// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract SendMoney {

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    // Fund the contract before sending Ether.
    function fund() public payable {}

    // Send 0.5 ETH using transfer.
    function sendViaTransfer() public onlyOwner {
        uint256 amount = 0.5 ether;

        require(address(this).balance >= amount, "Insufficient balance");

        owner.transfer(amount);
    }

    // Send 0.5 ETH using send.
    function sendViaSend() public onlyOwner {
        uint256 amount = 0.5 ether;

        require(address(this).balance >= amount, "Insufficient balance");

        bool success = owner.send(amount);
        require(success, "Transfer failed");
    }

    // Send 0.5 ETH using call.
    function sendViaCall() public onlyOwner {
        uint256 amount = 0.5 ether;

        require(address(this).balance >= amount, "Insufficient balance");

        (bool success, ) = owner.call{value: amount}("");
        require(success, "Transfer failed");
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}