Usage
Connecting to MetaMask
Open the project in a web browser.
Click the "Connect to MetaMask" button to connect your MetaMask wallet.
Creating a Campaign
After connecting to MetaMask, enter the campaign details:
Campaign Title
Goal Amount (in ETH)
Deadline (Unix Timestamp)
Click the "Create Campaign" button to create a new crowdfunding campaign.
Contributing to a Campaign
Select a campaign from the dropdown list.
Enter the contribution amount (in ETH).
Click the "Contribute" button to contribute to the selected campaign.
Manager Actions
Create Request: Managers can create a request for spending campaign funds. Specify the description, amount (in ETH), and recipient address.
Approve Request: Contributors can approve requests they want to fund. Once a request receives approval from contributors representing more than 50% of the contributors, the manager can finalize the request.
Finalize Request: Managers can finalize approved requests to release funds to the recipient.
Contract Details
The Solidity smart contract (Crowdfunding.sol) includes the following key functions and data structures:

createCampaign: Allows users to create new crowdfunding campaigns.
contribute: Allows users to contribute funds to a campaign.
createRequest: Allows the campaign manager to create a spending request.
approveRequest: Allows contributors to approve spending requests.
finalizeRequest: Allows the manager to finalize an approved request.
