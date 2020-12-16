#!/bin/bash

DIR=`dirname $0`
BASEDIR=$DIR/..

DO_MAIN() {
	cd ${APIS_INSTALLER_DIR}
	echo ">> make start"
	make start copCommunity=${COP_COMMUNITY} version=${APIS_VERSION} copVersion=${COP_VERSION} sshPassphrase=${MASTER_KEY_PASSPHRASE} interface=${INSTALLER_INTERFACE}
}

. ${BASEDIR}/00-util/main.sh
