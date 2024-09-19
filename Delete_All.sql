USE migdb;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE Table purchase;
TRUNCATE Table available;
TRUNCATE Table books;
TRUNCATE Table stores;
TRUNCATE Table students;
SET FOREIGN_KEY_CHECKS = 1;

DROP VIEW migdb.fulldata;