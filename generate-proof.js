const { MerkleTree } = require('merkletreejs');
const keccak256 = require('keccak256');

// Example Whitelist
const whitelistAddresses = [
    "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
    "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2",
    "0x4B20993Bc4811124709391e59A2119a730000000" // Example user
];

const leafNodes = whitelistAddresses.map(addr => keccak256(addr));
const merkleTree = new MerkleTree(leafNodes, keccak256, { sortPairs: true });

const rootHash = merkleTree.getHexRoot();
console.log('Merkle Root:', rootHash);

// Generate proof for a specific user
const claimingAddress = leafNodes[2];
const hexProof = merkleTree.getHexProof(claimingAddress);
console.log('Proof for Address [2]:', hexProof);
