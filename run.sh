#!/bin/bash

./tools/se.sh "$1"
./tools/ps.sh
./tools/cd.sh

mv ports.txt active-ports.txt ./ports-r/
mv urls.txt ./result/
mv act.txt ./result/
mv all.txt ./result/
mv old.txt ./hostory/