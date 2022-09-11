CALL gds.graph.project('k-shortest', "Place", "EROAD", {relationshipProperties: 'distance'})
YIELD graphName

MATCH (source:Place {id: 'Gouda'})
MATCH (destination:Place {id: 'Felixstowe'})
CALL gds.shortestPath.yens.stream('k-shortest',
  {
    sourceNode: source,
    targetNode: destination,
    k: 5,
    relationshipWeightProperty: 'distance'
  }
)
YIELD index, sourceNode, targetNode, totalCost, nodeIds, costs, path
RETURN totalCost, path