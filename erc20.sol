//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

interface IERC20 {
    function totalSupply() external view returns(uint);

    function balanceOf(address account) external view returns(uint);

    function transfer(address to, uint amount) external returns(bool);

    function transferFrom(address from, address to, uint amount) external returns(bool);

    function approve(address spender, uint amount) external returns(bool);

    function allowance(address from, address spender) external view returns(uint); 

    event Transfer(address indexed from, address indexed to, uint amount);

    event Approval(address indexed from, address indexed spender, uint amount);
    
}

contract Token is IERC20 {
    uint override  public totalSupply;
    mapping(address => uint) override public balanceOf;
    mapping(address => mapping(address => uint)) override  public allowance;
    string public name = "Saga";
    string public symbol = "SAGA";
    uint public decimal = 18;


    function transfer(address to, uint amount) override external returns(bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function transferFrom(address from, address to, uint amount) override external returns(bool) {
        allowance[from][msg.sender] -= amount;
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        emit Transfer(from, to, amount);
        return true;
    }

    function approve(address spender, uint amount) override external returns(bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }
    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}