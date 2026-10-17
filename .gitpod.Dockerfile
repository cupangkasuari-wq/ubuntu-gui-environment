FROM ubuntu:latest

# Install desktop components and VNC server
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
    novnc \
    websockify \
    curl \
    git \
    && apt-get clean

# Set up browser display port
EXPOSE 6080
CMD ["/usr/share/novnc/utils/launch.sh", "--vnc", "localhost:5901", "--listen", "6080"]
