// Circle Mid Point Algorithm
#include <iostream>
#include <graphics.h>
#include <math.h>
#include <conio.h>

void drawCircle(int xc, int yc, int x, int y){
    putpixel(xc + x, yc + y, WHITE);
    putpixel(xc - x, yc + y, WHITE);
    putpixel(xc + x, yc - y, WHITE);
    putpixel(xc - x, yc - y, WHITE);
    putpixel(xc + y, yc + x, WHITE);
    putpixel(xc - y, yc + x, WHITE);
    putpixel(xc + y, yc - x, WHITE);
    putpixel(xc - y, yc - x, WHITE);
}

int main(){
    int gd = DETECT, gm;
    initgraph(&gd, &gm, char(0));
    int xx = 250, yc = 250, r = 100;
    int x = 0, y = r;
    int p = 1 - r;

    while (x < y){
        drawCircle(xx, yc, x, y);
        if (p < 0){
            p = p + 2 * x + 3;
        }
        else{
            p = p + 2 * (x - y) + 5;
            y--;
        }
        x++;
    }
    getch();
    closegraph();
}
