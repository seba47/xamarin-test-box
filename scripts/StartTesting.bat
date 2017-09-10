@echo off
title Xamarin Test Box 1.0

REM *** VARs declarations - REQUIRED! ***
SET projectName=MyProject

SET androidProjectFilePath=E:\Projects\MyProject\MyProject\MyProject.Droid\MyProject.Droid.csproj

SET xunitPath=E:\Projects\MyProject\packages\xunit.runner.console.2.2.0\tools
SET unitTestProjectFilePath=E:\Projects\MyProject\Test\MyProject.UnitTest\MyProject.UnitTest.csproj
SET unitTestReleaseLibraryPath=E:\Projects\MyProject\Test\MyProject.UnitTest\bin\Release\MyProject.UnitTest.dll

SET nunitPath=C:\Program Files (x86)\NUnit.org\nunit-console
SET uITestProjectFilePath=E:\Projects\MyProject\Test\MyProject.UITest\MyProject.UITest.csproj
SET uiTestReleaseLibraryPath=E:\Projects\MyProject\Test\MyProject.UITest\bin\Release\MyProject.UITest.dll

REM ** BUILD ANDROID PROJECT **
echo.
echo.
echo ////////////////  TESTING %projectName% Project  ////////////////
echo.
TIMEOUT /T 10

REM ** BUILD ANDROID PROJECT **
echo /////////////////////////////////////////////////////////////////
echo ////////////////// BUILDING ANDROID PROJECT /////////////////////
echo /////////////////////////////////////////////////////////////////
echo.
TIMEOUT /T 3
call %windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe "%androidProjectFilePath%" /p:Configuration=Release /t:SignAndroidPackage

TIMEOUT /T 10

REM ** BUILD Unit TEST PROJECT **
echo /////////////////////////////////////////////////////////////////
echo ////////////////// BUILDING UNIT TEST PROJECT ///////////////////
echo /////////////////////////////////////////////////////////////////
echo.
TIMEOUT /T 3
call %windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe "%unitTestProjectFilePath%" /p:Configuration=Release


TIMEOUT /T 10

REM ** BUILD UI TEST PROJECT **
echo /////////////////////////////////////////////////////////////////
echo ////////////////// BUILDING UI TEST PROJECT /////////////////////
echo /////////////////////////////////////////////////////////////////
echo.
TIMEOUT /T 3
call %windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe "%uITestProjectFilePath%" /p:Configuration=Release

TIMEOUT /T 10

REM ** RUN Unit TEST using xUnit **
echo /////////////////////////////////////////////////////////////////
echo ////////////////// RUNNING Unit TEST PROJECT ////////////////////
echo /////////////////////////////////////////////////////////////////
echo.
echo.
echo Opening Unit tests console...
echo.
echo.
TIMEOUT /T 3
cd /d %xunitPath%
start "Xamarin Test Box - Unit Tests" xunit.console.exe "%unitTestReleaseLibraryPath%" -wait

TIMEOUT /T 10

REM ** RUN UI TEST using NUnit **
echo /////////////////////////////////////////////////////////////////
echo ////////////////// RUNNING UI TEST PROJECT //////////////////////
echo /////////////////////////////////////////////////////////////////
echo.
TIMEOUT /T 3
cd /d %nunitPath%
start /WAIT /B "Xamarin UI Tests" nunit3-console.exe "%uiTestReleaseLibraryPath%"

pause > null
exit
