// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract StructsWithArrays {

    // Each student has personal data and an array of grades.
    struct Student {
        uint256 id;
        string name;
        uint256[] grades;
    }

    Student[] private students;

    function addStudent(uint256 _id, string calldata _name) public {
        students.push();

        Student storage student = students[students.length - 1];
        student.id = _id;
        student.name = _name;
    }

    // Add a grade to an existing student's array.
    function addGrade(uint256 studentIndex, uint256 grade) public {
        require(studentIndex < students.length, "Student not found");
        students[studentIndex].grades.push(grade);
    }

    // Return the student's information and grades.
    function getStudent(uint256 studentIndex)
        public
        view
        returns (uint256, string memory, uint256[] memory)
    {
        require(studentIndex < students.length, "Student not found");

        Student storage student = students[studentIndex];

        return (student.id, student.name, student.grades);
    }

    function getStudentCount() public view returns (uint256) {
        return students.length;
    }
}