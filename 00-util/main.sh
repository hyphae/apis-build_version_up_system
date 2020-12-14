#!/bin/bash

. ${BASEDIR}/conf/installer.conf

[ ${APIS_INSTALLER_DIR::1} = '/' ] || APIS_INSTALLER_DIR=${BASEDIR}/conf/${APIS_INSTALLER_DIR}
[ ${DCDC_BATT_COMM_DIR::1} = '/' ] || DCDC_BATT_COMM_DIR=${BASEDIR}/conf/${DCDC_BATT_COMM_DIR}
[ ${MAIN_CONTROLLER_DIR::1} = '/' ] || MAIN_CONTROLLER_DIR=${BASEDIR}/conf/${MAIN_CONTROLLER_DIR}
[ ${EMULATOR_DIR::1} = '/' ] || EMULATOR_DIR=${BASEDIR}/conf/${EMULATOR_DIR}

COP_XML=${BASEDIR}/conf/cop-${COP_COMMUNITY}-${APIS_VERSION}-${COP_VERSION}.xml

echo
echo ">> WORK_DIR : ${WORK_DIR}"
echo ">> APIS_INSTALLER_DIR : ${APIS_INSTALLER_DIR}"
echo ">> DCDC_BATT_COMM_DIR : ${DCDC_BATT_COMM_DIR}"
echo ">> MAIN_CONTROLLER_DIR : ${MAIN_CONTROLLER_DIR}"
echo ">> EMULATOR_DIR : ${EMULATOR_DIR}"
echo
echo ">> APIS_INSTALLER_LOG_DIR : ${APIS_INSTALLER_LOG_DIR}"
echo ">> APIS_INSTALLER_WORK_DIR : ${APIS_INSTALLER_WORK_DIR}"
echo
echo ">> COP_COMMUNITY : ${COP_COMMUNITY}"
echo ">> APIS_VERSION : ${APIS_VERSION}"
echo ">> COP_VERSION : ${COP_VERSION}"
echo
echo ">> COP_XML : ${COP_XML}"
echo

mkdir -p ${WORK_DIR}

if [ ! -d ${WORK_DIR} ] ; then file ${WORK_DIR} ; exit 1 ; fi
if [ ! -d ${APIS_INSTALLER_DIR} ] ; then file ${APIS_INSTALLER_DIR} ; exit 1 ; fi
if [ ! -d ${DCDC_BATT_COMM_DIR} ] ; then file ${DCDC_BATT_COMM_DIR} ; exit 1 ; fi
if [ ! -d ${MAIN_CONTROLLER_DIR} ] ; then file ${MAIN_CONTROLLER_DIR} ; exit 1 ; fi
if [ ! -d ${EMULATOR_DIR} ] ; then file ${EMULATOR_DIR} ; exit 1 ; fi

DO_MAIN
