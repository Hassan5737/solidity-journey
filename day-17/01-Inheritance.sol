// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

// Parent contract containing shared student information.
contract Person {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }

    function introduce() public view returns (string memory) {
        return name;
    }
}

// Student inherits the state variable and function from Person.
contract Student is Person {
    uint256 public studentId;

    // The parent's constructor must receive its required argument.
    constructor(string memory _name, uint256 _studentId)
        Person(_name)
    {
        studentId = _studentId;
    }

    // The child contract can use inherited members.
    function getStudentInfo()
        public
        view
        returns (string memory, uint256)
    {
        return (name, studentId);
    }
}