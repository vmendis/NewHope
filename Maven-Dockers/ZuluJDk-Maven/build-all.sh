#!/bin/sh
make -C ~/Work/Maven-Dockers/ZuluJDk-Maven/0.Alpine build-nc &&
make -C ~/Work/Maven-Dockers/ZuluJDk-Maven/1.ZuluJDK/ build-nc &&
make -C ~/Work/Maven-Dockers/ZuluJDk-Maven/2.Maven/ build-nc

