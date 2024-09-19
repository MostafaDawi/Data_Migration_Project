@echo off
set TABLE="MigDB.dbo.FullData"
set DB_USER=serv_auth
set DB_SERVER=MY-LAPTOP
set DB_PASS=MSSQL@382001
set CSV_PATH="C:\Users\mosta\Desktop\Projects\Data Migration - Automation\Migration\mig_data_bulk.csv"

REM Export Table into a .csv file
bcp %TABLE% out %CSV_PATH% -c -t, -U %DB_USER% -P %DB_PASS% -S %DB_SERVER%

REM Check the error level
if %errorlevel% equ 0 (
    echo Command executed successfully.
) else (
    echo Command failed. Error level: %errorlevel%
)

pause