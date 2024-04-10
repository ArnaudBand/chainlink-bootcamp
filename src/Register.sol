// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Contract Address: 0x5a76C0F317099fF1D47AbC41fbF4a6288bACdB83

contract Register {
    string private info;

    function setInfo(string memory _info) public {
        info = _info;
    }

    function getInfo() public view returns (string memory) {
        return info;
    }
}
