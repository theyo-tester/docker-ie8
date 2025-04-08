# Pull base image.
FROM jlesage/baseimage-gui:debian-12-v4

WORKDIR /tmp

RUN dpkg --add-architecture i386

RUN apt-get update && apt-get install -y wget locales
# Set locale environment variables
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8

RUN mkdir -pm755 /etc/apt/keyrings

RUN wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

RUN wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources

RUN apt-get update && \
        apt install -y --install-recommends winehq-staging vulkan-tools mesa-vulkan-drivers cabextract

RUN wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && mv winetricks /usr/local/bin/
RUN chmod -R 777 /usr/local/bin/winetricks

RUN apt-get install -y libvulkan1 libvulkan1:i386 iproute2 iputils-ping file winbind xvfb && \
    apt-get clean

#RUN curl -fSsL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft-edge.gpg > /dev/null
#RUN echo 'deb [signed-by=/usr/share/keyrings/microsoft-edge.gpg] https://packages.microsoft.com/repos/edge stable main' | sudo tee /etc/apt/sources.list.d/microsoft-edge.list

#RUN apt-get update && \
#    apt install microsoft-edge-stable && \
#        apt-get clean

# Copy the start script. (and other files to set up the firefox profile)
COPY rootfs/ /

RUN chmod +x /Silverlight.exe
# Set the name of the application.
RUN set-cont-env APP_NAME "wine-ie8"
