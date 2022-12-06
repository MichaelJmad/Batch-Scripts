@echo off
color 02
cls


::Set the location of the restart batch
set RBat=C:\Users\Administrator\Desktop\AutoBatch\text\

for /f "tokens=*" %%a in ('find /i "GAMEDaystodie="^<%RBat%7d2d.txt') do set %%a
echo %GAMEDaystodie%
timeout 1

for /f "tokens=*" %%a in ('find /i "SPID="^<SPID.txt') do set %%a
echo %SPID%
timeout 1
cls

taskkill /PID %GAMEDaystodie% /t /f
taskkill /PID %SPID% /f
cls
echo shuting down
echo %GAMEDaystodie%
echo %SPID%
pause