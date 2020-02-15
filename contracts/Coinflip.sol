pragma solidity >=0.4.21 <0.7.0;

contract Coinflip {
  address public owner;
  uint public counter = 0; // For testing only

  mapping(address => uint) public balances;
  mapping(address => bool) public lastFlip;

  constructor() public {
    owner = msg.sender;
  }

  function getBalance(address _addr) public view returns (uint){
    return balances[_addr];
  }

  function getLastFlip(address _player) public view returns (bool) {
      return lastFlip[_player];
  }

  function flip() public payable {
    uint time = block.timestamp;
    uint bet = msg.value;

    if(time % 2 == 0){      //Requires a more effective random number algorithm for production use.
      msg.sender.transfer(bet*2);
      lastFlip[msg.sender] = true;
    }
    else{
        lastFlip[msg.sender] = false;
    }
  }

  function deposit() public payable {

  }
}