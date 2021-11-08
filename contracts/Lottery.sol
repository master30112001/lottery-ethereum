pragma solidity ^0.4.17;

contract Lottery {
    address public manager;

     // creating a dynamic array
    address[] public players;
    
    function Lottery() public {
        manager = msg.sender;
    }
    
      // when a person enters, they have to pay ether
    function enter() public payable {
        require(msg.value > .01 ether);
        players.push(msg.sender);
    }
    
    function random() private view returns (uint) {
        return uint(keccak256(block.difficulty, now, players));
    }
    
    function pickWinner() public restricted {
        uint index = random() % players.length;
        players[index].transfer(this.balance);
        players = new address[](0);
    }
    
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
    
    function getPlayers() public view returns (address[]) {
        return players;
    }
}   




// enter() function
    // if the require condition fails and results to false -> then it will not
    // execute the lines after the statement and it will exit out of the function


// random() function
    // there is no random function in solidity so we need to make a pseudo random function
    // uint converts the result into integer
    // keccak is a hash algorithm that creates a hash of the inputs given
    // keccak is similar to sha3
    // block is a global variable that we can access
    // the difficulty of the block is passed as a parameter
    // now as well is a global variable which gives the current time
    // players is the list of players variable that we have declared above
 
// pickWinner  
    // this.balance - this refers to the contract - and balance refers to the balance of the contract
    // after the winner is picked => we have to empty the array => reason ? because if we empty the array we can play the lottery again without having to redpeploy the contract
    // players = new address[](0) -> the square brackets mean that it is a dynamic array and the 0 in parentheses indicates that the length of the array should be initialized as 0
    
// modifier restricted
    // modifier is a modification that we can give to a function
    // restricted is the modifier's name 
    // the underscore means that -> in it's place other lines of code would go (these other lines of code means the lines of code of the function where we use the modifier)
    
    
    
// other notes
    // players[index] - this will give the address of the player - remember that it returns the address and not the player value or anything different
    