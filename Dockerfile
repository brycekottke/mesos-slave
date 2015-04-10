FROM ubuntu:14.04
MAINTAINER Bryce Kottke <bkottke3@gmail.com>

RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get update
RUN apt-get install -y mesos
RUN service zookeeper stop
RUN apt-get -y remove --purge zookeeper
RUN echo manual > /etc/init/mesos-master.override

CMD ["mesos-slave", "--master=172.19.8.101:5050"]
