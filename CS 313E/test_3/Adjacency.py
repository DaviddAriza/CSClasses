#  File: Adjacency.py
#  Description: Converts an edge list into an adjacency matrix
#  Student Name: David Ariza
#  Student UT EID: jda3867
#  Course Name: CS 313E
#  Unique Number: 52590

def edge_to_adjacency(edge_list):
# Add Your code here!
    nodes = set()
	# Add source and destination node labels to the set
    for edge in edge_list:
        nodes.add(edge[0])
        nodes.add(edge[1])
	# Convert the set to a sorted list
    nodes = sorted(list(nodes))
	# Create an empty adjacency matrix of the appropriate size
    matrix_size = len(nodes)
    matrix = [[0] * matrix_size for _ in range(matrix_size)]
	# Fill in the adjacency matrix with edge weights
    for edge in edge_list:
        src, dest, weight = edge
        row = nodes.index(src)
        col = nodes.index(dest)
        matrix[row][col] = weight
    return matrix

# ------ DO NOT CHANGE BELOW HERE ------ #
import ast

def main():
    matrix = edge_to_adjacency(ast.literal_eval(input()))

    print('\n'.join([' '.join([str(cell) for cell in row]) for row in matrix]))

if __name__ == "__main__":
    main()
