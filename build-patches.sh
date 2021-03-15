#!/bin/bash

# based on ax6's patch script for Fused Crystal https://github.com/TwitchPlaysPokemon/pokered-randofused/blob/master/patch.sh

basered=pokered.gbc
baseblue=pokeblue.gbc
targetred=pokered.gbc
targetgreen=pokegreen.gbc
targetblue=pokeblue.gbc
targetbluedebug=pokeblue_debug.gbc
redips=pokered.ips
greenredips=pokegreen.red.ips
greenblueips=pokegreen.blue.ips
blueips=pokeblue.ips
bluedebugips=pokeblue_debug.ips
redbps=pokered.bps
greenredbps=pokegreen.red.bps
greenbluebps=pokegreen.blue.bps
bluebps=pokeblue.bps
bluedebugbps=pokeblue_debug.bps

function checkfail {
	$@
	local result=$?
	if [[ $result -eq 0 ]]; then
		return 0
	fi
	echo "[$1] exit status $result" >&2
	exit 3
}

function updaterepo {
	# $1: repo, $2: URL
	if [[ ! ( -d $1 ) ]]; then
		checkfail git clone --recursive $2 $1
	fi
	pushd $1
	git pull
	popd
}

function checkhash {
	# $1: file, $2: expected hash
	# returns a Bool: https://thedailywtf.com/articles/What_Is_Truth_0x3f_
	if [[ ! ( -f $1 ) ]]; then
		return 2
	fi
	[ `sha1sum -b $1 | cut -c 1-40` = $2 ]
	if [[ $? -ne 0 ]]; then
		return 1
	fi
	return 0
}

function checkvalidrom {
	checkhash $basered ea9bcae617fdf159b045185467ae58b2e4a48b9a
	local resultred=$?
	checkhash $baseblue d7037c83e1ae5b39bde3c30787637ba1d4c48ce2
	local resultblue=$?
	if [[ $resultblue -gt $resultred ]]; then
		return $resultblue
	else
		return $resultred
	fi
}

# make sure the patch directory exists
if [[ ! ( -d patch ) ]]; then
	checkfail mkdir patch
fi
pushd patch

# make sure we have a copy of flips
if [[ ! ( -x flips ) ]]; then
	updaterepo Flipsrepo https://github.com/Alcaro/Flips
	pushd Flipsrepo
	checkfail make
	checkfail cp flips ..
	popd
fi

# update pokered if we don't have good base ROMs
checkvalidrom
if [[ $? -ne 0 ]]; then
	updaterepo pokered https://github.com/pret/pokered.git
	pushd pokered
	checkfail make red blue
	checkfail cp $basered ..
	checkfail cp $baseblue ..
	popd
	checkvalidrom
	case $? in
		0)
			;;
		1)
			echo "[check] base ROM hash mismatch" >&2
			exit 1
			;;
		2)
			echo "[check] base ROM not found" >&2
			exit 2
			;;
		*)
			echo "[check] unknown error" >&2
			exit 3
			;;
	esac
fi

# build the patches
./flips -c --ips $basered ../$targetred $redips
./flips -c --ips $basered ../$targetgreen $greenredips
./flips -c --ips $basered ../$targetgreen $greenblueips
./flips -c --ips $baseblue ../$targetblue $blueips
./flips -c --ips $baseblue ../$targetbluedebug $bluedebugips

./flips -c --bps $basered ../$targetred $redbps
./flips -c --bps $basered ../$targetgreen $greenredbps
./flips -c --bps $basered ../$targetgreen $greenbluebps
./flips -c --bps $baseblue ../$targetblue $bluebps
./flips -c --bps $baseblue ../$targetbluedebug $bluedebugbps

result=$?
if [[ $result -ne 0 ]]; then
	echo "[Flips] exit status $result" >&2
	exit 3
fi

# copy the file to the parent directory and we're done
checkfail cp *.ips ..
checkfail cp *.bps ..
popd
exit 0