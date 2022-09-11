CALL gds.graph.project('betweenness-centrality', 'SocialUser', 'FOLLOWS')
YIELD graphName
CALL gds.betweenness.stream('betweenness-centrality')
YIELD nodeId, score
RETURN gds.util.asNode(nodeId).id AS node, score
  ORDER BY score DESC