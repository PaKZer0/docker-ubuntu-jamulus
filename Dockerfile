FROM ubuntu:bionic
MAINTAINER Francisco Fuentes dmusta1ne.pak@gmail.com

WORKDIR /opt/
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get -y update && apt-get -y install build-essential wget curl && \
    apt-get -y install cmake gcc g++ && \
    apt-get -y install build-essential qt5-qmake qtdeclarative5-dev \
        qt5-default qttools5-dev-tools libjack-jackd2-dev && \
    apt-get -y install qjackctl && \
    apt-get install -y dh-make bzr-builddeb vim expect

ADD autopoint.sh /opt/autopoint.sh
ADD expect_bzr.sh /opt/expect_bzr.sh
ADD package.sh /opt/package.sh
RUN chmod +x /opt/autopoint.sh; chmod +x /opt/package.sh; \
    chmod +x /opt/expect_bzr.sh; chmod go+rw -R /opt/

RUN ./autopoint.sh

RUN useradd -ms /bin/bash newuser
USER newuser

ENTRYPOINT ["/opt/package.sh"]
#RUN cd /opt/; sleep 5s; export USER=newuser; ./package.sh
