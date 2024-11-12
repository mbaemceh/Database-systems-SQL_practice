--CREATE DATABASE 
CREATE DATABASE WEEK9
USE WEEK9

-- CREATE TABLE AGENTS 
CREATE TABLE AGENTS
(
AGENT_CODE  CHAR(6) NOT NULL PRIMARY KEY,
AGENT_NAME  CHAR(40),
WORKING_AREA  CHAR(35),
COMMISSION  DECIMAL(10,2),
PHONE_NO  CHAR(15),
COUNTRY  VARCHAR
);

drop table AGENTS
drop table CUSTOMER

CREATE TABLE CUSTOMER
(
CUST_CODE  VARCHAR(6) NOT NULL PRIMARY KEY,
CUST_NAME  VARCHAR(40) NOT NULL,
CUST_CITY  CHAR(35),
WORKING_AREA  VARCHAR(35) NOT NULL,
CUST_COUNTRY  VARCHAR(20) NOT NULL,
GRADE  DECIMAL,
OPENING_AMT  DECIMAL(12,2) NOT NULL,
RECEIVE_AMT  DECIMAL(12,2) NOT NULL,
PAYMENT_AMT  DECIMAL(12,2) NOT NULL,
OUTSTANDING_AMT  DECIMAL(12,2) NOT NULL,
PHONE_NO  VARCHAR(17) NOT NULL,
AGENT_CODE  CHAR(6) NOT NULL REFERENCES AGENTS
);

CREATE TABLE ORDERS
(
ORD_NUM  DECIMAL(6,0) NOT NULL PRIMARY KEY,
ORD_AMOUNT  DECIMAL(12,2) NOT NULL,
ADVANCE_AMOUNT  DECIMAL(12,2) NOT NULL,
ORD_DATE  DATE NOT NULL,
CUST_CODE  VARCHAR(6) NOT NULL REFERENCES CUSTOMER,
AGENT_CODE  CHAR(6) NOT NULL REFERENCES AGENTS,
ORD_DESCRIPTION  VARCHAR(60) NOT NULL

);

--Data Agents
INSERT INTO AGENTS VALUES ('A001','Subbarao','Bangalore',0.14,'077-12346674','')
INSERT INTO AGENTS VALUES ('A002','Mukesh','Mumbai',0.11,'029-12358964','')
INSERT INTO AGENTS VALUES ('A003','Alex','London',0.13,'075-12458969','')
INSERT INTO AGENTS VALUES ('A004','Ivan','Torento',0.15,'008-22544166','')
INSERT INTO AGENTS VALUES ('A005','Anderson','Brisban',0.13,'045-21447739','')
INSERT INTO AGENTS VALUES ('A006','McDen','London',0.15,'078-22255588','')
INSERT INTO AGENTS VALUES('A007', 'Ramasundar', 'Bangalore', 0.15, '077-25814763', '')
INSERT INTO AGENTS VALUES ('A008', 'Alford', 'New York', 0.12, '044-25874365', '')
INSERT INTO AGENTS VALUES ('A009', 'Benjamin', 'Hampshair', 0.11, '008-22536178', '')
INSERT INTO AGENTS VALUES ('A010', 'Santakumar', 'Chennai', 0.14, '007-22388644', '')
INSERT INTO AGENTS VALUES ('A011', 'Ravi Kumar', 'Bangalore', 0.15, '077-45625874', '')
INSERT INTO AGENTS VALUES ('A012', 'Lucida', 'San Jose', 0.12, '044-52981425', '')

