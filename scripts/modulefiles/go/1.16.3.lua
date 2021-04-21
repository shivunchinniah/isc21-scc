prepend_path("PATH", os.getenv("APPS") .. "/go/bin")
setenv("GOPATH", os.getenv("APPS") .. "/go")
prepend_path("LD_LIBRARY_PATH", os.getenv("APPS") .. "/go/lib")