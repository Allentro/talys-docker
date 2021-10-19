FROM ubuntu:20.04

MAINTAINER Ross Allen (rossallen1996@gmail.com) 

ARG TALYS_DIR="\opt"

ADD talys.tar \opt

RUN apt update && 
    
RUN cd /opt && \
    tar -xf talys.tar \
    cd talys/source \
    f95 -c *.f \
    f95 *.o -o talys \
    mv talys /bin \
    


