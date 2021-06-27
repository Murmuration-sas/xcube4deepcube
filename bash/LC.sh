gdalwarp -te -47 -6 -42 -1 -t_srs EPSG:4326 LC100/Tiffs/W060N00_PROBAV_LC100_global_v3.0.1_2015.tif LC100_2015.nc
ncrename -h -O -v Band1,LC100 LC100_2015.nc
ncatted -a long_name,LC100,o,c,"Land Cover 100m" LC100_2015.nc
ncecat -O -u time LC100_2015.nc LC100_2015_tmp.nc

mv LC100_2015_tmp.nc tmp.nc
ncap2 -s 'time[time]=1' tmp.nc tmp2.nc

# https://www.timeanddate.com/date/durationresult.html?d1=1&m1=1&y1=2016&d2=1&m2=1&y2=2017&h1=0&i1=0&s1=0&h2=0&i2=0&s2=0
# 2015. 1,008,072 hours
# 2016. 1,016,832 hours
# 2017. 1,025,616 hours
# 2018. 1,034,376 hours
# 2019. 1,043,136 hours

ncatted -a units,time,a,c,"hours since 1900-01-01 00:00:00.0" tmp2.nc
ncatted -a long_name,time,a,c,"time" tmp2.nc
ncatted -a calendar,time,a,c,"gregorian" tmp2.nc
