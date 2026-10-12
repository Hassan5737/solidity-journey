// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract EventsIndexedExample {

    uint256 public constant PRICE = 100;

    // Indexed parameters can be used to filter event logs.
    event TicketSold(
        address indexed buyer,
        uint256 indexed ticketId,
        uint256 price
    );

    function buyTicket(uint256 ticketId) public {
        emit TicketSold(msg.sender, ticketId, PRICE);
    }
}