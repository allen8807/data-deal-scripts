#!/bin/sh
#curl -XPUT 'http://192.168.47.11:9201/wuzei_v1?pretty'
#curl 'http://192.168.47.11:9201/_cat/indices?v'
#curl 'http://192.168.47.11:9201/_search?pretty=true'
#curl -XPOST 'http://192.168.47.11:9201/_aliases' -d '{
#    "actions":[
#        {
#            "add":{
#                "alias":"wuzei",
#                "index":"wuzei_v1"
#            }
#        }
#    ]
#}'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# ES_HOME required to detect elasticsearch jars
export ES_HOME=/home/bolu.zhao/elasticsearch-1.3.4



echo 'begin liyiba\n' >>insert.log

curl -XPUT 'http://192.168.47.11:9201/wuzei_v1/_mapping/liyiba' -d '{
"liyiba": {
    "properties": {
        "email": {
            "type":     "string",
                "analyzer": "standard",
                "fields": {
                "std":   {
                    "type":     "string",
                        "index": "not_analyzed"
                }
            }
        },
        "plain_pwd": {
            "type":"string",
                "analyzer": "standard",
                "fields": {
                "std":   {
                    "type":     "string",
                        "index": "not_analyzed"
                }
            }
        },
        "source": {
            "type":     "string",
                "analyzer": "standard",
                "fields": {
                "std":   {
                    "type":     "string",
                        "index": "not_analyzed"
                }
            }
        },
        "username": {
            "type":     "string",
                "analyzer": "standard",
                "fields": {
                "std":   {
                    "type":     "string",
                        "index": "not_analyzed"
                }
            }
        }
    }
}
}'
sleep 1

echo '
{
    "elasticsearch" : {
         "cluster" : "elasticsearch_wuzei",
         "host" : "192.168.47.11",
         "port" : 9301
    },
    "type" : "jdbc",
    "jdbc" : {
        "url" :  "jdbc:mysql://192.168.47.12:3306/wuzei_core",
        "user" : "forseti",
        "password" : "tongdun1234",
        "sql" :   "select concat(\"liyiba_\",id) as \"_id\", email as \"email\" ,password as \"plain_pwd\" ,  10 as \"source\" ,  username as \"username\" from crack_pconline",
        "treat_binary_as_string" : true,
        "index" : "wuzei_v1",
        "type" : "liyiba"
      }
}
' | java \
    -cp "${DIR}/*" \
    org.xbib.elasticsearch.plugin.jdbc.feeder.Runner \
    org.xbib.elasticsearch.plugin.jdbc.feeder.JDBCFeeder

    echo 'end pconline\n' >>insert.log




