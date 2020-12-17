#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	rm -f ${WORK_DIR}/target-list.txt
	rm -f ${WORK_DIR}/*.tar.gz
}

. ${BASEDIR}/00-util/main.sh
