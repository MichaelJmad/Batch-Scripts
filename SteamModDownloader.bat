@echo off
::JMAD community mod downloader and rename script
:: Steamcmd Path
set steamcmdpath=E:\steam
::Steam username and Password
set Username=
set Pass=
:: Location to download mods to and location to move renamed mods. Mods when downloaded will be saved in a folder with the moid id. 
:: Hence why we are renaming and moving to a diffrent folder, It will help keep mods upto date
set download=E:\ArmaServer\ArmaMods\downloads
set moveto=E:\ArmaServer\ArmaMods\renamed\
:: Game id must be set for the game you are downloading mods for in this example this id is for arma..
:: you can get the steam app id from here https://steamdb.info/
set gameid=107410
:: The mod id can be found on the mods steam page or URL
set modid=338988835
:: The mods Name
set modname="@MCC"


:: Do not edit below this line unless you are Kerby/K4tniss
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: SteamCMD Download script
echo Downloading the Mod: %modname% - ID: %modid%
echo.
timeout 1
echo.
%steamcmdpath%\steamcmd.exe +force_install_dir "%download%" +login %Username% %pass% +workshop_download_item %gameid%  %modid% validate +quit
timeout 1
cls
echo Download Complete
timeout 1
cls

::Renaming and moving script
echo Renaming and Moveing Mod
xcopy %download%\steamapps\workshop\content\%gameid%\%modid% "%moveto%\%modname%" /E/y/i
timeout 1
exit
