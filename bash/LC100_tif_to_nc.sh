#!/bin/bash

for year in 2015 2016 2017 2018 2019
do 
    printf -v month_str "%02d" $month
    gdalwarp -te -47 -6 -42 -1 -t_srs EPSG:4326 LC100/Tiffs/W060N00_PROBAV_LC100_global_v3.0.1_${year}.tif LC100/LC100_${year}.nc
    #cdo settaxis,${year}-01-01,00:00:00,1year LC100/LC100_${year}_tmp.nc LC100/LC100_${year}.nc
    #rm LC100/LC100_${year}_tmp.nc
    ncrename -h -O -v Band1,LC100 LC100/LC100_${year}.nc
    ncatted -a long_name,LC100,o,c,"Copernicus Global Land Cover" LC100/LC100_${year}.nc
done

#ncrcat -h LC100/LC100_2015.nc LC100/LC100_2016.nc LC100/LC100_2017.nc LC100/LC100_2018.nc LC100/LC100_2019.nc LC100/LC100.nc