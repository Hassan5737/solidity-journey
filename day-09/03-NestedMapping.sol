// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract NestedMapping {

    // election ID => candidate address => vote count
    mapping(uint256 => mapping(address => uint256)) private votes;

    // Record a vote for a candidate in a specific election.
    function castVote(uint256 electionId, address candidateAddr) public {
        votes[electionId][candidateAddr]++;
    }

    // Retrieve the candidate's vote count for an election.
    function getVotesCount(
        uint256 electionId,
        address candidateAddr
    ) public view returns (uint256) {
        return votes[electionId][candidateAddr];
    }
}