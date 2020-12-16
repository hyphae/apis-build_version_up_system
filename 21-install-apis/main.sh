#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_WITH_MASTER_KEY() {
	${DIR}/install-ApisInstaller.sh
}

DO_MAIN() {
	. ${BASEDIR}/00-util/load_master_key.sh
}

. ${BASEDIR}/00-util/main.sh
