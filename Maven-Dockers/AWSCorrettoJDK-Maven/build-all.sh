#!/bin/sh
make -C ./0.Ubuntu build-nc &&
make -C ./1.AWSCorrettoJDK/ build-nc &&
make -C ./2.Maven/ build-nc

