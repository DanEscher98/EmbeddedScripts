## Basic node setup

```json
{
  "name": "get_ghrepos",
  "version": "1.0.0",
  "main": "index.js",
  "repository": "",
  "author": "NAME <EMAIL>",
  "license": "MIT",
  "main": "out/index.js",
  "bin": {
    "get_ghrepos": "./out/index.js"
  },
  "scripts": {
    "build": "tsc",
    "start": "node out/index.js"
  }
}
```

## Adding Typescript

```bash
yarn add @types/node typescript --dev
```

```json
{
    "compilerOptions": {
        "rootDir": "src",
        "outDir": "out", // where to put the compiled JS files
        "strict": true,
        "target": "ES2020", // which level of JS support to target
        "module": "CommonJS", // which system for the program AMD, UMD, System, CommonJS
        "sourceMap": true,
        "esModuleInterop": true,
        "moduleResolution": "node", // for a backend project

        // Recommended: Compiler complains about expressions implicitly typed as 'any'
        "noImplicitAny": true
    },
    "include": ["src"], // which files to compile
    "exclude": ["node_modules"] // which files to skip
}
```

## Adding ESLint and Prettier

```bash
yarn add --dev eslint \
    @typescript-eslint/parser \
    @typescript-eslint/eslint-plugin
```

[Prettier Playground](https://prettier.io/playground/)

```json
{
  "arrowParens": "always",
  "bracketSameLine": false,
  "bracketSpacing": true,
  "semi": true,
  "experimentalTernaries": false,
  "singleQuote": true,
  "jsxSingleQuote": false,
  "quoteProps": "as-needed",
  "trailingComma": "none",
  "singleAttributePerLine": false,
  "htmlWhitespaceSensitivity": "css",
  "vueIndentScriptAndStyle": false,
  "proseWrap": "preserve",
  "insertPragma": false,
  "printWidth": 80,
  "requirePragma": false,
  "tabWidth": 2,
  "useTabs": true,
  "embeddedLanguageFormatting": "auto"
}
```

```json
{
	"env": {
    	"browser": true,
		"es2021": true
	},
	"extends": [
		"eslint:recommended",
		"plugin:@typescript-eslint/recommended",
		"prettier"
	],
	"parser": "@typescript-eslint/parser",
	"parserOptions": {
		"ecmaVersion": 12,
		"sourceType": "module"
	},
	"plugins": ["@typescript-eslint"],
	"rules": {}
}
```

```json
"devDependencies": {
	"@types/node": "^20.11.25",
	"@typescript-eslint/eslint-plugin": "^7.1.1",
	"@typescript-eslint/parser": "^7.1.1",
	"eslint": "^8.57.0",
	"eslint-config-prettier": "^9.1.0",
	"prettier": "^3.2.5",
	"typescript": "^5.4.2"
}
```

```json
	"dependencies": {
		"fp-ts": "^2.16.3",
		"io-ts": "^2.2.21",
		"wretch": "^2.8.1"
	}
```
