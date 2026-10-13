// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract RevertExample {

    uint256 public number;

    function setNumber(uint256 newNumber) public {
        // Reject values greater than 100.
        if (newNumber > 100) {
            revert("Number exceeds maximum");
        }

        number = newNumber;
    }
}