// SPDX-License-Identifier: MIT (not mandatory but recommended)
// zksync, polygon, arbitrum, optimism - EVM compatible L2 blockchains(or L2 protocols or  L2 scaling solutions for Ethereum) - Any blockchain that is EVM compatible allows you to deploy smart contracts written in Solidity  

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

   uint256 myFavoriteNumber = 70; //storage variable ~ any variable that you create outside of a function inside the contract, will automatically be identified as a storage variable ~ hence here 'uint256 myFavoriteNumber = 70;' is identified as a storage variable

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

    //dynamic array of type 'Person'
    //this type of array is known as dynamic array as size of elements can increase/decrease
    Person[] public listOfPeople;

    //static array as array size is fixed, here max. size is upto '3' elements
    Person[3] public listOfPeople2;

    //mapping associates a string (the name) with a uint256 (the favorite number). Essentially, it creates a key-value pair, where each name (the key) is mapped to a corresponding favorite number (the value)
    mapping(string => uint256) public nameToFavoriteNumber;

    //calldata, memory, storage
    //calldata and memory keyword ~ in simple words the memory keyword or calldata keyword in Solidity indicates that the variable _name should be stored in memory(temporay) rather than blockchain storage(permanent) i.e The memory keyword in Solidity specifies that the variable should be stored in temporary memory, which is cleared after the function execution and we don't store it permanently on the blockchain
    //calldata and memory keyword ~ only given for struct, array and mapping type variables //strings are also 'array of bytes'
    function addPerson(uint256 _favoriteNumber, string memory _name) public{
        // _name = "chomu"; //possible ~ memory variable can be modified/manipulated
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber; //storing a key-value pair in the mapping //Here, _name is the key, and _favoriteNumber is the value
    }

    function addPerson2(uint256 _favoriteNumber, string calldata _name) public{
        // _name = "chomu"; //NOT possible ~ calldata variable cannot be modified/manipulated
        listOfPeople.push(Person(_favoriteNumber, _name));
    }

    //calldata ~ temporary variable that can't be modified - will only exist for the duration of the function call
    //memory ~ temporary variable that can be modified - will only exist for the duration of the function call
    //storage ~ permanent variable that can be modified - will stay in the contract forever
}


/*
How mapping works when you enter a 'string' value to find its corresponding favorite number?
A:
mapping(string => uint256) public nameToFavoriteNumber; is the basic definition that tells the EVM and Solidity to create a key-value store.
nameToFavoriteNumber[_name] = _favoriteNumber; stores the value and name as a key-value pair when the value is stored for the first time using addPerson.
And when you try to retrieve the favorite number for "Lata", it directly goes to the storage (not memory, since it's a persistent storage) and checks if there is a number associated with the string "Lata". If found, it returns the number back to you.

Here's a summary:
Definition: mapping(string => uint256) public nameToFavoriteNumber; (only once)
Storing a value: nameToFavoriteNumber[_name] = _favoriteNumber; (when adding a new person using addPerson)
Retrieving a value: Directly checks the storage for the key ("Lata") and returns the associated value if found. and if name (the key) typed is not found it returns a default value of 0 back
*/

//First Contract created : 0x5326907E82B2e4507062E2D9Ad89ea11da65b3f7 (deployed on sepolia L1 & zksync sepolia L2)
