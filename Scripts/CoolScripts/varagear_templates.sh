declare -a templates=(
  "gear-wiki"
  "cargo-program"
  "substrate-telemetry"
  "dapps-dao-app"
  "integrations-chainlink"
  "whitepaper"
  "dapps-dao"
  "dapps-fungible-token"
  "dapps-dao-light"
  "dapps-ping"
  "dapps-multitoken"
  "dapps-non-fungible-token"
  "dapps-app"
  "dapps-gear-lib"
  "dapps-concert"
  "dapps-dutch-auction"
  "dapps-docs"
  "dapps-supply-chain"
  "dapps-rock-paper-scissors"
  "dapps-RMRK"
  "dapps-staking"
  "dapps-multisig-wallet"
  "dapps-crowdsale"
  "dapps-dex"
  "dapps-nft-pixelboard"
  "telemetry.rs"
  "vara-staking-dashboard"
  "dapps-sharded-fungible-token"
)

mkdir -p templates
for template in ${templates[@]}; do
  ret=$(cd templates; gear gcli new --template $template)
done
