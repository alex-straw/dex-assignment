# Overview

The Dex.sol contract inherits methods from the ERC20 contract with parameters:
  + Name: TestTokenDex
  + Symbol: TTD
  + Decimals: 2
  + Total Supply: 500000000000000 (Initially all held by the contract)
   
## How it works

+ The TTD token can be purchased through the contract by sending wei to the buyToken function. When buyToken is called, half of the sent wei is transferred to the owner of the contract (which is automatically set to be the deployer of the contract).

+ The TTD token can be sold by calling the sellToken and specifying the number of TTD tokens to sell. 

The exchange rates are fixed to be:

+ 10000 wei --> 1 TTD (buyToken)
+ 1 TTD --> 5000 wei (sellToken)

## Deployment

How this contract was deployed to Rinkeby:
1. Dex.sol code was copied into the browser Solidity IDE Remix.
2. This code was compiled.
3. The environment was set to 'Injected Provider - Metamask'.
4. The Metamask account was set to the 'Rinkeby Test Network'.
5. The contract was deployed by pressing 'Deploy'.

+ Deployed to Rinkeby with address:

`
"0x49d6A493767dE142A8181cb5E2C58D597477de21"
`

+ The contract address was found by manually inspecting the deployed contract on Remix, and saved to the api/contractInfo/contract.json file.
+ The ABI for the contract was copied manually from the Remix compiler page and saved to the api/contractInfo/contractABI.json file.

## Hardhat deployment
+ In future this could be automated using hardhat as this also enables easy integration testing.
+ Placeholder folders for deploying (deploy/deploy.js) and testing (test/dex.js) have been added.

# API

For Linux users:
```
git clone https://github.com/alex-straw/dex-assignment.git
cd dex-assignment
npm install
```

## Request contract details using the API:

(in the root directory)

```
npm run get-contract-details
```

For demonstration purposes, the reponse for this call is console.logged (but it also returns these values). All of the required contract details are returned in a single JSON format:

## Example response:

```
{
  "Contract Balance": {
    "TTD": 500000000000000,
    "ETH": 0
  },
  "Exchange Rates": {
    "ETH to TTD": 10000,
    "TTD to ETH": 5000
  },
  "Transaction Counts": {
    "Buy Count": 0,
    "Sell Count": 0
  }
}
```

# ADD

Queryable Variables:
+ public uint numberBuys;
+ public uint numberSells

Exposed functions:
+ Buy/sales rates
+ Max exchange size for buy and sell (balance of TTD and ETH)
+ Number of executed buys/sells

README
+ Overview of smart contract
+ Describe the deploy process
