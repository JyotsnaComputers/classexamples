/* create table */
CREATE TABLE ZIPCODE_INFO  -- comment
	(ZIP_CODE VARCHAR (5),
	CITY VARCHAR (10));

CREATE TABLE INSTRUCTOR_INFO 
	(INSTRUCTOR_ID DECIMAL (8, 0),
	INSTRUCTOR_FIRST_NAME VARCHAR (15),
	INSTRUCTOR_LAST_NAME VARCHAR (15));

CREATE TABLE COURSE_INFO
	(COURSE_NO DECIMAL (8, 0),
	COST DECIMAL (5, 2)); 

CREATE TABLE STDECIMALUDENT_INFO
	(STUDENT_ID DECIMAL (8, 0),
	STUDENT_FIRST_NAME VARCHAR (15),
	STUDENT_LAST_NAME VARCHAR (15));

CREATE TABLE SECTION_INFO
	(SECTION_ID DECIMAL (8, 0),
	COURSE_NO DECIMAL (8, 0),
	SECTION_NO DECIMAL (5),
	INSTRUCTOR_ID DECIMAL (8, 0));
    
CREATE TABLE ENROLLMENT_INFO
	(STUDENT_ID DECIMAL (8, 0),
	SECTION_ID DECIMAL (8, 0));

CREATE TABLE GRADE_INFO
 	(STUDENT_ID DECIMAL (8, 0),
 SECTION_ID DECIMAL (8, 0),
 GRADE_TYPE_CODE CHAR (2),
 GRADE_CODE_OCCURANCE CHAR (2));

/* alter table */
ALTER TABLE ZIPCODE_INFO
ADD COLUMN STATE VARCHAR (2),
CHANGE COLUMN CITY CITY VARCHAR (25);

ALTER TABLE ZIPCODE_INFO
ADD COLUMN STATE VARCHAR (2),
MODIFY COLUMN CITY VARCHAR (25);

ALTER TABLE INSTRUCTOR_INFO
ADD COLUMN STREET_ADDRESS VARCHAR (50),
ADD COLUMN ZIP_CODE VARCHAR (5),
CHANGE COLUMN INSTRUCTOR_FIRST_NAME  INSTRUCTOR_FIRST_NAME VARCHAR (25),
CHANGE COLUMN INSTRUCTOR_LAST_NAME INSTRUCTOR_LAST_NAME VARCHAR (25);

ALTER TABLE COURSE_INFO
ADD COLUMN COURSE_NAME VARCHAR (50),
ADD COLUMN COURSE_PREREQUISITE DECIMAL (8, 0),
CHANGE COLUMN COST COST DECIMAL (9, 2);

ALTER TABLE STUDENT_INFO 
ADD COLUMN STREET_ADDRESS VARCHAR(50),
ADD COLUMN ZIP_CODE VARCHAR(5),
CHANGE COLUMN STUDENT_FIRST_NAME STUDENT_FIRST_NAME VARCHAR(25),
CHANGE COLUMN STUDENT_LAST_NAME STUDENT_LAST_NAME VARCHAR(25);

ALTER TABLE SECTION_INFO
ADD COLUMN LOCATION VARCHAR(50),
ADD COLUMN CAPACITY DECIMAL(3,0),
MODIFY COLUMN SECTION_NO DECIMAL(3,0);

ALTER TABLE GRADE_INFO
ADD COLUMN NUMERIC_GRADE DECIMAL(3,0),
MODIFY COLUMN GRADE_CODE_OCCURANCE DECIMAL(38,0);


/* add  Constraint */
ALTER TABLE course_info
CHANGE COLUMN COURSE_NO COURSE_NO DECIMAL(8,0) NOT NULL ;

/* rename column */
ALTER TABLE enrollment_info 
CHANGE COLUMN STUDENT_ID STUDENT_IDN DECIMAL(8,0);

/* create duplicate table */
CREATE TABLE course_info_dup AS SELECT * FROM course_info;

/* create duplicate structure */
CREATE TABLE course_structure LIKE course_info;

/* rename table */
ALTER TABLE course_info_dup
RENAME TO  dummy;

/* remove column */
ALTER TABLE dummy 
DROP COLUMN COST;

/* remove table */
DROP TABLE dummy;

/* delete table row(s) can roll back*/
DELETE FROM DUMMY; -- WHERE cousrse_no < 100;

/* delete table info (rows) can roll back*/
DELETE FROM DUMMY;

/* delete table info (rows) fast and no roll back */
TRUNCATE TABLE DUMMY;


/* ADDING PRIMARY KEY AND NOT NULL */
ALTER TABLE ZIPCODE_INFO 
ADD CONSTRAINT ZIP_PKY PRIMARY KEY (ZIP_CODE),
MODIFY COLUMN CITY VARCHAR(5) NOT NULL,
MODIFY COLUMN STATE varchar(2) NOT NULL;


/* add PRIMAY KEY */
ALTER TABLE `concentrix`.`dummy` 
CHANGE COLUMN `COURSE_NO` `COURSE_NO` DECIMAL(8,0) NOT NULL ,
ADD CONSTRAINT `COURSE_NO_PK`
PRIMARY KEY (`COURSE_NO`);



/* ADDING PRIMARY KEY , FOREIN KEY AND NOT NULLS */
ALTER TABLE INSTRUCTOR_INFO 
	ADD CONSTRAINT INSTRUCTOR_ID_PK 
	PRIMARY KEY (INSTRUCTOR_ID), 
	MODIFY COLUMN INSTRUCTOR_FIRST_NAME VARCHAR(25) NOT NULL,
	MODIFY COLUMN INSTRUCTOR_LAST_NAME VARCHAR(25) NOT NULL,
	ADD CONSTRAINT  ZIP_INSTRUCTOR_FK 
		foreign key (ZIP_CODE)
		REFERENCES zipcode_info(zip_code) ;
        
        
