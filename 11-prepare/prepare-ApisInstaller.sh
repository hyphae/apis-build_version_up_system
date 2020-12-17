#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	cd ${APIS_INSTALLER_DIR}
	echo ">> make prepare"
	make prepare copCommunity=${COP_COMMUNITY} version=${APIS_VERSION} copVersion=${COP_VERSION} interface=${INSTALLER_INTERFACE} gitBaseUrl=${GIT_BASE_URL}
}

. ${BASEDIR}/00-util/main.sh
