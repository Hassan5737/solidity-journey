// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// bytes is used to store raw byte data.
// bytes32 stores exactly 32 bytes.

contract BytesExample {
    bytes public data = "Hello";
    bytes32 public fixedData = "Hello";
}