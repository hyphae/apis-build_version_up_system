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
	 apis-dcdc_batt_comm.tar.gz \
	 apis-dcdc_batt_comm
}

. ${BASEDIR}/00-util/main.sh
