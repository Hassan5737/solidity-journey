// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract CustomErrorsExample {

    uint256 public constant PRICE = 1 ether;
    uint256 public productsSold;

    // Custom errors can carry information about the failure.
    error InsufficientPayment(uint256 sent, uint256 required);

    function buyProduct() public payable {
        // Reject payments below the required price.
        if (msg.value < PRICE) {
            revert InsufficientPayment({
                sent: msg.value,
                required: PRICE
            });
        }

        // Update the state only after payment validation.
        productsSold++;
    }
}