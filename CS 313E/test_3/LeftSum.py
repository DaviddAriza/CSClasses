#  File: LeftSum.py

#  Description: Get the left sum of the BST

#  Student Name: David Ariza

#  Student UT EID: jda3867

#  Course Name: CS 313E

#  Unique Number: 86610


import sys

class Queue(object):

    def __init__(self):
        self.queue = []

    def enqueue(self, item):
        self.queue.append(item)

    def dequeue(self):
        return self.queue.pop(0)

    def is_empty(self):
        return len(self.queue) == 0

    def size(self):
        return len(self.queue)

class Node(object):

    def __init__(self, data):
        self.data = data
        self.lchild = None
        self.rchild = None

class Tree(object):

    def __init__(self):
        self.root = None

    def insert(self, data):
        new_node = Node(data)

        if self.root is None:
            self.root = new_node
            return

        current = self.root
        parent = self.root

        while current is not None:
            parent = current
            if data < current.data:
                current = current.lchild
            else:
                current = current.rchild

        if data < parent.data:
            parent.lchild = new_node
        else:
            parent.rchild = new_node

    def get_height_helper(self, node):
        if node is None:
            return 0

        left_height = self.get_height_helper(node.lchild)
        right_height = self.get_height_helper(node.rchild)

        return 1 + max(left_height, right_height)

    def get_height(self):
        return self.get_height_helper(self.root)

    def get_level(self, level):
        if self.root is None:
            return []

        q = Queue()
        q.enqueue(self.root)
        q.enqueue(None)
        current_level = 1
        nodes = []

        while not q.is_empty() and current_level <= level:
            node = q.dequeue()
            if node is None:
                current_level += 1
                if current_level <= level:
                    q.enqueue(None)
            else:
                if current_level == level:
                    nodes.append(node.data)
                if node.lchild:
                    q.enqueue(node.lchild)
                if node.rchild:
                    q.enqueue(node.rchild)

        return nodes

    def get_left_sum(self):
        if self.root is None:
            return 0

        q = Queue()
        q.enqueue(self.root)
        q.enqueue(None)
        nodes = []

        while not q.is_empty():
            node = q.dequeue()
            if node is None:
                if not q.is_empty():
                    q.enqueue(None)
                nodes.append(node)
            else:
                if len(nodes) == 0:
                    nodes.append(node.data)
                if node.lchild:
                    q.enqueue(node.lchild)
                if node.rchild:
                    q.enqueue(node.rchild)

        return sum(nodes[1:])   
# A wrapper over sumLeftViewUtil()

def main():
    line = sys.stdin.readline()
    line = line.strip()
    tree_input = list(map(int, line.split()))

    tree = Tree()

    for i in tree_input:
        tree.insert(i)

    print(tree.get_left_sum())

if __name__ == "__main__":
    main()