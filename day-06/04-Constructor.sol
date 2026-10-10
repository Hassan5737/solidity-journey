// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract ConstructorExample {
    address public owner;

    // Runs once during deployment.
    // msg.sender is the account that deploys the contract.
    constructor() {
        owner = msg.sender;
    }
}