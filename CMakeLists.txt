cmake_minimum_required(VERSION 3.23...4.2.3)

option(BUILD_SHARED_LIBS "Build using shared libraries" OFF)

set(SILVER_VERSION_MAJOR 0)
set(SILVER_VERSION_MINOR 0)
set(SILVER_VERSION_PATCH 1)
set(SILVER_VERSION ${SILVER_VERSION_MAJOR}.${SILVER_VERSION_MINOR}.${SILVER_VERSION_PATCH})

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

set(BUILD_SHARED_LIBS OFF CACHE BOOL "Don't build shared libs" FORCE)

project(silver VERSION ${SILVER_VERSION} LANGUAGES C CXX)

if(MSVC)
    add_compile_options(/MP)
endif(MSVC)

add_subdirectory(third_party EXCLUDE_FROM_ALL)
add_subdirectory(core)
add_subdirectory(graphics)
add_subdirectory(silver)