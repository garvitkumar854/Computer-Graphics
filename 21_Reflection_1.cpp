// Reflection Formula (y = −x)

#include <iostream>
#include <graphics.h>
using namespace std;

int main() {
    int gd = DETECT, gm;
    initgraph(&gd, &gm, (char*)"");

    int n;
    cout << "Enter number of vertices: ";
    cin >> n;

    int x[20], y[20];

    cout << "Enter coordinates (x y):\n";
    for (int i = 0; i < n; i++) {
        cin >> x[i] >> y[i];
    }

    // Screen center
    int midx = getmaxx() / 2;
    int midy = getmaxy() / 2;

    // Draw axes
    setcolor(YELLOW);
    line(0, midy, getmaxx(), midy);   // X-axis
    line(midx, 0, midx, getmaxy());   // Y-axis

    // Draw line y = -x
    setcolor(CYAN);
    line(0, midy + midx, getmaxx(), midy - midx);

    // Draw original polygon
    setcolor(WHITE);
    for (int i = 0; i < n; i++) {
        line(x[i], y[i], x[(i+1)%n], y[(i+1)%n]);
    }

    // Reflection about y = -x
    int xr[20], yr[20];

    for (int i = 0; i < n; i++) {

        // Shift origin to center
        int x1 = x[i] - midx;
        int y1 = midy - y[i];

        // Apply reflection (x, y) → (-y, -x)
        int x2 = -y1;
        int y2 = -x1;

        // Shift back to screen coordinates
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
    outtextxy(10, 10, (char*)"Original: WHITE");
    outtextxy(10, 30, (char*)"Reflected about y=-x: RED");

    getch();
    closegraph();
    return 0;
}