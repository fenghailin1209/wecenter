CREATE TABLE `aws_weixin_accounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weixin_mp_token` varchar(255) NOT NULL,
  `weixin_account_role` varchar(20) DEFAULT 'base',
  `weixin_app_id` varchar(255) DEFAULT '',
  `weixin_app_secret` varchar(255) DEFAULT '',
  `wecenter_access_token` varchar(255) DEFAULT '',
  `wecenter_access_secret` varchar(255) DEFAULT '',
  `weixin_mp_menu` text,
  PRIMARY KEY (`id`),
  KEY `weixin_mp_token` (`weixin_mp_token`),
  KEY `weixin_account_role` (`weixin_account_role`),
  KEY `weixin_app_id` (`weixin_app_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='微信多账号设置';

CREATE TABLE `aws_weixin_msg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_id` bigint(20) NOT NULL,
  `group_name` varchar(255) NOT NULL DEFAULT '未分组',
  `status` varchar(15) NOT NULL DEFAULT 'unsent',
  `error_num` int(10) DEFAULT NULL,
  `articles_info` text,
  `questions_info` text,
  `create_time` int(10) NOT NULL,
  `filter_count` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `msg_id` (`msg_id`),
  KEY `group_name` (`group_name`),
  KEY `status` (`status`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='微信群发列表';

CREATE TABLE `aws_weibo_msg` (
  `id` bigint(30) NOT NULL,
  `created_at` int(10) NOT NULL,
  `msg_author_uid` bigint(20) NOT NULL,
  `text` varchar(255) NOT NULL,
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL,
  `weibo_uid` bigint(20) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY `id` (`id`),
  KEY `created_at` (`created_at`),
  KEY `uid` (`uid`),
  KEY `weibo_uid` (`weibo_uid`),
  KEY `question_id` (`question_id`)
) ENGINE=inndb DEFAULT CHARSET=utf8 COMMENT='新浪微博消息列表';

INSERT INTO `aws_system_setting` (`varname`, `value`) VALUES ('weibo_msg_published_uid', 's:0:"";');

ALTER TABLE `aws_question` ADD `weibo_msg_id` bigint(30) DEFAULT NULL;
CREATE INDEX `weibo_msg_id` ON `aws_question` (`weibo_msg_id`);

ALTER TABLE `aws_users_sina` ADD `last_msg_id` bigint(30) DEFAULT NULL;
CREATE INDEX `last_msg_id` ON `aws_users_sina` (`last_msg_id`);
