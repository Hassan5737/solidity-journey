// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract FunctionStateMutability {
    uint256 private value;

    // Reads contract state without changing it.
    function getValue() public view returns (uint256) {
        return value;
    }

    // Updates contract state.
    // The default mutability is nonpayable.
    function setValue(uint256 newValue) public {
        value = newValue;
    }

    // Performs a calculation without reading or changing contract state.
    function compute(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    // Allows the function to receive Ether.
    function deposit() public payable {}
}