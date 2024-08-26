// SPDX-License-Identifier: MIT

//Inheritance - 'AddFiveStorage' contract as child of 'SimpleStorage' contract

pragma solidity 0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    function store(uint256 _myFavoriteNumber) public override {
        //explicitly mentioning 'store' function with 'override' so for store function AddFiveStorage contract will follow this, rest everything it will follow same as given in its parent contract SimpleStorage
        myFavoriteNumber = _myFavoriteNumber + 5;
    }
}

//Note (EXTRA)
/*
When you mark a function as virtual in the parent contract (SimpleStorage), it allows child contracts to override it. Similarly when you mark a function as override in the child contract (AddFiveStorage) it explicitly indicates that the child function is intended to override a function from the parent contract (SimpleStorage) ~ [Use virtual in the Parent Contract to indicate that a function can be overridden + Use override in the Child Contract to explicitly override a function from the parent contract.]
In short we need to use both virtual in the parent contract + override in the child contract together for child function to override parent function with same name
```
contract SimpleStorage{
function store(uint256 _myFavoriteNumber) public virtual {
        myFavoriteNumber = _myFavoriteNumber;
    }
}

contract AddFiveStorage is SimpleStorage {
    function store(uint256 _favoriteNumber) public override {
        myFavoriteNumber = _favoriteNumber + 5;
    }
}
```
*/
