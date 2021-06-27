#!/bin/bash

for f in Thermal_comfort/no_crop/*.nc
do file $f
    filename=$(basename -- "$f")
    filename="${filename##*/}"
    echo ${filename}
    ncks -d lat,-6.,-1. -d lon,-47.,-42. ${f} -O Thermal_comfort/crop/${filename}
done