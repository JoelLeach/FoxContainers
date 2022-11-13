@echo off

REM If necessary, download installers
if not exist install\VFP9SP2RT.exe  (
    @echo Downloading VFP 9.0 Runtime...
    curl -o install\VFP9SP2RT.exe https://raw.githubusercontent.com/VFPX/VFPRuntimeInstallers/master/VFP9SP2RT.exe
)
if not exist install\VFPODBC.msi  (
    @echo Downloading VFP ODBC Driver...
    curl -o install\VFPODBC.msi https://raw.githubusercontent.com/VFPX/VFP9SP2Hotfix3/master/VFPODBC.msi
)
if not exist install\VFPOLEDBSetup.msi  (
    @echo Downloading VFP OLEDB Driver...
    curl -o install\VFPOLEDBSetup.msi https://raw.githubusercontent.com/VFPX/VFP9SP2Hotfix3/master/VFPOLEDBSetup.msi
)

@echo Copying latest FoxConsole...
if exist "D:\VFPX\FoxConsole\FoxConsole\bin\Release\net46\win7-x86\foxc.exe" (
    xcopy "D:\VFPX\FoxConsole\FoxConsole\bin\Release\net46\win7-x86\*.*" "install/FoxConsole" /Y
)

@echo Removing existing images...
REM May fail if there are any child images. Can prune them later.
powershell -Command docker rmi -f $(docker images 'vfp9-runtime' -a -q)

rem Server 2022 requires Windows 11 or Server 2022 to build image
@echo ================================================
@echo Building Windows Server 2022 image...
@echo ================================================
docker image build --build-arg WinTag=windows/server:ltsc2022 --tag vfp9-runtime:ltsc2022 .

@echo ================================================
@echo Building Windows Server 2019 20H2 image...
@echo ================================================
docker image build --build-arg WinTag=windows:20H2 --tag vfp9-runtime:20H2 .

@echo ================================================
@echo Building Windows Server 2019 1809 (LTSC) image...
@echo ================================================
docker image build --build-arg WinTag=windows:1809 --tag vfp9-runtime:1809 .

rem Microsoft doesn't provide full API image for Server 2016
rem @echo Building Windows Server 2016 1607 (LTSC) image...
rem docker image build --build-arg WinTag=windows:1607 --tag vfp9-runtime:1607 .