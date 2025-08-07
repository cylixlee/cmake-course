cmake_minimum_required(VERSION 3.20)

function(show)
  message("Length: " ${ARGC})
  foreach(item ${ARGV})
    message("  " ${item})
  endforeach()
endfunction()

set(MyList "apple" "banana")
# Append a value to a list
list(APPEND MyList "orange")
show(${MyList})

# Remove a value from a list
#
# I don't know why this does not have syntax highlighting.
list(REMOVE_ITEM MyList "banana")
show(${MyList})

# Find a value in a list, outputing its index (starting from 0).
list(FIND MyList "apple" appleIndex)
list(FIND MyList "orange" orangeIndex)
message("Index of apple: " ${appleIndex})
message("Index of orange: " ${orangeIndex})

# Insert a value in a list
list(INSERT MyList 0 "pear")
show(${MyList})

# Reverse a list
list(REVERSE MyList)
show(${MyList})

# Sort a list
list(SORT MyList)
show(${MyList})
