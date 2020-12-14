#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_LOOP_TARGET_AUX() {
	${DIR}/stop-emulator.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_PASSWORD} ${BASEDIR}/key/${MASTER_KEY_NAME}
}

DO_LOOP_TARGET_FIRST() {
	${DIR}/stop-main_controller.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_PASSWORD} ${BASEDIR}/key/${MASTER_KEY_NAME}
}

DO_LOOP_TARGET_COP() {
	${DIR}/stop-dcdc_batt_comm.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_PASSWORD} ${BASEDIR}/key/${MASTER_KEY_NAME}
}

DO_WITH_MASTER_KEY() {
	${DIR}/stop-ApisInstaller.sh
	. ${BASEDIR}/00-util/loop_target.sh
}

DO_MAIN() {
	. ${BASEDIR}/00-util/load_master_key.sh
}

. ${BASEDIR}/00-util/main.sh
