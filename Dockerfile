FROM ubuntu:14.04
MAINTAINER padro@cs.upc.edu

# Install dependencies
RUN locale-gen en_US.UTF-8 && \
    apt-get update -q && \
    apt-get install -y build-essential automake autoconf libtool wget \
                       libicu52 libboost-regex1.54.0 \
                       libboost-system1.54.0 libboost-program-options1.54.0 \
                       libboost-thread1.54.0 libicu-dev libboost-regex-dev \
                       libboost-system-dev libboost-program-options-dev \
                       libboost-thread-dev zlib1g-dev python3-dev make \
                       subversion swig g++ libboost-all-dev

# Install Freeling and compile Python3 API
WORKDIR /tmp
RUN wget --progress=dot:giga https://github.com/TALP-UPC/FreeLing/releases/download/4.0/FreeLing-4.0.tar.gz && \
    tar xvzf FreeLing-4.0.tar.gz && \
    rm -rf FreeLing-4.0.tar.gz && \
    cd /tmp/FreeLing-4.0 && \
    autoreconf --install && \
    ./configure && \
    make && \
    make install
RUN cd /tmp && svn export https://github.com/TALP-UPC/FreeLing.git/trunk/APIs --trust-server-cert && cd APIs/python && make
RUN mkdir -p /root/.local/lib/python3.4/site-packages/ && cd /tmp/APIs/python && cp -r * /root/.local/lib/python3.4/site-packages/

# Delete files
#RUN rm -rf /tmp/FreeLing-4.0 && \
#    apt-get --purge -y remove build-essential libicu-dev \
#            libboost-regex-dev libboost-system-dev \
#            libboost-program-options-dev libboost-thread-dev zlib1g-dev\
#            automake autoconf libtool wget && \
#    apt-get autoremove -y && \
#    apt-get clean -y && \
#    rm -rf /usr/local/share/freeling/as && \
#    rm -rf /usr/local/share/freeling/cy && \
#    rm -rf /usr/local/share/freeling/de && \
#    rm -rf /usr/local/share/freeling/fr && \
#    rm -rf /usr/local/share/freeling/gl && \
#    rm -rf /usr/local/share/freeling/hr && \
#    rm -rf /usr/local/share/freeling/it && \
#    rm -rf /usr/local/share/freeling/nb && \
#    rm -rf /usr/local/share/freeling/pt && \
#    rm -rf /usr/local/share/freeling/ru && \
#    rm -rf /usr/local/share/freeling/sl && \
#    rm -rf /var/lib/apt/lists/*

WORKDIR /root

EXPOSE 50005
CMD echo 'Hello world' | analyze -f en.cfg | grep -c 'world world NN 1'
