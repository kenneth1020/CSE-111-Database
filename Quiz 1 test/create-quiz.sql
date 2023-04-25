DROP TABLE classes;
DROP TABLE ships;
DROP TABLE battles;
DROP TABLE Outcomes;


CREATE TABLE classes(
    c_name varchar(15),
    c_type char(2),
    c_country varchar(9),
    c_numGuns decimal(2,0),
    c_bore decimal(2,0),
    c_displacement decimal(5,0)
);

CREATE TABLE ships(
    s_name varchar(20),
    s_class varchar(20),
    s_launched decimal(4,0)
);

CREATE TABLE battles(
    b_name varchar(20),
    b_class date
);

CREATE TABLE Outcomes(
    o_ship varchar(20),
    o_battle varchar(25),
    o_results varchar(9)
);