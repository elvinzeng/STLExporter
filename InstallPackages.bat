@echo off 
if not exist "npl_packages" ( mkdir npl_packages )

pushd "npl_packages"

CALL :InstallPackage main
popd

EXIT /B %ERRORLEVEL%

rem install function here
:InstallPackage
if exist "%1\README.md" (
    pushd %1
    git reset --hard
	git pull
    popd
) else (
    rmdir /s /q "%CD%\%1"
    git clone https://github.com/NPLPackages/%1
)
EXIT /B 0