"""
Benjamin Ye
David Ariza
CS 313E Term Project

This code calculates and stores matrix in a BST
"""
import numpy as np


class TreeNode:
    def __init__(self, key, matrix):
        self.key = key
        self.matrix = matrix
        self.left = None
        self.right = None


class BinarySearchTree:
    def __init__(self):
        self.root = None

    """Insert matrix into BST base on it's determinant"""
    def insert(self, key, matrix):
        if self.root is None:
            self.root = TreeNode(key, matrix)
        else:
            self.insert_helper(self.root, key, matrix)

    def insert_helper(self, node, key, matrix):
        if key < node.key:
            if node.left is None:
                node.left = TreeNode(key, matrix)
            else:
                self.insert_helper(node.left, key, matrix)
        else:
            if node.right is None:
                node.right = TreeNode(key, matrix)
            else:
                self.insert_helper(node.right, key, matrix)


    def find(self, key):
        """Find an matrix base on the determinant"""
        return self.find_helper(self.root, key)

    def find_helper(self, node, key):
        if node is None:
            return None
        elif key == node.key:
            return node.matrix
        elif key < node.key:
            return self.find_helper(node.left, key)
        else:
            return self.find_helper(node.right, key)


    def display_level_order(self):
        """Display BST per level based on determinant"""
        if not self.root:
            return "The tree is empty"

        queue = [self.root]
        result = ""
        while queue:
            current = queue.pop(0)
            result += f'Key: {current.key}, Matrix: {current.matrix}\n'
            if current.left:
                queue.append(current.left)
            if current.right:
                queue.append(current.right)

        return result


class LinearAlgebra:
    """
    A class for solving linear algebra problems.
    """

    def __init__(self):
        self.matrix_tree = BinarySearchTree()

    def add_matrix(self, matrix):
        """
        Adds a matrix to the binary search tree, keyed by its determinant.
        """
        det = self.determinant(matrix)
        self.matrix_tree.insert(det, matrix)

    def find_matrix_by_determinant(self, determinant):
        """
        Finds a matrix in the binary search tree with the given determinant.
        """
        return self.matrix_tree.find(determinant)

    def solve_linear_equations(self, A, b):
        """
        Solves a system of linear equations Ax = b.
        """
        A = np.array(A)
        b = np.array(b)

        try:
            x = np.linalg.solve(A, b)
            return x
        except np.linalg.LinAlgError:
            return "The system cannot be solved."

    def matrix_operations(self, mat1, mat2, operation):
        """
        Performs basic matrix operations: addition, subtraction, and multiplication using nested loops.
        """
        mat1 = np.array(mat1)
        mat2 = np.array(mat2)

        if operation == 'add':
            return np.add(mat1, mat2)
        elif operation == 'subtract':
            return np.subtract(mat1, mat2)
        elif operation == 'multiply':
            return np.dot(mat1, mat2)
        else:
            return "Invalid operation"

    def determinant(self, matrix):
        """
        Calculates the determinant of a matrix using a recursive approach and rounds the result.
        """
        if len(matrix) == 0:
            raise ValueError("Empty matrix has no determinant.")

        if len(matrix) == 1:
            return matrix[0][0]

        if len(matrix) == 2:
            return matrix[0][0]*matrix[1][1] - matrix[0][1]*matrix[1][0]

        det = 0
        for c in range(len(matrix)):
            det += ((-1)**c) * matrix[0][c] * self.determinant(self.det_helper(matrix, 0, c))

        return det

    def det_helper(self, matrix, row, col):
        """
        Helper method to get a submatrix excluding the specified row and column.
        """
        return [row[:col] + row[col+1:] for row in (matrix[:row] + matrix[row+1:])]

    def inverse(self, matrix):
        """
        Finds the inverse of a matrix.
        """
        matrix = np.array(matrix)
        try:
            inv_matrix = np.linalg.inv(matrix)
            return inv_matrix
        except np.linalg.LinAlgError:
            return "Inverse does not exist."

    def eigenvalues_eigenvectors(self, matrix):
        """
        Computes eigenvalues and eigenvectors of a matrix.
        """
        matrix = np.array(matrix)
        eigenvalues, eigenvectors = np.linalg.eig(matrix)
        return eigenvalues, eigenvectors

    def display_tree(self):
        print("Displaying BST Level-Order:")
        print(self.matrix_tree.display_level_order())


def input_matrix(size):
    """Creates matrix base on user input"""
    matrix = []
    print(f"Enter the elements for a {size}x{size} matrix row by row:")
    for _ in range(size):
        row = input().split()
        matrix.append([float(val) for val in row])
    return matrix


def main():
    solver = LinearAlgebra()

    while True:
        print("\nOptions:")
        print("1. Solve linear equations")
        print("2. Perform matrix operations")
        print("3. Calculate matrix determinant")
        print("4. Calculate matrix inverse")
        print("5. Calculate matrix eigenvalues and eigenvectors")
        print("6. Add matrix to BST and display")
        print("7. Find and use matrix by determinant in BST")
        print("8. Exit")

        choice = input("Enter your choice: ")

        if choice == '1':
            size = int(input("Enter the size of the square matrix: "))
            A = input_matrix(size)
            b = [float(x) for x in
                 input(f"Enter {size} values for the right-hand side vector, separated by space: ").split()]
            print("Solution:", solver.solve_linear_equations(A, b))

        elif choice == '2':
            size = int(input("Enter the size of the two square matrices: "))
            mat1 = input_matrix(size)
            mat2 = input_matrix(size)
            operation = input("Enter the operation (add/subtract/multiply): ")
            print("Result:\n", solver.matrix_operations(mat1, mat2, operation))

        elif choice == '3':
            size = int(input("Enter the size of the square matrix: "))
            matrix = input_matrix(size)
            print("Determinant:", solver.determinant(matrix))

        elif choice == '4':
            size = int(input("Enter the size of the square matrix: "))
            matrix = input_matrix(size)
            print("Inverse:", solver.inverse(matrix))

        elif choice == '5':
            size = int(input("Enter the size of the square matrix: "))
            matrix = input_matrix(size)
            eigenvalues, eigenvectors = solver.eigenvalues_eigenvectors(matrix)
            print("Eigenvalues:", eigenvalues)
            print("Eigenvectors:\n", eigenvectors)

        elif choice == '6':
            size = int(input("Enter the size of the square matrix: "))
            matrix = input_matrix(size)
            solver.add_matrix(matrix)
            solver.display_tree()

        elif choice == '7':
            determinant = float(input("Enter the determinant value to find: "))
            found_matrix = solver.find_matrix_by_determinant(determinant)
            if found_matrix:
                print("Found matrix:", found_matrix)
                print("What would you like to do with this matrix?")
                print("a. Calculate its determinant")
                print("b. Calculate its inverse")
                print("c. Calculate its eigenvalues and eigenvectors")
                sub_choice = input("Enter your choice (a/b/c): ")

                if sub_choice == 'a':
                    print("Determinant:", solver.determinant(found_matrix))
                elif sub_choice == 'b':
                    print("Inverse:", solver.inverse(found_matrix))
                elif sub_choice == 'c':
                    eigenvalues, eigenvectors = solver.eigenvalues_eigenvectors(found_matrix)
                    print("Eigenvalues:", eigenvalues)
                    print("Eigenvectors:\n", eigenvectors)
                else:
                    print("Invalid sub-choice.")
            else:
                print("No matrix found with the given determinant.")

        elif choice == '8':
            break

        else:
            print("Invalid choice, please try again.")


if __name__ == "__main__":
    main()
