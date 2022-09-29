// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// With BaseRelayRecipient , Making contract Gasless transaction compatible

import "@opengsn/gsn/contracts/BaseRelayRecipient.sol";

contract Mood is BaseRelayRecipient {
    /// stores the current mood
    string mood;

    /// stores the address of owner , who deployed the contract
    address owner;

    constructor(address _trustedForwarder) public {
        /// address of the forwarder on the respective chain
        trustedForwarder = _trustedForwarder;
        /// As the contract is deployed by the owner itself so we are using msg.sender
        owner = msg.sender;
    }

    // check that the function is call from the owner itself
    modifier onlyOwner() {
        /// Instead of msg.sender , we are using msgSender()
        /// as this function will be called by a relayer for enabling gasless transaction
        msgSender() == owner;
        _;
    }

    // set new trusted forwarder in case issue persists
    function setTrustedForwader(address _trustedForwader) public onlyOwner {
        trustedForwarder = _trustedForwader;
    }

    // to track the version of the baseRelayRecepient we are using in the contract
    function versionRecipient() external view override returns (string memory) {
        return "1";
    }

    //write a mood to contract
    function setMood(string memory _mood) public {
        mood = _mood;
    }

    //get mood
    function getMood() public view returns (string memory) {
        return mood;
    }
}
