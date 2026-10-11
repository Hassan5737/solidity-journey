// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract StructsWithMappings {

    struct Student {
        address studentAddr;
        uint256 id;
        string name;
    }

    // Each student's wallet address maps to their record.
    mapping(address => Student) private students;

    // Register the caller as a student.
    function addStudent(uint256 _id, string memory _name) public {
        students[msg.sender] = Student({
            studentAddr: msg.sender,
            id: _id,
            name: _name
        });
    }

    // Read a student's information.
    function getStudent(address _key)
        public
        view
        returns (address, uint256, string memory)
    {
        Student storage student = students[_key];

        return (student.studentAddr, student.id, student.name);
    }

    // Update the caller's own record.
    function updateStudent(uint256 _id, string memory _name) public {
        require(
            students[msg.sender].studentAddr != address(0),
            "Student not found"
        );

        students[msg.sender].id = _id;
        students[msg.sender].name = _name;
    }

    // Delete the caller's own record.
    function deleteStudent() public {
        delete students[msg.sender];
    }
}