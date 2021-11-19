# Defined in /tmp/fish.5OSobh/countlang.fish @ line 2
function cntlang
	set igndir "target|node_modules|bin|build|venv|deps|config|dev|public|Reference"
	for ext in { "c", "rs", "py", "hs", "sh", "js", "ts", "jl", "rkt" }
		find $PWD \( ! -regex '.*/\..*' \) -type f -name "*.$ext" \
			| grep -v -E $igndir | xargs cat | wc -l \
			| xargs -I % printf "%\t lines in $ext files.\n"
	end | sort -g -k 1 -r | tee /dev/tty \
		| awk '{ print $1 }' | paste -sd+ | bc \
		| xargs -I % echo "Total:" % "lines."
end
