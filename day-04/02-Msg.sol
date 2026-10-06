// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

// msg provides information about the current call and transaction.

contract MsgExample {
    function getSender() public view returns (address) {
        return msg.sender;
    }

    function getValue() public payable returns (uint) {
        return msg.value;
    }
}