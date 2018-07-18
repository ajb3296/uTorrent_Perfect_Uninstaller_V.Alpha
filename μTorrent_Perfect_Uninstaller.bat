@echo off
pushd %~dp0
SETLOCAL ENABLEEXTENSIONS
setlocal enabledelayedexpansion
cls

::chack zip file
if not exist system\chack\レTorrent_Perfect_Uninstaller (goto chack)

::chack レTorrent
if not exist %appdata%\uTorrent\uTorrent.exe (goto nouTorrent)

::Set window size
mode.com con cols=95 lines=30

::chack required files
if not exist system\uninstallw\uninstallw.exe (goto nofile)
if not exist system\messagebox\MessageBox.exe (goto nofile)
if not exist system\df.bat (goto nofile)
if not exist system\reg.bat (goto nofile)
if not exist system\ (goto nofile)

::set other
set v=V1.0
set ut=レTorrent Perfect Uninstaller
set ut1=レTorrent_Perfect_Uninstaller
set zc=Zero_Cleaner
set dreg=0
set df=0

::set title
title %ut% %v%



:loading
cls
echo.
echo.
echo.
echo.
echo.        ++++++++++++++++        
echo.     ++++++++++++++++++++++     
echo.    +++++++++=++++++   :++++    
echo.  *+++++:+++====+++     +++++*  
echo. %++      ++++++++++     +++++  
echo. +++=      ++++++++++     *++++ 
echo. ++++       +++++++++=     ++++ 
echo. +++++       +++++++++      *++    Perfect Uninstaller
echo. *+++++       ++++++++          
echo.  ++++++         ..     +*      
echo.  #+++++              +++++++*  
echo.    *++++      :++++++++++++    
echo.     #*+++      ++++++++++*     
echo.        #**      +++++**        
echo.             =====#             
echo.
echo. [ %ut% %v% ]
echo. GNU General Public License
timeout/t 2 /nobreak>nul

::chack root
bcdedit > nul || (goto noroot)

SETLOCAL ENABLEDELAYEDEXPANSION
system\MESSAGEBOX\MESSAGEBOX.EXE /C:%ut1% /T:4132 /M:%ut1% follows the GNU General Public License. No warranties of any kind with respect to this program are provided.
IF !ERRORLEVEL! EQU 7 (
	ENDLOCAL
	SET ERRCODE=999
	exit
) ELSE (
	ENDLOCAL
)

::make Zero_Cleaner log folder
if not exist "%SYSTEMDRIVE%\%zc%_log" do (
mkdir "%SYSTEMDRIVE%\%zc%_log" >Nul 2>Nul
)
if not exist "%SYSTEMDRIVE%\%zc%_log" do (
mkdir "%SYSTEMDRIVE%\%zc%_log" >Nul 2>Nul
)
if not exist "%SYSTEMDRIVE%\%zc%_log" do (
mkdir "%SYSTEMDRIVE%\%zc%_log" >Nul 2>Nul
)
if not exist "%SYSTEMDRIVE%\%zc%_log" do (
mkdir "%SYSTEMDRIVE%\%zc%_log" >Nul 2>Nul
)
set "strtmp=%date% %time%"
set "datetime=%strtmp%"
set "rptdate=%strtmp:-=%"
set "rptdate=%rptdate:/=%"
set "rptdate=%rptdate::=%"
set "rptdate=%rptdate:.=%"
set "rptdate=%rptdate: =%"
set log=%SYSTEMDRIVE%\%zc%_log\%ut1%_log[%rptdate%].log

::start Log
echo %ut% %v% >%log%
echo.>>%log%

:main
echo.
echo. If you have removed the レTorrent, press the ENTER key.
system\uninstallw\uninstallw.exe utorrent >>%log%
pause>nul
echo.
echo.--------------------------------------------------------------------
echo.
echo. >>%log%
echo.-------------------------------------------------------------------- >>%log%
echo. >>%log%
echo. Removing the registry related to レTorrent. . .
echo Removing the registry related to レTorrent. . .>>%log%
reg delete HKEY_CLASSES_ROOT\uTorrent /f >Nul 2>Nul
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Classes\utorrent /f >Nul 2>Nul
reg delete HKEY_CLASSES_ROOT\utorrent /f >Nul 2>Nul
echo Complete^^! >>%log%
echo Complete^^!
echo.
echo.--------------------------------------------------------------------
echo.
echo. >>%log%
echo.-------------------------------------------------------------------- >>%log%
echo. >>%log%
echo. Remove files related to レTorrent
echo Remove files related to レTorrent >>%log%
del /q /s /f "%appdata%\uTorrent" >>%log%
del /q /s /f "%ProgramFiles%\utorrent" >>%log%
del /q /s /f "%systemdrive%\uTorrent.exe" >>%log%
del /q /s /f "%systemdrive%\*.torrent" >>%log%
del /q /s /f "%systemdrive%\*.!ut" >>%log%
echo Complete^^! >>%log%
echo. Complete^^!
echo.
echo. Press the ENTER key to exit the program.
start %log%
pause>nul
exit

:noroot
COLOR 4F
SETLOCAL ENABLEDELAYEDEXPANSION
system\MESSAGEBOX\MESSAGEBOX.EXE /C:Please check administrator privileges for %ut1%^^! /T:4132 /M:%ut1% did not get administrator rights.^^!\nIf you press the "Yes" key, %ut1% will restart with administrator rights..\nPress the No key to exit %ut1%.
IF !ERRORLEVEL! EQU 7 (
	ENDLOCAL
	SET ERRCODE=999
	exit
) ELSE (
	ENDLOCAL
)
goto startadmine
:startadmine
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
pushd "%CD%"
    CD /D "%~dp0"
exit /b

:nofile
COLOR 4F
cls
title The file system is corrupted.
echo. 
echo. The file system is corrupted^^!
echo. 
echo. Press the ENTER key to exit.
pause>nul
exit

:nouTorrent
cls
title レTorrent does not exist
echo.
echo. レTorrent does not exist
echo. 
echo. Press the ENTER key to exit.
pause>nul
exit

:chack
COLOR 4F
cls
title Please unzip the file properly and execute it.
echo.
echo. Please unzip the file properly and execute it.
echo.
echo. Press the ENTER key to exit the program.
PAUSE>NUL
exit