// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract IfElseExample {

    // if / else checks a condition and executes the matching block.
    function isPositive(int256 num) public pure returns (string memory) {
        if (num > 0) {
            return "Positive";
        } else {
            return "Negative";
        }
    }

    // else if allows checking multiple conditions.
    function getGrade(uint256 score) public pure returns (string memory) {
        if (score >= 90) {
            return "A";
        } else if (score >= 80) {
            return "B";
        } else if (score >= 70) {
            return "C";
        } else if (score >= 60) {
            return "D";
        } else {
            return "F";
        }
    }
}