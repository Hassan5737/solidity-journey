// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract Result_Checker {

    struct Student {
        string name;
        uint grade;
        bool isRegistered;
    }

    mapping (address => Student) studentData;

    address public owner;

    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner () {
        require(msg.sender == owner, "only owner can perform this action");
        _;
    }

    function registerStudent(string memory name, uint grade, address Saddress) public onlyOwner {

        require(Saddress != address(0), "Invalid address");

        require(bytes(name).length > 0,"Name cannot be empty" );

        require(
            !studentData[Saddress].isRegistered,
            "Student already registered"
        );

        require(grade <= 100, "Grade cannot exceed 100");



        studentData[Saddress] = Student ({
            name : name,
            grade : grade,
            isRegistered : true
        });

    }


    function updateGrade (address _address, uint newGrade) public onlyOwner {

        require(studentData[_address].isRegistered, "address is not registered");

        require(newGrade <= 100, "Grade cannot exceed 100");

        studentData[_address].grade = newGrade;

    }

    function GetResult (address _address ) public  view returns  (string memory _name, uint _grade, string memory status) {

        require(studentData[_address].isRegistered, "address is not registered");


        if(studentData[_address].grade >= 50) {
            status = "successful";
        }
        else {
            status = "fail";
        }

        return (studentData[_address].name , studentData[_address].grade , status);


    }
}