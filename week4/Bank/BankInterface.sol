//SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 < 0.8.1;

interface BankInterface{
    
    function deposit() external payable;
    function balances() external view returns(uint256);
    function withdraw(uint256 amount) external payable returns(uint256);
   // function close() external;
    
    
    
    
}
    
// }
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

// contract MyToken is ERC20 {
    
//     constructor () public ERC20("dojo","DOJO20"){
//       // _mint(msg.sender, 1000000000 *(10 ** (decimals())));
        
//     }
// }