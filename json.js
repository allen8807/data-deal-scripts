/**
 * Created by allen on 14-11-18.
 */

curl -XPUT 'http://192.168.47.11:9201/wuzei_v1?pretty'
curl 'http://192.168.47.11:9201/_cat/indices?v'
curl 'http://192.168.47.11:9201/_search?pretty=true'
curl -XPOST 'http://192.168.47.11:9201/_aliases' -d '{
    "actions":[
        {
            "add":{
                "alias":"wuzei",
                "index":"wuzei_v1"
            }
        }
    ]
}'



curl -XPOST 'http://192.168.47.11:9201/wuzei_v1/_search?pretty' -d '
{
    "query": { "match_all": {} },
    "from": 10,
    "size": 10
}'

/**
 * Created by allen on 14-11-18.
 */
    curl -XPUT 'http://localhost:9200/wuzei_v1?pretty'


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




/**
 * 126com
 */

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

/**
 * csdn
 */
    curl -XPUT 'http://192.168.47.11:9201/_river/my_jdbc_river/_meta' -d '{
"type" : "jdbc",
    "jdbc" : {
    "driver" : "com.mysql.jdbc.Driver",
        "url" : "jdbc:mysql://192.168.47.12:3306/wuzei_core",
        "user" : "forseti",
        "password" : "tongdun1234",
        "sql" : "select concat(\"csdn_\",id) as \"_id\", user_name as \"username\", email as \"email\" ,plain_pwd as \"plain_pwd\" , 1 as \"source\"from crack_csdn",
        "index" : "wuzei_v1",
        "type" : "csdn",
        "bulk_size" : 1000,
        "max_bulk_requests" : 50,
        "bulk_flush_interval" : "10s"
}
}'

curl -XPUT 'http://localhost:9200/_river/my_jdbc_river/_meta' -d '{
"type" : "jdbc",
    "jdbc" : {
    "driver" : "com.mysql.jdbc.Driver",
        "url" : "jdbc:mysql://192.168.6.201:3306/wuzei_core",
        "user" : "forseti",
        "password" : "tongdun1234",
        "sql" : "select concat(\"126com_\",id) as \"_id\", email as \"email\" ,plain_pwd as \"plain_pwd\" , 2 as \"source\"from crack_126_com",
        "index" : "wuzei_v2",
        "type" : "126com",
        "bulk_size" : 1000,
        "max_bulk_requests" : 50,
        "bulk_flush_interval" : "10s"
}
}'



