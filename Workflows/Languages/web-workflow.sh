npx degit sveltejs/template

# Live reload
npm install -g browser-sync
browser-sync start -s -f . --no-notify \
	--host "$(ip address show wlp1s0 | grep -w 'inet' | awk '{print $2}')" \
	--port 9000
