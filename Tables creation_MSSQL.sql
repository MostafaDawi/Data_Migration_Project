/****** ENTITIES ******/

/****** Table Students  ******/
CREATE TABLE Students(
	sid int IDENTITY(1,1) NOT NULL,
	FirstName varchar(50) NULL,
	LastName varchar(50) NULL,
	Address varchar(50) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED (id ASC)
 );

/****** Table Books  ******/
CREATE TABLE Books(
	bookName varchar(50) NOT NULL,
	price float NULL,
	category varchar(50) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED (bookName ASC)
 );

/****** Table Store  ******/
CREATE TABLE Stores(
	storeName varchar(50) NOT NULL,
	branch varchar(50) NULL,
	dateOfOpening date NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED (storeName ASC)
 );

 /****** RELATIONS ******/

 /****** Table Purchase ******/
 CREATE TABLE Purchase(
	sid INT NOT NULL,
	bookName varchar(50) NOT NULL,
	price FLOAT NULL,
	quantity INT NULL
	FOREIGN KEY (sid) REFERENCES Students(sid),
	FOREIGN KEY (bookName) REFERENCES Books(bookName)
 );

 /****** Table Available ******/
 CREATE TABLE Available(
	storeId VARCHAR(50) NOT NULL,
	available_bookName varchar(50) NOT NULL,
	available_quantity INT NULL,
	FOREIGN KEY (storeId) REFERENCES Stores(storeName),
	FOREIGN KEY (available_bookName) REFERENCES Books(bookName)
 );

