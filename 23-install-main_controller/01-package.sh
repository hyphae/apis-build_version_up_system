#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	cd ${WORK_DIR}
	tar \
	 --exclude .git \
	 --exclude venv \
	 --exclude '.*' \
	 --exclude __pycache__ \
	 --exclude '*.pyc' \
	 -czvf \
	 apis-main_controller.tar.gz \
	 apis-main_controller
}

. ${BASEDIR}/00-util/main.sh
