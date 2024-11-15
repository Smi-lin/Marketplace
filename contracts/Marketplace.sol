// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.27;

contract Marketplace {
    address public owner;

    enum ItemStatus {
        None,
        Created,
        Pending,
        Sold
    }

    struct Item {
        string name;
        string description;
        uint16 price;
        ItemStatus status;
    }

    Item[] public items;

    event ItemListed(string indexed name, uint16 price);

    constructor() {
        owner = msg.sender;
    }

      modifier validAddress() {
        require(msg.sender != address(0), "Zero Address not allowed");
        _;
    }

    function registerItem(
        string memory _name,
        string memory _desc,
        uint16 _price
    ) public {
        require(msg.sender != address(0), "Zero Address is not allowed");

        Item memory newItem;

        newItem.name = _name;
        newItem.description = _desc;
        newItem.price = _price;

        items.push(newItem);
    }

    function listItem(string memory _name, uint16 _price) external {
        require(msg.sender != address(0), "Zero address is not allowed");

        Item memory newItem;
        newItem.name = _name;
        newItem.price = _price;
        newItem.status = ItemStatus.Created;

        items.push(newItem);

        emit ItemListed(_name, _price);
    }

     function getAllItems() external view validAddress returns (Item[] memory) {
        return items;
    }

    function getItem(uint8 _index) external view validAddress returns (string memory, string memory) {
        require(_index < items.length,"Index is out of bound" );

        Item memory newItem = items[_index];
        return (newItem.name, newItem.description);
    }
}
