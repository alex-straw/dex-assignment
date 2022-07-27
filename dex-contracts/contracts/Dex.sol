// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Dex is ERC20 {

    address payable public owner;
    uint public ethToToken;
    uint public tokenToEth;
    uint public buyCount;
    uint public sellCount;

    /*
        The Dex contract inherits all the functionality of the ERC20 token.
        Each parameter must first be set in the constructor
            + Name
            + Symbol
            + Decimals --> which is done by overriding the default decimals() function

        All of these values could be input as constructor arguments. However, the client 
        has specified these parameters, and to make deployment easier for them they were 
        built into the .sol code itself.
    */

    constructor() ERC20("TestTokenDex", "TTD") {
        _mint(address(this), 500000000000000); // Set the initial supply
        owner = payable(msg.sender);
        ethToToken = 10000;
        tokenToEth = 5000;
        buyCount = 0;
        sellCount = 0;
    }

    // Override the standard 18 decimals function in the ERC20 contract and set this equal to 2.
    function decimals() public pure override returns (uint8) {
		return 2;
	}

    // ----- Swap Functions ----- //

    function buyToken() public payable {
        // Could add a require statement here for minimum swap size (decimal limited)
        require(msg.value <= maxTokenBuyInEth(), "Contract does not have enough TTD tokens");
        owner.transfer(msg.value/2);
        buyCount += 1;
        _transfer(address(this), msg.sender, msg.value/tokenToEth);
    }

    function sellToken(uint numTokens) public {
        require(numTokens <= maxTokenSellInToken(), "Contract does not have enough ETH");
        sellCount +=1;
        _transfer(msg.sender, address(this), numTokens);
    }

    // -------- Helpers -------- //

    // Eth balance of the contract
    function contractEthBalance() public view returns(uint) {
        return address(this).balance;
    }

    // TTD balance of the contract
    function contractTokenBalance() public view returns(uint) {
        return(balanceOf(address(this)));
    }

    // Max token buy size in terms of ETH - limited by token balance of contract.
    function maxTokenBuyInEth() public view returns(uint){
        return(contractTokenBalance()*ethToToken);
    }

    // Max token sell size in terms of the number of TTD tokens - limited by the ETH balance of the contract.
    function maxTokenSellInToken() public view returns(uint){
        return(contractEthBalance()/tokenToEth);
    }
}