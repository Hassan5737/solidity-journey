// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// State variables are stored as part of the contract state.
// Local variables exist only while the function is executing.

contract StateVsLocal {
    uint256 public stateNumber = 10;

    function example() public view returns (uint256) {
        uint256 localNumber = 20;

        return stateNumber + localNumber;
    }
}