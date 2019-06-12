#!/bin/sh
make -C ~/Work/Virantha-Docker/AWSCorrettoJDK-Maven/0.Ubuntu build-nc &&
make -C ~/Work/Virantha-Docker/AWSCorrettoJDK-Maven/1.AWSCorrettoJDK/ build-nc &&
make -C ~/Work/Virantha-Docker/AWSCorrettoJDK-Maven/2.Maven/ build-nc

