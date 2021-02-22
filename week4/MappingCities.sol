// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

 

contract MappingCities{
    
    mapping(string => string) cities;
    
    function add(string memory _city, string memory _country) public{
        cities[_city] = _country;
    }
    
    function get(string memory cityName) public view returns(string memory){
        return cities[cityName];
    }
    
    function remove(string memory cityName) public {
        delete(cities[cityName]);
    }
    
    
    
}