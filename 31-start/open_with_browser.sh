#!/bin/sh

if [ $# -ne 1 ] ; then
	echo "usage: $0 <url>"
	exit 1
fi

URL=$1

echo ">> open <${URL}> with browser ..."

UNAME=$(uname)
if [ "$UNAME" = 'Darwin' ] ; then
	open ${URL}
elif [ "$UNAME" = 'Linux' ] ; then
	if type xdg-open > /dev/null 2>&1 ; then
		xdg-open ${URL}
	else
		echo '>> Your platform is not supported : no xdg-open'
	fi
else
	echo ">> Your platform is not supported : $(uname -a)"
fi
