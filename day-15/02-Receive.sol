// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract ReceiveExample {

    uint256 public price = 100;
    uint256 public totalReceived;

    // Called when Ether is sent with empty calldata.
    receive() external payable {
        // msg.value is the amount received in wei.
        totalReceived += msg.value;

        // Demonstrates that receive() was executed.
        price = 200;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}