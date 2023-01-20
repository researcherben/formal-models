Here is the basic approach:
1) download trace-generator, Gryphon, and preloaded-examples from repositories into .tar files installable by Docker.
2) Run docker build.
3) Run the docker image; see `run_gryphon.bash`

For (1) see `build_gryphon.bash`.  It will not work as-is because https clone requires access permissions.

For (2) see Dockerfile.  Although I updated this to use the newer PySide6, it is not complete; for me, something needs libGL.so.1.


