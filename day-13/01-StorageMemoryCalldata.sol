// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract StorageMemoryCalldata {

    // Persistent state stored by the contract.
    uint256[] public numbers;

    function addNumber(uint256 value) public {
        numbers.push(value);
    }

    // A storage reference points to the original array.
    // Updating it changes the contract state.
    function updateStoredNumber(
        uint256 index,
        uint256 value
    ) public {
        require(index < numbers.length, "Invalid index");

        uint256[] storage storedNumbers = numbers;
        storedNumbers[index] = value;
    }

    // Memory creates a separate copy of the stored array.
    // Updating the copy does not change the original array.
    function modifyMemoryCopy(
        uint256 index,
        uint256 value
    ) public view returns (uint256[] memory) {
        require(index < numbers.length, "Invalid index");

        uint256[] memory temporaryNumbers = numbers;
        temporaryNumbers[index] = value;

        return temporaryNumbers;
    }

    // Calldata is read-only input data.
    function sumCalldata(
        uint256[] calldata values
    ) external pure returns (uint256 total) {
        for (uint256 i = 0; i < values.length; i++) {
            total += values[i];
        }
    }
}