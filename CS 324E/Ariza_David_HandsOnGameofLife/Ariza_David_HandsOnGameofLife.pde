int cols, rows;     // Number of columns and rows in the grid
int resolution = 10; // Size of each cell (grid resolution)
int[][] grid;       // Stores the current state of the grid
int[][] next;       // Stores the next generation

void setup() {
  size(800, 800);
  frameRate(30);
  cols = width / resolution;
  rows = height / resolution;

  grid = new int[cols][rows];
  next = new int[cols][rows];

  // Randomly initialize the grid
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = int(random(2));  // Randomly 0 or 1
    }
  }
}

void draw() {
  background(0);  // Clear the background

  // Display the current grid
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (grid[i][j] == 1) {
        fill(255);   // Live cell: White
      } else {
        fill(0);     // Dead cell: Black
      }
      stroke(50);    // Gridline color
      rect(i * resolution, j * resolution, resolution, resolution);
    }
  }

  // Calculate the next generation
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int state = grid[i][j];
      int neighbors = countNeighbors(grid, i, j);

      // Game of Life rules
      if (state == 0 && neighbors == 3) {
        next[i][j] = 1;  // Birth: Dead cell with 3 neighbors becomes alive
      } else if (state == 1 && (neighbors < 2 || neighbors > 3)) {
        next[i][j] = 0;  // Death: Over/underpopulation
      } else {
        next[i][j] = state;  // Stays the same
      }
    }
  }

  // Swap the current grid with the next generation
  int[][] temp = grid;
  grid = next;
  next = temp;
}

// Count the live neighbors of a cell
int countNeighbors(int[][] grid, int x, int y) {
  int sum = 0;
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      int col = (x + i + cols) % cols;
      int row = (y + j + rows) % rows;
      sum += grid[col][row];
    }
  }
  sum -= grid[x][y];  // Subtract the cell itself from the count
  return sum;
}
