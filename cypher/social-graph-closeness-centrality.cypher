CALL gds.graph.project('closeness-centrality', 'SocialUser', 'FOLLOWS')
YIELD graphName
CALL gds.beta.closeness.stream('closeness-centrality')
YIELD nodeId, score
RETURN gds.util.asNode(nodeId).id AS node, score
  ORDER BY score DESC