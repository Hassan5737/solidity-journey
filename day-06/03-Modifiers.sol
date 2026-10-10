// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract ProductSale {
    uint256 public constant PRICE = 100; // 100 wei
    uint256 public productsSold;

    modifier checkPrice(address student) {
        require(student != address(0), "Invalid student");
        require(msg.value >= PRICE, "Amount less than price");

        _;

        // Runs after the function body completes successfully.
        productsSold++;
    }

    function buyProduct(address student) public payable checkPrice(student) {
        // Product purchase logic would go here.
    }
}