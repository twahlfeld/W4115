cmake_minimum_required(VERSION 2.8)
project(main)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -Wall -Werror -std=gnu99")

set(MAIN_SOURCE main.c)
add_executable(main ${MAIN_SOURCE})
TARGET_LINK_LIBRARIES(main ${PROJECT_SOURCE_DIR}/libparse.a)