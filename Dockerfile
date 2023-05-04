FROM ubuntu:22.04

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
RUN mkdir hadoop
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.2.4/hadoop-3.2.4.tar.gz
RUN tar -xzvf hadoop-3.2.4.tar.gz -C ./hadoop
ADD ./hadoop_config/core-site.xml ./hadoop/hadoop-3.2.4/etc/hadoop
ADD ./hadoop_config/hdfs-site.xml ./hadoop/hadoop-3.2.4/etc/hadoop
ADD ./hadoop_config/hadoop-env.sh ./hadoop/hadoop-3.2.4/etc/hadoop
ADD ./hadoop_config/mapred-site.xml ./hadoop/hadoop-3.2.4/etc/hadoop
ADD ./hadoop_config/yarn-site.xml ./hadoop/hadoop-3.2.4/etc/hadoop
ENV HADOOP_HOME /hadoop/hadoop-3.2.4
ENV PATH $PATH:$HADOOP_HOME/bin
RUN echo "export HADOOP_HOME=./hadoop/hadoop-3.2.4" >>~/.bashrc
RUN echo "export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop" >>~/.bashrc
RUN echo "export HADOOP_HDFS_HOME=$HADOOP_HOME" >>~/.bashrc
RUN echo "export HADOOP_INSTALL=$HADOOP_HOME" >>~/.bashrc
RUN echo "export HADOOP_MAPRED_HOME=$HADOOP_HOME" >>~/.bashrc
RUN echo "export HADOOP_COMMON_HOME=$HADOOP_HOME" >>~/.bashrc
RUN echo "export HADOOP_HDFS_HOME=$HADOOP_HOME" >>~/.bashrc
RUN echo "export YARN_HOME=$HADOOP_HOME" >>~/.bashrc
RUN echo "export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native" >>~/.bashrc
RUN echo "export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin" >>~/.bashrc
RUN echo "export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"" >>~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"
RUN mkdir -P hadoop_data/tmp
RUN mkdir -P hadoop_data/namenode
RUN mkdir -P hadoop_data/datanode 
RUN apt install openssh-server openssh-client -y 
RUN ssh-keygen -t rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN $HADOOP_HOME/bin/hdfs namenode -format
EXPOSE 22

#----Installing Hive----------------------------------------
RUN mkdir hive
RUN wget https://dlcdn.apache.org/hive/hive-3.1.3/apache-hive-3.1.3-bin.tar.gz
RUN tar -xzvf apache-hive-3.1.3-bin.tar.gz -C ./hive
RUN rm -rf ./hive/apache-hive-3.1.3-bin/lib/guava-19.0.jar
ADD ./hive_config/guava-27.0-jre.jar ./hive/apache-hive-3.1.3-bin/lib/
ADD ./hive_config/hive-env.sh ./hive/apache-hive-3.1.3-bin/conf/
ADD ./hive_config/hive-site.xml ./hive/apache-hive-3.1.3-bin/conf/
RUN echo "export HIVE_HOME=./hive/apache-hive-3.1.3-bin" >>~/.bashrc
RUN echo "export PATH=$PATH:$HIVE_HOME/bin" >>~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

LABEL maintainer="Tien Sang Nguyen - ntbs1798@gmail.com"

