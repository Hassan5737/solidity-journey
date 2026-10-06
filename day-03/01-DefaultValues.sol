// SPDX-License-Identifier: MIT

pragma solidity ^0.8.31;

// State variables get default values automatically if no value is assigned.

contract defaultVal {
   
    uint public num; // Default: 0
    int public num2; // Default: 0
    bool public flag; // Default: false

    address public user;
    // Default: 0x0000000000000000000000000000000000000000
    // Address size: 20 bytes = 40 hexadecimal digits.

    bytes32 public myByte;
    // Default: 0x0000000000000000000000000000000000000000000000000000000000000000
    // 32 bytes = 64 hexadecimal digits.
}