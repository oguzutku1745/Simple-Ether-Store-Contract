// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector {

    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    receive() payable external{
        balance += msg.value;
    }

    function withdraw(uint amount, address payable _to) public {
        require(msg.sender == owner, "You are not the owner");
        require(amount <= balance, "Insufficient funds");
        
        _to.transfer(amount);
        balance -= amount;
    }
    
}
