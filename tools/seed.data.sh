#------------------------------------------------------------
# [[APP_NAME]] ([[APP_URL]])
#
# @link      [[APP_REPOSITORY_URL]]
# @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
# @license   [[LICENSE_URL]] ([[LICENSE]])
#--------------------------------------------------------------
#!/bin/bash

#------------------------------------------------------
# Scripts to setup configuration files
#------------------------------------------------------

BASE_URL="localhost:9200/fano-articles"

curl -X DELETE "$BASE_URL"
curl -X PUT "$BASE_URL"

curl -X POST "$BASE_URL/elasticsearch" \
-H 'Content-Type: application/json' \
-d '{
    "name":"Getting Started with Elasticsearch",
    "author":"Joko Widowo",
    "tags":["Data Analytics","Text Search","Elasticsearch"],
    "content":"Sample getting started with Elasticsearch"
}'

curl -X POST "$BASE_URL/elasticsearch" \
-H 'Content-Type: application/json' \
-d '{
    "name":"About with Elasticsearch",
    "author":"Pradowo Subiantini",
    "tags":["Data Analytics","Text Search","Elasticsearch"],
    "content":"Tutorial Elasticsearch for beginner"
}'

curl -X POST "$BASE_URL/elasticsearch" \
-H 'Content-Type: application/json' \
-d '{
    "name":"Finding data with Elasticsearch",
    "author":" Yusup Kalah Menang Happy",
    "tags":["Data Analytics","Text Search","Elasticsearch"],
    "content":"Tutorial data retrieval Elasticsearch for beginner"
}'
