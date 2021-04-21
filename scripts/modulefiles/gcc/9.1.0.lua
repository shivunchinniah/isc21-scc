local base=os.getenv("APPS") .. "/gcc/gcc-9.1.0"

prepend_path("INFOPATH", base .. "/share/info:")
prepend_path("LD_LIBRARY_PATH", base .. "/lib64")
prepend_path("LD_LIBRARY_PATH", base .. "/lib")
prepend_path("MANPATH", base .. "/share/man")
prepend_path("PATH", base .. "/bin")