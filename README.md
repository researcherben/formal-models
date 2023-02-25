# About 

This repo provides a Dockerfile for Gryphon, the server (and Qt GUI) that provides MONTEREY PHOENIX. 

# Requirements

The software dependencies are in a Dockerfile, so that makes installation and use easier.
However, because the GUI uses QT, if you're on Mac or Windows you'll need to have X11 enabled.
On Mac I'm running [XQuartz](https://www.xquartz.org/).

Gryphon uses 32bit libraries, so if you're on a new Mac (which doesn't support 32 bit software), you'll need to modify the Docker commands to something like
```bash
docker run --rm -it --platform linux/amd64 <IMAGE_NAME> <COMMAND>
```
as per <https://forums.docker.com/t/run-x86-intel-and-arm-based-images-on-apple-silicon-m1-macs/117123>.
See also <https://docs.docker.com/build/building/multi-platform/>.


# Originating project website

This repo builds on top of work by researchers at the Naval Postgraduate School. 

<https://nps.edu/mp> resolves to <https://wiki.nps.edu/display/mp>

The web-based instance is FIREBIRD, <https://firebird.nps.edu/>

The local instance is GRYPHON, <https://gitlab.nps.edu/monterey-phoenix/user-interfaces/gryphon/-/wikis/home>


