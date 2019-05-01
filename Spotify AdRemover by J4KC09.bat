@echo off
TITLE Spotify AdRemover by J4KC09
MODE con:cols=60 lines=8
COLOR 0a
if _%1_==_payload_  goto :payload

:getadmin
    echo %~nx0: elevating self
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload

:inicio
SET var=0
cls
echo  1. Block Ads                                         
echo  2. Uninstall                                             
echo  3. Exit                                                                 
echo.

SET /p var= ^Select a option [1-3]: 

if "%var%"=="0" goto inicio
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto salir

::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo The number "%var%" is not a valid number, try again.
echo.
pause
echo.
goto:inicio

:op1
    echo.
    taskkill /f /im Spotify.exe 2> NUL
    taskkill /f /im spotifywebhelper.exe 2> NUL
    echo ^ 0.0.0.0 spclient.wg.spotify.com >> C:\Windows\System32\drivers\etc\hosts
    echo ^ 0.0.0.0 ads.pubmatic.com >> C:\Windows\System32\drivers\etc\hosts
    echo ^ 0.0.0.0 gads.pubmatic.com >> C:\Windows\System32\drivers\etc\hosts
    echo ^ 0.0.0.0 www.googletagservices.com >> C:\Windows\System32\drivers\etc\hosts
    echo ^ 0.0.0.0 securepubads.g.doubleclick.net >> C:\Windows\System32\drivers\etc\hosts
    echo ^ 0.0.0.0 pubads.g.doubleclick.net >> C:\Windows\System32\drivers\etc\hosts
    ipconfig /flushdns
    test&cls
    echo Successfully completed.
    echo.
    pause
    start C:\Users\%username%\AppData\Roaming\Spotify\Spotify.exe
    goto:salir

:op2
    echo.
    taskkill /f /im Spotify.exe 2> NUL
    taskkill /f /im spotifywebhelper.exe 2> NUL
    findstr /V "0.0.0.0" "C:\Windows\System32\drivers\etc\hosts" > C:\Windows\temp\hosts
    move /Y "C:\Windows\temp\hosts" "C:\Windows\System32\drivers\etc\hosts"
    test&cls
    echo Successfully completed.
    echo.
    pause
    start C:\Users\%username%\AppData\Roaming\Spotify\Spotify.exe
    goto:inicio

:salir
    @cls&exit