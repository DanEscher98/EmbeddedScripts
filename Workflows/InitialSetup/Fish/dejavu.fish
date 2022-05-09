function dejavu --argument key_word
	eval (history | fzf --tac +s -e -q "$key_word")
end
