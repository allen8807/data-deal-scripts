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
