@echo off
color 02
title 7D2DJMAD
::set task to be shutdown
::This is the server EXE to kill
set task= 7Day2Die


::Restart timer
::How many Hours for server restarts

set hours= 4

::server restart delay
set restartd= 20

::Would you like to prform a server update once a day true/false

set update= false


:: Configure to your server setup

::Set a uniqe server name please do not use spaces as this can cause issues
set svservername= 7D2DJMAD

set svPort=2305
set svServerMod=
set svMod=

::This is the server startup batch Configeration
set BatCFG="E:\Server\7D2D\7daystodieserver.exe" -quit -batchmode -nographics -configfile=serverconfig.xml -dedicated





::-------------------------------------------------------------------------------------------------------------

echo|set /p="251570" > steam_appid.txt
set SteamAppId=251570
set SteamGameId=251570

::math unit to convert hour to seconds

set /a time = %hours%*60
 
set /a timeoutput = %time%*60



:start

taskkill /PID %PID% /f
timeout %restartd%
cls
echo Running %task% 
echo.Cycle 1
echo.
set AppCmdLine="%BatCFG%"
set ProcessCmd=wmic process call create %AppCmdLine%
for /f "tokens=3 delims=; " %%a in ('%ProcessCmd% ^| find "ProcessId"') do set PID=%%a
echo SPID=%PID%> SPID.txt

timeout %timeoutput%
