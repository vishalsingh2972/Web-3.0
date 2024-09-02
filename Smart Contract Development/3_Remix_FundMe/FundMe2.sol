// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

interface AggregatorV3Interface {
    function decimals() external view returns (uint8);

    function description() external view returns (string memory);

    function version() external view returns (uint256);

    function getRoundData(
        uint80 _roundId
    )
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );

    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );
}

contract FundMe2 {
    uint256 public minimum_USD = 5;

    //function they call to send money to our contract
    function fund() public payable {
        //payable ~ In Solidity, the payable keyword is used to indicate that a function can receive Ether (ETH) or other cryptocurrencies. When a function is marked as payable, it allows users to send funds to the contract by calling that specific function, so here the payable keyword enables users to send ETH to the contract when calling the fund function.
        // Allow users to send $
        // Have a min. $ sent ~ here $5

        require(
            msg.value >= minimum_USD,
            "Minimum funding amount is $5 mere Laal"
        );
        //here 'minimum_USD' is in USD and 'msg.value' is in ETH/Wei, hence to compare these two values, you need to convert the USD value to ETH/Wei. Since the ETH/USD exchange rate fluctuates, you can't hardcode a fixed conversion rate. That's where `oracles` or services like `Chainlink` come in. They provide a reliable and decentralized way to fetch the current exchange rate and convert the USD value to ETH/Wei.
    }

    function getPrice() public {
        // things we need ~ Address and ABI
        // ETH/USD Address -  0x694AA1769357215DE4FAC081bf1f309aDC325306 ~ contract address for the ETH/USD price feed on the Sepolia testnet
        // ABI - the 'interface AggregatorV3Interface' above
    }

    function getConversionRate() public {}

    function getVersion() public view returns(uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}
