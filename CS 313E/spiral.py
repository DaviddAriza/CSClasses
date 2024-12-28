"""
  File: spiral.py
  Description:

  Student Name: Benjamin Ye
  Student UT EID: by3768

  Partner Name: David Ariza
  Partner UT EID: jda3867

  Course Name: CS 313E
  Unique Number: 
  Date Created: 08/22/2023
  Date Last Modified:

 Input: n is an odd integer between 1 and 100
 Output: returns a 2-D list representing a spiral
         if n is even add one to n

def create_spiral(n):
    print("REMOVE THIS PRINT AND ADD YOUR CODE")
    
 Input: spiral is a 2-D list and n is an integer
 Output: returns an integer that is the sum of the
         numbers adjacent to n in the spiral
         if n is outside the range return 0
def sum_adjacent_numbers(spiral, n):
    print("REMOVE THIS PRINT AND ADD YOUR CODE")
"""
import math


def create_spiral(dim):
  """Creates a Spiral given a dimension for the spiral dimeter"""
  lst = [[0 for _ in range(dim)] for _ in range(dim)]
  row = dim // 2
  col = dim // 2
  lst[row][col] = 1
  num = 2
  #Sets the center to 1, starting num is 2
  tracker = 0
  #repeats for each sqr circle excluding center
  for _ in range(dim // 2):
    #Logic behind sqr is that each circle increases by 8
    #Each line moves by 2 more than previous square
    tracker += 2
    #Moves to the right and add to list
    col += 1
    lst[row][col] = num
    num += 1
    #Moves downward by 1 less since its already added
    for _ in range(tracker - 1):
      row += 1
      lst[row][col] = num
      num += 1
    #Moves Left, then up then right by val of Tracker
    for _ in range(tracker):
      col -= 1
      lst[row][col] = num
      num += 1
    for _ in range(tracker):
      row -= 1
      lst[row][col] = num
      num += 1
    for _ in range(tracker):
      col += 1
      lst[row][col] = num
      num += 1

  return lst


def sum_sub_grid(grid, val):
  """
    Input: grid a 2-D list containing a spiral of numbers
           val is a number within the range of numbers in
           the grid
    Output:
    sum_sub_grid returns the sum of the numbers (including val)
    surrounding the parameter val in the grid
    if val is out of bounds, returns 0
    """
  maxval = len(grid)
  sum = 0
  if val > (len(grid)**2):
    return 0
  else:
    for row, col in enumerate(grid):
      if val in col:
        rpos = row
        cpos = col.index(val)
        if rpos == 0:
          if cpos == 0:
            sum = grid[rpos+1][cpos]+grid[rpos+1][cpos+1]+grid[rpos][cpos+1]
          elif cpos == maxval-1:
            sum = grid[rpos+1][cpos]+grid[rpos+1][cpos-1]+grid[rpos][cpos-1]
          else:
            sum = grid[rpos+1][cpos]+grid[rpos+1][cpos-1]+grid[rpos+1][cpos+1]+grid[rpos][cpos-1]+grid[rpos][cpos+1]
        if 0>rpos>maxval-1:
          if cpos == 0:
            sum = grid[rpos][cpos+1]+grid[rpos+1][cpos+1]+grid[rpos+1][cpos+1]+grid[rpos-1][cpos+1]+grid[rpos-1][cpos]
          elif cpos == maxval-1:
            sum = grid[rpos+1][cpos]+grid[rpos+1][cpos-1]+grid[rpos][cpos-1]+grid[rpos-1][cpos-1]+grid[rpos-1][cpos]
          else:
            cpos +=1
            sum = grid[rpos][cpos]
            for _ in range(1):
              rpos +=1
              sum +=grid[rpos][cpos]
            for _ in range(2):
              cpos -=1
              sum +=grid[rpos][cpos]
            for _ in range(2):
              rpos -=1
              sum +=grid[rpos][cpos]
            for _ in range(2):
              cpos +=1
              sum +=grid[rpos][cpos]
        if rpos == maxval-1:
          if cpos == 0:
            sum = grid[rpos-1][cpos]+grid[rpos][cpos+1]+grid[rpos-1][cpos+1]
          elif cpos == maxval-1:
            sum = grid[rpos][cpos-1]+grid[rpos-1][cpos-1]+grid[rpos-1][cpos]
          else:
            sum =grid[rpos-1][cpos]+grid[rpos-1][cpos+1]+grid[rpos-1][cpos-1]+grid[rpos][cpos+1]+grid[rpos][cpos-1]
          
          
  return sum


def main():
  """
    A Main Function to read the data from input,
    run the program and print to the standard output.
    """

  # read the dimension of the grid and value from input file
  dim = int(input())

  # test that dimension is odd
  if dim % 2 == 0:
    dim += 1

  # create a 2-D list representing the spiral
  mat = create_spiral(dim)

  while True:
    try:
      sum_val = int(input())

      # find sum of adjacent terms
      adj_sum = sum_sub_grid(mat, sum_val)

      # print the sum
      print(adj_sum)
    except EOFError:
      break


if __name__ == "__main__":
  main()