// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Contract Address: 0x2614E39d661887A563Af1Eb8c7E921a30d0DfB60

contract RegisterAccess {
    string[] private info;
    address public owner;
    mapping(address => bool) public allowlist;

    constructor() {
        owner = msg.sender;
        allowlist[msg.sender] = true;
    }

    event InfoChange(string oldInfo, string newInfo);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    modifier onlyAllowlist() {
        require(allowlist[msg.sender] == true, "Only allowlist");
        _;
    }

    function getInfo(uint256 index) public view returns (string memory) {
        return info[index];
    }

    function setInfo(uint256 index, string memory _info) public onlyAllowlist {
        emit InfoChange(info[index], _info);
        info[index] = _info;
    }

    function addInfo(string memory _info) public onlyAllowlist returns (uint256 index) {
        info.push(_info);
        index = info.length - 1;
    }

    function listInfo() public view returns (string[] memory) {
        return info;
    }

    function addMember(address _member) public onlyOwner {
        allowlist[_member] = true;
    }

    function delMember(address _member) public onlyOwner {
        allowlist[_member] = false;
    }
}
