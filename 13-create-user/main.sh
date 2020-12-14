#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_LOOP_TARGET_AUX() {
	${DIR}/create-user.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_PASSWORD} ${LOOP_ROOTPASS}
}

DO_LOOP_TARGET_FIRST() {
	if [ "${LOOP_HOSTNAME}" ]; then
		${DIR}/create-user.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_PASSWORD} ${LOOP_ROOTPASS}
	fi
}

DO_LOOP_TARGET_COP() {
	${DIR}/create-user.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_PASSWORD} ${LOOP_ROOTPASS}
	${DIR}/sudoer-user.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_ROOTPASS}
}

DO_MAIN() {
	. ${BASEDIR}/00-util/loop_target.sh
}

. ${BASEDIR}/00-util/main.sh
