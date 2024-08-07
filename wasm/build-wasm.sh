# TODO: Ensure that version is up to date
cp README.md wasm/
cp LICENSE.md wasm/
echo using WASM pack v0.10.3 to build WASM...
npx wasm-pack@0.10.3 build --target web --out-dir wasm/stylua.web -- --features lua52,lua53,lua54,luau

# workaround for bundler usage
echo "export { getImports as __getImports, finalizeInit as __finalizeInit }" >> wasm/stylua.web/stylua_lib.js

# bundle for node CommonJS
echo using rollup v4.9.5 to build node CommonJS...
npx rollup@4.9.5 wasm/src/stylua_lib_node.cjs --file wasm/stylua_lib.cjs --format cjs
