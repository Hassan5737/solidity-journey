// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract FixedSizeArrays {

    // This array always contains exactly 3 elements.
    uint256[3] private scores = [80, 90, 100];

    // Read an element using its zero-based index.
    function getScore(uint256 index) public view returns (uint256) {
        require(index < scores.length, "Invalid index");
        return scores[index];
    }

    // Update an existing element without changing the array length.
    function setScore(uint256 index, uint256 score) public {
        require(index < scores.length, "Invalid index");
        scores[index] = score;
    }

    function getLength() public view returns (uint256) {
        return scores.length;
    }
}