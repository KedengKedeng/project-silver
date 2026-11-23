include_guard(GLOBAL)

function(silver_add_module NAME)
    cmake_parse_arguments(PARSE_ARGV 1 ARG
        "" 
        ""
        "PUBLIC_DEPS;PRIVATE_DEPS;PUBLIC_FILES;PRIVATE_FILES"
    )

    # Anything in PRIVATE_FILES that is a source file decides the library kind
    set(sources ${ARG_PRIVATE_FILES})
    list(FILTER sources INCLUDE REGEX "\\.(c|cc|cpp|cxx)$")

    if(sources)
        add_library(${NAME} STATIC)
        set(scope PUBLIC)
    else()
        add_library(${NAME} INTERFACE)   # headers only
        set(scope INTERFACE)
    endif()
    add_library(silver::${NAME} ALIAS ${NAME})

    # Public headers: they define the include path consumers see
    if(ARG_PUBLIC_FILES)
        target_sources(${NAME}
            ${scope}
                FILE_SET HEADERS
                BASE_DIRS inc
                FILES ${ARG_PUBLIC_FILES}
        )
    endif()

    # Private sources and private headers
    if(ARG_PRIVATE_FILES)
        if(NOT scope STREQUAL "INTERFACE")
            target_sources(${NAME} PRIVATE ${ARG_PRIVATE_FILES})
            target_include_directories(${NAME} PRIVATE src)
        endif()
    endif()

    target_compile_features(${NAME} ${scope} cxx_std_23)

    set_target_properties(${NAME} PROPERTIES
        CXX_STANDARD_REQUIRED ON
        CXX_EXTENSIONS OFF
    )

    # Stricter warnings, if you don't already set these globally
    target_compile_options(${NAME} INTERFACE
        $<$<CXX_COMPILER_ID:MSVC>:/W4>
        $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Wall -Wextra -Wpedantic>
    )

    if(ARG_PUBLIC_DEPS)
        target_link_libraries(${NAME} ${scope} ${ARG_PUBLIC_DEPS})
    endif()
    if(ARG_PRIVATE_DEPS AND NOT scope STREQUAL "INTERFACE")
        target_link_libraries(${NAME} PRIVATE ${ARG_PRIVATE_DEPS})
    endif()

    if(ARG_PCH AND NOT scope STREQUAL "INTERFACE")
        target_precompile_headers(${NAME} PRIVATE ${ARG_PCH})
    endif()
endfunction()