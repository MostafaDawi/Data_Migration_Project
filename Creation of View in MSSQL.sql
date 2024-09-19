CREATE VIEW FullData AS
SELECT *
FROM Students s 
FULL OUTER JOIN Purchase p ON s.sid = p.studentId
FULL OUTER JOIN Books b ON p.book_Name = b.bookName
FULL OUTER JOIN Available a ON b.bookName = a.available_bookName
FULL OUTER JOIN Stores st ON a.storeId = st.storeName;