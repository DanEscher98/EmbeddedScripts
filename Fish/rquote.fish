# Defined in /tmp/fish.qLqN3r/rquote.fish @ line 2
function rquote --description 'Spanish cowsay speak'
	set phrase (fortune -s -a)
	cowsay -f (ls /usr/share/cowsay/cows/ | shuf -n1) $phrase
	echo $phrase | trans en:es --brief 2> /dev/null \
		| espeak -v es-la -a 150 -g 2 -p 60 -s 140
end
