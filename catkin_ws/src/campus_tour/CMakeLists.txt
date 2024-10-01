cmake_minimum_required(VERSION 3.0.2)
project(campus_tour)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

## Find catkin macros and libraries
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation
)

## Declare ROS messages, services, and actions
add_message_files(
  FILES
  NavigationRequest.msg
  NavigationResponse.msg
)

## Generate added messages and services
generate_messages(
  DEPENDENCIES
  std_msgs
)

## Declare a catkin package
catkin_package(
  CATKIN_DEPENDS message_runtime std_msgs roscpp rospy
)

## Specify additional locations of header files
include_directories(
  ${catkin_INCLUDE_DIRS}
)
