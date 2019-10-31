#!/bin/sh
make -C ./0.Alpine build-nc &&
make -C ./1.ZuluJDK/ build-nc &&
make -C ./2.Maven/ build-nc

