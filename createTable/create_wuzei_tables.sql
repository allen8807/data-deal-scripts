CREATE DATABASE `wuzei_core` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
/*是否可以做成模板的形式?*/
DROP TABLE IF EXISTS `crack_sources_info`;
CREATE TABLE `crack_sources_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(200) NOT NULL,
  `leak_sources` varchar(200) NOT NULL,
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

DROP TABLE IF EXISTS `crack_163_com`;
CREATE TABLE `crack_163_com` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `plain_pwd`  varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 collate utf8_general_ci;


INSERT INTO `crack_sources_info` ( `table_name`, `leak_sources`,`leak_time`,`insert_time`)
VALUES("crack_csdn","www.csdn.net.sql",NULL,now());