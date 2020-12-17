#!/bin/bash

. ${BASEDIR}/conf/installer.conf

[ ${WORK_DIR::1} = '/' ] || WORK_DIR=${BASEDIR}/${WORK_DIR}
[ ${APIS_INSTALLER_DIR::1} = '/' ] || APIS_INSTALLER_DIR=${BASEDIR}/${APIS_INSTALLER_DIR}

COP_XML=${BASEDIR}/conf/cop-${COP_COMMUNITY}-${APIS_VERSION}-${COP_VERSION}.xml

echo
echo ">> WORK_DIR : ${WORK_DIR}"
echo ">> APIS_INSTALLER_DIR : ${APIS_INSTALLER_DIR}"
echo
echo ">> COP_COMMUNITY : ${COP_COMMUNITY}"
echo ">> APIS_VERSION : ${APIS_VERSION}"
echo ">> COP_VERSION : ${COP_VERSION}"
echo
echo ">> COP_XML : ${COP_XML}"
echo

if [ ! -d ${WORK_DIR} ] ; then file ${WORK_DIR} ; exit 1 ; fi
if [ ! -d ${APIS_INSTALLER_DIR} ] ; then file ${APIS_INSTALLER_DIR} ; exit 1 ; fi

DO_MAIN
