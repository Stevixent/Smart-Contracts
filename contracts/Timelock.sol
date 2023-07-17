// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Timelock {
    //who can Withdraw?
    //How much?
    //When?
    address payable beneficiary;  //who can Withdraw?
    uint256 releaseTime; //When?

    constructor(address payable _beneficiary, uint256 _releaseTime) public payable {
       require(_releaseTime > block.timestamp);
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }

    function release() public {
        require(block.timestamp >= releaseTime );
        address  (payable beneficiary).transfer(address(this).balance);
    }
}

