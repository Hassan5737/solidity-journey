// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract MappingCRUD {

    mapping(address => uint256) public studentGrade;

    // Create: add a grade for a student.
    function addGrade(address _student, uint256 _grade) public {
        studentGrade[_student] = _grade;
    }

    // Read: retrieve a student's grade.
    function getGrade(address _student) public view returns (uint256) {
        return studentGrade[_student];
    }

    // Update: replace the existing grade.
    function updateGrade(address _student, uint256 _newGrade) public {
        studentGrade[_student] = _newGrade;
    }

    // Delete: reset the value to its default value, zero.
    function deleteGrade(address _student) public {
        delete studentGrade[_student];
    }
}