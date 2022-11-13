@echo off

REM If necessary, download FoxUnit.zip
if not exist install\FoxUnit.zip  (
    @echo Downloading FoxUnit...
    curl -o install\FoxUnit.zip https://raw.githubusercontent.com/JoelLeach/FoxUnit/foxunit-zip/ThorUpdater/FoxUnit.zip
)

@echo Removing existing images...
REM May fail if there are any child images. Can prune them later.
powershell -Command docker rmi -f $(docker images 'joelleach/vfp9-foxunit' -a -q)

rem Server 2022 requires Windows 11 or Server 2022 to build image
@echo ================================================
@echo Building Windows Server 2022 image...
@echo ================================================
docker image build --build-arg VFPTag=ltsc2022 --tag joelleach/vfp9-foxunit:ltsc2022 .

@echo ================================================
@echo Building Windows 20H2 image...
@echo ================================================
docker image build --build-arg VFPTag=20H2 --tag joelleach/vfp9-foxunit:20H2 .

@echo ================================================
@echo Building Windows Server 2019 1809 (LTSC) image...
@echo ================================================
docker image build --build-arg VFPTag=1809 --tag joelleach/vfp9-foxunit:1809 .