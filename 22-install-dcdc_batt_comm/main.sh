#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_LOOP_TARGET_ZERO() {
	echo 'nop'
}

DO_LOOP_TARGET_FIRST() {
	echo 'nop'
}

DO_LOOP_TARGET_COP() {
	${DIR}/02-install.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_PASSWORD} ${BASEDIR}/key/${MASTER_KEY_NAME} ${WORK_DIR}
	${DIR}/03-build.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_PASSWORD} ${BASEDIR}/key/${MASTER_KEY_NAME}
}

DO_WITH_MASTER_KEY() {
	. ${BASEDIR}/00-util/loop_target.sh
}

DO_MAIN() {
	${DIR}/01-package.sh
	. ${BASEDIR}/00-util/load_master_key.sh
}

. ${BASEDIR}/00-util/main.sh
