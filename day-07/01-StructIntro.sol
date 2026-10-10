// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract StructIntro {

    // A struct groups related data of different types.
    struct Student {
        address studentAddr;
        uint256 id;
        string name;
    }

    // Creates a temporary Student struct and returns it.
    // The struct is not saved in contract storage.
    function createStudent(
        uint256 _id,
        string memory _name
    ) public view returns (Student memory) {
        Student memory student1 = Student(
            msg.sender,
            _id,
            _name
        );

        return student1;
    }
}