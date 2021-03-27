local base=os.getenv("APPS") .. "/openmpi/rchpc_v1"

prepend_path("LD_LIBRARY_PATH", base .. "/openmpi/lib")
prepend_path("LIBRARY_PATH", base .. "/openmpi/lib")
prepend_path("PATH", base .. "/openmpi/bin")

load('libfabric')
