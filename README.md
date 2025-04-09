# docker - IE8 with Silverlight
<b> Run Internet Explorer 8 (with Silverlight support) Inside a Docker Container and Access It Over Your Modern Browser</b>
___

## Purpose

If you need to manage or monitor a Web Service application based on Silverlight, you will need an Internet Explorer or the IE/compatibility mode in Edge (which was also discontinued lately). This bundle offers the option to run everything you need regarding IE and Silverlight in a Linux container.

## General

- **Base Image:** Taken from jlesage/docker-baseimage-gui
- **Dependencies:** This bundle heavily relies on `winehq` and `winetricks` to achieve the desired result.
- **Note:** Please see this project as a Proof of Concept (PoC). It has a lot of potential for improvement and bug fixing.

## How to

1. **Preparation:**
   - Download and place `Silverlight.exe` in the `/build/rootfs/` folder. You can download it from [Softpedia](https://www.softpedia.com/get/Tweak/Browser-Tweak/Microsoft-Silverlight.shtml) or [CNET](https://download.cnet.com/microsoft-silverlight-64-bit/3000-2378_4-75884713.html?_sm_vck=N5MR4QD1140FHTTv4QQjk30JJ57Vn4V1nHFkqN2rv3n4QD7SrZVq&ex=WLS-2202.3). There you find the latest version. Sorry, I am not allowed to upload the exe here, because of the Microsoft's copyright and distribution policies
   - In the main folder, where the `compose.yml` file is placed:

2. **Configuration:**
   - Adapt the `compose.yml` file: For example, change the volume folders and network settings according to your needs.

3. **Build the Image:**
   - Run `docker compose build`. Make sure it finishes completely.

4. **Run the Container:**
   - Run `docker compose up` and monitor the logs in the console and the graphical interface.
   - The GUI can be accessed through a VNC viewer (Port 5900) or through the browser (Port 5800 if you did not change it).

5. **Installation:**
   - Follow all installation steps shown in the UI. Sometimes it takes longer for a pop-up to appear, just wait, it will eventually pop up.
     
6. **Use:**
   - Every time you start the container, you will first see the installer. Close it and IE8 will start.
     
7. **Troubleshoot:**
   - If your container fails to start IE8, you can start from scratch with a fresh wine environment by deleting the .wine folder inside the config/ folder.
     
## ToDo

- Remove unneeded features (f.i. winetricks packages that I added in the process of making this image work as expected)
- Move some installation steps into the building phase.
- A lot of bug fixes needed.
- Test the stability
- Update IE8 to the latest official Version (2017)

  
## Disclaimer

Please note that Microsoft Silverlight has reached the end of its lifecycle and is no longer available for download from Microsoft's official site. If you choose to download Silverlight from third-party sources, be aware of the potential risks involved, including security vulnerabilities and the possibility of downloading malicious software.

So, proceed at your own risk, and ensure you have adequate security measures in place. One suggestion (and how I use it) is to have the silverlight service and the browser isolated from the internet. Thus, it can not be attacked from the outside.

By following these instructions, you acknowledge that you are responsible for any issues that may arise from downloading and using third-party software.


Enjoy & BR


