#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	tar \
	 --cd ${WORK_DIR} \
	 --exclude .git \
	 --exclude venv \
	 --exclude '.*' \
	 --exclude __pycache__ \
	 --exclude '*.pyc' \
	 -czvf \
	 ${WORK_DIR}/apis-emulator.tar.gz \
	 apis-emulator
}

. ${BASEDIR}/00-util/main.sh
