// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract ForLoopExample {

    // for loop: initialization → condition → increment.
    function countSum() public pure returns (uint256) {
        uint256 total = 0;

        for (uint256 i = 1; i <= 10; i++) {
            total += i;
        }

        return total;
    }
}