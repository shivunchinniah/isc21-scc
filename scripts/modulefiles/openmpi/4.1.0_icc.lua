local base=os.getenv("APPS") .. "/openmpi_icc"

append_path("LD_LIBRARY_PATH", base .. "/lib")
append_path("LIBRARY_PATH", base .. "/lib")
append_path("PATH", base .. "/bin")

load('libfabric')
