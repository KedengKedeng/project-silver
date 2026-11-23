include(${CMAKE_SOURCE_DIR}/cmake_files/silver_module.cmake)

silver_add_module(core
    PUBLIC_DEPS silver::math
    PRIVATE_DEPS  
    PUBLIC_FILES
    PRIVATE_FILES 
)