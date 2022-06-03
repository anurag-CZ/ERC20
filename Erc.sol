//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';


contract token is ERC20 {
    address public admin;

    constructor() ERC20("TOKEN", "TKN") {
        _mint(msg.sender, 10000 * 10 ** 18);
        admin = msg.sender;
    }

    function mint(address to , uint amount) external {
        require(admin == msg.sender, "only Admin");
        _mint(to, amount);
    }

    function burn(uint amount) external {
        _burn(msg.sender,amount);
    }

}