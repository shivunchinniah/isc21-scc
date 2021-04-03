# WRF

## Provisional Build using Intel parallel XE

### Dependancies
- Fortran and C compilers (icc → mpiicc, ifort → mpiifort)
- intelpython3
- HDF5
- LIBCURL & LIBZ
- NetCDF C (requires HDF)
- NetCDF Fortran (requires NetCDF C)
- NetCDF Python
- MPI (intel mpi)

to install an instance of the requirements run ./create_test.sh
then cd into tests/test_XXXXX and run in this order
1. <code>./intall_hdf5.sh</code>
2. <code>./install_netcdf.sh</code>
<!-- ./install_libz.sh
./install_libcurl.sh -->
3. <code>./install_netcdf-fortran.sh</code>
4. <code>./install_netcdf-python.sh</code>
5. <code>./configure_wrf.sh</code> → (downloads source code and runs configuration script)

### Building
Once all dependancies have been installed and loaded
you can finally build WRF by running 
<code>
./compile -j {num processes} em_real 2>&1 build_wrf.log</code>

Note that building takes a long time +30 mins
and be sure to load the appropriate modules E.g.
<code>
source $WRF/tests/test_XXXXXX/vars.sh
ml intel
ml intelpython3
</code>

