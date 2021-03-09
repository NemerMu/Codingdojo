const insurance = artifacts.require("insurance");

contract("insurance", async function(accounts){

    it (
    "should add product", async function(){
    let instance = await insurance.deployed()
    await instance.addProduct(1, "tv", 10);
    
    });
    
    });