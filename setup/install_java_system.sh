#!/bin/bash

# install the add-apt-repository program
sudo apt-get install software-properties-common

# add the private package archive webupd8team/java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

# install Oracle Java8
sudo apt-get install oracle-java8-installer

# setup Oracle Java8 to be the default Java VM
sudo apt-get install oracle-java8-set-default

ff.apt.update
sudo apt-get install openjdk-8-jdk

exit 0