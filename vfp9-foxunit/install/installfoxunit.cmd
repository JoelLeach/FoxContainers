@echo off

@echo Installing FoxUnit...

powershell -command "Expand-Archive -Force 'C:\install\FoxUnit.zip' 'C:\'"

@echo FoxUnit installation complete.

REM Dockerfile handles removing C:\install