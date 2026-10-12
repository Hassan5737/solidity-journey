// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract EnumExample {

    // Enum defines a fixed set of named states.
    enum Status {
        Pending,
        Shipped,
        Delivered,
        Cancelled
    }

    // The first enum member is the default value: Pending (index 0).
    Status public orderStatus;

    function shipOrder() public {
        orderStatus = Status.Shipped;
    }

    function deliverOrder() public {
        orderStatus = Status.Delivered;
    }

    function cancelOrder() public {
        orderStatus = Status.Cancelled;
    }

    // Resetting an enum returns it to its first member.
    function resetStatus() public {
        delete orderStatus;
    }
}