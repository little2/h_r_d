-- phpMyAdmin SQL Dump
-- version 2.11.9.5
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 建立日期: Aug 21, 2015, 07:57 AM
-- 伺服器版本: 5.6.15
-- PHP 版本: 5.4.24

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 資料庫: `inetar0_hrd`
--

-- --------------------------------------------------------

--
-- 資料表格式： `ability`
--

CREATE TABLE IF NOT EXISTS `ability` (
  `ability_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`ability_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=161 ;

-- --------------------------------------------------------

--
-- 資料表格式： `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `user_name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表格式： `basis_evaluation_appraisee`
--

CREATE TABLE IF NOT EXISTS `basis_evaluation_appraisee` (
  `basis_evaluation_appraisee_id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisee_uid` int(11) NOT NULL,
  `basis_evaluation_table_id` int(11) NOT NULL,
  `basis_evaluation_progress` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_appraisee_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=397 ;

-- --------------------------------------------------------

--
-- 資料表格式： `basis_evaluation_evaluator`
--

CREATE TABLE IF NOT EXISTS `basis_evaluation_evaluator` (
  `basis_evaluation_evaluator_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `basis_evaluation_appraisee_id` int(11) NOT NULL,
  `basis_evaluation_evaluator_uid` int(11) NOT NULL,
  `basis_evaluation_evaluator_relation` int(11) NOT NULL,
  `basis_evaluation_evaluator_progress` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_evaluator_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3567 ;

-- --------------------------------------------------------

--
-- 資料表格式： `basis_evaluation_evaluator_competeny`
--

CREATE TABLE IF NOT EXISTS `basis_evaluation_evaluator_competeny` (
  `basis_evaluation_evaluator_competency_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `basis_evaluation_evaluator_id` int(11) NOT NULL,
  `competency_id` int(11) NOT NULL,
  `evaluation_competency_grade` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_evaluator_competency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10985 ;

-- --------------------------------------------------------

--
-- 資料表格式： `basis_evaluation_evaluator_detail`
--

CREATE TABLE IF NOT EXISTS `basis_evaluation_evaluator_detail` (
  `basis_evaluation_evaluator_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `basis_evaluation_evaluator_id` int(11) NOT NULL,
  `behavior_id` int(11) NOT NULL,
  `evaluation_scale_item_grade` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_evaluator_detail_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74981 ;

-- --------------------------------------------------------

--
-- 資料表格式： `basis_evaluation_open_comment`
--

CREATE TABLE IF NOT EXISTS `basis_evaluation_open_comment` (
  `basis_evaluation_open_comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `basis_evaluation_table_id` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_open_comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 資料表格式： `basis_evaluation_report`
--

CREATE TABLE IF NOT EXISTS `basis_evaluation_report` (
  `basis_evaluation_report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `basis_evaluation_table_id` int(11) NOT NULL,
  `basis_evaluation_report_desc` text NOT NULL,
  PRIMARY KEY (`basis_evaluation_report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 資料表格式： `basis_evaluation_table`
--

CREATE TABLE IF NOT EXISTS `basis_evaluation_table` (
  `basis_evaluation_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `basis_evaluation_table_code` varchar(30) DEFAULT NULL,
  `is_show_competency` varchar(1) NOT NULL,
  `due_date` date NOT NULL,
  `competency_model_id` int(11) DEFAULT '0',
  `evaluation_scale_id` int(11) NOT NULL,
  `basis_evaluation_table_status` varchar(6) NOT NULL,
  `basis_evaluation_table_process` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_table_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- 資料表格式： `basis_evaluation_user_comment`
--

CREATE TABLE IF NOT EXISTS `basis_evaluation_user_comment` (
  `basis_evaluation_user_comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `basis_evaluation_open_comment_id` int(11) NOT NULL,
  `evalutor_uid` int(11) NOT NULL,
  `basis_evaluation_appraisee_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`basis_evaluation_user_comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 資料表格式： `behavior`
--

CREATE TABLE IF NOT EXISTS `behavior` (
  `behavior_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_id` int(11) NOT NULL,
  `weight` decimal(10,1) NOT NULL,
  PRIMARY KEY (`behavior_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=354 ;

-- --------------------------------------------------------

--
-- 資料表格式： `class_evaluation_appraisee`
--

CREATE TABLE IF NOT EXISTS `class_evaluation_appraisee` (
  `class_evaluation_appraisee_id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisee_uid` int(11) NOT NULL,
  `core_competency_model_id` int(10) unsigned NOT NULL,
  `manage_competency_model_id` int(10) unsigned NOT NULL,
  `general_competency_model_id` int(10) unsigned NOT NULL,
  `professional_competency_model_id` int(10) unsigned NOT NULL,
  `class_evaluation_appraisee_stauts` varchar(3) NOT NULL DEFAULT 'EDT',
  PRIMARY KEY (`class_evaluation_appraisee_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- 資料表格式： `class_evaluation_competency`
--

CREATE TABLE IF NOT EXISTS `class_evaluation_competency` (
  `class_evaluation_competency_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_evaluation_appraisee_id` int(11) NOT NULL,
  `competency_id` int(11) NOT NULL,
  `competency_level` int(11) NOT NULL,
  `class_evaluation_competency_status` varchar(3) NOT NULL DEFAULT 'EDT',
  `due_date` date NOT NULL,
  `competency_score` decimal(10,2) NOT NULL,
  `competency_score_adjusted` decimal(10,2) NOT NULL,
  `evaluate_result` varchar(3) NOT NULL,
  `competency_adjusted_date` datetime NOT NULL,
  `competency_grade_date` datetime NOT NULL,
  PRIMARY KEY (`class_evaluation_competency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

-- --------------------------------------------------------

--
-- 資料表格式： `class_evaluation_evaluator`
--

CREATE TABLE IF NOT EXISTS `class_evaluation_evaluator` (
  `class_evaluation_evaluator_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_evaluation_competency_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `weight` int(10) NOT NULL DEFAULT '0',
  `evalutor_score` decimal(10,2) NOT NULL,
  `class_evaluation_evaluator_status` varchar(3) NOT NULL DEFAULT 'EDT',
  `evalutor_score_adjusted` decimal(10,2) NOT NULL,
  `weight_adjusted` int(11) NOT NULL,
  `adjusted_date` datetime NOT NULL,
  PRIMARY KEY (`class_evaluation_evaluator_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

-- --------------------------------------------------------

--
-- 資料表格式： `competency`
--

CREATE TABLE IF NOT EXISTS `competency` (
  `competency_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `competency_type` varchar(10) NOT NULL,
  `competency_method` varchar(30) NOT NULL,
  `competency_model_id` int(10) NOT NULL,
  `competency_weight` decimal(10,1) NOT NULL DEFAULT '1.0',
  `competency_level_number` int(1) NOT NULL,
  PRIMARY KEY (`competency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=154 ;

-- --------------------------------------------------------

--
-- 資料表格式： `competency_dic`
--

CREATE TABLE IF NOT EXISTS `competency_dic` (
  `competency_dic_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_dic_code` varchar(10) DEFAULT NULL,
  `competency_type` varchar(5) NOT NULL,
  PRIMARY KEY (`competency_dic_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

-- --------------------------------------------------------

--
-- 資料表格式： `competency_dic_course`
--

CREATE TABLE IF NOT EXISTS `competency_dic_course` (
  `competency_dic_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_dic_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`competency_dic_course_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 資料表格式： `competency_evaluation`
--

CREATE TABLE IF NOT EXISTS `competency_evaluation` (
  `competency_evaluation_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`competency_evaluation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 資料表格式： `competency_level`
--

CREATE TABLE IF NOT EXISTS `competency_level` (
  `competency_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_id` int(11) NOT NULL,
  `competency_level` int(11) NOT NULL,
  PRIMARY KEY (`competency_level_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=155 ;

-- --------------------------------------------------------

--
-- 資料表格式： `competency_model`
--

CREATE TABLE IF NOT EXISTS `competency_model` (
  `competency_model_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_model_count` int(11) DEFAULT '0',
  `competency_model_type` varchar(10) NOT NULL,
  `competency_model_method` varchar(10) NOT NULL,
  `competency_level_number` int(1) DEFAULT '0',
  PRIMARY KEY (`competency_model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

-- --------------------------------------------------------

--
-- 資料表格式： `competency_model_standard`
--

CREATE TABLE IF NOT EXISTS `competency_model_standard` (
  `competency_model_id` int(11) NOT NULL,
  `update_date` datetime NOT NULL,
  `maintainer_uid` int(11) NOT NULL,
  PRIMARY KEY (`competency_model_id`),
  UNIQUE KEY `competency_model_id` (`competency_model_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表格式： `course_property`
--

CREATE TABLE IF NOT EXISTS `course_property` (
  `course_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_code` varchar(20) DEFAULT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=150 ;

-- --------------------------------------------------------

--
-- 資料表格式： `evaluation_relation`
--

CREATE TABLE IF NOT EXISTS `evaluation_relation` (
  `evaluation_relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_relation_code` varchar(10) NOT NULL,
  PRIMARY KEY (`evaluation_relation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 資料表格式： `evaluation_scale`
--

CREATE TABLE IF NOT EXISTS `evaluation_scale` (
  `evaluation_scale_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_scale_item_count` int(11) NOT NULL,
  `evaluation_scale_basis` decimal(10,2) NOT NULL,
  `evaluation_scale_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`evaluation_scale_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 資料表格式： `evaluation_scale_item`
--

CREATE TABLE IF NOT EXISTS `evaluation_scale_item` (
  `evaluation_scale_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_scale_id` int(11) NOT NULL,
  `evaluation_scale_item_sort` int(11) NOT NULL,
  `evaluation_scale_item_grade` int(11) NOT NULL,
  `evaluation_scale_item_self` varchar(1) NOT NULL DEFAULT 'T',
  PRIMARY KEY (`evaluation_scale_item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 資料表格式： `favorite_url`
--

CREATE TABLE IF NOT EXISTS `favorite_url` (
  `favorite_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `favorite_title` varchar(50) NOT NULL,
  `favorite_url` varchar(200) NOT NULL,
  PRIMARY KEY (`favorite_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 資料表格式： `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `groups_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groups_code` varchar(20) NOT NULL,
  PRIMARY KEY (`groups_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=102 ;

-- --------------------------------------------------------

--
-- 資料表格式： `group_member`
--

CREATE TABLE IF NOT EXISTS `group_member` (
  `group_member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `role` varchar(3) NOT NULL,
  PRIMARY KEY (`group_member_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=77 ;

-- --------------------------------------------------------

--
-- 資料表格式： `group_property`
--

CREATE TABLE IF NOT EXISTS `group_property` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_type` varchar(3) NOT NULL DEFAULT 'dep',
  `group_title` varchar(30) NOT NULL,
  `group_parent_id` int(10) unsigned NOT NULL,
  `group_code` varchar(30) DEFAULT NULL,
  `group_level` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=956 ;

-- --------------------------------------------------------

--
-- 資料表格式： `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_family_id` int(10) unsigned DEFAULT NULL,
  `job_level` int(10) unsigned DEFAULT NULL,
  `job_type_id` int(10) unsigned DEFAULT NULL,
  `core_competency_model_id` int(10) unsigned DEFAULT NULL,
  `manage_competency_model_id` int(11) unsigned DEFAULT NULL,
  `general_competency_model_id` int(11) unsigned DEFAULT NULL,
  `professional_competency_model_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

-- --------------------------------------------------------

--
-- 資料表格式： `job_competency`
--

CREATE TABLE IF NOT EXISTS `job_competency` (
  `job_competency_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `competency_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`job_competency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=133 ;

-- --------------------------------------------------------

--
-- 資料表格式： `job_family`
--

CREATE TABLE IF NOT EXISTS `job_family` (
  `job_family_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`job_family_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- 資料表格式： `job_type`
--

CREATE TABLE IF NOT EXISTS `job_type` (
  `job_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_type_code` varchar(10) NOT NULL,
  PRIMARY KEY (`job_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 資料表格式： `mail_poll`
--

CREATE TABLE IF NOT EXISTS `mail_poll` (
  `mail_poll_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mail_tpl_id` int(11) NOT NULL,
  `receive_datetime` datetime NOT NULL,
  `sent_datetime` datetime NOT NULL,
  `attachment` text NOT NULL,
  `mail_title` varchar(100) NOT NULL,
  `mail_to` varchar(100) NOT NULL,
  `mail_cc` varchar(100) NOT NULL,
  `mail_bcc` varchar(100) NOT NULL,
  `mail_content` text NOT NULL,
  `mail_attachment` varchar(100) NOT NULL,
  `mail_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`mail_poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 資料表格式： `majoy_company`
--

CREATE TABLE IF NOT EXISTS `majoy_company` (
  `majoy_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_update` int(1) DEFAULT NULL,
  PRIMARY KEY (`majoy_company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 資料表格式： `menu_structure`
--

CREATE TABLE IF NOT EXISTS `menu_structure` (
  `menuCode` varchar(10) NOT NULL,
  `active_status` varchar(1) NOT NULL DEFAULT 'T',
  `menuIndex` tinyint(1) NOT NULL DEFAULT '1',
  `menuName` varchar(30) NOT NULL,
  `menuNote` varchar(4) NOT NULL DEFAULT 'NOTE',
  `menuType` varchar(1) NOT NULL DEFAULT '1',
  `menuUrl` varchar(100) NOT NULL,
  `parentId` varchar(10) NOT NULL,
  `level` tinyint(1) NOT NULL,
  PRIMARY KEY (`menuCode`),
  UNIQUE KEY `menuCode` (`menuCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表格式： `org_company`
--

CREATE TABLE IF NOT EXISTS `org_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `groups_id` int(11) NOT NULL,
  `company_code` varchar(20) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=102 ;

-- --------------------------------------------------------

--
-- 資料表格式： `profile_behavior`
--

CREATE TABLE IF NOT EXISTS `profile_behavior` (
  `profile_behavior_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `behavior_id` int(11) NOT NULL,
  `behavior_arithmetic_avg` decimal(10,2) NOT NULL,
  `behavior_geometric_avg` decimal(10,2) NOT NULL,
  PRIMARY KEY (`profile_behavior_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8431 ;

-- --------------------------------------------------------

--
-- 資料表格式： `profile_behavior_detail`
--

CREATE TABLE IF NOT EXISTS `profile_behavior_detail` (
  `profile_behavior_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `behavior_id` int(11) NOT NULL,
  `evaluation_relation_id` int(11) NOT NULL,
  `behavior_arithmetic_avg` decimal(10,2) NOT NULL,
  `behavior_geometric_avg` decimal(10,2) NOT NULL,
  PRIMARY KEY (`profile_behavior_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30601 ;

-- --------------------------------------------------------

--
-- 資料表格式： `profile_competency`
--

CREATE TABLE IF NOT EXISTS `profile_competency` (
  `profile_competency_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `competency_id` int(11) NOT NULL,
  `competency_level` int(11) NOT NULL,
  `arithmetic_avg` decimal(10,2) NOT NULL,
  `geometric_avg` decimal(10,2) NOT NULL,
  PRIMARY KEY (`profile_competency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1687 ;

-- --------------------------------------------------------

--
-- 資料表格式： `profile_competency_detail`
--

CREATE TABLE IF NOT EXISTS `profile_competency_detail` (
  `profile_competency_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `evaluation_relation_id` int(11) NOT NULL,
  `competency_id` int(11) NOT NULL,
  `competency_level` int(11) NOT NULL,
  `arithmetic_avg` decimal(10,2) NOT NULL,
  `geometric_avg` decimal(10,2) NOT NULL,
  PRIMARY KEY (`profile_competency_detail_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6121 ;

-- --------------------------------------------------------

--
-- 資料表格式： `profile_competency_model`
--

CREATE TABLE IF NOT EXISTS `profile_competency_model` (
  `profile_competency_model_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `competency_model_id` int(11) NOT NULL,
  `arithmetic_avg` decimal(10,2) NOT NULL,
  `geometric_avg` decimal(10,2) NOT NULL,
  PRIMARY KEY (`profile_competency_model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 資料表格式： `report_company`
--

CREATE TABLE IF NOT EXISTS `report_company` (
  `report_company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_title_id` int(10) NOT NULL,
  `company_id` int(11) NOT NULL,
  `report_config_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`report_company_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 資料表格式： `report_config`
--

CREATE TABLE IF NOT EXISTS `report_config` (
  `report_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_config_desc` text NOT NULL,
  `method` varchar(10) NOT NULL,
  `id` int(11) NOT NULL,
  `basis_evaluation_table_id` int(11) NOT NULL,
  `base_value` decimal(10,2) NOT NULL,
  `avg_method` varchar(10) NOT NULL,
  `report_config_code` varchar(30) NOT NULL,
  `report_update` datetime NOT NULL,
  `threshold_interval` decimal(10,2) NOT NULL,
  `block_interval` decimal(10,2) NOT NULL,
  `interval_count` int(10) NOT NULL,
  PRIMARY KEY (`report_config_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 資料表格式： `report_group`
--

CREATE TABLE IF NOT EXISTS `report_group` (
  `report_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_title_id` int(10) NOT NULL,
  `group_id` int(11) NOT NULL,
  `report_config_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `comparison_group_id` int(11) NOT NULL DEFAULT '0',
  `population_group_id` int(11) NOT NULL DEFAULT '0',
  `job_id_str` text NOT NULL,
  PRIMARY KEY (`report_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

-- --------------------------------------------------------

--
-- 資料表格式： `report_personal`
--

CREATE TABLE IF NOT EXISTS `report_personal` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_title_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `report_config_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=536 ;

-- --------------------------------------------------------

--
-- 資料表格式： `report_title`
--

CREATE TABLE IF NOT EXISTS `report_title` (
  `report_title_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_title` varchar(30) NOT NULL,
  `report_type` varchar(30) NOT NULL,
  `report_method` varchar(30) NOT NULL,
  `report_kind` varchar(30) NOT NULL,
  `report_filename` varchar(50) NOT NULL,
  PRIMARY KEY (`report_title_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

-- --------------------------------------------------------

--
-- 資料表格式： `smtp`
--

CREATE TABLE IF NOT EXISTS `smtp` (
  `smtp_account` varchar(30) NOT NULL,
  `smtp_password` varchar(30) NOT NULL,
  `smtp_server` varchar(30) NOT NULL,
  `smtp_ssl` varchar(1) NOT NULL,
  `smtp_port` int(3) NOT NULL,
  UNIQUE KEY `smtp_server` (`smtp_server`),
  KEY `smtp_server_2` (`smtp_server`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表格式： `term`
--

CREATE TABLE IF NOT EXISTS `term` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term_title` varchar(50) NOT NULL,
  `depend_on_id` int(10) NOT NULL,
  `term_language` varchar(10) NOT NULL,
  `term_content` varchar(100) NOT NULL,
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4251 ;

-- --------------------------------------------------------

--
-- 資料表格式： `text`
--

CREATE TABLE IF NOT EXISTS `text` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term_title` varchar(30) NOT NULL,
  `depend_on_id` int(10) NOT NULL,
  `term_language` varchar(10) NOT NULL,
  `text_content` text NOT NULL,
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4153 ;

-- --------------------------------------------------------

--
-- 資料表格式： `tpl`
--

CREATE TABLE IF NOT EXISTS `tpl` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tpl_title` varchar(100) NOT NULL,
  `tpl_sender` varchar(100) NOT NULL,
  `tpl_content` text NOT NULL,
  `tpl_trigger` varchar(10) NOT NULL,
  PRIMARY KEY (`tpl_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 資料表格式： `training_material`
--

CREATE TABLE IF NOT EXISTS `training_material` (
  `training_material_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_material_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- 資料表格式： `training_method`
--

CREATE TABLE IF NOT EXISTS `training_method` (
  `training_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_method_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

-- --------------------------------------------------------

--
-- 資料表格式： `training_teacher`
--

CREATE TABLE IF NOT EXISTS `training_teacher` (
  `training_teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_teacher_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

-- --------------------------------------------------------

--
-- 資料表格式： `user_power`
--

CREATE TABLE IF NOT EXISTS `user_power` (
  `user_power_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `power_code` varchar(20) NOT NULL,
  PRIMARY KEY (`user_power_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 資料表格式： `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullName` varchar(10) NOT NULL,
  `user_name_chs` varchar(10) NOT NULL,
  `user_name_eng` varchar(10) DEFAULT NULL,
  `user_mps` varchar(6) NOT NULL,
  `name` varchar(40) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `birth_day` int(10) unsigned NOT NULL,
  `birth_month` int(10) unsigned NOT NULL,
  `birth_year` int(10) unsigned NOT NULL,
  `gender` varchar(10) NOT NULL,
  `job_title` varchar(15) NOT NULL,
  `company_id` int(11) NOT NULL,
  `notes` text NOT NULL,
  `city_code` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `url` text NOT NULL,
  `office_phone` varchar(30) NOT NULL,
  `home_phone` varchar(30) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `image` varchar(50) NOT NULL,
  `power_type` varchar(5) NOT NULL,
  `account_status` varchar(1) NOT NULL DEFAULT 'T',
  `job_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_code` varchar(10) NOT NULL,
  `login_count` int(10) unsigned NOT NULL,
  `login_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10934 ;

-- --------------------------------------------------------

--
-- 資料表格式： `user_sso`
--

CREATE TABLE IF NOT EXISTS `user_sso` (
  `user_email_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) NOT NULL,
  `user_live_id` varchar(20) NOT NULL,
  `user_fb_id` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_account` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`user_email_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8349 ;
