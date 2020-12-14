#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	rm -f ${WORK_DIR}/target-list.txt
	groovy ${DIR}/generate-target-list.groovy \
	 -auxAddress "${AUX_ADDRESS}" \
	 -auxUsername "${AUX_USERNAME}" \
	 -auxPassword "${AUX_PASSWORD}" \
	 -auxRootPassword "${AUX_ROOT_PASSWORD}" \
	 -copUsername "${COP_USERNAME}" \
	 -copPassword "${COP_PASSWORD}" \
	 -copRootPassword "${COP_ROOT_PASSWORD}" \
	 -copXml "${COP_XML}" \
	 -out ${WORK_DIR}/target-list.txt
}

. ${BASEDIR}/00-util/main.sh
