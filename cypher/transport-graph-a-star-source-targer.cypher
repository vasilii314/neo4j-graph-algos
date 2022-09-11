CALL gds.graph.project('A*', "Place", "EROAD", {nodeProperties: ['latitude', 'longitude'], relationshipProperties: 'distance'})
YIELD graphName

MATCH (source:Place {id: 'Amsterdam'})
MATCH (destination:Place {id: 'London'})
CALL gds.shortestPath.astar.stream('A*',
  {
    sourceNode: source,
    targetNode: destination,
    latitudeProperty: 'latitude',
    longitudeProperty: 'longitude',
    relationshipWeightProperty: 'distance'
  }
)
YIELD index, sourceNode, targetNode, totalCost, nodeIds, costs, path
RETURN totalCost, path