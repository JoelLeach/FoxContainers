@echo off 
rem Access on localhost:3000

docker run -it -p 3000:80 --name vfp9-runtime-iis --hostname vfp9-runtime-iis joelleach/vfp9-runtime-iis:1809
