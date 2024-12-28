#  File: BalanceFactor.py

#  Description: Determines the balance factor of a binary tree

#  Student Name: David Ariza

#  Student UT EID: jda3867

#  Course Name: CS 313E

#  Unique Number: 52590

class Node(object):
    def __init__(self, data, left=None, right=None):
        self.data = data
        self.left = left
        self.right = right


# Return the integer balance factor of a tree rooted at the given node.
def getHeight(node):
# # add your code here! 
    if node is None:     
        return 0
    else:
        return max(getHeight(node.left), getHeight(node.right)) + 1

def balance_factor(node):
# add your code here!
    if node is None:
        return 0
    else:
        left_height = getHeight(node.left)
        right_height = getHeight(node.right)
        return right_height - left_height
# ------ DO NOT CHANGE BELOW HERE ------ #
import pickle
import sys


def main():
    data_in = ''.join(sys.stdin.readlines())
    node = pickle.loads(str.encode(data_in))

    print(balance_factor(node))


if __name__ == "__main__":
    main()
