// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

// Describes the functions available on the target contract.
interface ICounterTarget {
    function getCount() external view returns (uint256);

    function increment() external;
}

// This is the contract we want to interact with.
contract CounterTarget {
    uint256 private count;

    function getCount() external view returns (uint256) {
        return count;
    }

    function increment() external {
        count++;
    }
}

// Calls CounterTarget through its interface.
contract CounterInteractor {
    ICounterTarget private target;

    constructor(address targetAddress) {
        require(targetAddress != address(0), "Invalid target address");

        // Treat the supplied address as a contract implementing this interface.
        target = ICounterTarget(targetAddress);
    }

    // Reads the count from the deployed target contract.
    function readTargetCount() external view returns (uint256) {
        return target.getCount();
    }

    // Calls increment() on the target contract.
    function incrementTarget() external {
        target.increment();
    }
}