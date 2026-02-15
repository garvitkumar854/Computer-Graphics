#include <iostream>
#include <graphics.h>
#include <conio.h>
int main()
{
    int gd = DETECT, gm;
    initgraph(&gd, &gm, (char *)"");

    // Draw rectangle using line()
    line(100, 100, 300, 100); // Top line
    line(300, 100, 300, 200); // Right line
    line(300, 200, 100, 200); // Bottom line
    line(100, 200, 100, 100); // Left line

    getch();
    closegraph();

    return 0;
}
