#include <graphics.h>
#include <iostream>
using namespace std;

// Region codes
const int INSIDE = 0;
const int LEFT   = 1;
const int RIGHT  = 2;
const int BOTTOM = 4;
const int TOP    = 8;

// Clipping window
int xmin = 100, ymin = 100, xmax = 400, ymax = 300;

// Compute region code
int computeCode(double x, double y)
{
    int code = INSIDE;

    if (x < xmin)       code |= LEFT;
    else if (x > xmax)  code |= RIGHT;

    if (y < ymin)       code |= BOTTOM;
    else if (y > ymax)  code |= TOP;

    return code;
}

// Cohen–Sutherland function
void cohenSutherlandClip(double x1, double y1, double x2, double y2)
{
    int code1 = computeCode(x1, y1);
    int code2 = computeCode(x2, y2);

    bool accept = false;

    while (true)
    {
        if ((code1 == 0) && (code2 == 0))
        {
            accept = true;
            break;
        }
        else if (code1 & code2)
        {
            break;
        }
        else
        {
            double x, y;
            int code_out = code1 ? code1 : code2;

            if (code_out & TOP)
            {
                x = x1 + (x2 - x1) * (ymax - y1) / (y2 - y1);
                y = ymax;
            }
            else if (code_out & BOTTOM)
            {
                x = x1 + (x2 - x1) * (ymin - y1) / (y2 - y1);
                y = ymin;
            }
            else if (code_out & RIGHT)
            {
                y = y1 + (y2 - y1) * (xmax - x1) / (x2 - x1);
                x = xmax;
            }
            else if (code_out & LEFT)
            {
                y = y1 + (y2 - y1) * (xmin - x1) / (x2 - x1);
                x = xmin;
            }

            if (code_out == code1)
            {
                x1 = x;
                y1 = y;
                code1 = computeCode(x1, y1);
            }
            else
            {
                x2 = x;
                y2 = y;
                code2 = computeCode(x2, y2);
            }
        }
    }

    if (accept)
    {
        setcolor(RED);
        line(x1, y1, x2, y2);   // Clipped line
    }
}

int main()
{
    int gd = DETECT, gm;

    initgraph(&gd, &gm, (char*)"");

    // Draw clipping window
    setcolor(WHITE);
    rectangle(xmin, ymin, xmax, ymax);

    // Input line
    double x1, y1, x2, y2;
    cout << "Enter line coordinates (x1 y1 x2 y2): ";
    cin >> x1 >> y1 >> x2 >> y2;

    // Draw original line
    setcolor(YELLOW);
    line(x1, y1, x2, y2);

    // Perform clipping
    cohenSutherlandClip(x1, y1, x2, y2);

    getch();
    closegraph();
    return 0;
}