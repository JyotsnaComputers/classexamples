create database IF NOT EXISTS org;
use  org;

CREATE TABLE IF NOT EXISTS DEPT (
    dname varchar(100),
    Did INT NOT NULL auto_increment,
    PRIMARY KEY (Did)
);

CREATE TABLE IF NOT EXISTS Emp (
    ename varchar(100),
    Eid int not null auto_increment,
    address varchar(100),
    did int,
    PRIMARY KEY (Eid),
    FOREIGN KEY (did) 
    references
    dept(did)
);

INSERT INTO `DEPT` (DNAME) VALUES 
('Information Technology'),
('HR'),
('Finance'),
('Accounting'),
('Housekeeping'),
('Security'),
('Support'),
('Contract Staff'),
('Sales'),
('Management');


INSERT INTO Emp (ENAME, ADDRESS, DID) VALUES ('Veniam','640 Damon Junction\nEast Mathew, NY 68818','3'),
('Molestiae','6658 Hollis Club\nErnamouth, TX 19743','10'),
('Officiis','59965 Mason Neck Apt. 985\nKareemborough, NV 85535','9'),
('Rerum','91067 Geovany Fort\nHanefort, WA 92863','6'),
('Et','7647 Reva Shores Suite 970\nNew Audrafort, OH 17846-5397','2'),
('Et','9419 Carmela Burg Apt. 687\nAimeebury, SD 32389-4489','8'),
('Laborum','6961 Weissnat Drive\nDonnellyfort, MT 53947','6'),
('Cupiditate','117 Nellie Summit Suite 982\nSouth Heavenfurt, CA 45675','8'),
('Eveniet','9086 Mariam Square Suite 698\nSouth Dulce, MT 82861-3079','2'),
('Rerum','783 Goodwin Burgs Apt. 429\nWillmsfort, UT 42820-1019','9'),
('Quis','42928 Ernesto Trail\nEast Jules, WV 87169-2851','1'),
('Esse','161 Kassulke Stravenue Apt. 937\nWilliamsonton, MS 62622','7'),
('Dolores','22811 Liliana Trail Apt. 890\nSouth Ernesto, MT 04134','10'),
('Ut','981 Laron Overpass Suite 361\nWest Olahaven, FL 46982-7801','10'),
('Mollitia','411 Louisa Mill\nSouth Maximefort, MA 04903','8'),
('Necessitatibus','2853 Jonathon Turnpike\nQuitzonville, KY 54776','4'),
('Fugit','3647 Rosalinda Corner\nMaureenstad, RI 96605','5'),
('Corporis','03559 Nicholas Circle Apt. 364\nWest Zettaberg, ID 58592-3447','8'),
('Neque','56111 Alysson Gateway Apt. 212\nLeschbury, VT 90605-2306','8'),
('Velit','263 O\'Keefe Avenue Apt. 884\nWest Missouri, IL 50303','6');  


/*
SELECT {column_list} FROM tableName1
INNER JOIN tableName2
ON {joinCondition}
*/

SELECT * FROM EMP;

SELECT * FROM DEPT;

SELECT Emp.Ename as Employee_name, DEPT.dname as Department_name 
FROM Emp 
INNER JOIN DEPT
ON Emp.Did = Emp.Did;


SELECT Emp.Ename as Employee_name, DEPT.dname as Department_name 
FROM Emp 
INNER JOIN DEPT
ON Emp.Did = Emp.Did
WHERE EMP.ENAME LIKE 'M%';

CREATE TABLE IF NOT EXISTS office_locations (
    address varchar(100),
    oid INT NOT NULL auto_increment,
    PRIMARY KEY (oid)
);

ALTER TABLE Emp
ADD COLUMN oid int;

INSERT INTO `office_locations`(address) VALUES('Bangalore'),
('Mumbai'),
('Seattle'),
('Santa Clara');

SELECT * FROM EMP;

SET SQL_SAFE_UPDATES = 0;

UPDATE Emp 
SET oid = 1 
where (Eid % 2) = 0;

UPDATE Emp 
SET oid = 2 
where (Eid % 3) = 0;

-- LEFT OUTER JOIN DEMO 
SELECT * from Emp
LEFT OUTER JOIN office_locations
ON Emp.oid = office_locations.Oid;

SELECT * from office_locations
LEFT OUTER JOIN Emp
ON Emp.oid = office_locations.Oid;

-- RIGHT OUTER JOIN DEMO 
SELECT * from Emp
RIGHT OUTER JOIN office_locations
ON Emp.oid = office_locations.Oid;

SELECT * from office_locations
RIGHT OUTER JOIN Emp
ON Emp.oid = office_locations.Oid;

SELECT * from Emp
CROSS JOIN office_locations;

CREATE TABLE temp_table( 
id INT PRIMARY KEY, 
dept VARCHAR(10), 
city VARCHAR(20) );


DROP PROCEDURE IF EXISTS insertRecs; 
DELIMITER // 
CREATE PROCEDURE 
insertRecs(IN empId INT, IN dept VARCHAR(10), IN city VARCHAR(20)) 
BEGIN 
	DECLARE EXIT HANDLER FOR 1062 
		SELECT CONCAT("duplicate entry for the emp id ",empId) AS errorMessage; 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
		SELECT "SQLEXCEPTION occured" AS errorMessage;
        
	DECLARE EXIT HANDLER FOR SQLSTATE "23000" 
		SELECT "SQLSTATE 23000" AS errorMessage;

	INSERT INTO temp_table VALUES(empId,dept,city); 
	SELECT * FROM temp_table WHERE id = empId; 
END // 
DELIMITER ;


CALL insertRecs(101,"IT","Mumbai");

CALL insertRecs(102,"IT","Hyderabad");



