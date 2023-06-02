```tx
project_name/
├── include/
│   ├── project_name/
│   │   ├── library_name_1.hpp
│   │   ├── library_name_2.hpp
│   │   ├── ...
│   ├── external_library_name_1.hpp
│   ├── external_library_name_2.hpp
│   ├── ...
├── src/
│   ├── main.cpp
│   ├── library_name_1.cpp
│   ├── library_name_2.cpp
│   ├── ...
├── tests/
│   ├── test_library_name_1.cpp
│   ├── test_library_name_2.cpp
│   ├── ...
├── CMakeLists.txt
├── README.md
```

```bash
PROJECT_NAME="my_prj"
mkdir -p "$PROJECT_NAME"
mkdir "$PROJECT_NAME/include"
mkdir "$PROJECT_NAME/src"
mkdir "$PROJECT_NAME/tests"
touch CMakeLists.txt
touch README.md
```

```cmake
cmake_minimum_required(VERSION 3.10)

# Define the project name
set(PROJECT_NAME my_project)

project(${PROJECT_NAME})

# Set C++ standard to C++17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Generate header files from source files
execute_process(
    COMMAND ${PYTHON_EXECUTABLE} generate_header.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
)

# Include directories
include_directories(include)

# Find external libraries (e.g. Boost)
find_package(Boost REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})

# Add all source files
file(GLOB SOURCES "src/*.cpp")

# Create an executable
add_executable(${PROJECT_NAME} ${SOURCES})

# Link external libraries (e.g. Boost)
target_link_libraries(${PROJECT_NAME} ${Boost_LIBRARIES})
```
