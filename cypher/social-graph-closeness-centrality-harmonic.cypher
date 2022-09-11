CALL gds.graph.project('closeness-centrality-harmonic', 'SocialUser', 'FOLLOWS')
YIELD graphName
CALL gds.alpha.closeness.harmonic.stream('closeness-centrality-harmonic')
YIELD nodeId, centrality
RETURN gds.util.asNode(nodeId).id AS node, centrality
  ORDER BY centrality DESC