@echo off
title Xamarin Test Local Server v1.0

echo.
echo.
echo Initializing Xamarin Test Local Server...
echo.
echo.
start "Git Pull" scripts\pull-git-repo.sh
TIMEOUT /T 15
call "cmd /c start scripts\StartTesting.bat"
exit

