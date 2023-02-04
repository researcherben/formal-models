

build_gryphon:
	./build_gryphon.bash
	docker build --tag gryphon .

clean:
	rm -rf gryphon gryphon.tar \
		preloaded-examples preloaded-examples.tar \
		trace-generator trace-generator.tar

# Running Gryphon requires X11 forwarding for Qt
# You may need XQuartz on Mac
docker_run_gryphon_mac:
	docker run -it --rm \
		--env "DISPLAY=host.docker.internal:0" \
		-v `pwd`:/scratch \
		--user mp_user \
		gryphon

docker_run_gryphon_linux:
	docker run -it \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		--env DISPLAY=$$DISPLAY \
		--user mp_user \
		gryphon
