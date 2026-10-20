// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract FreelancingPlatform {
    ////// Enums //////

    enum JobStatus {
        Open,
        Taken,
        Completed,
        Cancelled
    }

    ////// Structs //////

    struct Job {
        string title;
        string description;
        uint256 bounty;
        address client;
        address freelancer;
        JobStatus status;
    }

    ////// Constants & State Variables //////

    uint256 public constant REPUTATION_REWARD = 1;
    uint256 public listingFee = 0.001 ether;
    address public owner;
    uint256 public totalJobs;

    // Total bounty funds locked in active jobs.
    uint256 public totalEscrowed;

    // Platform fees collected but not yet withdrawn.
    uint256 public platformFeesAccrued;

    ////// Mappings //////

    mapping(uint256 => Job) public jobs;
    mapping(address => uint256) public freelancerReputation;

    ////// Events //////

    event JobCreated(
        uint256 indexed jobID,
        address indexed client,
        uint256 bounty
    );

    event JobTaken(uint256 indexed jobID, address indexed freelancer);
    event JobCompleted(uint256 indexed jobID, address indexed freelancer);
    event JobCancelled(
        uint256 indexed jobID,
        address indexed client,
        uint256 refundedBounty
    );
    event ListingFeeUpdated(uint256 oldFee, uint256 newFee);
    event PlatformFeesWithdrawn(address indexed owner, uint256 amount);

    ////// Errors //////

    error InsufficientFunds();
    error BountyMustBePositive();
    error JobNotFound();
    error JobNotOpen();
    error JobNotInProgress();
    error ClientCannotAcceptOwnJob();
    error OnlyClient();
    error NotOwner();
    error TransferFailed();
    error NoPlatformFees();

    ////// Modifiers //////

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert NotOwner();
        }
        _;
    }

    modifier jobExists(uint256 _jobID) {
        if (_jobID == 0 || _jobID > totalJobs) {
            revert JobNotFound();
        }
        _;
    }

    ////// Constructor //////

    constructor() {
        owner = msg.sender;
    }

    ////// Job Functions //////

    function postJob(
        string calldata _title,
        string calldata _description
    ) external payable {
        if (msg.value < listingFee) {
            revert InsufficientFunds();
        }

        uint256 bountyAmount = msg.value - listingFee;
        if (bountyAmount == 0) {
            revert BountyMustBePositive();
        }

        totalJobs++;

        jobs[totalJobs] = Job({
            title: _title,
            description: _description,
            bounty: bountyAmount,
            client: msg.sender,
            freelancer: address(0),
            status: JobStatus.Open
        });

        platformFeesAccrued += listingFee;
        totalEscrowed += bountyAmount;

        emit JobCreated(totalJobs, msg.sender, bountyAmount);
    }

    function getJob(
        uint256 _jobID
    ) external view jobExists(_jobID) returns (Job memory) {
        return jobs[_jobID];
    }

    function getAllJobs() external view returns (Job[] memory) {
        Job[] memory allJobs = new Job[](totalJobs);

        for (uint256 i = 1; i <= totalJobs; i++) {
            allJobs[i - 1] = jobs[i];
        }

        return allJobs;
    }

    function acceptJob(uint256 _jobID) external jobExists(_jobID) {
        Job storage job = jobs[_jobID];

        if (job.status != JobStatus.Open) {
            revert JobNotOpen();
        }

        if (msg.sender == job.client) {
            revert ClientCannotAcceptOwnJob();
        }

        job.freelancer = msg.sender;
        job.status = JobStatus.Taken;

        emit JobTaken(_jobID, msg.sender);
    }

    function completeJob(uint256 _jobID) external jobExists(_jobID) {
        Job storage job = jobs[_jobID];

        if (msg.sender != job.client) {
            revert OnlyClient();
        }

        if (job.status != JobStatus.Taken) {
            revert JobNotInProgress();
        }

        uint256 bountyAmount = job.bounty;
        address freelancer = job.freelancer;

        // Effects: update state before transferring ETH.
        job.status = JobStatus.Completed;
        totalEscrowed -= bountyAmount;
        freelancerReputation[freelancer] += REPUTATION_REWARD;

        emit JobCompleted(_jobID, freelancer);

        // Interaction: release the escrowed bounty.
        (bool success, ) = payable(freelancer).call{value: bountyAmount}("");
        if (!success) {
            revert TransferFailed();
        }
    }

    function cancelJob(uint256 _jobID) external jobExists(_jobID) {
        Job storage job = jobs[_jobID];

        if (msg.sender != job.client) {
            revert OnlyClient();
        }

        if (job.status != JobStatus.Open) {
            revert JobNotOpen();
        }

        uint256 refundAmount = job.bounty;
        address client = job.client;

        // Effects: cancel the job before refunding the client.
        job.status = JobStatus.Cancelled;
        totalEscrowed -= refundAmount;

        emit JobCancelled(_jobID, client, refundAmount);

        // Interaction: refund the bounty, not the listing fee.
        (bool success, ) = payable(client).call{value: refundAmount}("");
        if (!success) {
            revert TransferFailed();
        }
    }

    ////// Platform Administration //////

    function setListingFee(uint256 _listingFee) external onlyOwner {
        uint256 oldFee = listingFee;
        listingFee = _listingFee;

        emit ListingFeeUpdated(oldFee, _listingFee);
    }

    function withdrawPlatformFees() external onlyOwner {
        uint256 amount = platformFeesAccrued;

        if (amount == 0) {
            revert NoPlatformFees();
        }

        // Effects: clear accrued fees before the external call.
        platformFeesAccrued = 0;

        (bool success, ) = payable(owner).call{value: amount}("");
        if (!success) {
            revert TransferFailed();
        }

        emit PlatformFeesWithdrawn(owner, amount);
    }

    ////// Transparency //////

    function getPlatformBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
