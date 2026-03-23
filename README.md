# Merkle Tree Whitelist

A professional-grade implementation for managing large-scale whitelists in Web3. Unlike traditional mapping-based whitelists that cost significant gas to update, this repository uses Merkle Proofs to verify eligibility on-chain using a single 32-byte Root hash.

## Key Features
* **Massive Scalability:** Support for 10,000+ addresses without increasing deployment costs.
* **Gas Efficiency:** Verification costs remain constant regardless of the whitelist size.
* **Security:** Cryptographic proof ensures only authorized addresses can interact.
* **Flat Structure:** Integrated Solidity and JavaScript logic in the root directory.

## Workflow
1. **Off-chain:** Generate a Merkle Root from a list of addresses using `merkletreejs`.
2. **On-chain:** Store only the `merkleRoot` in the smart contract.
3. **Execution:** Users provide a `proof` (generated off-chain) to the contract to verify their spot.

## Setup
1. `npm install`
2. Update `whitelist.json` with your target addresses.
3. Run `node generate-root.js` to get your deployment parameters.
