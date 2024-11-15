// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.27;

import "./Marketplace.sol";

contract MarketPlaceFactory {
    Marketplace[] public deployedMarketplace;

    event MarketplaceDeployed(address indexed marketplaceAddress);
    mapping(address => Marketplace[]) allUser;

    function registerMarketplace(
        uint256 _index,
        string memory _name,
        string memory _desc,
        uint16 _price
    ) external {
        require(_index < deployedMarketplace.length, "Invalid index");
        Marketplace marketplace = deployedMarketplace[_index];
        marketplace.registerItem(_name, _desc, _price);
    }

    function getAllMarketplace(
        uint256 _index
    ) external view returns (Marketplace.Item[] memory) {
        require(_index < deployedMarketplace.length, "Invalid index");
        Marketplace marketplace = deployedMarketplace[_index];
        return marketplace.getAllItems();
    }

    function getUserContracts()
        external
        view
        returns (Marketplace[] memory)
    {
        return allUser[msg.sender];
    }
}
