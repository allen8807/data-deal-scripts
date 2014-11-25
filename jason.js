curl -XDELETE 'http://localhost:9200/wuzei'
curl -XPUT 'http://localhost:9200/wuzei_v1?pretty'
curl -XDELETE 'http://192.168.47.11:9201/wuzei/csdn1'
curl -XDELETE 'http://192.168.47.11:9201/wuzei/csdn2'
curl -XPOST 'http://localhost:9200/_aliases' -d '{
"actions":[{"add":{
    "alias":"wuzei","index":"wuzei_v1"
}
}]}'

curl -XPUT 'http://192.168.6.18:9200/wuzei/_mapping/user' -d '{
"user": {
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
        "encrypt_pwd": {
            "type":     "string",
                "analyzer": "standard",
                "fields": {
                "std":   {
                    "type":     "string",
                        "index": "not_analyzed"
                }
            }
        },
        "full_name": {
            "type":     "string",
                "analyzer": "standard",
                "fields": {
                "std":   {
                    "type":     "string",
                        "index": "not_analyzed"
                }
            }
        },
        "id_card_num": {
            "type":     "string",
                "analyzer": "standard",
                "fields": {
                "std":   {
                    "type":     "string",
                        "index": "not_analyzed"
                }
            }
        },
        "cellphoneNum": {
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




curl -XPUT '192.168.6.227:9200/_river/my_jdbc_river/_meta' -d '{
"type" : "jdbc",
    "jdbc" : {
    "driver" : "com.mysql.jdbc.Driver",
        "url" : "jdbc:mysql://192.168.6.227:3306/zbl_wuzei_core",
        "user" : "root",
        "password" : "root",
        "sql" : "select concat(\"csdn_\",id) as \"_id\", user_name as \"username\", email as \"email\" ,plain_pwd as \"plain_pwd\" from crack_csdn",
        "index" : "wuzei",
        "type" : "user",
        "bulk_size" : 1000,
        "max_bulk_requests" : 50,
        "bulk_flush_interval" : "10s"
}
}'
/**
 * csdn
 */
curl -XPUT '192.168.6.18:9200/_river/my_jdbc_river/_meta' -d '{
"type" : "jdbc",
    "jdbc" : {
    "driver" : "com.mysql.jdbc.Driver",
        "url" : "jdbc:mysql://192.168.6.201:3306/wuzei_core",
        "user" : "forseti",
        "password" : "tongdun1234",
        "sql" : "select concat(\"csdn_\",id) as \"_id\", user_name as \"username\", email as \"email\" ,plain_pwd as \"plain_pwd\" from crack_csdn",
        "index" : "wuzei",
        "type" : "user",
        "bulk_size" : 1000,
        "max_bulk_requests" : 50,
        "bulk_flush_interval" : "10s"
}
}'

/***
 * 126
 */
/
curl -XPUT '192.168.6.227:9200/_river/my_jdbc_river/_meta' -d '{
"type" : "jdbc",
    "jdbc" : {
    "driver" : "com.mysql.jdbc.Driver",
        "url" : "jdbc:mysql://192.168.6.201:3306/wuzei_core",
        "user" : "forseti",
        "password" : "tongdun1234",
        "sql" : "select concat(\"126com_\",id) as \"_id\", email as \"email\" ,plain_pwd as \"plain_pwd\" from crack_126_com",
        "index" : "wuzei",
        "type" : "user",
        "bulk_size" : 1000,
        "max_bulk_requests" : 50,
        "bulk_flush_interval" : "10s"
}
}'


curl localhost:9200/wuzei/user/_search -d '
{"query" : {"_source":{ "email": "123"}}}'