cmake_minimum_required(VERSION 3.20)

message("Header is included!") # Executed when included.

function(function_from_header x) # Defined when included.
  message("Hello, ${x}!")
endfunction()
