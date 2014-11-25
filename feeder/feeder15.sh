#!/bin/sh
#curl -XPUT 'http://192.168.47.11:9201/wuzei_v1?pretty'
#curl 'http://192.168.47.11:9201/_mapping?v'
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

echo 'begin youkong\n' >>insert.log

curl -XPUT 'http://192.168.47.11:9201/wuzei_v1/_mapping/youkong' -d '{
"youkong": {
    "properties": {
        "nickname": {
            "type":     "string",
                "analyzer": "standard",
                "fields": {
                "std":   {
                    "type":     "string",
                        "index": "not_analyzed"
                }
            }
        },
        "sex": {
            "type":     "string",
                "analyzer": "standard",
                "fields": {
                "std":   {
                    "type":     "string",
                        "index": "not_analyzed"
                }
            }
        },
        "location": {
            "type":     "string",
                "analyzer": "standard",
                "fields": {
                "std":   {
                    "type":     "string",
                        "index": "not_analyzed"
                }
            }
        },
        "birthday": {
            "type":     "string",
                "analyzer": "standard",
                "fields": {
                "std":   {
                    "type":     "string",
                        "index": "not_analyzed"
                }
            }
        },
         "weixin": {
            "type":     "string",
                "analyzer": "standard",
                "fields": {
                "std":   {
                    "type":     "string",
                        "index": "not_analyzed"
                }
            }
        },
        "momo": {
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
        "img_url": {
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
        "url" :  "jdbc:mysql://192.168.47.12:3306/wuzei_core",
        "user" : "forseti",
        "password" : "tongdun1234",
        "sql" :   "select concat(\"youkong_\",user_id) as \"_id\", user_brithday as \"birthday\", user_avatar_l as \"img_url\" , user_location as \"location\", user_momo as \"momo\", user_nick as \"nickname\" , user_qq as \"qq\" , user_sex as \"sex\" , 13 as \"source\" ,  user_weixin as \"weixin\" from crack_youkong",
        "treat_binary_as_string" : true,
        "index" : "wuzei_v1",
        "type" : "youkong"
      }
}
' | java \
    -cp "${DIR}/*" \
    org.xbib.elasticsearch.plugin.jdbc.feeder.Runner \
    org.xbib.elasticsearch.plugin.jdbc.feeder.JDBCFeeder

    echo 'end youkong\n' >>insert.log


echo 'begin daxuesheng\n' >>insert.log

curl -XPUT 'http://192.168.47.11:9201/wuzei_v1/_mapping/daxuesheng' -d '{
 "daxuesheng" : {
        "properties" : {
          "candidate_num" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "college" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "edu" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "email" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "enrollment_time" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "ethnic" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "full_name" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "graduated" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "graduation_time" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "id_card_num" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "major" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "mobile_num" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "political_status" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "sex" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "source" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "source_place" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "student_num" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            }
          },
          "student_type" : {
            "type" : "string",
            "analyzer" : "standard",
            "fields" : {
              "std" : {
                "type" : "string",
                "index" : "not_analyzed"
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
        "sql" :   "select concat(\"daxuesheng_\",id) as \"_id\", candidate_num as \"candidate_num\" , college as \"college\" , edu as \"edu\" ,email as \"email\" ,  enrollment_time as \"enrollment_time\" , ethnic as \"ethnic\" , full_name as \"full_name\", graduated as \"graduated\",  graduation_time as \"graduation_time\", id_card_num as \"id_card_num\", major as \"major\", mobile_num as \"mobile_num\", political_status as \"political_status\", sex as \"sex\",  15 as \"source\" , source_place as \"source_place\", student_num as \"student_num\",  student_type as \"student_type\" from crack_daxuesheng",
        "treat_binary_as_string" : true,
        "index" : "wuzei_v1",
        "type" : "daxuesheng"
      }
}
' | java \
    -cp "${DIR}/*" \
    org.xbib.elasticsearch.plugin.jdbc.feeder.Runner \
    org.xbib.elasticsearch.plugin.jdbc.feeder.JDBCFeeder

    echo 'end daxuesheng\n' >>insert.log


