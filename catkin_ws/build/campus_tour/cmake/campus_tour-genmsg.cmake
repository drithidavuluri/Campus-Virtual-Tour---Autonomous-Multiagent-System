# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "campus_tour: 2 messages, 0 services")

set(MSG_I_FLAGS "-Icampus_tour:/home/drithi/catkin_ws/src/campus_tour/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(campus_tour_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationRequest.msg" NAME_WE)
add_custom_target(_campus_tour_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "campus_tour" "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationRequest.msg" ""
)

get_filename_component(_filename "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationResponse.msg" NAME_WE)
add_custom_target(_campus_tour_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "campus_tour" "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationResponse.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(campus_tour
  "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationRequest.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/campus_tour
)
_generate_msg_cpp(campus_tour
  "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/campus_tour
)

### Generating Services

### Generating Module File
_generate_module_cpp(campus_tour
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/campus_tour
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(campus_tour_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(campus_tour_generate_messages campus_tour_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationRequest.msg" NAME_WE)
add_dependencies(campus_tour_generate_messages_cpp _campus_tour_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationResponse.msg" NAME_WE)
add_dependencies(campus_tour_generate_messages_cpp _campus_tour_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(campus_tour_gencpp)
add_dependencies(campus_tour_gencpp campus_tour_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS campus_tour_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(campus_tour
  "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationRequest.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/campus_tour
)
_generate_msg_eus(campus_tour
  "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/campus_tour
)

### Generating Services

### Generating Module File
_generate_module_eus(campus_tour
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/campus_tour
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(campus_tour_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(campus_tour_generate_messages campus_tour_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationRequest.msg" NAME_WE)
add_dependencies(campus_tour_generate_messages_eus _campus_tour_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationResponse.msg" NAME_WE)
add_dependencies(campus_tour_generate_messages_eus _campus_tour_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(campus_tour_geneus)
add_dependencies(campus_tour_geneus campus_tour_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS campus_tour_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(campus_tour
  "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationRequest.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/campus_tour
)
_generate_msg_lisp(campus_tour
  "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/campus_tour
)

### Generating Services

### Generating Module File
_generate_module_lisp(campus_tour
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/campus_tour
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(campus_tour_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(campus_tour_generate_messages campus_tour_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationRequest.msg" NAME_WE)
add_dependencies(campus_tour_generate_messages_lisp _campus_tour_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationResponse.msg" NAME_WE)
add_dependencies(campus_tour_generate_messages_lisp _campus_tour_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(campus_tour_genlisp)
add_dependencies(campus_tour_genlisp campus_tour_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS campus_tour_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(campus_tour
  "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationRequest.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/campus_tour
)
_generate_msg_nodejs(campus_tour
  "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/campus_tour
)

### Generating Services

### Generating Module File
_generate_module_nodejs(campus_tour
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/campus_tour
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(campus_tour_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(campus_tour_generate_messages campus_tour_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationRequest.msg" NAME_WE)
add_dependencies(campus_tour_generate_messages_nodejs _campus_tour_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationResponse.msg" NAME_WE)
add_dependencies(campus_tour_generate_messages_nodejs _campus_tour_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(campus_tour_gennodejs)
add_dependencies(campus_tour_gennodejs campus_tour_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS campus_tour_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(campus_tour
  "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationRequest.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/campus_tour
)
_generate_msg_py(campus_tour
  "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/campus_tour
)

### Generating Services

### Generating Module File
_generate_module_py(campus_tour
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/campus_tour
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(campus_tour_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(campus_tour_generate_messages campus_tour_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationRequest.msg" NAME_WE)
add_dependencies(campus_tour_generate_messages_py _campus_tour_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/drithi/catkin_ws/src/campus_tour/msg/NavigationResponse.msg" NAME_WE)
add_dependencies(campus_tour_generate_messages_py _campus_tour_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(campus_tour_genpy)
add_dependencies(campus_tour_genpy campus_tour_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS campus_tour_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/campus_tour)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/campus_tour
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(campus_tour_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/campus_tour)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/campus_tour
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(campus_tour_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/campus_tour)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/campus_tour
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(campus_tour_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/campus_tour)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/campus_tour
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(campus_tour_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/campus_tour)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/campus_tour\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/campus_tour
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(campus_tour_generate_messages_py std_msgs_generate_messages_py)
endif()
