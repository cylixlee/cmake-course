cmake_minimum_required(VERSION 3.20)

# Actually callee functions creates a new scope, which shadows the outer functions' scopes.
#
# CMake finds the variables from the current scope, and then the parent scopes if not found.

function(outer_function var) # creates a scope <'outer>, with `var` assigned to the value passed in.
  function(inner_function var) # creates a scope <'inner>, with `var` assigned to the value passed in.
    message("-> inner: ${var}") # finds `var` ("outer") at current scope (function argument).
    set(var "inner")            
    message(":: inner: ${var}") # finds `var` ("inner") in current scope.
    message("<- inner: ${var}") # finds `var` ("inner") in current scope.
  endfunction()

  message("-> outer: ${var}") # finds `var` ("toplevel") at current scope (function argument).
  set(var "outer")            
  message(":: outer: ${var}") # finds `var` ("outer") in current scope.
  inner_function(${var})      # passes value "outer" to `inner_function`.
  message("<- outer: ${var}") # finds `var` ("outer") in current scope.
endfunction()

set(var "toplevel")            # creates a variable `var` at directory scope (toplevel)
message(":: toplevel: ${var}") # finds `var` at current scope
outer_function(${var})         # passes value "toplevel" to `outer_function`
message(":: toplevel: ${var}") # finds `var` at current scope

message("-------------------------------")

# If you want to modify a variable from parent scope, use `PARENT_SCOPE`.
set(outer "initialized at toplevel.")
function(modify_outer_scope)
  set(outer "modified from function scope." PARENT_SCOPE)
endfunction()
modify_outer_scope()
message(${outer})
