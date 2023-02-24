If you're on a Mac, use

```bash
	docker run -it --rm \
		--env "DISPLAY=host.docker.internal:0" \
		-v `pwd`:/scratch \
		--user mp_user \
		benislocated/gryphon 
```

If you are using linux, use the command

```bash
	docker run -it --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		--env DISPLAY=$DISPLAY \
		--user mp_user \
		benislocated/gryphon 
```

Those commands are also in the `Makefile`.
    
