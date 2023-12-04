#!/bin/bash

DB_NAME="fibra_o"
DB_USER="user"

SQL_QUERY="SELECT 1 - AVG(start.probabilidad * final.probabilidad) AS a2tr
FROM fibra_optica start
JOIN fibra_optica final ON start.target = final.source
WHERE start.id != final.id;"

RESULT=$(docker exec -i postgres_c psql -U $DB_USER -d $DB_NAME -c "$SQL_QUERY")

if [ $? -ne 0 ]; then
  echo "Error al ejecutar la consulta"
  exit 1
fi

echo "ATTR calculado: $RESULT"

