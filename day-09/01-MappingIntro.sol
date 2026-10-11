// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract MappingIntro {

    // Mapping: key => value
    // Each wallet address is associated with a grade.
    mapping(address => uint256) public studentGrade;

    // Tracks whether an address is subscribed.
    mapping(address => bool) public isSubscribed;

    function setGrade(address _student, uint256 _grade) public {
        studentGrade[_student] = _grade;
    }

    function setSubscription(address _user, bool _status) public {
        isSubscribed[_user] = _status;
    }
}