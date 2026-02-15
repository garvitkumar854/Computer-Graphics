// Demonstrate the putpixel() function.
#include <iostream>
#include <graphics.h>
#include <conio.h>

int main() {
    int gd = DETECT, gm;
    initgraph(&gd, &gm, char());

    setcolor(RED);

    for (int i = 100; i <= 200; ++i) {
        putpixel(i, 150, RED); // Draw a pixel at (i, 150) with RED color
    }

    getch();
    closegraph();
    return 0;
}