# Defined in /tmp/fish.4g7H3X/cntlang.fish @ line 2
function cntlang
	function ext2name --argument ext
		switch $ext
			case 'sh'
				set name "Bash/Fish"
			case 'c'
				set name "C99/C++"
			case 'html'
				set name "HTML/CSS"
			case 'js'
				set name "Type/JavaScript"
			case 'asm'
				set name "Assembly"
			case 'hs'
				set name "Haskell"
			case 'jl'
				set name "Julia"
			case 'py'
				set name "Python"
			case 'scm'
				set name "Scheme/Racket"
			case 'rs'
				set name "Rust"
			case 'st'
				set name "Smalltalk"
			case '*'
				set name "unknown"
		end
		echo (set_color green)$name(set_color normal)
	end

	set igndir (
		for i in {"bin", "build", "config","deps", "dev", \
			"node_modules", "public", "Reference", "target", "venv"}
			echo "$i" | tr -d "[:blank:]"
		end| paste -sd'|')
	
	set simple_search (for ext in { \
		"asm,nasm", "c,cpp", "sh,fish", "js,ts", "scm,rkt"}
		set fst (echo $ext | tr -d "[:blank:]" | awk -F, '{ print $1 }')
		set snd (echo $ext | tr -d "[:blank:]" | awk -F, '{ print $2 }')
		find $PWD \( ! -regex '.*/\..*' \) \
			-type f \( -name "*.$fst" -o -name "*.$snd" \) \
			| grep -v -E $igndir | xargs cat | wc -l \
			| xargs -I % printf "%\t lines in "(ext2name "$fst")" files.@"
	end)

	set double_search (
		for ext in { "rs", "py", "hs", "jl" }
			find $PWD \( ! -regex '.*/\..*' \) -type f -name "*.$ext" \
				| grep -v -E $igndir | xargs cat | wc -l \
				| xargs -I % printf "%\t lines in "(ext2name "$ext")" files.@"
		end)

	echo "$simple_search$double_search" | tr '@' '\n'\
		| sort -g -k 1 -r | tee /dev/tty \
		| awk '{ print $1 }' | paste -sd+ | sed 's/.$//' | bc \
		| xargs -I % echo (set_color -o red)%(set_color normal) \
		| xargs -I % echo "Total:" % "lines written this year."
end
