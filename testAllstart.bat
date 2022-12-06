@echo off
color 02

set timeout= 10


echo Starting servers


::7D2D servers

echo starting the 7D2D servers
echo.
set AppCmdLine="E:\Server\7D2D\7D2DRestart.bat"
set ProcessCmd=wmic process call create %AppCmdLine%
for /f "tokens=3 delims=; " %%a in ('%ProcessCmd% ^| find "ProcessId"') do set PID=%%a
echo GAMEDaystodie=%PID%>> text\7d2d.txt

for /f "tokens=*" %%a in ('find /i "GAMEDaystodie="^<text\7d2d.txt') do set %%a
cls
echo 7D2DBatPID=%GAMEDaystodie%

timeout %timeout%