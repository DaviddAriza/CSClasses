#  File: ExpressionTree.py

#  Description: Create an expression tree to solve expression

#  Student Name: David Ariza

#  Student UT EID: jda3867

#  Partner Name: Benjamin Ye

#  Partner UT EID: by3768

#  Course Name: CS 313E

#  Unique Number: 52590

#  Date Created: 10/18/2023

#  Date Last Modified: 10/18/2023

import sys

operators = ['+', '-', '*', '/', '//', '%', '**']

class Stack ():
    def __init__(self):
        self.stack = []

    def push(self, data):
        self.stack.append (data)

    def pop(self):
        if not self.is_empty():
            return self.stack.pop()
        else:
            return None

    def is_empty(self):
        return len(self.stack) == 0

class Node ():
    def __init__ (self, data = None, l_child = None, r_child = None):
        self.data = data
        self.l_child = l_child
        self.r_child = r_child

class Tree():
    def __init__ (self):
        self.root = Node(None)

    # this function takes in the input string expr and
    # creates the expression tree
    def create_tree (self, expr):
        equation = expr.split()
        stack = Stack()
        curr = self.root

        for token in equation:
            if token == '(':
                stack.push(curr)
                curr.l_child = Node(None)
                curr = curr.l_child
            elif token in operators:
                curr.data = token
                stack.push(curr)
                curr.r_child = Node(None)
                curr = curr.r_child
            elif str(token).isdigit() or '.' in token:
                curr.data = token
                curr = stack.pop()
            elif token == ')':
                if not stack.is_empty():
                    curr = stack.pop()
                else:
                    break

    # this function should evaluate the tree's expression
    # returns the value of the expression after being calculated
    def evaluate (self, aNode):
        if aNode.data == '+':
            return self.evaluate(aNode.l_child) + self.evaluate(aNode.r_child)
        elif aNode.data == '-':
            return self.evaluate(aNode.l_child) - self.evaluate(aNode.r_child)
        elif aNode.data == '*':
            return self.evaluate(aNode.l_child) * self.evaluate(aNode.r_child)
        elif aNode.data == '/':
            return self.evaluate(aNode.l_child) / self.evaluate(aNode.r_child)
        elif aNode.data == '//':
            return self.evaluate(aNode.l_child) // self.evaluate(aNode.r_child)
        elif aNode.data == '%':
            return self.evaluate(aNode.l_child) % self.evaluate(aNode.r_child)
        elif aNode.data == '**':
            return self.evaluate(aNode.l_child) ** self.evaluate(aNode.r_child)
        elif str(aNode.data).isdigit() or '.' in aNode.data:
            return eval(aNode.data)

    # this function should generate the preorder notation of
    # the tree's expression
    # returns a string of the expression written in preorder notation
    def pre_order (self, aNode):
        if aNode != None:
            print(aNode.data, end=' ')
            self.pre_order(aNode.l_child)
            self.pre_order(aNode.r_child)

    # this function should generate the postorder notation of
    # the tree's expression
    # returns a string of the expression written in postorder notation
    def post_order (self, aNode):
        if aNode != None:
            self.post_order(aNode.l_child)
            self.post_order(aNode.r_child)
            print(aNode.data, end=' ')

# you should NOT need to touch main, everything should be handled for you
def main():
    # read infix expression
    line = sys.stdin.readline()
    expr = line.strip()

    tree = Tree()
    tree.create_tree(expr)

    # evaluate the expression and print the result
    print(expr,"= {:.1f}".format(tree.evaluate(tree.root)))

    # get the prefix version of the expression and print
    print("Prefix Expression:",end=' ')
    tree.pre_order(tree.root)
    print()

    # get the postfix version of the expression and print
    print("Postfix Expression:",end=' ')
    tree.post_order(tree.root)

if __name__ == "__main__":
    main()
