@echo off
net use P: /DEL /Y
cls
set user=%username%

set i=0
set group=Administratoren
echo Checking if %user% is member of %group%...
for /f %%f in ('"net user %user% /domain | findstr /i %group%"') do set /a i=%i%+1
if %i% gtr 0 (goto :end)

set i=0
set group=Verkauf_Leitung
echo Checking if %user% is member of %group%...
for /f %%f in ('"net user %user% /domain | findstr /i %group%"') do set /a i=%i%+1
if %i% gtr 0 (goto :Verkauf_Leitung)

set i=0
set group=Verkauf
echo Checking if %user% is member of %group%...
for /f %%f in ('"net user %user% /domain | findstr /i %group%"') do set /a i=%i%+1
if %i% gtr 0 (goto :Verkauf)

set i=0
set group=Admin_Leitung
echo Checking if %user% is member of %group%...
for /f %%f in ('"net user %user% /domain | findstr /i %group%"') do set /a i=%i%+1
if %i% gtr 0 (goto :Admin_Leitung)

set i=0
set group=Admin
echo Checking if %user% is member of %group%...
for /f %%f in ('"net user %user% /domain | findstr /i %group%"') do set /a i=%i%+1
if %i% gtr 0 (goto :Admin)

set i=0
set group=Entwicklung_Leitung
echo Checking if %user% is member of %group%...
for /f %%f in ('"net user %user% /domain | findstr /i %group%"') do set /a i=%i%+1
if %i% gtr 0 (goto :Entwicklung_Leitung)

set i=0
set group=Entwicklung
echo Checking if %user% is member of %group%...
for /f %%f in ('"net user %user% /domain | findstr /i %group%"') do set /a i=%i%+1
if %i% gtr 0 (goto :Entwicklung)


goto :end

:verkauf
net use P: \\10.0.10.21\Verkauf\Allgemein
goto :end

:verkauf_Leitung
net use P: \\10.0.10.21\Verkauf
goto :end

:Admin
net use P: \\10.0.10.21\Admin\Allgemein
goto :end

:Admin_Leitung
net use P: \\10.0.10.21\Admin
goto :end

:Entwicklung
net use P: \\10.0.10.21\Entwicklung\Allgemein
goto :end

:Entwicklung_Leitung
net use P: \\10.0.10.21\Entwicklung
goto :end

:end
REM pause
