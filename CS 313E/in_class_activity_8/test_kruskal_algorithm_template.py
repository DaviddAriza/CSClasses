import unittest
from example_022_minimum_spanning_tree_Kruskal_algo import Graph


class TestKruskalAlgorithm(unittest.TestCase):

    def setUp(self):
        # Create your Test Graphs here. 
        self.g1 = Graph(5)

        self.g1.add_edge(0, 1, 2)
        self.g1.add_edge(0, 3, 6)
        self.g1.add_edge(1, 4, 5)
        self.g1.add_edge(1, 2, 3)
        self.g1.add_edge(2, 3, 12)
        self.g1.add_edge(3, 4, 16)
        self.g1.add_edge(3, 5, 20)
        self.g1.add_edge(4, 5, 21)
        self.g1.add_edge(5, 6, 22)
        
        self.g2 = Graph(0)
        
        self.g3 = Graph(1)
        
        self.g4 = Graph(6)

        self.g4.add_edge(0, 1, 2)
        self.g4.add_edge(0, 3, 6)
        self.g4.add_edge(1, 4, 5)
        self.g4.add_edge(1, 2, 3)
        self.g4.add_edge(2, 3, 12)
        self.g4.add_edge(3, 4, 16)
        self.g4.add_edge(3, 5, 20)
        self.g4.add_edge(4, 5, 21)
        self.g4.add_edge(5, 6, 22)
        
    def test_kruskal_mst(self):
        # Compute the minimum spanning tree using Kruskal's algorithm
        # mst = kruskal_mst(self.graph)
        mst_1 = self.g1.kruskal_algo()
        # WRITE YOUR CODE

        # Assert that the total weight of the MST is correct
        # self.assertEqual( , )
        
        # Assert that the MST contains the correct edges
        expected_mst_1 = [[0, 1, 2], [1, 2, 3], [1, 4, 5], [0, 3, 6]]
        self.assertEqual(mst_1, expected_mst_1)

    def test_kruskal_mst_empty_graph(self):
        # Test with an empty graph
        mst_2 = self.g2.kruskal_algo()

        # ... 

        # YOUR CODE 
        expected_mst_2 = []
        # self.assertEqual(   ,   )
        self.assertEqual(mst_2,expected_mst_2)
    def test_kruskal_mst_single_vertex(self):
        # Test with a graph with a single vertex
        # ...
        mst_3 = self.g3.kruskal_algo()
        # YOUR CODE
        expected_mst_3 = []
        # self.assertEqual(   ,   )
        self.assertEqual(mst_3, expected_mst_3)


    def test_kruskal_mst_disconnected_graph(self):
        # Test with a disconnected graph
        mst_4 = self.g4.kruskal_algo()
        # ...

        # YOUR CODE
        expected_mst_4 = [[0, 1, 2], [1, 2, 3], [1, 4, 5], [0, 3, 6], [3, 5, 20]]
        # self.assertEqual(   ,   )
        self.assertEqual(mst_4, expected_mst_4)
if __name__ == '__main__':
    unittest.main()
