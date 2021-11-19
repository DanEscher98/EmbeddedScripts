# Defined in /tmp/fish.AXTfMS/cntlang.fish @ line 2
function cntlang
	function ext2name --argument ext
		switch $ext
			case 'sh'
				set name "Bash"
			case 'c'
				set name "C99"
			case 'fish'
				set name "Bash"
			case 'hs'
				set name "Haskell"
			case 'js'
				set name "JavaScript"
			case 'jl'
				set name "Julia"
			case 'py'
				set name "Python"
			case 'rkt'
				set name "Racket"
			case 'rs'
				set name "Rust"
			case 'ts'
				set name "TypeScript"
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
	
	for ext in { "c", "rs", "py", "hs", "sh", "js", "ts", "jl", "rkt" }
		find $PWD \( ! -regex '.*/\..*' \) -type f -name "*.$ext" \
			| grep -v -E $igndir | xargs cat | wc -l \
			| xargs -I % printf "%\t lines in "(ext2name "$ext")" files.\n"
	end | sort -g -k 1 -r | tee /dev/tty \
		| awk '{ print $1 }' | paste -sd+ | bc \
		| xargs -I % echo (set_color -o red)%(set_color normal) \
		| xargs -I % echo "Total:" % "lines written this year."
end
