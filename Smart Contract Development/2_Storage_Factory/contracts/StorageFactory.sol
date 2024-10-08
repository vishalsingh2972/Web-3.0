// SPDX-License-Identifier: MIT

//StorageFactory.sol will be responsible for deploying new SimpleStorage.sol contracts ~ this is a great illustration of `composability` in action where StorageFactory.sol creates, interacts with, and modifies SimpleStorage.sol contracts
//contracts interacting with each other seemlessly and permissonlessly (AKA composability) is a feature of SC and blockchain development that is super cruicial, and also one of the reasons why blockchain development is so powerful

pragma solidity ^0.8.18;

// import {SimpleStorage, SimpleStorage2} from "./SimpleStorage.sol";
import {SimpleStorage} from "./SimpleStorage.sol";
// When you import a contract like SimpleStorage, you can use it as a type to: Declare arrays, Create instances, Declare variables etc.

contract StorageFactory {
    // SimpleStorage public simpleStorage;
    //Declare arrays using imported contract SimpleStorage.sol
    SimpleStorage[] public listOfSimpleStorageContracts; //array that stores the instances of SimpleStorage.sol that we create below

    function createSimpleStorageContract() public {
        // simpleStorage = new SimpleStorage();

        //Create instances using imported contract SimpleStorage.sol
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    //function to interact(function to basically pass value to our 'store' function in SimpleStorage.sol contract) with the 'store' function of the SimpleStorage.sol contract ~ so here our StorageFactory.sol contract is calling the 'store' function present in the SimpleStorage.sol contract
    function sfStore(
        uint256 _simpleStorageIndex,
        uint256 _newSimpleStorageNumber
    ) public {
        //so in order to interact with the SimpleStorage.sol contract from the StorageFactory.sol contract we will be needing 2 things - address and ABI(Application Binary Interface)

        //Declare variables using imported contract SimpleStorage.sol
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[
            _simpleStorageIndex
        ];
        mySimpleStorage.store(_newSimpleStorageNumber);

        //or just directly listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber); also works
    }

    //function to access/retrieve/view the value that we previously passed to our 'store' function in SimpleStorage.sol contract using the 'sfStore function'
    //sfGet function you defined as a view function, which means it only reads data from the contract's state and doesn't modify anything.
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
        // return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
    }
}
