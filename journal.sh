#!/bin/sh

if [[ -z "$JOURNAL_DIR" ]]
then
	echo "You must set JOURNAL_DIR in your .profile or equivalent, or export it in the shell"
	exit 0;
fi

DAY=0

# default to current year and month in case of date being passed
# this way a simple day can be passed for quick access
MONTH=`date +"%m"`
YEAR=`date +"%Y"`

if [[ $# = 1 ]]
then
	ARG=$1
	# check if the argument is matches 'dd[mm][yyyy]'
	if [[ $ARG =~ ^(0[1-9]|[1-2][0-9]|3[0-1])((0[1-9]|1[0-2])?)([0-9]{4}?)$ ]]
	then
		DAY=${ARG:0:2}

		if [[ ${ARG:2:2} =~ (0[1-9]|1[0-2]) ]]
		then
			MONTH=${ARG:2:2}
		fi

		if [[ ${ARG:4:8} =~ [0-9]{4} ]]
		then
			YEAR=${ARG:4:8}
		fi
	else
		echo "Invalid argument: argument must be a date in the form of 'dd[mm][yyyy]'"
		exit 0;
	fi
fi

if [[ $DAY = 0 ]]
then
	DAY=`date +"%d"`
fi

if [[ ! -d "$JOURNAL_DIR/$YEAR" ]]
then
	`mkdir $JOURNAL_DIR/$YEAR`
fi

JOURNAL_DIR="$JOURNAL_DIR/$YEAR"

if [[ ! -d "$JOURNAL_DIR/$MONTH" ]]
then
	`mkdir $JOURNAL_DIR/$MONTH`
fi

JOURNAL_DIR="$JOURNAL_DIR/$MONTH/$DAY.txt"

$EDITOR $JOURNAL_DIR
