//SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.1;

/**
 * @title Tech Insurance tor
 * @dev 
 * Step1: Complete the functions in the insurance smart contract
 * Step2:Add any required methods that are needed to check if the function are called correctly, 
 * and also add a modifier function that allows only the owner can run the changePrice function.
 * Step3: Add any error handling that may occur in any function
 * Step 4: add ERC 721 Token
 * 
 */
contract TechInsurance {
    
    /** 
     * Defined two structs
     * 
     * 
     */
    struct Product {
        uint productId;
        string productName;
        uint price;
        bool offered;
    }
     
    struct Client {
        bool isValid;
        uint time;
    }
    
    
    mapping(uint => Product) public productIndex;
    mapping(address => mapping(uint => Client)) public client;
    
    uint productCounter;
    
    address payable insOwner;
    constructor(address payable _insOwner) public{
        insOwner = _insOwner;
    }
 
    function addProduct(uint _productId, string memory _productName, uint _price ) public {
        
        require(msg.sender == insOwner, "Only the product owner who can use this option!");
        Product  memory newProduct = Product(_productId, _productName, _price, true);
        productIndex[productCounter++]= newProduct;

    }
    
    
    function changeFalse(uint _productIndex) public {
        
        require(msg.sender == insOwner, "Only the product owner who can use this option!");
        productIndex[_productIndex].offered = false;
    }
    
    function changeTrue(uint _productIndex) public {
        require(msg.sender == insOwner, "Only the product owner who can use this option!");
        productIndex[_productIndex].offered = true;
    }
    
    function changePrice(uint _productIndex, uint _price) public {
        require(msg.sender == insOwner, "Only the product owner who can use this option!");
        productIndex[_productIndex].price = _price;
    }
    
    function clientSelect(uint _productIndex) public payable {
        require(productIndex[_productIndex].offered == false, "This item is sold out!");
        require(msg.value <= productIndex[_productIndex].price, "You don't have enough tokens!");
        
        changeFalse(_productIndex);        
        Client(true, block.timestamp);
        insOwner.transfer(msg.value); 
    } 
    
}