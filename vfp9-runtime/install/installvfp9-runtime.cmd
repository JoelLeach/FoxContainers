@echo off

@echo Installing VFP 9.0 Runtime...
C:\install\VFP9SP2RT.exe /S
REM Since this is run inside cmd script, Windows will wait for it to complete before executing next command
REM Otherwise, Start /Wait would be required to run command

@echo Installing VFP ODBC Driver...
msiexec.exe /i c:\install\VFPODBC.msi /QN /L*V "C:\install\vfpodbc.log"

@echo Installing VFP OLEDB Driver...
msiexec.exe /i c:\install\VFPOLEDBSetup.msi /QN /L*V "C:\install\vfpoledb.log"

@echo Installing FoxConsole...
move "C:\install\FoxConsole" "C:\Program Files (x86)\FoxConsole"
setx path "%path%;C:\Program Files (x86)\FoxConsole"
REM VFP Runtime files are duplicated here. Otherwise, registration below fails when building container.


@echo Registering FoxCOM.exe...
"C:\Program Files (x86)\FoxConsole\FoxCOM.exe" /regserver

@echo VFP 9.0 Runtime installation complete.

REM Dockerfile handles removing C:\install