#!/bin/bash
# abort on error
set -e

BASEDIR=$PWD

# trace-generator
if [ ! -d trace-generator ]
then
  git clone https://gitlab.nps.edu/monterey-phoenix/trace-generator.git
else
  cd trace-generator ; git pull --ff-only
  cd $BASEDIR
fi
cd trace-generator ; git archive --format=tar -o ${BASEDIR}/trace-generator.tar HEAD
cd $BASEDIR

# Gryphon
if [ ! -d gryphon ]; then
  mkdir -p gryphon
  git clone https://gitlab.nps.edu/monterey-phoenix/user-interfaces/gryphon.git
else
  cd gryphon ; git pull --ff-only
  cd $BASEDIR
fi
cd gryphon ; git archive --format=tar -o ${BASEDIR}/gryphon.tar HEAD
cd $BASEDIR

# preloaded-examples
if [ ! -d preloaded-examples ]; then
  mkdir -p preloaded-examples
  git clone https://gitlab.nps.edu/monterey-phoenix/mp-model-collection/preloaded-examples.git

else
  cd preloaded-examples ; git pull --ff-only
  cd $BASEDIR
fi
cd preloaded-examples ; git archive --format=tar -o ${BASEDIR}/preloaded-examples.tar HEAD
cd $BASEDIR

docker build --tag gryphon .

