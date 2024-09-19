@echo off
set MYSQL_BIN="C:\Program Files\MySQL\MySQL Workbench 8.0 CE\mysql.exe"
set DB_USER=root
set DB_NAME=migdb
set PORT_NUM=3305
set SQL_FILE="C:\Users\mosta\Desktop\Projects\Data Migration - Automation\Migration\Delete_All.sql"

REM Execute SQL commands from SQL file
%MYSQL_BIN% -u %DB_USER% -p --local-infile=1 -D %DB_NAME% -P %PORT_NUM% < %SQL_FILE%

REM Check the error level
if %errorlevel% equ 0 (
    echo Data has been deleted.
    echo Command executed successfully.
) else (
    echo Command failed. Error level: %errorlevel%
)

pause