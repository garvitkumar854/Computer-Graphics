// Polygon Clipping
#include <iostream>
#include <graphics.h>

using namespace std;

#define MAX 20
// Clipping window
int xmin = 150, ymin = 150, xmax = 450, ymax = 350;
// Structure for point
struct Point{
    float x;
    float y;
};

// Function to check inside for each boundary
int insideLeft(Point p)   { return p.x >= xmin; }
int insideRight(Point p)  { return p.x <= xmax; }
int insideBottom(Point p) { return p.y >= ymin; }
int insideTop(Point p)    { return p.y <= ymax; }

// Intersection functions
Point intersectLeft(Point p1, Point p2){
    Point p;
    p.x = xmin;
    p.y = p1.y + (p2.y - p1.y) * (xmin - p1.x) / (p2.x - p1.x);
    return p;
}

Point intersectRight(Point p1, Point p2){
    Point p;
    p.x = xmax;
    p.y = p1.y + (p2.y - p1.y) * (xmax - p1.x) / (p2.x - p1.x);
    return p;
}

Point intersectBottom(Point p1, Point p2){
    Point p;
    p.y = ymin;
    p.x = p1.x + (p2.x - p1.x) * (ymin - p1.y) / (p2.y - p1.y);
    return p;
}

Point intersectTop(Point p1, Point p2){
    Point p;
    p.y = ymax;
    p.x = p1.x + (p2.x - p1.x) * (ymax - p1.y) / (p2.y - p1.y);
    return p;
}

// Clipping against one boundary
int clip(Point in[], int n, Point out[],
         int (*inside)(Point),
         Point (*intersect)(Point, Point)){
    int k = 0;
    for (int i = 0; i < n; i++){
        Point current = in[i];
        Point prev = in[(i + n - 1) % n];
        int currIn = inside(current);
        int prevIn = inside(prev);
        if (currIn){
            if (!prevIn)
                out[k++] = intersect(prev, current);
            out[k++] = current;
        }
        else if (prevIn){
            out[k++] = intersect(prev, current);
        }
    }
    return k;
}

int main(){ 
    int gd = DETECT, gm;
    initgraph(&gd, &gm, char(0));

    // Draw clipping window
    setcolor(WHITE);
    rectangle(xmin, ymin, xmax, ymax);

    // Input polygon
    Point poly[MAX], temp1[MAX], temp2[MAX];
    int n;
    cout << "Enter number of vertices: ";
    cin >> n;
    cout << "Enter polygon coordinates:\n";
    for (int i = 0; i < n; i++)
        cin >> poly[i].x >> poly[i].y;

    // Draw original polygon
    setcolor(YELLOW);
    for (int i = 0; i < n; i++)
        line(poly[i].x, poly[i].y,
             poly[(i+1)%n].x, poly[(i+1)%n].y);

    // Clipping steps
    int n1 = clip(poly, n, temp1, insideLeft, intersectLeft);
    int n2 = clip(temp1, n1, temp2, insideRight, intersectRight);
    int n3 = clip(temp2, n2, temp1, insideBottom, intersectBottom);
    int n4 = clip(temp1, n3, temp2, insideTop, intersectTop);

    // Draw clipped polygon
    setcolor(RED);
    for (int i = 0; i < n4; i++)
        line(temp2[i].x, temp2[i].y,
             temp2[(i+1)%n4].x, temp2[(i+1)%n4].y);
             
    getch();
    closegraph();
    return 0;
}
