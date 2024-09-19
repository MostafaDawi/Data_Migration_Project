USE migdb;

/****** Table Students  ******/
CREATE TABLE IF NOT EXISTS Students(
	id int auto_increment NOT NULL,
	FirstName varchar(50) NULL,
	LastName varchar(50) NULL,
	Address varchar(50) NULL,
 CONSTRAINT PK_Students PRIMARY KEY CLUSTERED (id ASC)
 );

/****** Table Books  ******/
CREATE TABLE IF NOT EXISTS Books(
	bookName varchar(50) NOT NULL,
	price float NULL,
	category varchar(50) NULL,
 CONSTRAINT PK_Books PRIMARY KEY CLUSTERED (bookName ASC)
 );

/****** Table Store  ******/
CREATE TABLE IF NOT EXISTS Stores(
	storeName varchar(50) NOT NULL,
	branch varchar(50) NULL,
	dateOfOpening date NULL,
 CONSTRAINT PK_Store PRIMARY KEY CLUSTERED (storeName ASC)
 );
 
/*ALTER TABLE Students 
RENAME column id to sid;*/

 /****** RELATIONS ******/

 /****** Table Purchase ******/
 USE migdb;
 CREATE TABLE Purchase(
	sid INT NOT NULL,
	bookName varchar(50) NOT NULL,
	price FLOAT NULL,
	quantity INT NULL,
	FOREIGN KEY (sid) REFERENCES Students(sid),
	FOREIGN KEY (bookName) REFERENCES Books(bookName)
 );

 /****** Table Available ******/
 CREATE TABLE Available(
	storeId VARCHAR(50) NOT NULL,
	bookName varchar(50) NOT NULL,
	quantity INT NULL,
	FOREIGN KEY (storeId) REFERENCES Stores(storeName),
	FOREIGN KEY (bookName) REFERENCES Books(bookName)
 );