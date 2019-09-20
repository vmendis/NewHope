#!/bin/sh
make -C ~/Work/Maven-Dockers/AWSCorrettoJDK-Maven/0.Ubuntu build-nc &&
make -C ~/Work/Maven-Dockers/AWSCorrettoJDK-Maven/1.AWSCorrettoJDK/ build-nc &&
make -C ~/Work/Maven-Dockers/AWSCorrettoJDK-Maven/2.Maven/ build-nc

