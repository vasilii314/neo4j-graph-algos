CALL gds.graph.project('page-rank', 'SocialUser', 'FOLLOWS')
YIELD graphName
CALL gds.pageRank.stream('page-rank', {maxIterations: 20, dampingFactor: 0.85})
YIELD nodeId, score
RETURN gds.util.asNode(nodeId).id AS id, score
ORDER BY score DESC, id ASC