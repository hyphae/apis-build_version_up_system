#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	echo ">> ssh-keygen -f ${BASEDIR}/key/${MASTER_KEY_NAME}"
	ssh-keygen -f ${BASEDIR}/key/${MASTER_KEY_NAME}
	echo ">> chmod 600 ${BASEDIR}/key/${MASTER_KEY_NAME}"
	chmod 600 ${BASEDIR}/key/${MASTER_KEY_NAME}
}

. ${BASEDIR}/00-util/main.sh
