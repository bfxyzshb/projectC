cmake_minimum_required(VERSION 3.15)
project(projectC)

set(CMAKE_CXX_STANDARD 14)

include_directories(Cbase/funcPointDev)
include_directories(Cbase/mmsetDev)
include_directories(Cbase/test)
include_directories(dev_entern)
include_directories(funcPointer)
include_directories(make)

add_executable(projectC
        Cbase/funcPointDev/funcPoint.c
        Cbase/funcPointDev/funcPoint.h
        Cbase/mmsetDev/memsetTest.c
        Cbase/mmsetDev/memsetTest.h
        Cbase/test/test.c
        Cbase/test/test.h
        defineTest/defineTest.cpp
        dev_entern/dev.cpp
        dev_entern/dev.h
        forkTest/forkTest.cpp
        funcPointer/funcPointer.cpp
        funcPointer/funcPointer.h
        funcPointer/testFuncPointer.cpp
        make/test/test.c
        make/a.c
        make/a.h
        make/b.c
        make/foo.c
        make/foo.h
        make/main.c
        main.cpp)
