// DDA Alogrithm
#include <iostream>
#include <graphics.h>
#include <math.h>
#include <conio.h>
using namespace std;

int main(){
    int gd = DETECT, gm;
    initgraph(&gd, &gm, char());

    int x1 = 100, y1 = 100; // Starting point
    int x2 = 300, y2 = 200; // Ending point

    int dx = x2 - x1;
    int dy = y2 - y1;

    float steps = max(abs(dx), abs(dy)); // Number of steps needed

    float xInc = dx / steps;
    float yInc = dy / steps;

    float x = x1;
    float y = y1;

    for (int i = 0; i <= steps; ++i) {
        putpixel(round(x), round(y), RED); // Draw pixel at the current position
        x += xInc; // Increment x
        y += yInc; // Increment y
    }

    getch();
    closegraph();
    return 0;
}