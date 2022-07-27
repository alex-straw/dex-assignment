## DEX Requirements

+ Deploy to Rinkeby
+ Deploy its own ERC20
  + Name: TestTokenDex
  + Symbol: TTD
  + Decimals: 2
  + Supply: 500000000000000
    
Exchange Mechanic:
+ 10000 wei --> 1 TTD
+ 1 TTD --> 5000 wei
  
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


## API

API should expose DEX relevant data poitns by querying DEX Smart Contract

+ Details of TTD token
+ Exchange rates for ETH-TTD
+ Number of total buys/sells
+ Create a README document that contains all the instructions required to set up the project locally

NodeJs Based