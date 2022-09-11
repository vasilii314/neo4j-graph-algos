WITH 'file:///transport-nodes.csv' AS path
LOAD CSV WITH HEADERS FROM path AS row
MERGE (place:Place {id: row.id})
SET place.latitude = toFloat(row.latitude),
    place.longitude = toFloat(row.longitude),
    place.population = toInteger(row.population)
WITH 'file:///transport-relationships.csv' AS path
LOAD CSV WITH HEADERS FROM path AS row
MATCH (origin:Place {id: row.src})
MATCH (destination:Place {id: row.dst})
MERGE (origin)-[:EROAD {distance: toInteger(row.cost)}]->(destination)
