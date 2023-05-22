function 256-colors() {
	echo 'fg: \\033[38;5;<color>m'
	echo 'bg: \\033[48;5;<color>m'
	color=""
	for i in {0..255}; do
		color="${color}\033[38;5;${i};7m $i "
	done
	echo $color
}

function rgb-colors() {
	echo 'fg: \\033[38;2;<r>;<g>;<b>m'
	echo 'bg: \\033[48;2;<r>;<g>;<b>m'
	echo "\033[38;2;$1;$2;$3m $1 $2 $3 "
}

function display() {
	for i in {0..15}; do
		echo -n "\\033[38;5;${i};7m $i "
	done
}
