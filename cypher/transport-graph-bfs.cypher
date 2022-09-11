CALL gds.graph.exists('transportGraphBFS')
YIELD graphName, exists
CALL apoc.when(
                exists,
                'MATCH (source:Place {id: \'London\'})
                CALL gds.bfs.stream(\'' + graphName + '\', {sourceNode: source})
                YIELD path
                RETURN path',
                'CALL gds.graph.project(\'' + graphName + '\', "Place", "EROAD")
                 YIELD graphName
                 MATCH (source:Place {id: \'London\'})
                 CALL gds.bfs.stream(\'' + graphName + '\', {sourceNode: source})
                 YIELD path
                 RETURN path')
YIELD value
RETURN value.path
