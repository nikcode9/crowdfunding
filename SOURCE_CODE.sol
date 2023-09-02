//SPDX-License-Identifier: GPL-3.0
// created by nikhil
pragma solidity >=0.5.0 <0.9.0;// i am displaying the version range of solidity being used

contract Crowdfunding {
    struct Campaign {
        address creator;
        string title;
        uint256 goalAmount;
        uint256 currentAmount;
        uint256 deadline;
        bool isFunded;
        mapping(address => uint256) contributions;
        uint256 contributorCount;
    }

    address public manager;
    mapping(uint256 => Campaign) public campaigns;
    uint256 public campaignCount;

    event CampaignCreated(address indexed creator, string title);
    event ContributionMade(address indexed contributor, uint256 campaignId, uint256 amount);

    constructor() {
        manager = msg.sender;
    }

    modifier onlyManager() {
        require(msg.sender == manager, "Only the manager can perform this action.");
        _;
    }

    function createCampaign(string memory title, uint256 goalAmount, uint256 deadline) public {
        uint256 campaignId = campaignCount++;
        campaigns[campaignId] = Campaign({
            creator: msg.sender,
            title: title,
            goalAmount: goalAmount,
            currentAmount: 0,
            deadline: deadline,
            isFunded: false,
            contributorCount: 0
        });
        emit CampaignCreated(msg.sender, title);
    }

    function contribute(uint256 campaignId) public payable {
        require(campaignId < campaignCount, "Invalid campaign ID");
        Campaign storage campaign = campaigns[campaignId];
        require(!campaign.isFunded, "This campaign is already funded.");
        require(block.timestamp < campaign.deadline, "Campaign deadline has passed.");
        require(msg.value > 0, "Contribution amount must be greater than 0");

        campaign.contributions[msg.sender] += msg.value;
        campaign.currentAmount += msg.value;
        campaign.contributorCount++;

        emit ContributionMade(msg.sender, campaignId, msg.value);
    }
}
