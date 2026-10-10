// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract DynamicSizeArrays {

    // A dynamic array can grow or shrink.
    uint256[] private numbers;

    // Add a new element at the end.
    function addElement(uint256 value) public {
        numbers.push(value);
    }

    // Read an element by index.
    function getElement(uint256 index) public view returns (uint256) {
        require(index < numbers.length, "Invalid index");
        return numbers[index];
    }

    // Return the current number of elements.
    function getLength() public view returns (uint256) {
        return numbers.length;
    }
}