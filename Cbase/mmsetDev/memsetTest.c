/*
 * memset是一个初始化函数，作用是将某一块内存中的全部设置为指定的值。
 * void *memset(void *s, int c, size_t n);
 *s指向要填充的内存块。
 *c是要被设置的值。
 *n是要被设置该值的字符数。
 *返回类型是一个指向存储区s的指针。
 *
 * */
# include <stdio.h>
# include <string.h>

void testChar() {
    char a[4];
    memset(a, '1', 4);
    for (int i = 0; i < 4; i++) {
        printf("%s",a[i]);
    }
}

void testChar1(){
    int i;  //循环变量
    char str[10];
    char *p = str;
    memset(str, '\0', sizeof(str));  //只能写sizeof(str), 不能写sizeof(p)
    for (i=0; i<10; ++i)
    {
        printf("%s", str[i]);
    }
    printf("\n");
}

void testCbase() {
    printf("======================================mmset====test====================================================\n");
    //testChar();
    testChar1();
}


