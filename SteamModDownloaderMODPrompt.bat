@echo off

goto start
::JMAD community mod downloader and rename script
:: Steamcmd Path
set steamcmdpath=E:\steam
::Steam username and Password
set Username=username
set Pass=pass
:: Location to download mods to and location to move renamed mods. Mods when downloaded will be saved in a folder with the moid id. 
:: Hence why we are renaming and moving to a diffrent folder, It will help keep mods upto date
set download=E:\ArmaServer\ArmaMods\downloads
set moveto=E:\ArmaServer\ArmaMods\renamed\
:: Game id must be set for the game you are downloading mods for in this example this id is for arma..
:: you can get the steam app id from here https://steamdb.info

::gameid="107410"   modid="338988835"    modname="@MCC"
:start
set /P gameid="Enter Game Id= "
:: The mod id can be found on the mods steam page or URL
set /P modid="Enter Mod Id= "
:: The mods Name
set /P modname="Enter Mod name example @MCC= "


:: Do not edit below this line unless you are Kerby/K4tniss
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------

:: SteamCMD Download script
echo Downloading the Mod: %modname% - ID: %modid%
echo.
timeout 5
echo.
%steamcmdpath%\steamcmd.exe +login %Username% %pass% +force_install_dir "%download%" +workshop_download_item %gameid%  %modid%" validate +quit
cls
echo Download Complete
timeout 5
cls

::Renaming and moving script
echo Renaming and Moveing Mod
xcopy %download%\steamapps\workshop\content\%gameid%\%modid% "%moveto%\%modname%" /E/y/i
timeout 3 
exit
