WITH "file:///social-nodes.csv" AS path
LOAD CSV WITH HEADERS FROM path as row
MERGE(:SocialUser {id: row.id})

WITH "file:///social-relationships.csv" AS path
LOAD CSV WITH HEADERS FROM path as row
MATCH (source:SocialUser {id: row.src})
MATCH (destination:SocialUser {id: row.dst})
MERGE (source)-[:FOLLOWS]->(destination)