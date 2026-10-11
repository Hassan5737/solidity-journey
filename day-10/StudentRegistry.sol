// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract StudentRegistry {

    // Groups all information associated with a student.
    struct Student {
        string name;
        uint256 id;
        bool isRegistered;
        uint256[] grades;
    }

    address public owner;

    uint256 public constant MAX_GRADE = 100;
    uint256 private nextStudentId = 1;

    // Maps each wallet address to its student record.
    mapping(address => Student) private students;

    // Keeps track of registered student addresses.
    address[] private studentAddresses;

    // The deployer becomes the contract owner.
    constructor() {
        owner = msg.sender;
    }

    // Restricts administrative functions to the owner.
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    // Register a new student.
    function registerStudent(
        address studentAddress,
        string memory studentName
    ) public onlyOwner {

        require(
            studentAddress != address(0),
            "Invalid student address"
        );

        require(
            !students[studentAddress].isRegistered,
            "Student already registered"
        );

        require(
            bytes(studentName).length > 0,
            "Name cannot be empty"
        );

        Student storage newStudent = students[studentAddress];

        newStudent.name = studentName;
        newStudent.id = nextStudentId;
        newStudent.isRegistered = true;

        studentAddresses.push(studentAddress);

        nextStudentId++;
    }

    // Update the name of an existing student.
    function updateStudentName(
        address studentAddress,
        string memory newName
    ) public onlyOwner {

        require(
            students[studentAddress].isRegistered,
            "Student not found"
        );

        require(
            bytes(newName).length > 0,
            "Name cannot be empty"
        );

        students[studentAddress].name = newName;
    }

    // Add a grade to an existing student's record.
    function addGrade(
        address studentAddress,
        uint256 grade
    ) public onlyOwner {

        require(
            students[studentAddress].isRegistered,
            "Student not found"
        );

        require(
            grade <= MAX_GRADE,
            "Grade exceeds maximum"
        );

        students[studentAddress].grades.push(grade);
    }

    // Read a student's basic information.
    function getStudentInfo(
        address studentAddress
    )
        public
        view
        returns (
            uint256 id,
            string memory name,
            uint256 gradeCount
        )
    {
        require(
            students[studentAddress].isRegistered,
            "Student not found"
        );

        Student storage student = students[studentAddress];

        return (
            student.id,
            student.name,
            student.grades.length
        );
    }

    // Retrieve all grades recorded for a student.
    function getStudentGrades(
        address studentAddress
    ) public view returns (uint256[] memory) {

        require(
            students[studentAddress].isRegistered,
            "Student not found"
        );

        return students[studentAddress].grades;
    }

    // Check whether a wallet address is registered.
    function isStudentRegistered(
        address studentAddress
    ) public view returns (bool) {

        return students[studentAddress].isRegistered;
    }

    // Return the total number of registered students.
    function getStudentCount() public view returns (uint256) {
        return studentAddresses.length;
    }

    // Retrieve a student's wallet address by its zero-based index.
    function getStudentAddress(
        uint256 index
    ) public view returns (address) {

        require(
            index < studentAddresses.length,
            "Invalid index"
        );

        return studentAddresses[index];
    }
}