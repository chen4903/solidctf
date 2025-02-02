// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.9;

contract test02 {
    string greeting;

    constructor(string memory _greeting) {
        greeting = _greeting;
    }

    function greet() public view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

    function isSolved() public view returns (bool) {
        string memory expected = "HelloChainFlag";
        return keccak256(abi.encodePacked(expected)) == keccak256(abi.encodePacked(greeting));
    }
}