--Data Customer
INSERT INTO CUSTOMER VALUES ('C00001','Michael','New York','New York','USA','2','3000','5000','2000', '6000','CCCCCCC','A008')
INSERT INTO CUSTOMER VALUES ('C00002','Bolt','New York','New York','USA','3','5000','7000','9000','3000','DDNRDRH','A008') 
INSERT INTO CUSTOMER VALUES ('C00003','Martin','Torento','Torento','Canada','2','8000','7000','7000','8000','MJYURFD','A004')
INSERT INTO CUSTOMER VALUES ('C00004','Winston','Brisban','Brisban','Australia','1','5000','8000','7000','6000','AAAAAAA','A005')
INSERT INTO CUSTOMER VALUES ('C00005','Sasikant','Mumbai','Mumbai','India','1','7000','11000','7000','11000','147-25896312','A002')
INSERT INTO CUSTOMER VALUES ('C00006','Shilton','Torento','Torento','Canada','1','10000','7000','6000','11000','DDDDDDD','A004')
INSERT INTO CUSTOMER VALUES ('C00007','Ramanathan','Chennai','Chennai','India','1','7000','11000','9000','9000','GHRDWSD','A010')
INSERT INTO CUSTOMER VALUES ('C00008','Karolina','Torento','Torento','Canada','1','7000','7000','9000','5000','HJKORED','A004')
INSERT INTO CUSTOMER VALUES ('C00009','Ramesh','Mumbai','Mumbai','India','3','8000','7000','3000','12000','Phone No','A002')
INSERT INTO CUSTOMER VALUES ('C00010','Charles','Hampshair','Hampshair','UK','3','6000','4000','5000','5000','MMMMMMM','A009')
INSERT INTO CUSTOMER VALUES ('C00011','Sundariya','Chennai','Chennai','India','3','7000','11000','7000','11000','PPHGRTS','A010')
INSERT INTO CUSTOMER VALUES ('C00012','Steven','San Jose','San Jose','USA','1','5000','7000','9000','3000','KRFYGJK','A012')
INSERT INTO CUSTOMER VALUES ('C00013','Holmes','London','London','UK','2','6000','5000','7000','4000','BBBBBBB','A003')
INSERT INTO CUSTOMER VALUES ('C00014','Rangarappa','Bangalore','Bangalore','India','2','8000','11000','7000','12000','AAAATGF','A001')
INSERT INTO CUSTOMER VALUES ('C00015','Stuart','London','London','UK','1','6000','8000','3000','11000','GFSGERS','A003')
INSERT INTO CUSTOMER VALUES ('C00016','Venkatpati','Bangalore','Bangalore','India','2','8000','11000','7000','12000','JRTVFDD','A007')
INSERT INTO CUSTOMER VALUES ('C00017','Srinivas','Bangalore','Bangalore','India','2','8000','4000','3000','9000','AAAAAAB','A007')
INSERT INTO CUSTOMER VALUES ('C00018','Fleming','Brisban','Brisban','Australia','2','7000','7000','9000','5000','NHBGVFC','A005')
INSERT INTO CUSTOMER VALUES ('C00019','Yearannaidu','Chennai','Chennai','India','1','8000','7000','7000','8000','ZZZZBFV','A010')
INSERT INTO CUSTOMER VALUES ('C00020','Albert','New York','New York','USA','3','5000','7000','6000','6000','BBBBSBB','A008')
INSERT INTO CUSTOMER VALUES ('C00021','Jacks','Brisban','Brisban','Australia','1','7000','7000','7000','7000','WERTGDF','A005')
INSERT INTO CUSTOMER VALUES ('C00022','Avinash','Mumbai','Mumbai','India','2','7000','11000','9000','9000','1113-1234578','A002')
INSERT INTO CUSTOMER VALUES ('C00023','Karl','London','London','UK','0','4000','6000','7000','3000','AAAABAA','A006')
INSERT INTO CUSTOMER VALUES ('C00024','Cook','London','London','UK','2','4000','9000','7000','6000','FSDDSDF','A006')

select * from CUSTOMER
drop table ORDERS

