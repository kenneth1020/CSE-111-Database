/*
 MID TERM for CSE111
 */
/*
 1. What makers produce Laptops with screen larger than 15’’ that are cheaper than $1,000?
 */
--Question 1 
SELECT maker
FROM Product
INNER JOIN Laptop ON Product.model = Laptop.model
WHERE Laptop.screen > 15
    and Laptop.price < 1000
GROUP BY maker;

--Quetion 1 alt
SELECT maker
From Product, Laptop
Where Product.model = Laptop.model
    AND Laptop.screen > 15
    AND Laptop.price < 1000;
/*
 2. How many makers produce PCs with speed larger than 2.0, Laptops with hd larger than 250 GB, and
 laser printers?
 */
--Question 2
SELECT count(Product.maker) + (
        SELECT count(Product.maker) + (
                SELECT count(Product.maker)
                From Product,
                    Printer
                WHERE Printer.typeP LIKE "%laser%"
                    AND Product.model = Printer.model
            ) as countPrint
        From Product,
            Laptop
        WHERE Laptop.hd > 250
            AND Product.model = Laptop.model
    ) as countLap
From Product,
    PC
WHERE PC.speed > 2.0
    AND Product.model = PC.model;

--Question 2 ALT
SELECT count(*)
FROM (
        SELECT maker
        FROM Product,
            PC
        WHERE PC.speed > 2.0
            AND Product.model = PC.model
        INTERSECT
        SELECT maker
        FROM Product,
            Laptop
        WHERE Laptop.hd > 250
            AND Product.model = Laptop.model
        INTERSECT
        SELECT maker
        FROM Product,
            Printer
        WHERE Printer.typeP LIKE "%laser%"
            AND Product.model = Printer.model
    );
/*
 3. For every maker that produces PCs with more than 4 GB of ram, find the average price of these PCs
 (with more than 4 GB of RAM).
 */
--Question 3
SELECT avg(PC.price)
FROM Product
    INNER JOIN PC ON Product.model = PC.model
WHERE PC.ram > 4;
--GROUP BY PC.model;
/*
 4. What makers produce PCs or Laptops, but do not produce Printers?
 */
--Question 4
SELECT maker as Answer4
FROM Product,
    PC
WHERE Product.model = PC.model
UNION
SELECT maker
FROM Product,
    Laptop
WHERE Product.model = Laptop.model
EXCEPT
SELECT maker
FROM Product,
    Printer
WHERE Product.model = Printer.model;

--Question 4 ALT 
SELECT maker as Answer4Alt
FROM Product
WHERE Product.type = 'pc'
    Or Product.type = 'laptop'
EXCEPT
SELECT maker as Answer4Alt
From Product
WHERE Product.type = 'printer';


/*
 5. How many makers produce every type of product?
 */
--Question 5
SELECT count(*)
FROM (
        SELECT maker
        FROM Product
        WHERE Product.type LIKE "%pc%"
        INTERSECT
        SELECT maker
        FROM Product
        WHERE Product.type LIKE "%laptop%"
        INTERSECT
        SELECT maker
        FROM Product
        WHERE Product.type LIKE "%printer%"
    );

--Question 5 ALT
SELECT maker
FROM Product
GROUP BY maker
HAVING COUNT(DISTINCT Product.type) = 3;

--Question 5 Alt 2
SELECT maker as Alt2
From Product
GROUP BY maker
HAVING COUNT(DISTINCT Product.type) = (SELECT COUNT(DISTINCT Product.type)
From Product);

/*
6. For all the makers that produce PCs, Laptops, and Printers, find the minimum price of a complete
package that includes a PC, a Laptop, and a Printer.
 */
--Question 6
SELECT sq.maker, min (sq.pc_price + sq.l_price + sq.pr_price)
FROM 
    (SELECT p1.maker, p1.model, pc.price as pc_price, p2.model, l.price as l_price, p3.model, pr.price as pr_price
    FROM Product p1, PC pc, Product p2, Laptop l, Product p3, printer pr
    WHERE
    p1.model = pc.model
    and p2.model = l.model
    and p3.model = pr.model
    and p1.maker = p2.maker
    and p2.maker = p3.maker
    ) as sq
GROUP BY sq.maker;

/*
Question 7
Find the cheapest Laptop sold by a PC maker.
*/
SELECT min(sq.l_price)
FROM (SELECT l.price as l_price, p1.maker 
FROM Product p1, Product p2, Laptop l
WHERE p1.type = "pc" 
AND p2.type = "laptop"
AND p1.maker = p2.maker) as sq;


/*
Question 8
Find the maker that sells the most expensive PC and also sells Printers.
*/
SELECT sq.maker
FROM (SELECT max(p.price) as p_price, p1.maker 
FROM Product p1, Product p2, PC p
WHERE p1.type = "printer" 
AND p2.type = "pc"
AND p1.maker = p2.maker) as sq;

/*
Question 9
We want to rate the value of every PC based on a score computed as the sum of three terms: the score
of the speed; the score of the ram; and the score of the hd. Each of these terms is computed as the
ratio between the attribute (i.e., speed, ram, or hd) and the price of the PC. List the PCs and their
score in decreasing order of the score.
*/
SELECT SQ.speedScore, SQ.ramScore, Sq.hdScore, Sq.speedScore + Sq.ramScore + Sq.hdScore as totalScore
FROM (SELECT PC.speed / PC.price as speedScore, PC.ram / PC.price as ramScore, PC.hd/ PC.price as hdScore
    FROM PC
    GROUP BY PC.model) as SQ
ORDER BY totalScore DESC; 


/*
Question 10
Find the makers that produce at least 5 different products out of which there is at least one product
of every type (i.e., at least one PC, at least one Laptop, and at least one Printer).
*/
SELECT maker
FROM Product
GROUP BY maker
HAVING COUNT(DISTINCT Product.type) = 3 AND COUNT(DISTINCT Product.model) > 5;


--Question 10 Alt
SELECT maker as Alt10
        FROM Product
        WHERE Product.type LIKE "%pc%"
        INTERSECT
        SELECT maker
        FROM Product
        WHERE Product.type LIKE "%laptop%"
        INTERSECT
        SELECT maker
        FROM Product
        WHERE Product.type LIKE "%printer%"
        INTERSECT
        SELECT sq.maker
        From (SELECT maker, count(Product.model) as cnt
                FROM Product
                GROUP BY maker
                HAVING cnt > 5 ) as sq;
