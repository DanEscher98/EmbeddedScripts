# Defined in /tmp/fish.DCkfbE/cheats.fish @ line 2
function cheats
    curl -sS cheat.sh/$argv[1] | batcat -p
end
