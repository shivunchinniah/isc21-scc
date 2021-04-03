local base='/home/witsteam1/apps/intel/intelpython3'

prepend_path("LD_LIBRARY_PATH", base .. "/lib")
prepend_path("LIBRARY_PATH", base .. "/lib")
prepend_path("PATH", base .. "/bin")
