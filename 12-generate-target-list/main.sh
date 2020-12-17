#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	rm -f ${WORK_DIR}/target-list.txt
	groovy ${DIR}/generate-target-list.groovy \
	 -zeroAddress "${ZERO_ADDRESS}" \
	 -zeroUsername "${ZERO_USERNAME}" \
	 -zeroPassword "${ZERO_PASSWORD}" \
	 -copPassword "${COP_PASSWORD}" \
	 -copXml "${COP_XML}" \
	 -out ${WORK_DIR}/target-list.txt
}

. ${BASEDIR}/00-util/main.sh
