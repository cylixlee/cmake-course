cmake_minimum_required(VERSION 3.20)

set(booleanVariable TRUE)
set(numberVariable 114)
set(stringVariable "hello")

# Truthy values: TRUE, 1, YES, ON Falsy values: FALSE, 0, NO, OFF
if(${booleanVariable})
  message("booleanVariable is true")
endif()

# Actually there're only strings in CMake.
#
# The operators (LESS, STRLESS, etc.) _parses_ the variable string to a specific
# form (number, string, bool, etc.) and then produces a value.
if(${numberVariable} LESS 514)
  message("numberVariable is less than 514")
else()
  message("numberVariable is greater than or equal to 514")
endif()

if(${stringVariable} STRLESS ${numberVariable})
  message("stringVariable is less than numberVariable")
else()
  message("stringVariable is greater than or equal to numberVariable")
endif()

if(${numberVariable} EQUAL 114)
  message("numberVariable EQUAL 114")
else()
  message("numberVariable NOT EQUAL 114")
endif()

if(${numberVariable} STREQUAL 114)
  message("numberVariable STREQUAL 114")
else()
  message("numberVariable NOT STREQUAL 114")
endif()

# `foreach` loops
#
# Allowed form:
#
# 1. foreach(<loop_var> <items>)
# 2. foreach(<loop_var> RANGE <start> <stop> [<step>])
# 3. foreach(<loop_var> RANGE <stop>)
# 4. foreach(<loop_var> IN [LISTS [<lists>]] [ITEMS [<items>]])
# 5. foreach(<loop_var>... IN ZIP_LISTS <lists>)
#
# The `foreach(<loop_var> IN LISTS A)` is equivalent to `foreach(<loop_var> IN ITEMS ${A})`.

# RANGE operator
foreach(item RANGE 5)
  message("item: ${item}")
endforeach()
message("=================")

# IN operator LISTS operator
set(listVariable 1 2 3 4 5)
foreach(item IN LISTS listVariable)
  message("item: ${item}")
endforeach()
message("=================")

# (additional) ITEMS operator
#
# Append some extra items to the loop range.
foreach(item IN LISTS listVariable ITEMS 6 7 8 9 10)
  message("additional item: ${item}")
endforeach()
message("=================")

# IN operator ZIP_LISTS operator
set(anotherListVariable "apple" "banana" "carrot" "durian" "elderberry")
foreach(pair IN ZIP_LISTS listVariable anotherListVariable)
  message("pair: ${pair_0} ${pair_1}")
endforeach()
