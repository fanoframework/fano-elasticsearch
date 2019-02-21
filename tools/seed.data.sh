#------------------------------------------------------------
# Fano Framework Elasticsearch Sample Application (https://fanoframework.github.io)
#
# @link      https://github.com/fanoframework/fano-elasticsearch
# @copyright Copyright (c) 2019 Zamrony P. Juhara
# @license   https://github.com/fanoframework/fano-elasticsearch/blob/master/LICENSE (GPL-3.0)
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
