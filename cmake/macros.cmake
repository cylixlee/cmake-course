cmake_minimum_required(VERSION 3.20)

macro(redefine x)
  set(${x} "redefined") # macros bodies are directly expanded to the calling point.
endmacro()

set(y "first defined")
message(${y})
redefine(y) # equivalent to `set(y "redefined")`
message(${y})
