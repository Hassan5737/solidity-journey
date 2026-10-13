// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract BalanceContract {

    // This function allows the contract to receive Ether.
    function fund() public payable {}

    // Returns the contract's current balance in wei.
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}