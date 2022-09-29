// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// With ERC2771Context , Making contract Gasless tx compatible

import "@openzeppelin/contracts/metatx/ERC2771Context.sol";

contract Mood is ERC2771Context {
    /// stores the current mood
    string mood;

    /// stores the address of owner , who deployed the contract
    address owner;

    constructor(address _trustedForwarder)
        public
        ERC2771Context(_trustedForwarder)
    {
        /// address of the forwarder on the respective chain

        /// As the contract is deployed by the owner itself so we are using msg.sender
        owner = msg.sender;
    }

    // check that the function is call from the owner itself
    modifier onlyOwner() {
        /// Instead of msg.sender , we are using msgSender()
        /// as this function will be called by a relayer for enabling gasless transaction
        _msgSender() == owner;
        _;
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
