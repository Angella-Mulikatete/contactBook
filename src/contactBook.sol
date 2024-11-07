// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract contactBook {

    address private owner;

    struct Contact {
        string name;
        address wallet;
    }

    Contact[] private contacts;
    constructor() {
        owner = msg.sender;
    }

    modifier  onlyOwner {
        require( msg.sender == owner , "only Owner has to call this function");
        _;
    }

    function addContact(string memory _name, address _wallet) external onlyOwner {
        contacts.push(Contact({
            name: _name,
            wallet: _wallet
        }));
    }

    function removeContact(uint256 _index) public onlyOwner {
        for(uint i = _index; i < contacts.length - 1; i++){
            contacts[i] = contacts[i + 1];
        }
        contacts.pop();
    }

    function getContacts() public view returns(Contact[] memory){
        return contacts;
    }
}
