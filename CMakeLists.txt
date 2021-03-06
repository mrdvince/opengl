cmake_minimum_required(VERSION 3.2)
project(learn_opengl)

include(FetchContent)


set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(FETCHCONTENT_QUIET FALSE)

# glfw
set(GLFW_BUILD_DOCS FALSE)
set(GLFW_BUILD_EXAMPLES FALSE)
set(GLFW_BUILD_TESTS FALSE)

FetchContent_Declare( glfw
                      GIT_REPOSITORY https://github.com/glfw/glfw.git
                      GIT_TAG 3.3.4
                      GIT_PROGRESS TRUE
)
# glad
FetchContent_Declare( glad
                      GIT_REPOSITORY https://github.com/Dav1dde/glad
                      GIT_TAG v0.1.34
                      GIT_PROGRESS TRUE
)

# fetch dependencies
FetchContent_MakeAvailable(glfw glad)

set(PROJECT_SOURCES src/main.cpp
)

add_executable(${PROJECT_NAME} ${PROJECT_SOURCES})

add_dependencies(${PROJECT_NAME} glfw glad)

target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_libraries(${PROJECT_NAME} PRIVATE glfw glad)
