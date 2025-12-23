#!/bin/bash
# Unzip the file to extract the .txt file.
gunzip -f web-server-access-log.txt.gz

# extract data
echo "Extracting data"

cut -d"#" -f1-4 web-server-access-log.txt > extracted-data.txt

# transform data
echo "Transform data"

tr "#" ","  < extracted-data.txt > transform-data.csv

export PGPASSWORD='AdminPGdb'

# creating table if not exists
echo "Creating table if not exists"
psql -U postgres -h postgres -p 5432 -d etlbash -f create_table.sql

# load data
echo "Loading data"

echo "\COPY access_log  FROM './transform-data.csv' DELIMITERS ','  CSV HEADER;" | psql -U postgres -h localhost -p 5432 -d etlbash

# query data
echo "Quering data"

echo "SELECT * FROM access_log;" | psql -U postgres -h postgres -p 5432 -d etlbash