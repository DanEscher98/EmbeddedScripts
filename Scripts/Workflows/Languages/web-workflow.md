# Template of Workflow Guide

## Official Docs
- []()

## Install toolchain
```sh

```


## Create project
```sh

```


## Develop, Test, Build, Deploy Cycle
```sh

```

## Specific Workflows
npx degit sveltejs/template

# Live reload
npm install -g browser-sync
browser-sync start -s -f . --no-notify \
	--host "$(ip address show wlp1s0 | grep -w 'inet' | awk '{print $2}')" \
	--port 9000
sudo apt install nodejs npm
npm install typescript
npm install --save @tensorflow/tfjs

# Upgrade npm
npm cache clean -f
sudo npm install -g n
sudo n stable
#!/usr/bin/bash


mkdir src dist
npm install typescript @types/node --save-dev
npx tsc --init

echo '{
	"compilerOptions": {
		"target": "es2019",
		"lib": ["es2020"],
		"module": "commonjs",
		"strict": true,
		"outDir": "./dist",
		"rootDir": "./src",
		"sourceMap": true,
		"types": ["node"]
	},
	"include": [
		"src/**/*.ts"
	],
	"exclude": [
		"node_modules"
	]
}
' > tsconfig.json
touch src/index.ts

#npx tsc -w
npx degit sveltejs/template

# Live reload
npm install -g browser-sync
browser-sync start -s -f . --no-notify \
	--host "$(ip address show wlp1s0 | grep -w 'inet' | awk '{print $2}')" \
	--port 9000
