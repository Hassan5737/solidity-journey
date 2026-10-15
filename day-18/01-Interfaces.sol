// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

// An interface defines the functions a contract must provide.
interface ICounter {
    function getCount() external view returns (uint256);

    function increment() external;
}

// This contract implements the ICounter interface.
contract Counter is ICounter {
    uint256 private count;

    // Provides the implementation of getCount().
    function getCount()
        external
        view
        override
        returns (uint256)
    {
        return count;
    }

    // Provides the implementation of increment().
    function increment() external override {
        count++;
    }
}