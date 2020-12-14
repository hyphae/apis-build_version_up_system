#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	tar \
	 --cd ${DCDC_BATT_COMM_DIR}/.. \
	 --exclude .git \
	 --exclude venv \
	 --exclude '.*' \
	 --exclude __pycache__ \
	 --exclude '*.pyc' \
	 -czvf \
	 ${WORK_DIR}/apis-dcdc_batt_comm.tar.gz \
	 apis-dcdc_batt_comm
}

. ${BASEDIR}/00-util/main.sh
