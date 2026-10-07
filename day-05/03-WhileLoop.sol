// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract WhileLoopExample {

    // while loop keeps running as long as the condition is true.
    function countSum() public pure returns (uint256) {
        uint256 total = 0;
        uint256 i = 1;

        while (i <= 10) {
            total += i;
            i++;
        }

        return total;
    }
}