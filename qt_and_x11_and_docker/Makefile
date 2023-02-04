

qt_fix:
	docker build -f Dockerfile --tag qt_mvp .

docker_run:
	docker run -it --rm \
		--env "DISPLAY=host.docker.internal:0" \
		-v `pwd`:/scratch \
		--user mp_user \
		qt_mvp /bin/bash

