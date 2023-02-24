# 0) Install XQuartz

On my mac, install XQuartz.

After installing XQuartz, restart the computer.

Start XQuartz. A white terminal window will pop up. Open Preferences from the top menu and go to the last tab, ‘security’. Make sure the “allow connections from network clients” is checked “on”.

# 1) verify X11 works

In an XQuartz "xterm" terminal window, run
```bash
xeyes
```
result: produces the expected GUI

# 2) verify Docker and X11 works
In an XQuartz "xterm" terminal window, run
```bash
ifconfig en0
```
--> get the "inet" IP address. 
See also <https://sourabhbajaj.com/blog/2017/02/07/gui-applications-docker-mac/>

In an XQuartz "xterm" terminal window, run
```bash
xhost +
docker run -e DISPLAY=192.168.1.154:0 gns3/xeyes
```
Notes: 
```bash
xhost +local:
```
didn't work. And
```bash
docker run -ti --rm -e DISPLAY=docker.for.mac.host.internal:0 eyes
```
didn't work

# 3) verify Qt in Docker with X11 works

```bash
make build_docker_qt_mvp
make run_docker_qt_mvp
```

# 4) run Gryphon in Docker

In an XQuartz "xterm" terminal window, run
```bash
docker run -it --rm \
     --env "DISPLAY=host.docker.internal:0" \
     -v `pwd`:/scratch \
     --user mp_user \
     qt_fix 
```

