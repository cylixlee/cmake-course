# Run cmake -B <build_dir> to run this script.
#
# `include` and other target-definition commands are not allowed in scripts (`*.cmake`). A `CMakeLists.txt` is required
# to do so.

cmake_minimum_required(VERSION 3.20)
project(cmake-course)

include("cmake/header.cmake")

function_from_header("World")