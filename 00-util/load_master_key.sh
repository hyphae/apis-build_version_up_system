#!/bin/bash

LOAD_MASTER_KEY() {
	echo
	echo ">> MASTER_KEY_NAME : ${MASTER_KEY_NAME}"
	echo

	eval `ssh-agent`
	(
		# パスフレーズをつけた場合はここで聞かれる
		ssh-add ${BASEDIR}/key/${MASTER_KEY_NAME}

		DO_WITH_MASTER_KEY
	)
	eval `ssh-agent -k`
}

LOAD_MASTER_KEY
