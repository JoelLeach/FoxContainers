@echo off
docker run -it --name vfp9-1809 --hostname vfp-1809 --volume D:\VFF\DevOps\files:c:\files vfp9:1809

rem docker run -it --name vfp9 --hostname vfp9 --volume D:\VFF\DevOps\files:c:\files vfp9:20H2

rem docker run -it --name vfp9-2022 --hostname vfp9-2022 --volume D:\VFF\DevOps\vfp9\files:c:\files vfp9:ltsc2022