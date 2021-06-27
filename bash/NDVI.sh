#!/bin/bash

for f in NDVI/no_crop/*.nc
do file $f
    filename=$(basename -- "$f")
    filename="${filename##*/}"
    echo ${filename}
    ncks -d lat,-6.,-1. -d lon,-47.,-42. ${f} -O NDVI/crop/${filename}
done
 
ncrcat -h NDVI/crop/* NDVI/NDVI.nc