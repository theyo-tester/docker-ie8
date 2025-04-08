# docker-ie8 with Silverlight
Run Internet Explorer 8 inside a docker container and access it over your modern browser

Purpuose:
- In case you have to manage/monitor a web application that is based on Silverlight you have no other chance than to use the Internet Eplorer mode.
- This bundle offers the option to run everything you need regarding IE and Silverlight in a Linux container.

General:
- Base image taken from: https://github.com/jlesage/docker-baseimage-gui
- This bundle relies havily on uses winehq and wintricks to achieve the desired result.
- Please see this trial as a PoC :). It has a lot of potential for improvement and bugfixing.

How to:

In the main folder, where the compose.yml file is placed:
1. Download and place Silverlight.exe int the /build/rootfs/ folder. I have downloaded it from https://www.softpedia.com/get/Tweak/Browser-Tweak/Microsoft-Silverlight.shtml There you find the latest version. Sorry, I am afraid I am not allowed to upload the exe here...
2. Adapt the compose.yml: F.I. Change the volume folders and network settings according to your needs
3. Build the image: docker compose build. Make sure it is finished completely
4. run docker compose up and monitor the LOGS in the console AND the Graphical interface.
5. The GUI can be accessed through a VNC viewer (Port 5900) or thorugh the browswer (Port 5800 if you did not change it the)
6. Follow all installation steps shown in the UI. Sometimes it takes longer for a pop-up to appear, just wait, it will evenually pop up.

ToDo: 
1. Remove unneded features.
2. Move some installation steps in the building phase
3. Lot of bufixes needed

enjoy & BR

