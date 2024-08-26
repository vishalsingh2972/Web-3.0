// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract SimpleStorage {
    uint256 myFavoriteNumber = 70;

    //function responsible for updating our favorite number
    function store(uint256 _myFavoriteNumber) public virtual {
        myFavoriteNumber = _myFavoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // uint256[] public anArray;
    //dynamic array of type 'Person'
    Person[] public listOfPeople;

    //mapping associates a string (the name) with a uint256 (the favorite number). Essentially, it creates a key-value pair, where each name (the key) is mapped to a corresponding favorite number (the value)
    mapping(string => uint256) public nameToFavoriteNumber;

    //calldata, memory, storage
    function addPerson(uint256 _favoriteNumber, string memory _name) public {
        // _name = "chomu"; //possible ~ memory variable can be modified/manipulated
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber; //storing a key-value pair in the mapping //Here, _name is the key, and _favoriteNumber is the value
    }

    function addPerson2(uint256 _favoriteNumber, string calldata _name) public {
        // _name = "chomu"; //NOT possible ~ calldata variable cannot be modified/manipulated
        listOfPeople.push(Person(_favoriteNumber, _name));
    }

    //calldata ~ temporary variable that can't be modified - will only exist for the duration of the function call
    //memory ~ temporary variable that can be modified - will only exist for the duration of the function call
    //storage ~ permanent variable that can be modified - will stay in the contract forever
}

contract SimpleStorage2 {}

contract SimpleStorage3 {}

contract SimpleStorage4 {}
