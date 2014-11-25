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
export ES_HOME=

echo 'begin netease\n' >>insert.log

curl -XPUT 'http://192.168.47.11:9201/wuzei_v1/_mapping/csdn' -d '{
"csdn": {
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
        "sql" :   "select concat(\"csdn_\",id) as \"_id\", email as \"email\" ,plain_pwd as \"plain_pwd\" , 3 as \"source\"from crack_csdn",
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

    echo 'begin ntusers\n' >>insert.log
curl -XPUT 'http://192.168.47.11:9201/wuzei_v1/_mapping/ntusers' -d '{
"ntusers": {
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
 "encrypt_pwd": {
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
        "sql" :  "select concat(\"ntusers_\",uid) as \"_id\", username as \"username\", email as \"email\" ,password as \"plain_pwd\" ,epwd as \"encrypt_pwd\" , 6 as \"source\"from crack_nt_users",
        "treat_binary_as_string" : true,
        "index" : "wuzei_v1",
        "type" : "ntusers"
      }
}
' | java \
    -cp "${DIR}/*" \
    org.xbib.elasticsearch.plugin.jdbc.feeder.Runner \
    org.xbib.elasticsearch.plugin.jdbc.feeder.JDBCFeeder


echo 'end ntusers\n' >>insert.log

echo 'begin qq\n' >>insert.log
curl -XPUT 'http://192.168.47.11:9201/wuzei_v1/_mapping/qq' -d '{
"qq": {
    "properties": {
        "qq": {
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
 "status": {
            "type":     "string",
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
        "sql" :  "select concat(\"qq_\",id) as \"_id\", qq as \"qq\", plain_pwd as \"plain_pwd\" ,status as \"status\" , 5 as \"source\"from crack_qq",
        "treat_binary_as_string" : true,
        "index" : "wuzei_v1",
        "type" : "qq"
      }
}
' | java \
    -cp "${DIR}/*" \
    org.xbib.elasticsearch.plugin.jdbc.feeder.Runner \
    org.xbib.elasticsearch.plugin.jdbc.feeder.JDBCFeeder


echo 'end qq\n' >>insert.log
