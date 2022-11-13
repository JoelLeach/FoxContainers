@echo off

docker run -it --name vfp9-runtime --hostname vfp9-runtime --volume D:\VFF\DevOps\files:c:\files --volume D:\VFF\DevOps\Northwind:C:\Northwind vfp9-runtime:1809

rem docker run -it --name vfp9-runtime --hostname vfp9-runtime --volume F:\DataConversions_Bill_old\import:c:\data vfp9-runtime:20H2

rem docker run -it --name vfp9-runtime-1809 --hostname vfp-runtime-1809 --volume D:\VFF\DevOps\files:c:\files vfp9-runtime:1809

rem docker run -it --name vfp9-runtime-2016 --hostname vfp9-runtime-2016 --volume D:\VFF\DevOps\files:c:\files vfp9-runtime:ltsc2016