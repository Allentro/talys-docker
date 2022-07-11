# TALYS dockerfile
FROM ubuntu:20.04

MAINTAINER Ross Allen (rossallen1996@gmail.com) 

# Adding TALYS tar to OS
ADD tasman.tar /opt/

RUN apt update && \
    apt install -y gfortran

WORKDIR "/opt/tasman/source" 

# Editing setup file to have correct home directory location
RUN sed -i "s|bindir=$Thome'/bin'|bindir='/opt' |g" /opt/tasman/tasman.setup

#changing path in machine.f
RUN sed -i "s|home='/Users/koning/'|home='/opt/'|g" /opt/tasman/source/machine.f

#Compiling TALYS 
RUN gfortran -c *.f && \
    gfortran *.o -o tasman && \
    mv tasman /bin
    
# Adding TASMAN to path 
ENV PATH="/opt/tasman:${PATH}"

# Install base utilities
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Creating test environment (will be removed in full deployment) 
RUN mkdir /home/test
ADD input /home/test/
WORKDIR "/home/test"



