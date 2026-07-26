// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract VulnerableAllowanceVault {
    error InsufficientBalance();
    error InsufficientAllowance();
    error TransferFailed();

    mapping(address owner => uint256 amount) public balances;
    mapping(address owner => mapping(address spender => uint256 amount)) public allowances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function approve(address spender, uint256 amount) external {
        allowances[msg.sender][spender] = amount;
    }

    function spendFrom(address owner, address payable recipient, uint256 amount) external {
        if (balances[owner] < amount) revert InsufficientBalance();
        if (allowances[owner][msg.sender] < amount) revert InsufficientAllowance();

        balances[owner] -= amount;
        allowances[owner][msg.sender] -= amount;

        (bool ok,) = recipient.call{value: amount}("");
        if (!ok) revert TransferFailed();
    }
}