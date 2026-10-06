// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Immutable variables are assigned once during contract deployment
// and cannot be changed afterwards.

contract Immutable {
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }
}