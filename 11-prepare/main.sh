#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	${DIR}/prepare-key.sh
	${DIR}/prepare-ApisInstaller.sh
	${DIR}/prepare-dcdc_batt_comm.sh
	${DIR}/prepare-main_controller.sh
	${DIR}/prepare-emulator.sh
}

. ${BASEDIR}/00-util/main.sh
