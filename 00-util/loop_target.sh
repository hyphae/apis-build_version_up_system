#!/bin/bash

LOOP_TARGET() {
	cat ${WORK_DIR}/target-list.txt \
	| grep -v -e '^\s*#' -e '^\s*$' \
	| while read LINE ; do
		LOOP_TYPE=`echo ${LINE} | cut -d ',' -f 1`
		LOOP_ADDRESS=`echo ${LINE} | cut -d ',' -f 2`
		LOOP_USERNAME=`echo ${LINE} | cut -d ',' -f 3`
		LOOP_PASSWORD=`echo ${LINE} | cut -d ',' -f 4`

		echo
		echo ">> LOOP_TYPE : ${LOOP_TYPE}"
		echo ">> LOOP_ADDRESS : ${LOOP_ADDRESS}"
		echo ">> LOOP_USERNAME : ${LOOP_USERNAME}"
		echo ">> LOOP_PASSWORD : ${LOOP_PASSWORD}"
		echo

		case ${LOOP_TYPE} in
			[Zz][Ee][Rr][Oo])
				DO_LOOP_TARGET_ZERO
				;;
			[Ff][Ii][Rr][Ss][Tt])
				DO_LOOP_TARGET_FIRST
				;;
			[Cc][Oo][Pp])
				DO_LOOP_TARGET_COP
				;;
			*)
				echo "#### ERROR #### unknown type : ${LOOP_TYPE}"
				exit 1
				;;
		esac
	done
}

LOOP_TARGET
