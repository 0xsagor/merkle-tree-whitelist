// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WhitelistMint is Ownable {
    bytes32 public merkleRoot;
    mapping(address => bool) public hasMinted;

    constructor(bytes32 _merkleRoot) Ownable(msg.sender) {
        merkleRoot = _merkleRoot;
    }

    /**
     * @dev Validates the Merkle Proof and allows the user to mint.
     */
    function mint(bytes32[] calldata _merkleProof) external {
        require(!hasMinted[msg.sender], "Already minted");
        
        // Verify the leaf node (msg.sender)
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        require(MerkleProof.verify(_merkleProof, merkleRoot, leaf), "Invalid Merkle Proof");

        hasMinted[msg.sender] = true;
        // Logic for minting/transferring goes here
    }

    function updateRoot(bytes32 _newRoot) external onlyOwner {
        merkleRoot = _newRoot;
    }
}
