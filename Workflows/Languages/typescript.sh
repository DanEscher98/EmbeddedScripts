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
