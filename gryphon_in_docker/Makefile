
docker: docker_build docker_run
docker_build:
	docker build -t mp_gryphon .

docker_run:
	docker run -it --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=$DISPLAY \
		-v `pwd`:/scratch \
		-p 6000:6000 \
		--user $(id -u):$(id -g) \
		mp_gryphon /bin/bash
