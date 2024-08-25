// SPDX-License-Identifier: MIT

//StorageFactory.sol will be responsible for deploying new SimpleStorage.sol contracts ~ this is a great illustration of `composability` in action where StorageFactory.sol creates, interacts with, and modifies SimpleStorage.sol contracts
//contracts interacting with each other seemlessly and permissonlessly (AKA composability) is a feature of SC and blockchain development that is super cruicial, and also one of the reasons why blockchain development is so powerful

pragma solidity ^0.8.18;

// import {SimpleStorage, SimpleStorage2} from "./SimpleStorage.sol";
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    // SimpleStorage public simpleStorage;
    SimpleStorage[] public listOfSimpleStorageContracts; //array that stores the instances of SimpleStorage.sol that we create below

    function createSimpleStorageContract() public {
        // simpleStorage = new SimpleStorage();
        
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    //function to interact with the 'store' function of the SimpleStorage.sol contract ~ so here our StorageFactory.sol contract is calling the 'store' function present in the SimpleStorage.sol contract
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public{
        //so in order to interact with the contract we will be needing 2 things - address and ABI(Application Binary Interface)
    }
}
