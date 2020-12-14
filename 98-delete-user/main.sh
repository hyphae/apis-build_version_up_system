#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_LOOP_TARGET_AUX() {
	${DIR}/delete-user.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_ROOTPASS}
}

DO_LOOP_TARGET_FIRST() {
	${DIR}/delete-user.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_ROOTPASS}
}

DO_LOOP_TARGET_COP() {
	${DIR}/delete-user.exp ${LOOP_ADDRESS} ${LOOP_USERNAME} ${LOOP_ROOTPASS}
}

DO_MAIN() {
	. ${BASEDIR}/00-util/loop_target.sh
}

. ${BASEDIR}/00-util/main.sh
