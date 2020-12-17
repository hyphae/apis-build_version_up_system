#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

MAKE_TARGET='cleanLog cleanDerived stop-kill versionup setupfiles keycert verify'

DO_MAIN() {
	cd ${APIS_INSTALLER_DIR}
	echo ">> make ${MAKE_TARGET}"
	make ${MAKE_TARGET} copCommunity=${COP_COMMUNITY} version=${APIS_VERSION} copVersion=${COP_VERSION} interface=${INSTALLER_INTERFACE} gitBaseUrl=${GIT_BASE_URL}
}

. ${BASEDIR}/00-util/main.sh
