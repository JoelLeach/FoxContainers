@echo off

@echo Removing existing images...
REM May fail if there are any child images. Can prune them later.
powershell -Command docker rmi -f $(docker images 'vfp9-runtime-iis' -a -q)
powershell -Command docker rmi -f $(docker images 'vfp9-foxunit' -a -q)
powershell -Command docker rmi -f $(docker images 'vfp9' -a -q)
powershell -Command docker rmi -f $(docker images 'vfp9-runtime' -a -q)

@echo ------------------------------------------------
@echo Building vfp9-runtime images...
@echo ------------------------------------------------
cd vfp9-runtime
call buildimages.cmd

@echo ------------------------------------------------
@echo Building vfp9 images...
@echo ------------------------------------------------
cd ..\vfp9
call buildimages.cmd

@echo ------------------------------------------------
@echo Building vfp9-runtime-iis images...
@echo ------------------------------------------------
cd ..\vfp9-runtime-iis
call buildimages.cmd

@echo ------------------------------------------------
@echo Building vfp9-foxunit images...
@echo ------------------------------------------------
cd ..\vfp9-foxunit
call buildimages.cmd

cd ..
@echo ------------------------------------------------
@echo Building VFP images complete.
@echo ------------------------------------------------