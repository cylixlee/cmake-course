cmake_minimum_required(VERSION 3.20)

# Function names are case-insensitive.
#
# This is different from variables.
function(helloworld arg) # Functions receive _values_.
  # Here, the value passed in is actually stored into the variable named `arg`.
  message("----------")
  message("Hello, " ${arg})
  message("ARGV0 -> " ${ARGV0})
  message("ARGV1 -> " ${ARGV1})
  message("ARGV2 -> " ${ARGV2})
  message("----------")
endfunction()

helloworld(114)
helloworld(114 514 1919810)

set(var 120)
helloworld(var) # a string actually
helloworld(${var}) # passing the value to the function
