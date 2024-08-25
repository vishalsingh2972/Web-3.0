// SPDX-License-Identifier: MIT

//StorageFactory.sol will be responsible for deploying new SimpleStorage.sol contracts ~ this is a great illustration of `composability` in action where StorageFactory.sol creates, interacts with, and modifies SimpleStorage.sol contracts
//contracts interacting with each other seemlessly and permissonlessly (AKA composability) is a feature of SC and blockchain development that is super cruicial, and also one of the reasons why blockchain development is so powerful

pragma solidity ^0.8.18;

// import {SimpleStorage, SimpleStorage2} from "./SimpleStorage.sol";
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage public simpleStorage;

    function createSimpleStorageContract() public {
        simpleStorage = new SimpleStorage();
    }   
}
