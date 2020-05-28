@echo off
color 02
cls

for /f "tokens=*" %%a in ('find /i "PID="^<CFG.txt') do set %%a
echo %PID%
cls
echo this is the update batch file
timeout 5

:update
cls
echo checking to see if sever is running
taskkill %PID% /f
timeout 5
cls
echo Updateing server
call serverupdate.bat

cls
echo Server is now upto date
timeout 10

call start.bat