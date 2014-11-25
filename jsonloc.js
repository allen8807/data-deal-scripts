/**
 * Created by allen on 14-11-18.
 */
    curl -XPUT 'http://localhost:9200/wuzei_v2?pretty'


curl -XPUT 'http://localhost:9200/wuzei_v2/_mapping/csdn' -d '{
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
 * csdn
 */
curl -XPUT 'http://localhost:9200/_river/my_jdbc_river/_metacsdn' -d '{
    "type" : "jdbc",
        "jdbc" : {
        "driver" : "com.mysql.jdbc.Driver",
            "url" : "jdbc:mysql://192.168.6.201:3306/wuzei_core",
            "user" : "forseti",
            "password" : "tongdun1234",
            "sql" : "select concat(\"csdn_\",id) as \"_id\", user_name as \"username\", email as \"email\" ,plain_pwd as \"plain_pwd\" , 1 as \"source\"from crack_csdn",
            "index" : "wuzei_v2",
            "type" : "csdn",
            "bulk_size" : 1000,
            "max_bulk_requests" : 50,
            "bulk_flush_interval" : "10s"
    }
}'

/**
 * 126com
 */

curl -XPUT 'http://localhost:9200/wuzei_v2/_mapping/126com' -d '{
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

curl -XPUT 'http://localhost:9200/_river/my_jdbc_river/_meta126' -d '{
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



