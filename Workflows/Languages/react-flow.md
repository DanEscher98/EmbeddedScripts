## The stack
- react
- typescript
- vite 
- tailwind
- prettier

```sh
# Init app
PROJECT=dummy_vite
yarn create vite $PROJECT --template react-swc-ts
cd $PROJECT
yarn install

# Add tailwind
yarn add --dev tailwindcss postcss-cli autoprefixer postcss-import
yarn tailwindcss init -p
echo '@import "tailwindcss/base";
@import "tailwindcss/components";
@import "tailwindcss/utilities";' >src/styles.css

# Add prettier
yarn add --dev prettier
```

```json
# add to tsconfig.json
{ "compilerOptions": { "types": [ "vite/client" ] }}

# add to package.json
{ "scripts": { "format": "prettier --write ." } }

# .prettierrc.json
{
  "trailingComma": "none",
  "semi": false,
  "singleQuote": true,
  "jsxSingleQuote": true,
  "printWidth": 100,
  "tabWidth": 2
}
```

```js
// add to postcss.config.js
export default {
    plugins: {
        'postcss-import': {},
        'tailwindcss/nesting': {},
    }
}

// add to tailwind.config.js
export default {
    content: [ "./src/**/*.{js,jsx,ts,tsx}" ]
}

// add to package.json
{

}
```
