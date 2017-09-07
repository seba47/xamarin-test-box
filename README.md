
# Xamarin Test Local Server for Windows

Run Xamarin UI and Unit Tests in Windows with only 2 clicks. Pull from your repo, build projects and run tests.

**Platform Support**

|Platform|Available|
| ------------------- | :-----------: |
|Xamarin.Android|![alt text](https://www.pedshoes.com/images/general/greenCheck50x50Transparent.png)|
|Xamarin.iOS|![alt text](http://i4ultimate.com/alertemails/warning-icon-orange.png)|

## Requirements

 - MsBuild (included with Visual Studio)
 - Xamarin Project with UI/Unit Test Projects within a git repository in your system.
 - UITest project with a real device configured (e.g: check Test.Cs section in http://sebacabrera.com/automated-xamarin-ui-tests-and-recorder/)
 - Add xunit console package in your UnitTest project - by Package
   Manager in VS or https://www.nuget.org/packages/xunit.runner.console
 - NUnit Console for Windows - http://nunit.org/download/
 - Git Bash - https://git-for-windows.github.io/



## Pre-Configuration

#### Git Bash
If you have not used the bash, please login with your credentials because they will be needed later to get the last version of the tests.

#### xUnit and NUnit console don´t need configuration



## Setup

Complete your project path in **pull-git-repo.sh**
```bash
...
cd /e/Projects/MyProject
...
```
 
Complete project name and paths in **StartTesting.bat**
```bash
...
REM *** VARs declarations - REQUIRED! ***
SET projectName=MyProject

SET androidProjectFilePath=E:\Projects\MyProject\MyProject\MyProject.Droid\MyProject.Droid.csproj

SET xunitPath=E:\Projects\MyProject\packages\xunit.runner.console.2.2.0\tools
SET unitTestProjectFilePath=E:\Projects\MyProject\Test\MyProject.UnitTest\MyProject.UnitTest.csproj
SET unitTestReleaseLibraryPath=E:\Projects\MyProject\Test\MyProject.UnitTest\bin\Release\MyProject.UnitTest.dll

SET nunitPath=C:\Program Files (x86)\NUnit.org\nunit-console
SET uITestProjectFilePath=E:\Projects\MyProject\Test\MyProject.UITest\MyProject.UITest.csproj
SET uiTestReleaseLibraryPath=E:\Projects\MyProject\Test\MyProject.UITest\bin\Release\MyProject.UITest.dll
...
```

## Running Test Process

Open Run.bat and the process will be the next:

* Git Pull on the current branch of the project
* Build Android project (If your git pulls take much longer time,you can increase the waiting time for compiling Androind: into Run.bat - line 10)
* Build UnitTest project
* Build UITest project
* Open xUnit Console and run Unit tests
* Run UI tests in the connected device


## Version history

*1.0* (September 07, 2017)

* First version which is run manually in windows.

## Working on

*  Mac support
*  Continuous Integration with GitHub Repos using WebHooks and Node.js

## Contributions
Feel free to add improvements and all stuffs that help us to get a better testing process.
