create database gasagency;
use gasagency;
create table Cust_Details 
	(cust_id int primary key auto_increment, 
	cust_Name varchar(50), 
	Gender varchar(1), 
	Address varchar(100), 
	Phone_NO bigint, 
	Connection_Type decimal(3,1), 
	No_Of_Cylinders int);


create table Orders 
	(order_id int primary key auto_increment, 
    order_Date date, 
    Cust_Id int, 
    Quantity int, 
    Payment_type varchar(30), 
    Status varchar(30), 
    foreign key(Cust_Id) references Cust_details(cust_id));
    
create table Cancelled_Orders 
	(Order_Id int,      order_cancel_Date date, 
    Reason varchar(50), 
    foreign key(Order_Id) references Orders(order_id));

create table Billing_Details
	(billing_Id int Primary key auto_increment, 
    billing_Date date,      Order_Id int, 
    Delivery_Status varchar(30), 
    foreign key(Order_Id) references Orders(order_Id));
    
create table Cancelled_Bills 
	(billing_Id int,     bill_cancel_Date date, 
    Reason varchar(50), 
    foreign key(billing_Id) references billing_details(billing_Id));

create table pricing
(connection_type decimal(3,1),
pmonth varchar(10), 	pyear int,	price int);

insert into cust_details (cust_name, 
	Gender, 
    Address, 
    Phone_No, 
    Connection_Type, 
    No_Of_Cylinders)
 values 
 ('Harish', 'M', '1-2, bglr', 1987654322, 14.2, 1);
 
 insert into cust_details (cust_name, 
	Gender, 
    Address, 
    Phone_No, 
    Connection_Type, 
    No_Of_Cylinders) values 
 ('Amisha', 'F', '32-12, bglr', 1614322387, 14.2, 1),
 ('Ujjawal', 'M', '19-0, gurgaon', 1871614322, 14.2, 1),
 ('Anu', 'F', '2-10, hyd', 1000614322, 19.0, 5),
 ('Rakshitha', 'F', '3-1-3, chennai', 1614322551, 19.0, 10),
 ('Varuni', 'F', '10-4, gurgaon', 1432245789, 14.2, 1),
 ('Vamshi', 'M', '31-14, hyd', 14433245789, 19.0, 6);
 
insert into orders 
 (order_Date, 
 Cust_Id, 
 Quantity, 
 Payment_type, 
 Status) values
 ('2021-10-01', 6, 1, 'online', 'cancelled'),
 ('2021-10-01', 3, 1, 'POD', 'Ordered'),
('2021-10-02', 5, 4, 'POD', 'Cancelled'),
('2021-10-03', 6, 1, 'POD',	'Ordered'),
('2021-10-04', 3, 1, 'Online', 'Ordered'),
('2021-11-05', 6, 1, 'Online', 'Ordered'),
('2021-11-06', 4, 4, 'Online', 'Ordered'),
('2021-11-07', 5, 9, 'POD', 'Ordered'),
('2021-11-09', 7, 5, 'Online', 'Ordered');

insert into cancelled_orders values(1, '2021-10-02', 'Out of Station');
insert into cancelled_orders values(3, '2021-10-03', 'Mistakenly Ordered');

insert into billing_details(billing_date, Order_Id, Delivery_Status) 
values ('2021-10-03', 1, 'Delivered'),
('2021-10-03', 2, 'Undelivered'),
('2021-10-04', 4, 'Delivered'),
('2021-10-06', 5, 'Delivered'),
('2021-11-06', 6, 'Delivered'),
('2021-11-06', 7, 'Delivered'),
('2021-11-08', 8, 'Delivered'); 

insert into cancelled_bills values(2, '2021-10-04', 'Insufficient Amount');

insert into pricing values(14.2, 'January', 2021, 925),
(19.0, 'January', 2021, 1223),
(5.0, 'January', 2021, 352),
(14.2, 'February', 2021, 931),
(19.0, 'February', 2021, 1025),
(5.0, 'February', 2021, 361),
(14.2, 'March', 2021, 910),
(19.0, 'March', 2021, 1225),
(5.0, 'March', 2021, 365),
(14.2, 'April', 2021, 942),
(19.0, 'April', 2021, 1300),
(5.0, 'April', 2021, 330),
(14.2, 'May', 2021, 942),
(19.0, 'May', 2021, 1280),
(5.0, 'May', 2021, 333),
(4.2, 'June', 2021, 958),
(19.0, 'June', 2021, 1283),
(5.0, 'June', 2021, 320),
(14.2, 'July', 2021, 950),
(19.0, 'July', 2021, 1295),
(5.0, 'July', 2021, 330),
(14.2, 'August', 2021, 947),
(19.0, 'August', 2021, 1298),
(5.0, 'August', 2021, 337),
(14.2, 'September', 2021, 963),
(19.0, 'September', 2021, 1306),
(5.0, 'September', 2021, 340),
(14.2, 'October', 2021, 960),
(19.0, 'October', 2021, 1310),
(5.0, 'October', 2021, 347),
(14.2, 'November', 2021, 970),
(19.0, 'November', 2021, 1313),
(5.0, 'November', 2021, 350),
(14.2, 'December', 2021, 974),
(19.0, 'December', 2021, 1320),
(5.0, 'December', 2021, 362),
(14.2,'January', 2022, 999),
(19.0, 'January', 2022, 1309),
(5.0, 'January', 2022, 359);


