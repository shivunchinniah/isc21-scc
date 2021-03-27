local base=os.getenv("APPS") .. "/openmpi/rchpc_v1"

append_path("LD_LIBRARY_PATH", base .. "/openmpi/lib")
append_path("LIBRARY_PATH", base .. "/openmpi/lib")
append_path("PATH", base .. "/openmpi/bin")

load('libfabric')
