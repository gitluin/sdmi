#!/bin/bash

test -z "$MAINDIS" && MAINDIS="eDP-1-1"

# Better be sure you pass a valid output, fool
DISPLAY=$2
POSITION=$3

AssertArgs () {
	test $1 -ne $2 \
		&& echo "Please provide an Action, display, and Position (where applicable)." \
		&& echo "Use -h/--help for more information." \
		&& exit -1
}

On () {
	case "$2" in
		-a | --above)
			POSITION="--above"
			;;
		-b | --below)
			POSITION="--below"
			;;
		-r | --right)
			POSITION="--right-of"
			;;
		-l | --left)
			POSITION="--left-of"
			;;
		-m | --mirror)
			POSITION="--same-as"
			;;
		*)
			Usage
			exit -1
	esac

	xrandr --output "$MAINDIS" --auto --output "$1" --auto "$POSITION" "$MAINDIS"
}

Off () {
	xrandr --output "$1" --off
}

Usage () {
	echo "Usage: sdmi [Action] [display] [Position]"
	echo "Control xrandr output more easily."
	echo "Set \$MAINDIS to a default in this script, ~/.bashrc, or"
	echo "  somewhere else before using."
	echo 
	echo "Actions:"
	echo "  -h, --help	Show this help."
	echo "  -on, --on	Turn on [display]."
	echo "  -of, --off	Turn off [display]."
	echo
	echo "Positions:"
	echo "  -a, --above	Attach [display] above \$MAINDIS."
	echo "  -b, --below	Attach [display] below \$MAINDIS."
	echo "  -r, --right	Attach [display] to the right of \$MAINDIS."
	echo "  -l, --left	Attach [display] to the left of \$MAINDIS."
	echo "  -m, --mirror	Mirror \$MAINDIS to [display]."
}

case "$1" in
	-h | --help)
		Usage
		exit -1
		;;
	-on | --on)
		AssertArgs $# 3
		On $DISPLAY $POSITION
		exit 1
		;;
	-of | --off)
		AssertArgs $# 2
		Off $DISPLAY
		exit 1
		;;
	*)
		echo "Not a valid command - see usage below."
		echo
		Usage
		exit -1
esac
