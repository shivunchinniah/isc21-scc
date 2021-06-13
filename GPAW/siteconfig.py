prefix = '/scratch/l/lcl_uotiscscc/lcl_uotiscsccs1041/GPAW/test4'

compiler = 'icc'
mpicompiler = 'mpicc'
mpilinker = 'mpicc'

# - static linking (libxc):
xc = prefix + '/gpaw-20.10.0/libxc-4.3.4/install/'
include_dirs += [xc + 'include']
extra_link_args += [xc + 'lib/libxc.a']
if 'xc' in libraries:
        libraries.remove('xc')

# intelmpi
include_dirs += ['/scinet/intel/2019u4/compilers_and_libraries_2019.4.243/linux/mpi/intel64/include']
library_dirs += ['/scinet/intel/2019u4/compilers_and_libraries_2019.4.243/linux/mpi/intel64/lib']

parallel_python_interpreter = True
scalapack = True

library_dirs += ['$MKLROOT']
libraries = ['mkl_intel_lp64', 'mkl_sequential', 'mkl_core',
             'mkl_lapack95_lp64', 'mkl_blacs_intelmpi_lp64', 'mkl_scalapack_lp64']