#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	if [ ! -d ${WORK_DIR}/apis-dcdc_batt_comm ] ; then
		cd ${WORK_DIR}
		echo ">> git clone ${GIT_BASE_URL}/apis-dcdc_batt_comm.git"
		git clone ${GIT_BASE_URL}/apis-dcdc_batt_comm.git
	fi
}

. ${BASEDIR}/00-util/main.sh
