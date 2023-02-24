
ifndef DOCKERHUB_USERNAME
  DOCKERHUB_USERNAME=benislocated
endif

ifndef IMAGE_NAME
  IMAGE_NAME=gryphon
endif

build_gryphon:
	./build_gryphon.bash
	docker build --tag $(DOCKERHUB_USERNAME)/$(IMAGE_NAME):latest .

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
		$(IMAGE_NAME)

docker_run_gryphon_linux:
	docker run -it --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		--env DISPLAY=$$DISPLAY \
		--user mp_user \
		$(IMAGE_NAME)

docker_login:
	docker login

docker_push:
	docker push $(DOCKERHUB_USERNAME)/$(IMAGE_NAME):latest
