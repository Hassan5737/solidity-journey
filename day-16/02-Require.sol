// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract RequireExample {

    uint256 public number;

    function setNumber(uint256 newNumber) public {
        // Validate the input before updating the state.
        require(newNumber <= 100, "Number exceeds maximum");

        number = newNumber;
    }
}