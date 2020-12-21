#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	if [ ! -d ${WORK_DIR}/apis-emulator ] ; then
		cd ${WORK_DIR}
		echo ">> git clone ${GIT_BASE_URL}/apis-emulator.git"
		git clone ${GIT_BASE_URL}/apis-emulator.git
	fi
}

. ${BASEDIR}/00-util/main.sh
