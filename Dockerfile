FROM ubuntu:focal as build

USER root
WORKDIR /tmp

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update --yes && \
    apt-get upgrade --yes && \
    apt-get install --yes --no-install-recommends \
    ca-certificates \
    wget \
    unzip

# Downloading jdk17
RUN wget https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz
RUN tar xvf openjdk-17_linux-x64_bin.tar.gz
# Downloading ijava 1.3
RUN wget https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip
RUN mkdir ijava-1.3.0
RUN unzip ijava-1.3.0.zip -d ijava-1.3.0

FROM jupyter/base-notebook

USER root
RUN mkdir /opt/jdk-17 && mkdir /tmp/ijava-1.3.0
COPY --from=build /tmp/jdk-17 /opt/jdk-17
COPY --from=build /tmp/ijava-1.3.0 /tmp/ijava-1.3.0
RUN python /tmp/ijava-1.3.0/install.py
RUN rm -rf /tmp/ijava-1.3.0
RUN ln -sf /opt/jdk-17/bin/java /usr/local/bin/java

USER jovyan
