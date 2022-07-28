const ethers = require('ethers');
const fs = require("fs");

const contractInfoPath = 'api/contractInfo/contract.json'
const dexAbiPath = 'api/contractInfo/contractABI.json'

/*

    When this is run in the terminal using npm there is likely to be a "Request-Rate Exceeded notice".
    When this does happen, it can stop the return statement from ending execution - but it does still
    return the details from the contract. I believe this would be fixed by using a personal set of 
    API keys.

*/

function getJson(_filepath) {
    return JSON.parse(fs.readFileSync(_filepath))
}

function getContract() {
    let abi = getJson(dexAbiPath);
    let provider = ethers.getDefaultProvider('rinkeby'); // No need for Infura
    let contractAddress = getJson(contractInfoPath).address;
    return new ethers.Contract(contractAddress, abi, provider);
}

function bigNumberToNumber(n) {
    return ethers.BigNumber.from(n).toNumber();
}

async function getContractDetails() {
    contract = getContract();
    response = {
        'Contract Balance': {
            'TTD': bigNumberToNumber(await contract.contractTokenBalance()),
            'ETH': bigNumberToNumber(await contract.contractEthBalance())
        },
        'Exchange Rates': {
            'ETH to TTD': bigNumberToNumber(await contract.ethToToken()),
            'TTD to ETH': bigNumberToNumber(await contract.tokenToEth())
        },
        'Transaction Counts': {
            'Buy Count': bigNumberToNumber(await contract.buyCount()),
            'Sell Count': bigNumberToNumber(await contract.sellCount())
        }
    }
    console.log(JSON.stringify(response, null, 2)) // to demo that this is working - with spacing level = 2
    return response
}


module.exports = {getContractDetails}