#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	${DIR}/clean-ApisInstaller.sh
	${DIR}/clean-installer.sh
}

. ${BASEDIR}/00-util/main.sh