/* ADD FOREIGN KEY */
ALTER TABLE `concentrix`.`dummy` 
ADD CONSTRAINT `COURSE_NO_FK`
  FOREIGN KEY (`COURSE_NO`)
  REFERENCES `concentrix`.`course_structure` (`COURSE_NO`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE COURSE_INFO 
ADD constraint COURSE_NO_PK
PRIMARY KEY (COURSE_NO),
MODIFY COLUMN COURSE_NAME VARCHAR(50) NOT NULL,
MODIFY COLUMN COST DECIMAL (9,2) NOT NULL; 

ALTER TABLE STUDENT_INFO
	ADD CONSTRAINT STUDENT_ID_PK
	PRIMARY KEY (STUDENT_ID),
	MODIFY COLUMN STUDENT_FIRST_NAME VARCHAR(25) NOT NULL,
	MODIFY COLUMN STUDENT_LAST_NAME VARCHAR(25) NOT NULL,
	ADD CONSTRAINT ZIP_STUDENT_FK
	foreign key(ZIP_CODE)
	references zipcode_info(ZIP_CODE);
    
    /*
SECTION_ID	NUMBER	8,0	PRIMARY KEY – SECTION_ID_PK
COURSE_NO	NUMBER	8,0	FOREIGN KEY – COURSE_SECTION_FK
SECTION_NO	NUMBER	3,0	NOT NULL -SECTION_NO_NN
INSTRUCTOR_ID	NUMBER	8,0	FOREIGN KEY – INSTRUCTOR_SECTION_FK
LOCATION	VARCHAR2	50	
CAPACITY	NUMBER	3,0	
*/
ALTER TABLE SECTION_INFO
ADD CONSTRAINT SECTION_ID_PK 
PRIMARY KEY (SECTION_ID),
ADD CONSTRAINT COURSE_SECTION_FK 
foreign key(COURSE_NO)
REFERENCES COURSE_INFO(COURSE_NO),
ADD CONSTRAINT INSTRUCTOR_SECTION_FK
foreign key(INSTRUCTOR_ID)
REFERENCES INSTRUCTOR_INFO(INSTRUCTOR_ID),
MODIFY COLUMN SECTION_NO DECIMAL(3,0) NOT NULL;


ALTER TABLE ENROLLMENT_INFO 
ADD CONSTRAINT STUDENT_SECTION_ID_PK  PRIMARY KEY (STUDENT_ID, SECTION_ID),
ADD CONSTRAINT ENROLLMENT_STUDENT_ID_FK foreign key (STUDENT_ID)
REFERENCES STUDENT_INFO(STUDENT_ID),
ADD CONSTRAINT ENROLLMENT_SECTION_ID_FK foreign key (SECTION_ID)
REFERENCES SECTION_INFO(SECTION_ID);



ALTER TABLE GRADE_INFO 
ADD CONSTRAINT GRADE_INFO_PK  
PRIMARY KEY (STUDENTID,SECTIONID,GRADE_TYPE_CODE,GRADE_CODE_OCCURANCE),
ADD CONSTRAINT ENROLLMENT_STUDENT_ID_FK foreign KEY (STUDENT_ID)
REFERENCES STUDENT_INFO(STUDENT_ID),
ADD CONSTRAINT ENROLLMENT_SECTION_ID_FK FOReIgN KEY (SECTION_ID)
REFERENCES SECTION_INFO(SECTION_ID),
MODIFY COLUMN NUMERIC_GRADE DECIMAL(38,0) DEFAULT 0,
ADD CONSTRAINT GRADE_TYPE_CODE_CHK 
CHECK (GRADE_TYPE_CODE IN ('FI','HM', 'MT','PA','PJ','QZ'));


/* DROP FOREIGN KEY */
ALTER TABLE `concentrix`.`dummy` 
DROP FOREIGN KEY `course_no_fk`;

/* DROP PRIMARY KEY */
ALTER TABLE `concentrix`.`course_structure` 
CHANGE COLUMN `COURSE_NO` `COURSE_NO` DECIMAL(8,0) NULL ,
DROP PRIMARY KEY;


ALTER TABLE ZIPCODE_INFO 
MODIFY COLUMN CITY VARCHAR(10);
/* 
TABLE NAME - ZIPCODE_INFO 
CITY varchar(10) 
STATE varchar(2)
ZIP_CODE varchar(5) PK 

*/
/* INSERT DEMO */
INSERT INTO ZIPCODE_INFO VALUES ('11432','Jamai','NY'); 

INSERT INTO ZIPCODE_INFO VALUES ('11433','Jamaica','NY');

INSERT INTO ZIPCODE_INFO (ZIP_CODE, STATE) VALUES ('11434','NY');

INSERT INTO ZIPCODE_INFO (STATE, ZIP_CODE) VALUES ('NY','11435');

INSERT INTO ZIPCODE_INFO VALUES ('11510','Baldwin','NY');  

INSERT INTO ZIPCODE_INFO VALUES ('11511','Baldwin','NY');

INSERT INTO ZIPCODE_INFO (ZIP_CODE, STATE) VALUES ('11530','NY');

INSERT INTO INSTRUCTOR_INFO VALUES 
(110, 'Ilena', 'Wong', '415 West 101st Marleton street', '11432');

INSERT INTO INSTRUCTOR_INFO VALUES 
(109, 'Lei', 'Chow', '55 10th Avenue Jerry Street', '11432');

UPDATE ZIPCODE_INFO SET CITY='Hempstead' WHERE ZIP_CODE='11432';

UPDATE ZIPCODE_INFO SET CITY='West' WHERE CITY IS NULL;