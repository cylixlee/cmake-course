cmake_minimum_required(VERSION 3.20)

# Variables are case-sensitive
set(MyVariable "Hello, CMake!")
set(myvariable "Another variable.")

message(${MyVariable})
message(${myvariable})

# Variable names are strings
#
# Note that spaces are allowed in variable names, but not recommended.
set("My Variable" "This is a variable with spaces.")
message(${My\ Variable})

# Variables can be list.
#
# Inside the list, semicolons are used to separate items. But they're not displayed when the list is printed by
# `message()`. Be ware to use semicolons inside variables!
set(MyList "Item1" "Item2" "Item3")
message("MyList: " ${MyList})
foreach(item ${MyList})
    message(${item})
endforeach()

# Equivalent to the previous one.
set(MySemicolonSeparatedList Item1;Item2;Item3)
message("MySemicolonSeparatedList: " ${MySemicolonSeparatedList})
foreach(item ${MySemicolonSeparatedList})
    message(${item})
endforeach()

# Variables can be unset
set(ExistVariable "Exist")
unset(ExistVariable)
if(DEFINED ${ExistVariable})
    message(${ExistVariable})
else()
    message("ExistVariable is not defined")
endif()

# Read environment variables
message($ENV{PATH})
if(DEFINED $ENV{CXX})
    message("CXX: " $ENV{CXX})
else()
    message("CXX is not defined")
endif()