SELECT * FROM CUST_DETAILS;

SELECT CUST_NAME, GENDER, CONNECTION_TYPE FROM CUST_DETAILS;

SELECT CUST_NAME, 
	GENDER, 
    PHONE_NO AS MOBILE,
    NO_OF_CYLINDERS,
    NO_OF_CYLINDERS * 10 AS CYLINDERS
    FROM CUST_DETAILS;
-- SELECT CUST_NAME + ' ' + PHONE_NO as 'NAME WITH MOBILE', 
-- 	CUST_ID, 
--     ADDRESS 
--     FROM CUST_DETAILS;


SELECT CONNECTION_TYPE FROM CUST_DETAILS;

SELECT distinct CONNECTION_TYPE FROM CUST_DETAILS;

SELECT * FROM PRICING;

SELECT * FROM PRICING WHERE PYEAR = 2021;

SELECT * FROM PRICING WHERE PYEAR = 2021 && PMONTH = 'January';

SELECT * FROM PRICING WHERE PMONTH = 'January';

SELECT * FROM PRICING WHERE PYEAR = 2021 || PMONTH = 'January';

SELECT * FROM PRICING WHERE PYEAR = 2021 or PMONTH = 'January';

SELECT price FROM PRICING WHERE PYEAR = 2021 and PMONTH = 'January';

SELECT * FROM PRICING WHERE NOT PYEAR = 2021;

SELECT * FROM PRICING WHERE PRICE BETWEEN 350 AND 362;

-- SELECT * FROM PRICING WHERE PMONTH BETWEEN 'January' AND 'March';

SELECT * FROM BILLING_DETAILS;

SELECT * 
FROM  BILLING_DETAILS 
WHERE BILLING_DATE BETWEEN '2021-10-06' AND '2021-11-06';

SELECT * 
FROM PRICING
WHERE PRICE IN(1280, 1295, 1300, 330);
--  WHERE PRICE = 1280 OR PRICE = 1295 OR PRICE = 1300 OR PRICE = 330

SELECT * 
FROM PRICING
WHERE PMONTH LIKE 'Ma%';

SELECT * 
FROM PRICING
WHERE PMONTH LIKE 'J___';

SELECT * 
FROM PRICING 
WHERE PYEAR IS NULL;

SELECT * 
FROM PRICING
WHERE 
PRICE IN(1280, 1295, 1300, 330) 
OR PMONTH = 'January'
AND PYEAR = 2021
LIMIT 2,5;


SELECT * 
FROM CUST_DETAILS 
order by CUST_NAME ;

SELECT * 
FROM CUST_DETAILS 
order by CUST_NAME asc;

SELECT * 
FROM CUST_DETAILS 
order by CUST_NAME DESC
LIMIT 3,1000;

SELECT * FROM ORDERS;

SELECT C.CUST_ID, 
C.CUST_NAME, 
C.CONNECTION_TYPE, 
O.ORDER_ID, 
O.ORDER_DATE, 
O.QUANTITY
FROM CUST_DETAILS C, ORDERS O
WHERE C.CUST_ID = O.CUST_ID;

SELECT * FROM 
CUST_DETAILS
WHERE CUST_NAME REGEXP 'M|N';

SELECT * FROM 
CUST_DETAILS
WHERE CUST_NAME REGEXP '[MN]';

SELECT * FROM CUST_DETAILS WHERE CUST_NAME REGEXP 'O[TR]';

SELECT * FROM CUST_DETAILS WHERE CUST_NAME LIKE '%OT%'
OR
CUST_NAME LIKE '%OR%';

SELECT * FROM CUST_DETAILS WHERE CUST_NAME REGEXP '^[A-K]';

SELECT * FROM CUST_DETAILS WHERE CUST_NAME REGEXP '[A-K]$';

SELECT * 
FROM CUST_DETAILS 
order by CUST_NAME desc;

SELECT * 
FROM CUST_DETAILS 
order by CONNECTION_TYPE DESC;

SELECT * 
FROM CUST_DETAILS 
order by CONNECTION_TYPE ASC, CUST_NAME ASC;

SELECT * 
FROM CUST_DETAILS 
order by CONNECTION_TYPE DESC, CUST_NAME;

SELECT * 
FROM CUST_DETAILS 
order by CONNECTION_TYPE ASC, CUST_NAME DESC;

SELECT * 
FROM CUST_DETAILS 
order by CONNECTION_TYPE DESC, CUST_NAME DESC;

SELECT * 
FROM PRICING
WHERE PMONTH = 'MARCH';

SELECT lower(pmonth) 
FROM PRICING
WHERE PMONTH LIKE 'Jan%' COLLATE utf8mb4_0900_as_cs;

SELECT ucase(pmonth) 
FROM PRICING
WHERE PMONTH LIKE 'jan%';

SELECT avg(price)
FROM PRICING;

SELECT min(price)
FROM PRICING;

SELECT max(price)
FROM PRICING;

SELECT COUNT(*) 
FROM PRICING;

SELECT COUNT(PRICE) 
FROM PRICING;

SELECT CURDATE();

SELECT CURTIME();

SELECT DATABASE();



/* Write a query to display a table with 
customer Id, Name, Connection_Type and No_Of Cylinders 
ordered from orders table.
*/

SELECT cust_name, connection_type, order_date, quantity
FROM cust_details JOIN orders
-- ON cust_details.cust_id = orders.Cust_Id;
USING (cust_id)
where Quantity > 4;



