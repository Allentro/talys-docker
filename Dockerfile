FROM ubuntu:20.04
MAINTAINER Ross Allen (rossallen1996@gmail.com)

ARG TALYS_DIR="/opt"

RUN apt update &&

COPY talys.tar.xz TALYS_DIR

RUN cd $TALYS_DIR && 
    tar -xvf talys.tar.xz
    

