// Bresenham Circle Algorithm
#include <iostream>
#include <graphics.h>
#include <conio.h>

void drawCircle(int xc, int yc, int x, int y) {
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

    int xc=250, yc=250, r=100;
    int x = 0, y = r;
    int p = 3 - 2 * r;
    
    drawCircle(xc, yc, x, y);

    while(x < y){
        if(p < 0){
            p += 4 * x + 6;
        } else {
            p += 4 * (x - y) + 10;
            y--;
        }
        x++;
        drawCircle(xc, yc, x, y);
    }

    getch();
    closegraph();
}