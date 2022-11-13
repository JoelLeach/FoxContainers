@echo off

@echo Installing VFP 9.0...
move "C:\install\Microsoft Visual FoxPro 9" "C:\Program Files (x86)\Microsoft Visual FoxPro 9"

@echo Registering VFP 9.0...
"C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe" /regserver

@echo VFP 9.0 installation complete.

REM Dockerfile handles removing C:\install