--Data Orders
INSERT INTO ORDERS VALUES(200100, 1000, 600, '1-AUG-2008', 'C00013', 'A003', 'SOD');
INSERT INTO ORDERS VALUES(200101, 3000, 1000, '15-JUL-2008', 'C00001', 'A008', 'SOD');
INSERT INTO ORDERS VALUES(200102, 2000, 300, '25-MAY-2008', 'C00012', 'A012', 'SOD');
INSERT INTO ORDERS VALUES(200103, 1500, 700, '15-MAY-2008', 'C00021', 'A005', 'SOD');
INSERT INTO ORDERS VALUES(200104, 1500, 500, '13-MAR-2008', 'C00006', 'A004', 'SOD');
INSERT INTO ORDERS VALUES(200105, 2500, 500, '18-JUL-2008', 'C00024', 'A011', 'SOD');
INSERT INTO ORDERS VALUES(200106, 2500, 700, '20-APR-2008', 'C00005', 'A002', 'SOD');
INSERT INTO ORDERS VALUES(200107, 4500, 900, '30-AUG-2008', 'C00007', 'A010', 'SOD');
INSERT INTO ORDERS VALUES(200108, 4000, 600, '15-FEB-2008', 'C00008', 'A004', 'SOD');
INSERT INTO ORDERS VALUES(200109, 3500, 800, '30-JUL-2008', 'C00011', 'A010', 'SOD');
INSERT INTO ORDERS VALUES(200110, 3000, 500, '15-APR-2008', 'C00019', 'A010', 'SOD');
INSERT INTO ORDERS VALUES(200111, 1000, 300, '10-JUL-2008', 'C00020', 'A008', 'SOD');
INSERT INTO ORDERS VALUES(200112, 2000, 400, '30-MAY-2008', 'C00016', 'A007', 'SOD');
INSERT INTO ORDERS VALUES(200113, 4000, 600, '10-JUN-2008', 'C00022', 'A002', 'SOD');
INSERT INTO ORDERS VALUES(200114, 3500, 2000, '15-AUG-2008', 'C00002', 'A008', 'SOD');
INSERT INTO ORDERS VALUES(200116, 500, 100, '13-JUL-2008', 'C00010', 'A009', 'SOD');
INSERT INTO ORDERS VALUES(200117, 800, 200, '20-OCT-2008', 'C00014', 'A001', 'SOD');
INSERT INTO ORDERS VALUES(200118, 500, 100, '20-JUL-2008', 'C00023', 'A006', 'SOD');
INSERT INTO ORDERS VALUES(200119, 4000, 700, '16-SEP-2008', 'C00007', 'A010', 'SOD');
INSERT INTO ORDERS VALUES(200120, 500, 100, '20-JUL-2008', 'C00009', 'A002', 'SOD');
INSERT INTO ORDERS VALUES(200121, 1500, 600, '23-SEP-2008', 'C00008', 'A004', 'SOD');
INSERT INTO ORDERS VALUES(200122, 2500, 400, '16-SEP-2008', 'C00003', 'A004', 'SOD');
INSERT INTO ORDERS VALUES(200123, 500, 100, '16-SEP-2008', 'C00022', 'A002', 'SOD');
INSERT INTO ORDERS VALUES(200124, 500, 100, '20-JUN-2008', 'C00017', 'A007', 'SOD');
INSERT INTO ORDERS VALUES(200125, 2000, 600, '10-OCT-2008', 'C00018', 'A005', 'SOD');
INSERT INTO ORDERS VALUES(200126, 500, 100, '24-JUN-2008', 'C00022', 'A002', 'SOD');
INSERT INTO ORDERS VALUES(200127, 2500, 400, '20-JUL-2008', 'C00015', 'A003', 'SOD');
INSERT INTO ORDERS VALUES(200128, 3500, 1500, '20-JUL-2008', 'C00009', 'A002', 'SOD');
INSERT INTO ORDERS VALUES(200129, 2500, 500, '20-JUL-2008', 'C00024', 'A006', 'SOD');
INSERT INTO ORDERS VALUES(200130, 2500, 400, '30-JUL-2008', 'C00024', 'A011', 'SOD');
INSERT INTO ORDERS VALUES(200131, 900, 150, '26-AUG-2008', 'C00012', 'A012', 'SOD');
INSERT INTO ORDERS VALUES(200133, 1200, 400, '29-JUN-2008', 'C00009', 'A002', 'SOD');
INSERT INTO ORDERS VALUES(200134, 4200, 1800, '25-SEP-2008', 'C00004', 'A005', 'SOD');
INSERT INTO ORDERS VALUES(200135, 2000, 800, '16-SEP-2008', 'C00007', 'A010', 'SOD');

SELECT * FROM ORDERS
SELECT * FROM CUSTOMER
SELECT * FROM AGENTS

--2
SELECT agent_code, agent_name, working_area, commission
FROM AGENTS
WHERE agent_code = SOME(
SELECT agent_code FROM customer
WHERE cust_country = 'UK');
--Untuk mendapatkan tabel 'agent_code','agent_name','working_area','commission' dari tabel 'agents',
--dengan kondisi 'agent_code' harus berada dalam beberapa 'agent_code' dari tabel 'orders', yang
--memenuhi persyaratan'cust_country' di tabel 'orders' harus 'Inggris'

--3
SELECT ord_date, ord_amount, advance_amount
FROM orders
WHERE advance_amount > ALL(
SELECT ord_amount FROM orders
WHERE ord_amount = 1000);
--Untuk mendapatkan kolom 'ord_date','ord_amount' dan 'advance_amount' dari tabel 'orders' dengan kondisi 'advance_amount' dari tabel 'orders' lebih dari 'ord_amount' 
--dari tabel 'orders' yang memenuhi kondisi 'ord_amount' harus sama dengan 1000