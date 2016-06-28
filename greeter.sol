contract mortal {
  /* Owner's address */
  address owner;

  /* Set owner at initialization time */
  function mortal() { owner = msg.sender; }

  /* Recover contract funds when destroyed */
  function kill() { if (msg.sender == owner) selfdestruct(owner); }
}

contract greeter is mortal {
  /* The greeting to say ) */
  string greeting;

  /* Set greeting at initialization time */
  function greeter(string _greeting) public {
    greeting = _greeting;
  }

  /* Greet the caller */
  function greet() constant returns (string) {
    return greeting;
  }
}
