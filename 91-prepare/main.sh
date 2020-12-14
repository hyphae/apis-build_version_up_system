#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	${DIR}/prepare-ApisInstaller.sh
}

. ${BASEDIR}/00-util/main.sh
