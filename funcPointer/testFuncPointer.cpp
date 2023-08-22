//
// Created by hebiao1 on 2023/8/8.
//
#include <cstdio>
#include "funcPointer.h"

extern pf f;

void testFuncPointer(int a,int b) {
    int res = f(a, b);
    printf("======testFuncPointer===%d\n",res);
}

