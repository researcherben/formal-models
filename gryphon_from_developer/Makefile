

build_gryphon:
	./build_gryphon.bash

qt_fix:
	docker build -f Dockerfile_fix_qt --tag qt_fix .

docker_run:
	docker run -it --rm \
		--env "DISPLAY=host.docker.internal:0" \
		-v `pwd`:/scratch \
		--user mp_user \
		qt_fix 

#run_gryphon_linux:
#	#./run_gryphon.bash
#	docker run -it \
#		-v /tmp/.X11-unix:/tmp/.X11-unix \
#		-e DISPLAY=$$DISPLAY \
#		-u mp_user gryphon
