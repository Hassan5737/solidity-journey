// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract StructCRUD {

    struct Student {
        address studentAddr;
        uint256 id;
        string name;
    }

    // Each student is stored using their wallet address as the key.
    mapping(address => Student) private students;

    // Create: register the caller as a student.
    function addStudent(uint256 _id, string memory _name) public {
        require(
            students[msg.sender].studentAddr == address(0),
            "Student already exists"
        );

        students[msg.sender] = Student({
            studentAddr: msg.sender,
            id: _id,
            name: _name
        });
    }

    // Read: return a student's information.
    function getStudent(address _student)
        public
        view
        returns (Student memory)
    {
        return students[_student];
    }

    // Update: modify the caller's existing record.
    function updateStudent(uint256 _id, string memory _name) public {
        require(
            students[msg.sender].studentAddr != address(0),
            "Student not found"
        );

        students[msg.sender].id = _id;
        students[msg.sender].name = _name;
    }

    // Delete: remove the caller's record.
    function deleteStudent() public {
        require(
            students[msg.sender].studentAddr != address(0),
            "Student not found"
        );

        delete students[msg.sender];
    }
}