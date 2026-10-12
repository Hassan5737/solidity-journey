// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract EventsEmitExample {

    uint256 public constant PRICE = 100;

    // Declares the event and its data.
    event TicketSold(address buyer, uint256 price);

    function buyTicket() public {
        // Placeholder for the ticket purchase logic.
        // This example demonstrates event emission only.
        emit TicketSold(msg.sender, PRICE);
    }
}