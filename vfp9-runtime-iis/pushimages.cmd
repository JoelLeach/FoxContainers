@echo off

@echo ================================================
@echo Pushing Windows Server 2022 image...
@echo ================================================
REM docker tag vfp9-runtime-iis:ltsc2022 joelleach/vfp9-runtime-iis:ltsc2022
docker push joelleach/vfp9-runtime-iis:ltsc2022

@echo ================================================
@echo Pushing Windows Server 2019 20H2 image...
@echo ================================================
REM docker tag vfp9-runtime-iis:20H2 joelleach/vfp9-runtime-iis:20H2
docker push joelleach/vfp9-runtime-iis:20H2

@echo ================================================
@echo Pushing Windows Server 2019 1809 (LTSC) image...
@echo ================================================
REM docker tag vfp9-runtime-iis:1809 joelleach/vfp9-runtime-iis:1809
docker push joelleach/vfp9-runtime-iis:1809