local base=os.getenv("APPS") .. "/openmpi_icc"

prepend_path("LD_LIBRARY_PATH", base .. "/lib")
prepend_path("LIBRARY_PATH", base .. "/lib")
prepend_path("PATH", base .. "/bin")

load('libfabric')
