CREATE DATABASE `wuzei_core` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
/*是否可以做成模板的形式?*/
DROP TABLE IF EXISTS `crack_sources_info`;
CREATE TABLE `crack_sources_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(200) NOT NULL,
  `leak_sources` varchar(200) NOT NULL,
  `leak_mount` int(11)DEFAULT NULL,
  `leak_time` datetime DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `desc` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_name` (`table_name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;

DROP TABLE IF EXISTS `insert_log`;
CREATE TABLE `insert_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(200)  DEFAULT NULL,
  `ticks` int(11)  DEFAULT NULL,
  `insert_time`  datetime  DEFAULT NULL,
  `desc`  varchar(200)  DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;

DROP TABLE IF EXISTS `crack_csdn`;
CREATE TABLE `crack_csdn` (
  `id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `plain_pwd`  varchar(200) NOT NULL,
  `email` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;


DROP TABLE IF EXISTS `crack_126_com`;
CREATE TABLE `crack_126_com` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `plain_pwd`  varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;

DROP TABLE IF EXISTS `crack_net_ease`;
CREATE TABLE `crack_net_ease` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `plain_pwd`  varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;


INSERT INTO `crack_sources_info` ( `table_name`,`leak_mount`, `leak_sources`,`leak_time`,`insert_time`,`desc`)
VALUES("crack_csdn",6428631,"www.csdn.net",NULL,now(),"CSDN帐号泄露事件，该事件发生在2011年12月21日，600多万数据泄露，具体数据泄露的时间不明");

INSERT INTO `crack_sources_info` ( `table_name`,`leak_mount`, `leak_sources`,`leak_time`,`insert_time`,`desc`)
VALUES("crack_126_com",9357529,"www.126.com",NULL,now(),NULL);

INSERT INTO `crack_sources_info` ( `table_name`,`leak_mount`, `leak_sources`,`leak_time`,`insert_time`,`desc`)
VALUES("crack_net_ease",19928239,"网易2000万www.163.com",NULL,now(),NULL);

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE IF NOT EXISTS `nt_users` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(21) DEFAULT NULL,
  `password` char(32) NOT NULL,
  `epwd` char(32) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `utype` enum('0','1') NOT NULL DEFAULT '0',
  `atype` enum('0','1') NOT NULL DEFAULT '0',
  `atype2` enum('0','1') NOT NULL DEFAULT '0',
  `scores` int(10) NOT NULL,
  `tgid` int(10) NOT NULL,
  `loginCount` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `utype` (`utype`),
  KEY `atype` (`atype`),
  KEY `epwd` (`epwd`),
  KEY `datetime` (`datetime`),
  KEY `email` (`email`),
  KEY `scores` (`scores`),
  KEY `tgid` (`tgid`),
  KEY `loginCount` (`loginCount`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7438164 ;

DROP TABLE IF EXISTS `crack_7k7k`;
CREATE TABLE `crack_7k7k` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `plain_pwd`  varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;

DROP TABLE IF EXISTS `crack_qq`;
CREATE TABLE `crack_qq` (
  `id` int(11) NOT NULL,
  `qq` varchar(50) NOT NULL,
  `plain_pwd`  varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;

INSERT INTO `source_info` ( `table_name`,`leak_mount`, `leak_sources`,`leak_time`,`insert_time`,`desc`)
VALUES("crack_qq",20617616,"qqdatabases",NULL,now(),NULL);


DROP TABLE IF EXISTS `crack_id_card`;
CREATE TABLE `crack_id_card` (
  `id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `id_card_num`  varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;

INSERT INTO `source_info` ( `table_name`,`leak_mount`, `leak_sources`,`leak_time`,`insert_time`,`desc`)
VALUES("crack_id_card",11999999,"1200W身份证.zip",NULL,now(),NULL);


DROP TABLE IF EXISTS `crack_duduniu`;
CREATE TABLE `crack_duduniu` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `plain_pwd`  varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;


INSERT INTO `source_info` ( `table_name`,`leak_mount`, `leak_sources`,`leak_time`,`insert_time`,`desc`)
VALUES("crack_duduniu", 16282971,"嘟嘟牛_66277.rar",NULL,now(),NULL);


DROP TABLE IF EXISTS `crack_pconline`;
CREATE TABLE `crack_pconline` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `plain_pwd`  varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;

INSERT INTO `source_info` (`id`, `table_name`,`leak_mount`, `leak_sources`,`leak_time`,`insert_time`,`desc`)
VALUES(9,"crack_pconline", 5443597,"太平洋电脑网.zip",NULL,now(),NULL);

INSERT INTO `source_info` (`id`, `table_name`,`leak_mount`, `leak_sources`,`leak_time`,`insert_time`,`desc`)
VALUES(11,"crack_xiaomi_com", 8281387,"小米数据库文件（信息被爆）.rar",NULL,now(),NULL);


DROP TABLE IF EXISTS `crack_36wmodel`;
CREATE TABLE `crack_36wmodel` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `encrypt_pwd`  varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `regip` varchar(20) NOT NULL,
  `regdate`  varchar(20) NOT NULL,
  `salt` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;

DROP TABLE IF EXISTS `crack_baihe`;
CREATE TABLE `crack_baihe` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `encrypt_pwd`  varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `regip` varchar(20) NOT NULL,
  `regdate`  varchar(20) NOT NULL,
  `salt` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;


INSERT INTO `source_info` (`id`, `table_name`,`leak_mount`, `leak_sources`,`leak_time`,`insert_time`,`desc`)
VALUES(16,"crack_36wmodel", 361079,"36w-模特.rar",NULL,now(),NULL);

INSERT INTO `source_info` (`id`, `table_name`,`leak_mount`, `leak_sources`,`leak_time`,`insert_time`,`desc`)
VALUES(17,"crack_baihe", 34966,"百合网.7z",NULL,now(),NULL);

ALTER TABLE crack_daxuesheng CHANGE COLUMN 姓名 full_name varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 性别 sex varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 身份证 id_card_num varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 民族 ethnic varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 学历 edu varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 专业 major varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 毕业学校 graduated varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 院系 college varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 政治面貌 political_status varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 生源地 source_place varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 学生类型 student_type varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 考生号 candidate_num varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 学号 student_num varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 入学日期 enrollment_time varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 毕业时间 graduation_time varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 移动电话 mobile_num varchar(255);
ALTER TABLE crack_daxuesheng CHANGE COLUMN 邮箱 email varchar(255);

ALTER TABLE crack_dnf CHANGE COLUMN password plain_pwd varchar(255);
INSERT INTO `source_info` (`id`, `table_name`,`is_dealed`,`leak_mount`, `leak_sources`,`leak_time`,`insert_time`,`desc`)
VALUES(18,"crack_cnzz", "NO",946454,"cnzz数据库%2B用户资料导出.zip",NULL,now(),NULL);

INSERT INTO `source_info` (`id`, `table_name`,`leak_mount`, `leak_sources`,`leak_time`,`insert_time`,`desc`)
VALUES(19,"crack_dnf", 7333041,"dnf_database.zip",NULL,now(),NULL);


select concat("dnf_",id) as "_id", password as  "plain_pwd" ,  qq as "qq" , 19 as "source" from crack_dnf limit 10;


DROP TABLE IF EXISTS `crack_adobe`;
CREATE TABLE `crack_adobe` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `encrypt_pwd`  varchar(100) NOT NULL,
  `hint` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;

INSERT INTO `source_info` (`id`, `table_name`,`leak_mount`, `leak_sources`,`leak_time`,`insert_time`,`desc`)
VALUES(20,"crack_adobe", 152989496,"adobe.tar.gz",NULL,now(),NULL);



DROP TABLE IF EXISTS `crack_hzcy`;
CREATE TABLE `crack_hzcy` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
   `encrypt_pwd`  varchar(100) NOT NULL,
  `email` varchar(200)  DEFAULT  NULL,
  `mobile_num` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;

INSERT INTO `source_info` (`id`, `table_name`,`leak_mount`, `leak_sources`,`leak_time`,`insert_time`,`desc`)
VALUES(21,"crack_hzcy", 45874,"杭州长运.zip",NULL,now(),NULL);