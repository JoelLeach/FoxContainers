@echo off

@echo ------------------------------------------------
@echo Pushing vfp9-runtime images...
@echo ------------------------------------------------
cd vfp9-runtime
call pushimages.cmd

@echo ------------------------------------------------
@echo Pushing vfp9 images...
@echo ------------------------------------------------
cd ..\vfp9
call pushimages.cmd

@echo ------------------------------------------------
@echo Pushing vfp9-runtime-iis images...
@echo ------------------------------------------------
cd ..\vfp9-runtime-iis
call pushimages.cmd

@echo ------------------------------------------------
@echo Pushing vfp9-foxunit images...
@echo ------------------------------------------------
cd ..\vfp9-foxunit
call pushimages.cmd

cd ..
@echo ------------------------------------------------
@echo Pushing VFP images complete.
@echo ------------------------------------------------