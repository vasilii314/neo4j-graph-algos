CALL gds.graph.project('dijkstra', "Place", "EROAD", {relationshipProperties: 'distance'})
YIELD graphName

MATCH (source:Place {id: 'Amsterdam'})
MATCH (destination:Place {id: 'London'})
CALL gds.shortestPath.dijkstra.stream('dijkstra', {sourceNode: source, targetNode: destination, relationshipWeightProperty: 'distance'})
YIELD index, sourceNode, targetNode, totalCost, nodeIds, costs, path
RETURN path, totalCost


//Unweighted variant
MATCH (source:Place {id: 'Amsterdam'})
MATCH (destination:Place {id: 'London'})
CALL gds.shortestPath.dijkstra.stream('dijkstra', {sourceNode: source, targetNode: destination})
YIELD index, sourceNode, targetNode, totalCost, nodeIds, costs, path
RETURN path, totalCost