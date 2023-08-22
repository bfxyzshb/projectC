#include <iostream>
#include <zconf.h>
#include "test.h"
#include "dev_entern/dev.h"
extern "C"{
#include "Cbase/mmsetDev/memsetTest.h"
#include "Cbase//funcPointDev/funcPoint.h"
#include "Cbase//test/test.h"
}

struct Student {
    char name[41];
    int age:1000;
    unsigned score:100;
};
extern int a;
extern int b;

extern void dev();

extern int testFuncPointer(int a, int b);
extern void testFork();

using namespace std;

#define product(x,y) (x* \
                      y)

int main() {
    std::cout << "AHello, World!" << std::endl;
    int age = 19;
    int *p_age = &age;
    *p_age = 20;            //通过指针修改指向的内存数据
    int **p_age2 = &p_age;
    std::cout << "=====p_age2======\n" << std::endl;
    std::cout << &p_age << std::endl;
    std::cout << p_age2 << std::endl;


    std::cout << "===p_age:" << p_age << "===*p_age:" << *p_age << "===&p_age:" << &p_age << "====age:" << &age
              << std::endl;
    printf("age = %d\n", *p_age);    //通过指针读取指向的内存数据
    printf("age = %d\n", age);


//=============================================
    Student stu = {"Bob", 19, 98};
    printf("name:%s age:%d\n", stu.name, stu.age);
    Student *p_s0 = &stu;
    printf("name:%s age:%d score:%d\n", p_s0->name, p_s0->age, p_s0->score);
    /*p_s0->a=p_age;
    *p_age=100000;
    std::cout <<"------------"<< *p_s0->a <<"------"<<p_age << std::endl;*/
    std::cout << "--------" << sizeof(stu) << std::endl;
    Student *p_s = &stu;

    p_s->age = 20;
    p_s->score = 99.0;
    printf("name:%s age:%d\n", p_s->name, p_s->age);

    Student *stu1 = (Student *) malloc(sizeof(Student));
    printf(">>>>>>>>>name:%s age:%d\n", stu1->name, stu1->age);
    //=============================================
    char *str = "A Hello world";
    std::cout << "============" << std::endl;
    std::cout << &str << std::endl;        //输出的是str指针变量的地址
    std::cout << *str << std::endl; //输出的是str指针的值
    std::cout << (void *) str << std::endl; //输出的是str指针的值
    std::cout << static_cast<void *>(str) << std::endl;
    std::cout << str << std::endl;                 //输出的是字符串str
    char *s = "abcd"; //合法
    std::cout << *(s + 1) << std::endl;
    cout << *(s + 1) << endl;

    int tmp = max(1, 2000);
    printf("%d\n", tmp);
    printf("%d\n", a);
    printf("%d\n", b);
    b = 333;
    dev();
    getDev();
    //函数指针
    testFuncPointer(100,200);
    //宏定义
    printf("%d\n", product(2,2)+product(2,2));
    //pause();
    testFork();
    testCbase();
    testFuncPoint();
    test();
    return 0;
}
