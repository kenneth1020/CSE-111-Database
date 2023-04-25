
/*
SELECT s_name
FROM ships 
WHERE s_launched = 1916;
*/


/*
SELECT s_name, c_displacement, c_numGuns
FROM classes
INNER JOIN ships ON c_name = s_class
INNER JOIN Outcomes ON s_name = o_ship 
WHERE o_battle = 'Surigao Strait';
*/


/*
DROP VIEW DamagedShips;

CREATE VIEW DamagedShips AS
SELECT o_ship as nameShip, b_class as damageDate
FROM battles, Outcomes
Where b_name = o_battle AND o_results ='damaged';

SELECT DamagedShips.nameShip, DamagedShips.damageDate
FROM DamagedShips, battles, Outcomes
WHERE DamagedShips.nameShip = o_ship AND 
b_name = o_battle AND 
b_class > DamagedShips.damageDate;
*/

/*
SELECT c_name, c_country
FROM classes
WHERE c_numGuns >= 9;
*/

/*
SELECT s_name
FROM ships
WHERE s_name LIKE 'R%';
*/

/*
--6.1.4
SELECT s_name
FROM ships
WHERE s_name LIKE '% % %';
*/

/*
SELECT c_country
FROM classes
WHERE c_type = 'bb'
INTERSECT
SELECT c_country
FROM classes
where c_type = 'bc';
*/

/*
SELECT s_class, count(s_class) as CS
FROM ships
GROUP BY s_class
HAVING CS >= 2;
*/

/*
--NUMBER 8 QUIZ
SELECT *
FROM ships
INNER JOIN classes ON s_class = c_class
INNER JOIN Outcomes ON s_name = o_ship;
--Left JOIN if you want all data of all ships to appear
*/

/*
DELETE FROM battles WHERE strftime('%Y', b_class) > '1942';
SELECT *
FROM battles;
*/

/*
SELECT * 
FROM battles
WHERE b_name LIKE 'a__%';
*/

/*
DELETE FROM battles
WHERE b_name LIKE 'a__%';
SELECT *
FROM battles;
*/

/*
UPDATE battles
SET b_name = 'HELLO';
--WHERE strftime('%Y', b_class) < '1942';
SELECT *
FROM battles;
*/

/*
SELECT *
FROM ships
GROUP BY s_class;
--ORDER BY s_class;
*/


SELECT *
From ships
WHERE s_name <> s_class;