// SPDX-License-Identifier: MIT (not mandatory but recommended)

pragma solidity ^0.8.18; //stating our current version with caret '^'
// pragma solidity >=0.8.18 <0.9.0; //stating version within range

contract SimpleStorage {
    //Basic Types: boolean, unit, init, address, bytes
    bool hasFavoriteNumber = true;
    int256 myFavoriteNumbertrial = -88;
    uint256 myFavoriteNumbertrial2 = 42;
    string favoriteNumberInText = "66";
    address myAddress = 0x4D5FcefFce56B5D79a2870450342a4cD391C8828;
    bytes32 favoriteBytes32 = "meow meow";

    uint256 myFavoriteNumber = 70; //storage variable

    //function responsible for updating our favorite number
    function store(uint256 _myFavoriteNumber) public{
        myFavoriteNumber = _myFavoriteNumber;
    }

    //function similar to the getter function of ' uint256 public myFavoriteNumber = 70; '
    //view function ~ this function is not modifying the state of the variable hence uses less gas ~ thats's why blue color buttons in Deployed Contracts indicating that the function doesn't modify the contract's state.
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    //pure function ~ this function is not modifying the state of the variable hence uses less gas ~ thats's why blue color buttons in Deployed Contracts indicating that the function doesn't modify the contract's state.
    function retrieve2() public pure returns (uint256) {
        return 150;
    }

    // uint256[] listOfFavoriteNumbers;
    struct Person{//create own types in solidity using 'struct' keyword
        uint256 favoriteNumber;
        string name;
    }

    //creating variables of type 'Person' ~ will also appear as blue buttons in Remix IDE. This is because these lines are essentially initializing state variables (instances of the Person struct) and not performing any actions that modify the contract's state.
    // Person public Vishal = Person(0,"Vishal");

    // Person public Sahil = Person(1,"Sahil");

    // Person public Krishna = Person({favoriteNumber: 2, name:"Krishna"});

    // Person public Radha = Person({name:"Radha", favoriteNumber: 4});

    //array of type 'Person'
    //this type of array is known as dynamic array as size of elements can increase/decrease
    Person[] public listOfPeople;

    //static array as array size is fixed, here max. size is upto '3' elements
    Person[3] public listOfPeople2;

    function addPerson(uint256 _favoriteNumber, string memory _name) public{
        listOfPeople.push(Person(_favoriteNumber, _name));
    }

    //memory keyword ~ in simple words the memory keyword in Solidity indicates that the variable _name should be stored in memory(temporay) rather than blockchain storage(permanent) i.e The memory keyword in Solidity specifies that the variable should be stored in temporary memory, which is cleared after the function execution and we don't store it permanently on the blockchain
    //calldata, memory, storage
}