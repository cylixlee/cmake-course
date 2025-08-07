cmake_minimum_required(VERSION 3.20)

# Export compile commands to Clangd.
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(cmake-course)

add_executable(
    "main"
    "src/main.cc"
)