// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract DeleteArrayElement {

    uint256[] private numbers;

    function addElement(uint256 value) public {
        numbers.push(value);
    }

    // Remove an element by replacing it with the last element.
    // This changes the order of elements.
    function removeElement(uint256 index) public {
        require(index < numbers.length, "Invalid index");

        numbers[index] = numbers[numbers.length - 1];
        numbers.pop();
    }

    function getElement(uint256 index) public view returns (uint256) {
        require(index < numbers.length, "Invalid index");
        return numbers[index];
    }

    function getLength() public view returns (uint256) {
        return numbers.length;
    }
}