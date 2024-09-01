// Get funds from users into this contract 
// Withdraw funds to the owner of the contract or whoever has created this fundme contract
// Set a minimum funding value in USD (~ min. $5)

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract FundMe{

    //function they call to send money to our contract
    function fund() public payable {//payable ~ In Solidity, the payable keyword is used to indicate that a function can receive Ether (ETH) or other cryptocurrencies. When a function is marked as payable, it allows users to send funds to the contract by calling that specific function, so here the payable keyword enables users to send ETH to the contract when calling the fund function.
        // Allow users to send $
        // Have a min. $ sent


        //msg.value is the amount of money being sent by the user to the contract here via the fund function, which increases this contract's balance, also msg.value is only relevant when a user sends ETH to the contract, not when the contract sends ETH to a user/owner's wallet during withdrawal.
        require(msg.value > 1e18, "Minimum funding amount is 1 ETH mere Laal"); //1e18 = 1 ETH = 1000000000000000000 wei = 1 * 10**18 wei

        //Revert ~ Undo an action that have been done, and sends the remaining gas associated with that transaction back

    }







    // //function used by owner to withdraw the money collected
    // function withdraw() public {

    // }

}


//Note:
/*
- Just like wallets can hold funds, contracts (like FundMe.sol) can actually hold funds as well. So whenever you deploy a contract similiar to a wallet address it actually works same as a wallet address i.e we you can send money to it, you can interact with it etc.





*/