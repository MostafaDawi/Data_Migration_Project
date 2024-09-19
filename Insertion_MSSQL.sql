INSERT INTO Stores 
VALUES ('Dar Aaoun', 'Dahye', '8-5-2010'),
	('Store2', 'South', '5-1-2001'),
	('Store3', 'Baalbeck', '2-3-2001'),
	('Store4', 'Zahle', '5-1-2001');

INSERT INTO Books 
VALUES ('Book5', 19, 'Novel'),
	('Book6', 18, 'Educational'),
	('Book7', 20, 'Course'),
	('Book8', 15, 'Informative');

INSERT INTO Available 
VALUES ('Store2','Book1', 13),
	('Store3','Book6', 18),
	('Store4','Book7', 20),
	('Dar Aaoun','Book8', 15);


INSERT INTO Purchase 
VALUES (2,'Book1', 13, 2),
	(5,'Book6', 18, 1),
	(6,'Book7', 20, 3),
	(9,'Book8', 15, 6);

SELECT TOP (1000) [storeId]
      ,[bookName]
      ,[quantity]
  FROM [MigDB].[dbo].[Available]

  SELECT TOP (1000) A.[storeId]
      ,A.[bookName]
      ,A.[quantity] available_quantity
	  ,P.[quantity] bought_quantity
	  ,P.[sid]
	  ,S.[FirstName]
  FROM [MigDB].[dbo].[Available] A, [MigDB].[dbo].[Purchase] P, [MigDB].[dbo].[Students] S
  WHERE A.bookName = P.bookName AND S.sid = P.sid


SELECT TOP (1000) [bookName]
      ,[price]
      ,[category]
  FROM [MigDB].[dbo].[Books]

SELECT TOP (1000) [sid], [FirstName]
  FROM [MigDB].[dbo].[Students]

SELECT TOP (1000) *
FROM Purchase P, Students S
WHERE P.sid = S.sid;