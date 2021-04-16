FROM openjdk:12-jdk-alpine

RUN mkdir /minecraft
WORKDIR /minecraft

RUN wget https://serverjars.com/jars/proxies/waterfall/waterfall-1.16.jar -O waterfall.jar

COPY entrypoint.sh .
ENTRYPOINT [ "entrypoint.sh" ]
