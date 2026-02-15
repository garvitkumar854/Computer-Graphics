// Draw a Triangle using Graphics in C++
#include <graphics.h>
#include <conio.h>
#include <iostream>

int main()
{
    int gd = DETECT, gm;
    initgraph(&gd, &gm, char(0));

    // Draw a triangle using lines
    line(200, 100, 100, 250); // Base of the triangle
    line(100, 250, 300, 250); // Left side of the triangle
    line(300, 250, 200, 100); // Right side of the triangle

    getch();
    closegraph();
    return 0;
}