// Get funds from users into this contract
// Withdraw funds to the owner of the contract or whoever has created this fundme contract
// Set a minimum funding value in USD (~ min. $5)
// till 5:33:00

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract FundMe {
    
    uint256 public myValue = 1;

    //function they call to send money to our contract
    function fund() public payable {
        //payable ~ In Solidity, the payable keyword is used to indicate that a function can receive Ether (ETH) or other cryptocurrencies. When a function is marked as payable, it allows users to send funds to the contract by calling that specific function, so here the payable keyword enables users to send ETH to the contract when calling the fund function.
        // Allow users to send $
        // Have a min. $ sent

        myValue = myValue + 2; //if after this below 'require' fails then the 'myValue' gets reveted back to previous value but the gas that was previously spent on the increment operation before reaching 'require' statement is not reverted or refunded. The gas is still consumed, and the sender loses those gas units forever.

        //msg.value is the amount of money being sent by the user to the contract here via the fund function, which increases this contract's balance, also msg.value is only relevant when a user sends ETH to the contract, not when the contract sends ETH to a user/owner's wallet during withdrawal.
        require(msg.value > 1e18, "Minimum funding amount is 1 ETH mere Laal"); //1e18 = 1 ETH = 1000000000000000000 wei = 1 * 10**18 wei

        //suppose after 'require' statement we have a ton of computation here that takes lot of gas to execute, so in case it reaches the 'require' line, fails the require condition and reverts back so now how much ever gas we send to run this computation after 'require' line is send back to the user ~ refunded back to the user
        //So, in your example, if the user sends 0.5 ETH to the contract, but the require statement fails because the minimum funding amount is 1 ETH, the entire 0.5 ETH will be refunded to the user, and none of the gas will be consumed by the subsequent computations.
        //By reverting the transaction and refunding the gas, the user doesn't lose their funds on unnecessary computations, and the contract maintains its integrity by ensuring that the minimum funding amount is met. So, the require statement serves as a safeguard both to avoid malicious attacks and also to prevent unnecessary computations and ensure that the contract's conditions are met before proceeding with the execution.
        //But remember, even if a transaction is reverted due to a failed require statement, the sender still spends gas on the transaction. The gas is spent on the computation that occurred before the require statement failed, including the gas used to execute the code up to that point. So, in the case of a reverted transaction, the sender loses the gas spent on the transaction, but the funds sent (e.g., ETH) are refunded.

        //Revert ~ Undo an action that have been done, and sends the remaining gas associated with that transaction back
    }

    // //function used by owner to withdraw the money collected
    // function withdraw() public {

    // }
}

//Note:
/*
- Just like wallets can hold funds, contracts (like FundMe.sol) can actually hold funds as well. So whenever you deploy a contract similiar to a wallet address it actually works same as a wallet address i.e we you can send money to it, you can interact with it etc.

- Revert transactions gas loss ~ Let's break it down:
    You send 0.5 ETH to the contract, along with some gas (let's say 20,000 gas units) to execute the transaction.
    The transaction starts executing, and some gas is consumed (let's say 5,000 gas units) before reaching the require statement.
    The require statement checks the condition (msg.value > 1e18), which fails because 0.5 ETH is less than 1 ETH.
    Since the condition fails, the transaction is reverted, and the changes are undone.
    However, the gas already consumed (5,000 gas units) is not refunded. It's gone forever!
    The remaining gas (20,000 - 5,000 = 15,000 gas units) is refunded to you.
    The 0.5 ETH you sent is also refunded to you, but the gas cost (5,000 gas units) is deducted from the refund.

    So, the actual refund you receive would be:
        0.5 ETH (initially sent) - gas cost ( converted to ETH) = refund
    Assuming the gas price is 20 Gwei (a common value), the gas cost would be:
        5,000 gas units * 20 Gwei/gas unit = 0.0001 ETH (approximately)
    Subtracting this from the initial 0.5 ETH, you'd get:
        0.5 ETH - 0.0001 ETH = 0.4999 ETH (approximately)
    Rounded to 4 decimal places, the refund would be approximately 0.4999 ETH.
    In your example, the refund of 0.44449 ETH might be due to variations in gas prices or additional gas consumption before the require statement. But the concept remains the same: the gas consumed before the reversion is not refunded, and the remaining gas is refunded along with the initial ETH sent.
*/
