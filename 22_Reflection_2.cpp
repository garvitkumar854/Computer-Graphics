// Reflection (y=mx+c)
#include <iostream>
#include <graphics.h>
#include <math.h>
using namespace std;

int main() {
    int gd = DETECT, gm;
    initgraph(&gd, &gm, (char*)"");

    int n;
    cout << "Enter number of vertices: ";
    cin >> n;

    float x[20], y[20];

    cout << "Enter coordinates (x y):\n";
    for (int i = 0; i < n; i++) {
        cin >> x[i] >> y[i];
    }

    float m, c;
    cout << "Enter m and c of line y = mx + c: ";
    cin >> m >> c;

    int midx = getmaxx()/2;
    int midy = getmaxy()/2;

    // Draw axes
    setcolor(YELLOW);
    line(0, midy, getmaxx(), midy);
    line(midx, 0, midx, getmaxy());

    // Draw arbitrary line
    setcolor(CYAN);
    line(0, midy - c, getmaxx(), midy - (m*getmaxx() + c));

    // Draw original polygon
    setcolor(WHITE);
    for (int i = 0; i < n; i++) {
        line(x[i], y[i], x[(i+1)%n], y[(i+1)%n]);
    }

    // Angle of line
    float theta = atan(m);
    float cos2t = cos(2*theta);
    float sin2t = sin(2*theta);

    float xr[20], yr[20];

    for (int i = 0; i < n; i++) {

        // Shift to Cartesian origin
        float x1 = x[i] - midx;
        float y1 = midy - y[i];

        // Translate line to origin (remove c)
        y1 = y1 - c;

        // Apply reflection
        float x2 = x1*cos2t + y1*sin2t;
        float y2 = x1*sin2t - y1*cos2t;

        // Reverse translation
        y2 = y2 + c;

        // Convert back to screen
        xr[i] = midx + x2;
        yr[i] = midy - y2;
    }

    // Draw reflected polygon
    setcolor(RED);
    for (int i = 0; i < n; i++) {
        line(xr[i], yr[i], xr[(i+1)%n], yr[(i+1)%n]);
    }

    // Labels
    setcolor(WHITE);
    outtextxy(10,10,(char*)"Original : WHITE");
    outtextxy(10,30,(char*)"Reflected : RED");

    getch();
    closegraph();
    return 0;
}