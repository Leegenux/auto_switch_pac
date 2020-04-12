#!/bin/bash

# variables definition
FILE_NAME='OmegaRules_auto_switch.sorl'
TMP='_tmp'
SCRIPT='update_sorl.sh'
NOT_IN_LIST="^($SCRIPT|$TMP)$"
STRIP="tr -d '\r'"

# append all wildcats into the $TMP
cat $FILE_NAME | $STRIP >$TMP

for filename in * ; do
	if [[ ! $filename =~ $NOT_IN_LIST ]] ; then
		tail -n +6 $filename | $STRIP >>$TMP        		# assume that the file is published by swithyomega
		rm -v $filename
	fi
done

# sort the $TMP into $FILE_NAME
sort $TMP | uniq >>$FILE_NAME
rm $TMP

