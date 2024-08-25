// SPDX-License-Identifier: MIT (not mandatory but recommended)

pragma solidity ^0.8.18;

contract SimpleStorage {
    uint256 myFavoriteNumber = 70;

    //function responsible for updating our favorite number
    function store(uint256 _myFavoriteNumber) public {
        myFavoriteNumber = _myFavoriteNumber;
    }

    //function similar to the getter function of ' uint256 public myFavoriteNumber = 70; '
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    //pure function ~ this function is not modifying the state of the variable hence uses less gas ~ thats's why blue color buttons in Deployed Contracts indicating that the function doesn't modify the contract's state.
    function retrieve2() public pure returns (uint256) {
        return 150;
    }

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

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
