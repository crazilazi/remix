// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract MyNFT is ERC1155, Ownable {
    using Strings for uint256;

    // Base URI for metadata
    string private _baseURI;

    constructor() ERC1155("") Ownable(msg.sender) {
        _baseURI = "https://jsonkeeper.com/b/ZRGN"; // Replace with your actual metadata URL
    }

    // Mint a new NFT (only callable by the owner)
    function mint(address to, uint256 id, uint256 amount, bytes memory data) public onlyOwner {
        _mint(to, id, amount, data);
    }

    // Mint multiple NFTs in a batch (only callable by the owner)
    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data) public onlyOwner {
        _mintBatch(to, ids, amounts, data);
    }

    // Set the base URI for metadata
    function setBaseURI(string memory newBaseURI) public onlyOwner {
        _baseURI = newBaseURI;
    }
}