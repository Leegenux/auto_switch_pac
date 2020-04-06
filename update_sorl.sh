#!/bin/bash

FILE_NAME='OmegaRules_auto_switch.sorl'
NOT_IN_LIST='^(update_sorl.sh|tmp)$'

head -n 5 $FILE_NAME >tmp
for filename in * ; do
	if [[ ! $filename =~ $NOT_IN_LIST ]] ; then
		tail -n +6 $filename >>tmp
		rm -v $filename
	fi
done
cat tmp | uniq >$FILE_NAME
rm tmp
