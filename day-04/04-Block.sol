// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

// block provides information about the current block.

contract BlockExample {
    function getTimestamp() public view returns (uint) {
        return block.timestamp;
    }

    function getBlockNumber() public view returns (uint) {
        return block.number;
    }
}