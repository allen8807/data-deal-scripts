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

echo 'begin csdn\n' >>insert.log
curl -XPUT 'http://192.168.47.11:9201/wuzei_v1/_mapping/csdn' -d '{
"csdn": {
    "properties": {
        "username": {
            "type":     "string",
                "analyzer": "standard",
                "fields": {
                "std":   {
                    "type":     "string",
                        "index": "not_analyzed"
                }
            }
        },
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
        "url" :  "jdbc:mysql://192.168.47.12:3306/wuzei_core,
        "user" : "forseti",
        "password" : "tongdun1234",
        "sql" :  "select concat(\"csdn_\",id) as \"_id\", user_name as \"username\", email as \"email\" ,plain_pwd as \"plain_pwd\" , 1 as \"source\"from crack_csdn;",
        "treat_binary_as_string" : true,
        "index" : "wuzei_v1",
        "type" : "csdn"
      }
}
' | java \
    -cp "${DIR}/*" \
    org.xbib.elasticsearch.plugin.jdbc.feeder.Runner \
    org.xbib.elasticsearch.plugin.jdbc.feeder.JDBCFeeder


echo 'end csdn\n' >>insert.log
echo 'begin 126\n' >>insert.log

curl -XPUT 'http://192.168.47.11:9201/wuzei_v1/_mapping/126com' -d '{
"126com": {
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
        "sql" :   "select concat(\"126com_\",id) as \"_id\", email as \"email\" ,plain_pwd as \"plain_pwd\" , 2 as \"source\"from crack_126_com",
        "treat_binary_as_string" : true,
        "index" : "wuzei_v1",
        "type" : "126com"
      }
}
' | java \
    -cp "${DIR}/*" \
    org.xbib.elasticsearch.plugin.jdbc.feeder.Runner \
    org.xbib.elasticsearch.plugin.jdbc.feeder.JDBCFeeder

    echo 'end 126\n' >>insert.log
