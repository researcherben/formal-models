
# create a container that includes xeyes 
build_docker_xeyes:
	docker build -f Dockerfile_xeyes -t dxeyes .

# run the Docker image that contains xeyes
run_docker_xeyes:
	docker run -it --rm dxeyes
# whether the above target runs outside of xterm (on the Mac host)
#  or within xterm, the result is
#
#   Error: Can't open display: :0
#   make: *** [run_docker_xeyes] Error 1
#
# that isn't an "xhost +local:" or "xhost +" issue; it's the display

# the following works in xterm and in a Mac terminal
run_docker_eyes_display_mac:
	docker run -ti --rm -e DISPLAY=docker.for.mac.host.internal:0 dxeyes

# the following works in xterm and in a Mac terminal
run_docker_xeyes_display_docker:
	docker run -ti --rm -e DISPLAY=host.docker.internal:0 dxeyes


# on the command line in xterm, this command produces the IP address:
#
#    ifconfig en0 | grep inet |  cut -d' ' -f2
#
# the following works in xterm and in a Mac terminal
run_docker_xeyes_display_ip:
	docker run -e DISPLAY=`ifconfig en0 | grep inet |  cut -d' ' -f2`:0 dxeyes


build_docker_qt_mvp:
	docker build -f Dockerfile_qt_mvp --tag qt_mvp .

# the following works in xterm and in a Mac terminal
run_docker_qt_mvp:
	docker run -it --rm \
		--env "DISPLAY=host.docker.internal:0" \
		-v `pwd`:/scratch \
		--user mp_user \
		qt_mvp python3 /opt/minimum_qt_demo.py


