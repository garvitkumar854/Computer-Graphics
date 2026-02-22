# Computer Graphics Assignments

A collection of Computer Graphics programming assignments covering fundamental algorithms and techniques in graphics rendering and geometric computations.

## Assignments Overview

### Assignment 02: Line & Point
**File:** [02_Line_Pont.cpp](02_Line_Pont.cpp)
- Basic implementation of line and point drawing techniques
- Fundamental graphics primitives

### Assignment 03: Third Parameter
**File:** [03_third_parameter.m](03_third_parameter.m)
- Exploration of third parameter in graphics operations
- MATLAB implementation

### Assignment 04: Square Line
**File:** [04_sqaure_line.cpp](04_sqaure_line.cpp)
- Drawing squares using line primitives
- Composite shape construction

### Assignment 05: Rectangle Line
**File:** [05_rectangle_line.cpp](05_rectangle_line.cpp)
- Rectangle drawing using line operations
- Shape rendering techniques

### Assignment 06: Triangle Line
**File:** [06_triangle_line.cpp](06_triangle_line.cpp)
- Triangle drawing implementation
- Polygon rendering basics

### Assignment 07: Putpixel
**File:** [07_putpixel.cpp](07_putpixel.cpp)
- Direct pixel manipulation
- Low-level graphics operations

### Assignment 08: DDA Algorithm
**File:** [08_DDA_Algorithm.cpp](08_DDA_Algorithm.cpp)
- Digital Differential Analyzer algorithm
- Line rasterization technique

### Assignment 09: Bresenham Algorithm
**File:** [09_Bresenham_Algorithm.cpp](09_Bresenham_Algorithm.cpp)
- Bresenham's line drawing algorithm
- Efficient integer-based line rasterization

### Assignment 10: Bresenham Circle Algorithm
**File:** [10_Bresenham_Circle_Algo.cpp](10_Bresenham_Circle_Algo.cpp)
- Bresenham's circle drawing algorithm
- Efficient circular arc generation

### Assignment 11: Circle Midpoint Algorithm
**File:** [11_Circle_midPoint_Algo.cpp](11_Circle_midPoint_Algo.cpp)
- Midpoint circle algorithm
- Symmetric circle generation

### Assignment 12: Rotating Ellipse
**File:** [12_Rotating_Ellipse.cpp](12_Rotating_Ellipse.cpp)
- Ellipse drawing with rotation
- Affine transformations

### Assignment 13: Moving Cycle
**File:** [13_Moving_Cycle.cpp](13_Moving_Cycle.cpp)
- Animation of moving circles
- Dynamic graphics rendering

### Assignment 14: Polynomial Least Squares
**File:** [14_Polynomial_Least_Algo.cpp](14_Polynomial_Least_Algo.cpp)
- Polynomial curve fitting using least squares method
- Gaussian elimination and back-substitution

### Assignment 15: Cohen-Sutherland Algorithm
**File:** [15_Cohen_Sutherland.cpp](15_Cohen_Sutherland.cpp)
- Cohen-Sutherland line clipping algorithm
- Viewport clipping implementation

### Assignment 16: Polygon Clipping
**File:** [16_Polygon_Clippng.cpp](16_Polygon_Clippng.cpp)
- Sutherland-Hodgman style polygon clipping
- Clipping against rectangular boundaries

### Assignment 17: Scaling
**File:** [17_Scaling.cpp](17_Scaling.cpp)
- 2D scaling transformation
- Object resizing using transformation factors

### Assignment 18: Rotation
**File:** [18_Rotation.cpp](18_Rotation.cpp)
- 2D rotation transformation
- Coordinate update using rotation matrix

### Assignment 19: Translation
**File:** [19_Translation.cpp](19_Translation.cpp)
- 2D translation transformation
- Position shifting by offset values

### Assignment 20: 2D Reflection
**File:** [20_2D_Reflection.cpp](20_2D_Reflection.cpp)
- Reflection in 2D space
- Mirror transformation of geometric objects

### Assignment 21: Reflection 1
**File:** [21_Reflection_1.cpp](21_Reflection_1.cpp)
- Reflection case study (variant 1)
- Axis-based geometric reflection

### Assignment 22: Reflection 2
**File:** [22_Reflection_2.cpp](22_Reflection_2.cpp)
- Reflection case study (variant 2)
- Extended reflection transformation example

## Prerequisites

- C++ compiler (MinGW/GCC)
- BGI (Basic Graphics Interface) library for graphics rendering
- Windows graphics libraries: gdi32, comdlg32, uuid, oleaut32, ole32

## Compilation

To compile any assignment:

```bash
g++ -g <filename>.cpp -o <output>.exe -lbgi -lgdi32 -lcomdlg32 -luuid -loleaut32 -lole32
```

Example:
```bash
g++ -g 08_DDA_Algorithm.cpp -o DDA.exe -lbgi -lgdi32 -lcomdlg32 -luuid -loleaut32 -lole32
```

## Topics Covered

- **Basic Graphics:** Points, lines, and shapes
- **Line Rasterization:** DDA, Bresenham algorithms
- **Circle Rasterization:** Bresenham and Midpoint algorithms
- **Transformations:** Scaling, rotation, translation, reflection
- **Curve Fitting:** Polynomial least squares approximation
- **Clipping:** Cohen-Sutherland and polygon clipping
- **Animation:** Dynamic object rendering

