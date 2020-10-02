* Many languages say you should use defensive programming and check
  the arguments to all functions. In Erlang, defensive programming is built-in.
  You should describe the behavior of functions only for valid input arguments; 
  all other arguments will cause internal errors that are automatically detected.
  You should never return values when a function is called with invalid arguments. 
  You should always raise an exception. This rule is called “Let it crash.”