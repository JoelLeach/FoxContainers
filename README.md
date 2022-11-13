# FoxContainers
Pre-built Visual FoxPro containers. Containers can be built on top of these images, or the Dockerfiles can be used as examples for creating images from scratch.

## Images
- [vfp9-runtime](vfp9-runtime): A container with the VFP9 runtime preinstalled.  The VFP ODBC and OLEDB drivers have been included as well.
- [vfp9-runtime-iis](vfp9-runtime-iis): Includes IIS inside the container with the runtime.
- [vfp9](vfp9): The VFP9 IDE that can be used for automated builds.
- [vfp9-foxunit](vfp9-foxunit): Inherits from the vfp9 image and adds FoxUnit as a layer.

## Scripts
Batch files and Dockerfile arguments are used to build each container for multiple operating systems.

## Docker Hub
Images are hosted on [Docker Hub](https://hub.docker.com/u/joelleach).

## Video
The Fox Containers project was announced and demonstrated at Virtual Fox Fest 2022 (October):

[DevOps with Visual FoxPro](https://youtu.be/FNFk1CpBzjE)

## FoxConsole
FoxConsole is included with all FoxContainers. Enter **foxc** at the command prompt inside container to start.