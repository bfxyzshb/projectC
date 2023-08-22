//
// Created by hebiao1 on 2023/8/22.
//

#include "funcPoint.h"
# include <stdio.h>
# include <string.h>


void add(int x,int y){
    printf("testFuncPoint======>x+y=%d",x+y);
}

int add1(int x,int y){
    return x+y;
}

void testFuncPoint(){
    printf("======================================testFuncPoint====================================================\n");
    Func f =add;
    f(1,2);
    Func1 = add1;
    int res = Func1(100,200);
    printf("testFuncPoint======>x+y=%d\n",res);
}
