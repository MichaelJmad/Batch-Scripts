@echo off
color 0A
@rem http://media.steampowered.com/installer/steamcmd.zip
SETLOCAL ENABLEDELAYEDEXPANSION

    :: _________________________________________________________
    :: Do not run this script unless its in its own folder
    :: _________________________________________________________

    :: Your steam login example STEAMLOGIN= User name password
	:: If it ask for your Steam Guard enter it and then type exit. Then rerun this script. 
    SET STEAMLOGIN= anonymous
	:: The AppID of the Game/Server you wish to Install/Update
	:: Set your AppID example AppID=739590
    SET AppID=403240 


    :: DEFINE the following variables where applicable to your install
	:: Use this " %~dp0 " for file directory if you want everything saved to the same folder you run the batch from.
	
    :: set this to your steam CMD folder
	:: Only change this if you have steamCMD already installed or change to the folder where you want steamCMD installed.
	:: Leaving this to default will install steamCMD in the folder were the batch was ran from.
    SET STEAMPATH=E:\steam
	
	:: Set this to the folder where you wish to install/update your server. 
	:: Leaving this to default and it will install in the folder were the batch was ran from.
    SET InstallLocation=%~dp0

	
    
	
:: Do not edit below this line unless you know what your doing.
:: _________________________________________________________


:: Checks if steamCMD is installed if it isn't the it will download and unzip it to the defined directory.
::______________________________________________________________________________________________________________


:CheckSteam
IF EXIST "%STEAMPATH%" (
    goto Part2
) ELSE (
    mkdir %STEAMPATH%%
	goto Part2
)

:Part2
IF EXIST "%STEAMPATH%\steamcmd.exe" (
    goto UpdateServer
) ELSE (
    goto DownloadSteam
)


:DownloadSteam
echo downloading steamCMD please wait
bitsadmin.exe /transfer "Downloading steam" https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip %STEAMPATH%\steamcmd.zip
goto UnzipSteam
:UnzipSteam
echo unziping SteamCMD
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('%STEAMPATH%\steamcmd.zip', '%STEAMPATH%'); }"
goto UpdateServer
::______________________________________________________________________________________________________________


:UpdateServer
echo.
echo     You are about to Install/update your server
echo        Dir: %InstallLocation%
echo        
echo.
%STEAMPATH%\steamcmd.exe +force_install_dir %InstallLocation% +login %STEAMLOGIN% +"app_update %AppID%" validate +quit
echo .
echo     Your Game Server is now up to date
timeout 10
