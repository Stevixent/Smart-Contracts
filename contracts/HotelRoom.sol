// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
    // Ether Payments
    enum Statuses {Vacant, Occupied}

    Statuses currentStatus;

    address payable public owner;
    
    constructor() {
        owner =payable (msg.sender) ;
        currentStatus = Statuses.Vacant;
    }

    // Modifiers
    modifier onlyWhileVacant {
         require(currentStatus == Statuses.Vacant, "Currently occupied.");
         _;
    }

    modifier costs(uint _amount) {
         require(msg.value >= 2 ether, "Not enough ether provided.");
         _;
    }

    function book() public payable onlyWhileVacant  {
        // Check Price(moved to costs 
        // Check Status(moved to midifier
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);
    }



    
    // Visibility in functions
    // Events
    // Enums(vacant and occupied)
    

}