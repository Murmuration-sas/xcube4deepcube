#!/bin/bash

for f in SWI/no_crop/*.nc
do file $f
    filename=$(basename -- "$f")
    filename="${filename##*/}"
    echo ${filename}
    ncks -d lat,-6.,-1. -d lon,-47.,-42. ${f} -O SWI/crop/${filename}
done
 
ncrcat -h SWI/crop/* SWI/SWI.nc