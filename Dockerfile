FROM ubuntu

#----Set up ubuntu and installing java------------------------- 
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install vim sudo
RUN apt-get -y install openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >>~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

#-----Installing hadoop-----------------------------




LABEL maintainer="Tien Sang Nguyen - ntbs1798@gmail.com"

