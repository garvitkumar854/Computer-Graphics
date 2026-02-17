// 2D Reflection
#include <iostream>
#include <graphics.h>
using namespace std;

int main() {
    int gd = DETECT, gm;
    initgraph(&gd, &gm, (char*)"");

    int n, choice;

    cout << "Enter number of vertices: ";
    cin >> n;

    int x[20], y[20];

    cout << "Enter coordinates (x y):\n";
    for (int i = 0; i < n; i++) {
        cin >> x[i] >> y[i];
    }

    // Draw Original Polygon
    setcolor(WHITE);
    for (int i = 0; i < n; i++) {
        line(x[i], y[i], x[(i+1)%n], y[(i+1)%n]);
    }

    cout << "\nReflection Options:";
    cout << "\n1. About X-axis";
    cout << "\n2. About Y-axis";
    cout << "\n3. About Origin";
    cout << "\n4. About line y = x";
    cout << "\nEnter choice: ";
    cin >> choice;

    int xr[20], yr[20];

    // Screen center (for axis reference)
    int midx = getmaxx() / 2;
    int midy = getmaxy() / 2;

    // Draw axes
    setcolor(YELLOW);
    line(0, midy, getmaxx(), midy);   // X-axis
    line(midx, 0, midx, getmaxy());   // Y-axis

    // Apply reflection
    for (int i = 0; i < n; i++) {
        int x1 = x[i] - midx;
        int y1 = midy - y[i];

        int x2, y2;

        switch(choice) {
            case 1: // X-axis
                x2 = x1;
                y2 = -y1;
                break;

            case 2: // Y-axis
                x2 = -x1;
                y2 = y1;
                break;

            case 3: // Origin
                x2 = -x1;
                y2 = -y1;
                break;

            case 4: // y = x
                x2 = y1;
                y2 = x1;
                break;

            default:
                cout << "Invalid choice";
                closegraph();
                return 0;
        }

        xr[i] = midx + x2;
        yr[i] = midy - y2;
    }

    // Draw Reflected Polygon
    setcolor(RED);
    for (int i = 0; i < n; i++) {
        line(xr[i], yr[i], xr[(i+1)%n], yr[(i+1)%n]);
    }

    // Labels
    setcolor(WHITE);
    outtextxy(10, 10, (char*)"Original: WHITE");
    outtextxy(10, 30, (char*)"Reflected: RED");

    getch();
    closegraph();
    return 0;
}