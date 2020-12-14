#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_LOOP_TARGET_AUX() {
	${DIR}/clock-master.exp ${LOOP_ADDRESS} ${LOOP_ROOTPASS}
	${DIR}/syslog.exp ${LOOP_ADDRESS} ${LOOP_ROOTPASS}
}

DO_LOOP_TARGET_FIRST() {
	if [ "${LOOP_HOSTNAME}" ]; then
		${DIR}/clock-slave.exp ${LOOP_ADDRESS} ${LOOP_ROOTPASS} ${AUX_ADDRESS}
		${DIR}/hostname.exp ${LOOP_ADDRESS} ${LOOP_HOSTNAME} ${LOOP_ROOTPASS}
		${DIR}/syslog.exp ${LOOP_ADDRESS} ${LOOP_ROOTPASS}
	fi
}

DO_LOOP_TARGET_COP() {
	${DIR}/clock-slave.exp ${LOOP_ADDRESS} ${LOOP_ROOTPASS} ${AUX_ADDRESS}
	${DIR}/hostname.exp ${LOOP_ADDRESS} ${LOOP_HOSTNAME} ${LOOP_ROOTPASS}
	${DIR}/syslog.exp ${LOOP_ADDRESS} ${LOOP_ROOTPASS}
}

DO_MAIN() {
	. ${BASEDIR}/00-util/loop_target.sh
}

. ${BASEDIR}/00-util/main.sh
