#include<iostream.h>
#include<graphics.h>
#include<conio.h>

int main(){
    int gd = DETECT, gm;
    initgraph(&gd, &gm, char(*)"");
    line(100, 100, 200, 100);   // Top Side
    line(200, 100, 200, 200);   // Right Side
    line(200, 200, 100, 200);   // Bottom Side
    line(100, 200, 100, 100);   // Left Side

    getch();
    closegraph();
    return 0;
}