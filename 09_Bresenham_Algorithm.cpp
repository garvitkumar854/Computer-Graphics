// Bresenham Algorithm
#include <iostream>
#include <graphics.h>
#include <conio.h>
using namespace std;

int main(){
    int gd = DETECT, gm;
    initgraph(&gd, &gm, char(0));
    int x1 = 100, y1 = 100, x2 = 300, y2 = 180;

    int dx = x2 - x1;
    int dy = y2 - y1;
    
    int p = 2 * dy - dx;
    int x = x1, y = y1;

    putpixel(x, y, WHITE);
    while(x < x2){
        x++;
        if(p < 0){
            p += 2 * dy;
        } else {
            y++;
            p += 2 * (dy - dx);
        }
        putpixel(x, y, WHITE);
    }

    getch();
    closegraph();
    return 0;
}