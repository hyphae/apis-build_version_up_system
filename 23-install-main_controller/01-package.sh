#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	tar \
	 --cd ${MAIN_CONTROLLER_DIR}/.. \
	 --exclude .git \
	 --exclude venv \
	 --exclude '.*' \
	 --exclude __pycache__ \
	 --exclude '*.pyc' \
	 -czvf \
	 ${WORK_DIR}/apis-main_controller.tar.gz \
	 apis-main_controller
}

. ${BASEDIR}/00-util/main.sh
