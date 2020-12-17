#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_LOOP_TARGET_ZERO() {
	${DIR}/shutdown.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_PASSWORD} ${BASEDIR}/key/${MASTER_KEY_NAME}
}

DO_LOOP_TARGET_FIRST() {
	${DIR}/shutdown.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_PASSWORD} ${BASEDIR}/key/${MASTER_KEY_NAME}
}

DO_LOOP_TARGET_COP() {
	${DIR}/shutdown.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_PASSWORD} ${BASEDIR}/key/${MASTER_KEY_NAME}
}

DO_WITH_MASTER_KEY() {
	. ${BASEDIR}/00-util/loop_target.sh
}

DO_MAIN() {
	. ${BASEDIR}/00-util/load_master_key.sh
}

. ${BASEDIR}/00-util/main.sh
