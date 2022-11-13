@echo off 
rem Access on localhost:3000

docker run -it -p 3000:80 --name vfp9-runtime-iis --hostname vfp9-runtime-iis --volume D:\VFF\DevOps\files:c:\files vfp9-runtime-iis:1809

rem docker run -it -p 3000:80 --name vfp9-runtime-iis --hostname vfp9-runtime-iis --volume F:\DataConversions_Bill_old\import:c:\data vfp9-runtime-iis:20H2

rem docker run -it -p 3000:80 --name vfp9-runtime-iis-1809 --hostname vfp-runtime-iis-1809 --volume D:\VFF\DevOps\files:c:\files vfp9-runtime-iis:1809

rem docker run -it -p 3000:80 --name vfp9-runtime-iis-2016 --hostname vfp9-runtime-iis-2016 --volume D:\VFF\DevOps\files:c:\files vfp9-runtime-iis:ltsc2016