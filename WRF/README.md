# WRF

## Provisional Build using Intel parallel XE

### Dependencies
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

1. <code>./intstall_libz.sh</code>
2. <code>./intall_hdf5.sh</code>
3. <code>./install_netcdf.sh</code>
<!-- ./install_libz.sh
./install_libcurl.sh -->
 
4. <code>./install_netcdf-fortran.sh</code>
5. <code>./install_netcdf-python.sh</code>
6. <code>./configure_wrf.sh</code> → (downloads source code and runs configuration script)

After step `6.` you will have to edit the configure.wrf file: see output from configure_wrf.sh

### Building
Once all dependencies have been installed and loaded
you can finally build WRF by running 

<code>./compile -j {num processes} em_real &> build_wrf.log</code>
note: `{num processes}` can't be more than 20

Note that building takes a long time ~1h 45min
and be sure to load the appropriate modules before building E.g.

<code>source $WRF/tests/test_XXXXXX/vars.sh</code>

<code>ml intel</code>

<code>ml intelpython3</code>


### Running Single Domain test

The test is downloaded from https://hpcadvisorycouncil-my.sharepoint.com/:f:/p/ophir/EvOfQ0I6kfVMr9Iash9D9ykBM9-CGdf-51Ykg9dejADH8A?e=RJIobO

