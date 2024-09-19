USE migdb;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE Table purchase;
TRUNCATE Table available;
TRUNCATE Table books;
TRUNCATE Table stores;
TRUNCATE Table students;
SET FOREIGN_KEY_CHECKS = 1;

CREATE VIEW FullData AS
SELECT *
FROM Students s
LEFT JOIN Purchase p ON s.sid = p.studentId
LEFT JOIN Books b ON p.book_Name = b.bookName
LEFT JOIN Available a ON b.bookName = a.available_bookName
LEFT JOIN Stores st ON a.storeId = st.storeName
UNION
SELECT *
FROM Students s
RIGHT JOIN Purchase p ON s.sid = p.studentId
RIGHT JOIN Books b ON p.book_Name = b.bookName
RIGHT JOIN Available a ON b.bookName = a.available_bookName
RIGHT JOIN Stores st ON a.storeId = st.storeName;

CREATE TABLE IF NOT EXISTS NewTable
SELECT *
FROM FullData;

/****** LOAD THE DATA FROM FILE INTO TEMPTABLE ******/
LOAD DATA LOCAL INFILE 'C:/Users/mosta/Desktop/Projects/Data Migration - Automation/Migration/mig_data_bulk.csv'
INTO TABLE NewTable
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE students;
SET FOREIGN_KEY_CHECKS = 1;

/****** LOAD FROM TEMPTABLE INTO STUDENTS ******/
INSERT INTO students (sid, FirstName, LastName, Address)
SELECT DISTINCT sid, FirstName, LastName, Address
FROM NewTable
WHERE NewTable.sid != 0;

/****** LOAD FROM TEMPTABLE INTO BOOKS ******/
INSERT INTO books (bookName, price, category)
SELECT DISTINCT N.bookName, N.price, N.category
FROM NewTable N
WHERE N.bookName != '' AND N.category != '' AND N.price != 0;

/****** LOAD FROM TEMPTABLE INTO STORES ******/
INSERT INTO stores (storeName, branch, dateOfOpening)
SELECT DISTINCT N.storeName, N.branch, N.dateOfOpening
FROM NewTable N
WHERE N.storeName != '' AND N.branch != '' AND dateOfOpening != 0000-00-00;

/****** LOAD FROM TEMPTABLE INTO PURCHASE ******/
-- SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO purchase (studentId, book_name, bought_price, bought_quantity)
SELECT n.studentId, n.book_name, n.bought_price, n.bought_quantity
FROM NewTable n
WHERE n.studentId != 0;
-- SET FOREIGN_KEY_CHECKS = 1;

/****** LOAD FROM TEMPTABLE INTO AVAILABLE ******/
-- SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO available (storeId, available_bookName, available_quantity)
SELECT n.storeId, n.available_bookName, n.available_quantity
FROM NewTable n
WHERE N.storeId != '';
-- SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE NewTable;
DROP VIEW FullData;