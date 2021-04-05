
# flake8: noqa

compiler = 'icc'
mpicompiler = 'mpiicc'
mpilinker = 'MPICH_CC=icc mpiicc -Xlinker --export-dynamic'

extra_compile_args = ['-O3', '-g', '-std=c99', '-fpic'
		      , '-pthread' , '-fno-strict-aliasing' , '-fmessage-length=0'
			, '-Wall', ]
# platform_id = ''




# MKL:
mkldir= '/home/witsteam1/apps/intel/compilers_and_libraries_2020.4.304/linux/mkl/lib/intel64_lin'


#libraries += ['mkl_intel_lp64' ,'mkl_sequential' ,'mkl_core',
#             'mkl_lapack95_lp64', 'mkl_pgi_thread'

#             ]
libraries += ['mkl_intel_lp64' ,'mkl_sequential' ,'mkl_core',
                 'mkl_lapack95_lp64',
                 'mkl_scalapack_lp64', 'mkl_blacs_intelmpi_lp64',
		'fabric' , 'mkl_avx512' 
                 
             ]

library_dirs += [mkldir]
#extra_link_args += ['Wl,-rpath='+mkldir]


#icc libs
libraries += ['imf']
library_dirs += 'apps/intel/compilers_and_libraries/linux/lib/intel64'


#libfabric for  IntelMPI
fabric = '/home/witsteam1/apps/intel/compilers_and_libraries_2020.4.304/linux/mpi/intel64/libfabric/'
#include_dirs += [fabric + 'include']
library_dirs += [fabric + 'lib']
# You can use rpath to avoid changing LD_LIBRARY_PATH:
extra_link_args += ['-Wl,-rpath={fabric}lib'.format(fabric=fabric)]

define_macros += [('GPAW_NO_UNDERSCORE_CBLACS', '1')]
define_macros += [('GPAW_NO_UNDERSCORE_CSCALAPACK', '1')]
define_macros += [("GPAW_ASYNC",1)]
define_macros += [("GPAW_MPI2",1)]


# FFTW3:
fftw = False
if fftw:
    libraries += ['fftw3']

# ScaLAPACK (version 2.0.1+ required):
scalapack = False
if scalapack:
    libraries += ['scalapack-openmpi']

# Use Elpa (requires ScaLAPACK and Elpa API 20171201):
if 0:
    elpa = True
    elpadir = '/home/user/elpa'
    libraries += ['elpa']
    library_dirs += ['{}/lib'.format(elpadir)]
    extra_link_args += ['-Wl,-rpath={}/lib'.format(elpadir)]
    include_dirs += ['{}/include/elpa-xxxx.xx.xxx'.format(elpadir)]

# LibXC:
# In order to link libxc installed in a non-standard location
# (e.g.: configure --prefix=/home/user/libxc-2.0.1-1), use:

# - static linking:
if 0:
    xc = '/home/user/libxc-4.0.4/'
    include_dirs += [xc + 'include']
    extra_link_args += [xc + 'lib/libxc.a']
    if 'xc' in libraries:
        libraries.remove('xc')

# - dynamic linking (requires rpath or setting LD_LIBRARY_PATH at runtime):
if 1:
    xc = '/home/witsteam1/apps/libxc-5.0.0/'
    include_dirs += [xc + 'include']
    library_dirs += [xc + 'lib']
    # You can use rpath to avoid changing LD_LIBRARY_PATH:
    extra_link_args += ['-Wl,-rpath={xc}lib'.format(xc=xc)]
    if 'xc' not in libraries:
        libraries.append('xc')


# libvdwxc:
if 0:
    libvdwxc = True
    path = '/home/user/libvdwxc'
    extra_link_args += ['-Wl,-rpath=%s/lib' % path]
    library_dirs += ['%s/lib' % path]
    include_dirs += ['%s/include' % path]
    libraries += ['vdwxc']


"""User provided customizations.

Here one changes the default arguments for compiling _gpaw.so.

Here are all the lists that can be modified:

* libraries
  List of libraries to link: -l<lib1> -l<lib2> ...
* library_dirs
  Library search directories: -L<dir1> -L<dir2> ...
* include_dirs
  Header search directories: -I<dir1> -I<dir2> ...
* extra_link_args
  Arguments forwarded directly to linker
* extra_compile_args
  Arguments forwarded directly to compiler
* runtime_library_dirs
  Runtime library search directories: -Wl,-rpath=<dir1> -Wl,-rpath=<dir2> ...
* extra_objects
* define_macros

The following lists work like above, but are only linked when compiling
the parallel interpreter:

* mpi_libraries
* mpi_library_dirs
* mpi_include_dirs
* mpi_runtime_library_dirs
* mpi_define_macros

To override use the form:

    libraries = ['somelib', 'otherlib']

To append use the form

    libraries += ['somelib', 'otherlib']
"""
