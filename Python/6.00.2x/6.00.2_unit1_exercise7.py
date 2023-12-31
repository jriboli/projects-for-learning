class Node(object):
    def __init__(self, name):
        """Assumes name is a string"""
        self.name = name
    def getName(self):
        return self.name
    def __str__(self):
        return self.name
    
class Edge(object):
    def __init__(self, src, dest):
        """Assumes src and dest are nodes"""
        self.src = src
        self.dest = dest
    def getSource(self):
        return self.src
    def getDestination(self):
        return self.dest
    def __str__(self):
        return self.src.getName() + '->' + self.dest.getName()
    
class Digraph(object):
    """edges is a dict mapping each node to a list of its children"""

    def __init__(self):
        self.edges = {}
    def addNode(self, node):
        if node in self.edges:
            raise ValueError('Duplicate node')
        else:
            self.edges[node] = []
    def addEdge(self, edge):
        src = edge.getSource()
        dest = edge.getDestination()
        if not (src in self.edges and dest in self.edges):
            raise ValueError('Node not in graph')
        self.edges[src].append(dest)
    def childrenOf(self, node):
        return self.edges[node]
    def hasNode(self, node):
        return node in self.edges
    def getNode(self, name):
        for n in self.edges:
            if n.getName() == name:
                return n
        raise NameError(name)
    def __str__(self):
        result = ''
        for src in self.edges:
            for dest in self.edges[src]:
                result = result + src.getName() + '->' + dest.getName() + '\n'
        return result[:-1] #omit final newline
    
# Why is graph a subclass of Digraph?
# Substitution rule from 6.00.1x
class Graph(Digraph):
    def addEdge(self, edge):
        Digraph.addEdge(self, edge)
        rev = Edge(edge.getDestination(), edge.getSource())
        Digraph.addEdge(self, rev)

# EXERCISE 7

"""
Write a WeightedEdge class that extends Edge. Its constructor requires a weight parameter, as well as the parameters from Edge. 
You should additionally include a getWeight method. The string value of a WeightedEdge from node A to B with a weight of 3 should be "A->B (3)".
"""

class WeightedEdge(Edge):
    def __init__(self, src, dest, weight):
        # Your code here
        self.src = src
        self.dest = dest
        self.weight = weight
    def getWeight(self):
        # Your code here
        return self.weight
    def __str__(self):
        # Your code here
        return self.src.getName() + '->' + self.dest.getName() + " ("+ str(self.getWeight()) + ")"