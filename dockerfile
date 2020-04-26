FROM jenkins/jnlp-slave
MAINTAINER exlinetr<it@exlinetr.com>

LABEL Author="exlinetr"
LABEL AuthorMail="it@exlinetr.com"
LABEL Version="1.0.0"


USER root

RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get install curl -y
RUN apt-get install gettext-base -y
RUN apt-get install software-properties-common -y

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    cosmic \
    stable"

RUN apt-get update 
RUN apt-get install docker-ce-cli -y

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl