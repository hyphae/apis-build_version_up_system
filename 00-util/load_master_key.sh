#!/bin/bash

LOAD_MASTER_KEY() {
	echo
	echo ">> MASTER_KEY_NAME : ${MASTER_KEY_NAME}"
	echo ">> MASTER_KEY_PASSPHRASE : ${MASTER_KEY_PASSPHRASE}"
	echo

	eval `ssh-agent`
	(
		expect -c "
		set timeout -1
		spawn ssh-add ${BASEDIR}/key/${MASTER_KEY_NAME}
		expect {
			-regexp \"Enter passphrase for .*:\" {
				send -- \"${MASTER_KEY_PASSPHRASE}\n\"
				set timeout 30
				exp_continue
			}
			interact
		}
		"

		DO_WITH_MASTER_KEY
	)
	eval `ssh-agent -k`
}

LOAD_MASTER_KEY
