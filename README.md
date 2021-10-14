# xcube4deepcube
Repository to create the cube for the UC5 of the H2020 project. - DeepCube

The datasets used for creating the .zarr files are found in the shared drive 20-DATA-MURMURATION. 

Specifically:
<code>Datasat_raw</code>: Datasats directly downloaded from the different satellite data supply sources (formats: Tiff, net, grib, etc)
<code>Datasat_nc_intermediate</code>: netcdf4 files generated through the relevant shell codes.
<code>Datasat_nc_final</code>: From <code>Datasat_nc_intermediate</code> se han seleccionado los .nc que se eplean en generar los .zarr
