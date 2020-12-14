#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_LOOP_TARGET_AUX() {
	${DIR}/start-emulator.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_PASSWORD} ${BASEDIR}/key/${MASTER_KEY_NAME}
}

DO_LOOP_TARGET_FIRST() {
	${DIR}/start-main_controller.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_PASSWORD} ${BASEDIR}/key/${MASTER_KEY_NAME}
}

DO_LOOP_TARGET_COP() {
	${DIR}/start-dcdc_batt_comm.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_PASSWORD} ${BASEDIR}/key/${MASTER_KEY_NAME}
}

DO_WITH_MASTER_KEY() {
	. ${BASEDIR}/00-util/loop_target.sh
	${DIR}/start-ApisInstaller.sh
}

DO_MAIN() {
	. ${BASEDIR}/00-util/load_master_key.sh
}

. ${BASEDIR}/00-util/main.sh
