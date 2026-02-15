#include <iostream>
#include <graphics.h>
#include <conio.h>

int main(){
    int gd = DETECT, gm;
    initgraph(&gd, &gm, (char*)"");

    putpixel(100, 100, RED); // A Single Point
    line(50, 50, 150, 150);  // A Line
    getch();
    closegraph();
    return 0;
}