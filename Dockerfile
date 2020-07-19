FROM openjdk:8u191-jdk-alpine

RUN mkdir /minecraft
WORKDIR /minecraft

RUN wget https://serverjars.com/jars/proxies/waterfall/waterfall-1.12.jar -O waterfall.jar

COPY entrypoint.sh .
ENTRYPOINT [ "entrypoint.sh" ]