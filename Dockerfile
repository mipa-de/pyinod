# syntax=docker/dockerfile:1

FROM python:3.6-slim-buster

WORKDIR /app

RUN apt-get update 
RUN apt-get install -y curl


# RUN apt-get update

RUN apt-get update 
RUN	apt-get install -y git 
RUN	apt-get install -y vim 
RUN	apt-get install -y gcc


RUN cd /app
RUN git clone https://github.com/mipa-de/influxdb-odata-server/
#Set working directory

RUN python -m pip install --upgrade pip
WORKDIR /app/influxdb-odata-server

RUN pip install -r requirements.txt
CMD COPY /

RUN python startServer.py -c settings.conf -m

ARG GIT_HASH
ENV GIT_HASH=${GIT_HASH:-dev}

EXPOSE 8080
CMD python startServer.py -c /mnt/settings.conf



