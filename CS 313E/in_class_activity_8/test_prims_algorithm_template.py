import unittest
from typing import List, Tuple
from example_023_minimum_spanning_tree_Prims_algo import Graph

class TestPrimsAlgorithm(unittest.TestCase):
    
    def setUp(self):
        # Create your Test Graphs here.

        # YOUR CODE

        self.graph1 = Graph()
        
        self.graph1.add_verticies(range(7))
        
        self.graph1.add_undirected_edge(0, 1, 30)
        self.graph1.add_undirected_edge(0, 6, 10)
        self.graph1.add_undirected_edge(1, 4, 13)
        self.graph1.add_undirected_edge(1, 2, 15)
        self.graph1.add_undirected_edge(2, 3, 12)
        self.graph1.add_undirected_edge(3, 4, 16)
        self.graph1.add_undirected_edge(3, 5, 20)
        self.graph1.add_undirected_edge(4, 5, 21)
        self.graph1.add_undirected_edge(5, 6, 22)

        self.graph2 = Graph()
        
        self.graph2.add_verticies(range(4))
        
        self.graph3 = Graph()
        
        self.graph2.add_undirected_edge(0, 1, 2)
        self.graph2.add_undirected_edge(0, 2, 3)
        self.graph2.add_undirected_edge(1, 2, 4)
        self.graph2.add_undirected_edge(1, 3, 1)
        self.graph2.add_undirected_edge(2, 3, 2)
        self.graph2.add_undirected_edge(3, 2, 2)
        
        self.graph3.add_verticies(range(8))
        
        self.graph3.add_undirected_edge(0, 1, 2)
        self.graph3.add_undirected_edge(0, 2, 3)
        self.graph3.add_undirected_edge(1, 2, 4)
        self.graph3.add_undirected_edge(1, 3, 1)
        self.graph3.add_undirected_edge(2, 3, 2)
        self.graph3.add_undirected_edge(3, 2, 2)

    
    def test_prims_algorithm_with_graph1(self):
        # ...

        # YOUR CODE
        mst_1 = self.graph1.prims()
        expected_output1 = [True, 0, 0, 0, 0, 0, True]
        # self.assertEqual(   ,   )
        self.assertEqual(mst_1, expected_output1)
    def test_prims_algorithm_with_graph2(self):
        # ...

        # YOUR CODE
        mst_2 = self.graph2.prims()
        expected_output2 = [True, True, 0, 0]
        # self.assertEqual(   ,   )
        self.assertEqual(mst_2, expected_output2)
    def test_prims_algorithm_with_graph3(self):
        # ...

        # YOUR CODE
        mst_3 = self.graph3.prims()
        expected_output3 = [True, True, 0, 0, 0, 0, 0, 0]
        # self.assertEqual(   ,   )
        self.assertEqual(mst_3, expected_output3)
if __name__ == '__main__':
    unittest.main()
