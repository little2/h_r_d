-- phpMyAdmin SQL Dump
-- version 2.11.9.5
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 建立日期: Feb 24, 2015, 08:30 AM
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 列出以下資料庫的數據： `ability`
--

INSERT INTO `ability` (`ability_id`, `competency_level_id`) VALUES
(5, 14),
(6, 14),
(7, 20),
(8, 20),
(9, 24);

-- --------------------------------------------------------

--
-- 資料表格式： `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `user_name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `account`
--


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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `basis_evaluation_appraisee`
--


-- --------------------------------------------------------

--
-- 資料表格式： `basis_evaluation_evaluator`
--

CREATE TABLE IF NOT EXISTS `basis_evaluation_evaluator` (
  `basis_evaluation_evaluator_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `basis_evaluation_appraisee_id` int(11) NOT NULL,
  `basis_evaluation_evaluator_uid` int(11) NOT NULL,
  `basis_evaluation_evaluator_relation` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_evaluator_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `basis_evaluation_evaluator`
--


-- --------------------------------------------------------

--
-- 資料表格式： `basis_evaluation_table`
--

CREATE TABLE IF NOT EXISTS `basis_evaluation_table` (
  `basis_evaluation_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `basis_evaluation_table_code` varchar(30) DEFAULT NULL,
  `is_show_competency` varchar(1) NOT NULL,
  `due_date` date NOT NULL,
  `competency_model_id` int(11) NOT NULL,
  `evaluation_scale_id` int(11) NOT NULL,
  `basis_evaluation_table_status` varchar(6) NOT NULL,
  PRIMARY KEY (`basis_evaluation_table_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 列出以下資料庫的數據： `basis_evaluation_table`
--

INSERT INTO `basis_evaluation_table` (`basis_evaluation_table_id`, `basis_evaluation_table_code`, `is_show_competency`, `due_date`, `competency_model_id`, `evaluation_scale_id`, `basis_evaluation_table_status`) VALUES
(3, '', 'F', '2015-01-25', 33, 0, '');

-- --------------------------------------------------------

--
-- 資料表格式： `behavior`
--

CREATE TABLE IF NOT EXISTS `behavior` (
  `behavior_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_id` int(11) NOT NULL,
  `weight` decimal(10,1) NOT NULL,
  PRIMARY KEY (`behavior_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 列出以下資料庫的數據： `behavior`
--

INSERT INTO `behavior` (`behavior_id`, `competency_id`, `weight`) VALUES
(17, 53, 1.0),
(15, 53, 1.0),
(16, 53, 1.0),
(19, 53, 1.0),
(20, 53, 1.0),
(21, 54, 1.0),
(22, 54, 1.0),
(23, 54, 1.0),
(24, 54, 1.0),
(25, 54, 1.0),
(26, 55, 1.0),
(27, 55, 1.0),
(28, 55, 1.0),
(29, 55, 1.0),
(30, 55, 1.0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 列出以下資料庫的數據： `class_evaluation_appraisee`
--

INSERT INTO `class_evaluation_appraisee` (`class_evaluation_appraisee_id`, `appraisee_uid`, `core_competency_model_id`, `manage_competency_model_id`, `general_competency_model_id`, `professional_competency_model_id`, `class_evaluation_appraisee_stauts`) VALUES
(1, 3, 0, 0, 0, 0, 'PUB'),
(2, 8, 0, 0, 0, 0, 'EDT');

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
  PRIMARY KEY (`class_evaluation_competency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- 列出以下資料庫的數據： `class_evaluation_competency`
--

INSERT INTO `class_evaluation_competency` (`class_evaluation_competency_id`, `class_evaluation_appraisee_id`, `competency_id`, `competency_level`, `class_evaluation_competency_status`, `due_date`) VALUES
(4, 2, 56, 5, 'REV', '0000-00-00'),
(5, 1, 63, 3, 'REV', '0000-00-00');

-- --------------------------------------------------------

--
-- 資料表格式： `class_evaluation_evaluator`
--

CREATE TABLE IF NOT EXISTS `class_evaluation_evaluator` (
  `class_evaluation_evaluator_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_evaluation_competency_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `weight` int(10) NOT NULL DEFAULT '0',
  `class_evaluation_evaluator_status` varchar(3) CHARACTER SET utf8 NOT NULL DEFAULT 'EDT' COMMENT 'EDT/REW/PAS',
  PRIMARY KEY (`class_evaluation_evaluator_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- 列出以下資料庫的數據： `class_evaluation_evaluator`
--

INSERT INTO `class_evaluation_evaluator` (`class_evaluation_evaluator_id`, `class_evaluation_competency_id`, `user_id`, `weight`, `class_evaluation_evaluator_status`) VALUES
(4, 4, 10, 20, 'EDT'),
(2, 4, 11, 70, 'PAS'),
(6, 4, 7, 10, 'EDT'),
(7, 5, 10, 100, 'EDT');

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
  PRIMARY KEY (`competency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- 列出以下資料庫的數據： `competency`
--

INSERT INTO `competency` (`competency_id`, `competency_type`, `competency_method`, `competency_model_id`, `competency_weight`) VALUES
(53, 'M', 'B', 33, 1.0),
(54, 'M', 'B', 33, 1.0),
(55, 'M', 'B', 33, 1.0),
(56, 'P', 'C', 34, 0.0),
(57, 'P', 'C', 34, 0.0),
(58, 'P', 'C', 34, 0.0),
(59, 'P', 'C', 34, 0.0),
(60, 'P', 'C', 34, 0.0),
(61, 'P', 'C', 34, 0.0),
(62, 'P', 'C', 34, 0.0),
(63, 'M', 'C', 35, 0.0),
(64, 'M', 'C', 35, 0.0);

-- --------------------------------------------------------

--
-- 資料表格式： `competency_evaluation`
--

CREATE TABLE IF NOT EXISTS `competency_evaluation` (
  `competency_evaluation_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`competency_evaluation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 列出以下資料庫的數據： `competency_evaluation`
--

INSERT INTO `competency_evaluation` (`competency_evaluation_id`, `competency_level_id`) VALUES
(7, 14),
(8, 20),
(9, 21),
(10, 22),
(11, 24);

-- --------------------------------------------------------

--
-- 資料表格式： `competency_level`
--

CREATE TABLE IF NOT EXISTS `competency_level` (
  `competency_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_id` int(11) NOT NULL,
  `competency_level` int(11) NOT NULL,
  PRIMARY KEY (`competency_level_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- 列出以下資料庫的數據： `competency_level`
--

INSERT INTO `competency_level` (`competency_level_id`, `competency_id`, `competency_level`) VALUES
(14, 0, 1),
(18, 0, 3),
(17, 0, 2),
(19, 0, 4),
(20, 56, 1),
(21, 56, 2),
(22, 56, 3),
(23, 56, 4),
(24, 56, 5),
(25, 63, 1),
(26, 63, 2),
(27, 63, 3),
(28, 63, 4),
(29, 63, 5);

-- --------------------------------------------------------

--
-- 資料表格式： `competency_model`
--

CREATE TABLE IF NOT EXISTS `competency_model` (
  `competency_model_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_model_count` int(11) NOT NULL,
  `competency_model_type` varchar(10) NOT NULL,
  `competency_model_method` varchar(10) NOT NULL COMMENT '���Ũ�ΰ�Ǩ�',
  PRIMARY KEY (`competency_model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- 列出以下資料庫的數據： `competency_model`
--

INSERT INTO `competency_model` (`competency_model_id`, `competency_model_count`, `competency_model_type`, `competency_model_method`) VALUES
(33, 3, 'M', 'B'),
(34, 7, 'P', 'C'),
(35, 2, 'M', 'C');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 列出以下資料庫的數據： `competency_model_standard`
--

INSERT INTO `competency_model_standard` (`competency_model_id`, `update_date`, `maintainer_uid`) VALUES
(34, '0000-00-00 00:00:00', 0),
(35, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- 資料表格式： `course_property`
--

CREATE TABLE IF NOT EXISTS `course_property` (
  `course_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_code` varchar(20) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- 列出以下資料庫的數據： `course_property`
--

INSERT INTO `course_property` (`course_id`, `course_code`, `catalog_id`, `competency_level_id`) VALUES
(52, '', 0, 14),
(53, '', 0, 14);

-- --------------------------------------------------------

--
-- 資料表格式： `evaluation_relation`
--

CREATE TABLE IF NOT EXISTS `evaluation_relation` (
  `evaluation_relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_relation_code` varchar(10) NOT NULL,
  PRIMARY KEY (`evaluation_relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `evaluation_relation`
--


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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `evaluation_scale`
--


-- --------------------------------------------------------

--
-- 資料表格式： `evaluation_scale_item`
--

CREATE TABLE IF NOT EXISTS `evaluation_scale_item` (
  `evaluation_scale_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_scale_id` int(11) NOT NULL,
  `evaluation_scale_item_sort` int(11) NOT NULL,
  `evaluation_scale_item_grade` int(11) NOT NULL,
  `evaluation_scale_item_self` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'T',
  PRIMARY KEY (`evaluation_scale_item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `evaluation_scale_item`
--


-- --------------------------------------------------------

--
-- 資料表格式： `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `groups_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groups_code` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`groups_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `groups`
--


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `group_member`
--


-- --------------------------------------------------------

--
-- 資料表格式： `group_property`
--

CREATE TABLE IF NOT EXISTS `group_property` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_type` varchar(3) NOT NULL COMMENT 'S:系統 D:部門 N:一般',
  `group_title` varchar(30) NOT NULL,
  `group_parent_id` int(10) unsigned NOT NULL,
  `group_code` varchar(30) NOT NULL,
  `group_level` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 列出以下資料庫的數據： `group_property`
--

INSERT INTO `group_property` (`group_id`, `group_type`, `group_title`, `group_parent_id`, `group_code`, `group_level`, `company_id`) VALUES
(1, 'dep', '', 0, '', 0, 1),
(2, 'dep', '', 1, '', 0, 1);

-- --------------------------------------------------------

--
-- 資料表格式： `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_family_id` int(10) unsigned DEFAULT NULL COMMENT '職系',
  `job_level` int(10) unsigned DEFAULT NULL COMMENT '職等',
  `job_type_id` int(10) unsigned DEFAULT NULL COMMENT '工作類別',
  `core_competency_model_id` int(10) unsigned DEFAULT NULL,
  `manage_competency_model_id` int(11) unsigned DEFAULT NULL,
  `general_competency_model_id` int(11) unsigned DEFAULT NULL,
  `professional_competency_model_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 列出以下資料庫的數據： `job`
--

INSERT INTO `job` (`job_id`, `job_family_id`, `job_level`, `job_type_id`, `core_competency_model_id`, `manage_competency_model_id`, `general_competency_model_id`, `professional_competency_model_id`) VALUES
(13, 6, 3, 5, NULL, 35, NULL, 0),
(14, 6, 3, 5, NULL, 33, NULL, 0),
(15, 6, 4, 0, NULL, NULL, NULL, 0),
(16, 6, 5, 0, NULL, NULL, NULL, 0),
(17, 6, 6, 0, NULL, NULL, NULL, 0),
(18, 6, 7, 0, NULL, NULL, NULL, 0),
(19, 7, 3, 0, NULL, NULL, NULL, 0),
(20, 7, 3, 0, NULL, NULL, NULL, 0),
(25, 7, 6, 0, NULL, NULL, NULL, 0),
(26, 8, 2, 0, NULL, NULL, NULL, 0),
(27, 8, 3, 0, NULL, NULL, NULL, 0),
(28, 8, 3, 0, NULL, NULL, NULL, 0),
(29, 8, 4, 0, NULL, NULL, NULL, 0),
(30, 8, 4, 0, NULL, NULL, NULL, 0),
(31, 8, 5, 0, NULL, NULL, NULL, 0),
(32, 8, 5, 0, NULL, NULL, NULL, 0),
(33, 8, 6, 0, NULL, NULL, NULL, 0),
(34, 0, 0, 0, NULL, NULL, NULL, 0),
(35, 7, 4, 0, NULL, NULL, NULL, 34),
(36, 7, 4, 0, NULL, NULL, NULL, 34),
(37, 7, 5, 0, NULL, NULL, NULL, 34),
(38, 7, 5, 7, NULL, NULL, NULL, 34);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- 列出以下資料庫的數據： `job_competency`
--

INSERT INTO `job_competency` (`job_competency_id`, `job_id`, `competency_id`, `level`) VALUES
(10, 35, 56, 3),
(11, 35, 57, 2),
(12, 35, 58, 3),
(13, 35, 59, 3),
(14, 35, 60, 2),
(15, 35, 61, 2),
(16, 35, 62, 3),
(17, 36, 56, 3),
(18, 36, 57, 4),
(19, 36, 58, 3),
(20, 36, 59, 3),
(21, 36, 60, 2),
(22, 36, 61, 3),
(23, 36, 62, 3),
(24, 37, 56, 1),
(25, 37, 57, 1),
(26, 37, 58, 1),
(27, 37, 59, 1),
(28, 37, 60, 1),
(29, 37, 61, 2),
(30, 37, 62, 2),
(31, 38, 56, 5),
(32, 38, 57, 5),
(33, 38, 58, 1),
(34, 38, 59, 2),
(35, 38, 60, 3),
(36, 38, 61, 5),
(37, 38, 62, 5),
(38, 13, 63, 3),
(39, 13, 64, 2);

-- --------------------------------------------------------

--
-- 資料表格式： `job_family`
--

CREATE TABLE IF NOT EXISTS `job_family` (
  `job_family_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`job_family_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 列出以下資料庫的數據： `job_family`
--

INSERT INTO `job_family` (`job_family_id`, `company_id`) VALUES
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1);

-- --------------------------------------------------------

--
-- 資料表格式： `job_type`
--

CREATE TABLE IF NOT EXISTS `job_type` (
  `job_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_type_code` varchar(10) NOT NULL,
  PRIMARY KEY (`job_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- 列出以下資料庫的數據： `job_type`
--

INSERT INTO `job_type` (`job_type_id`, `job_type_code`) VALUES
(5, ''),
(6, ''),
(7, '');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `majoy_company`
--


-- --------------------------------------------------------

--
-- 資料表格式： `org_company`
--

CREATE TABLE IF NOT EXISTS `org_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `groups_id` int(11) NOT NULL,
  `company_code` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `org_company`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=763 ;

--
-- 列出以下資料庫的數據： `term`
--

INSERT INTO `term` (`term_id`, `term_title`, `depend_on_id`, `term_language`, `term_content`) VALUES
(496, 'competency_model_title', 33, 'tw', '中層管理職能模型'),
(497, 'competency_model_title', 33, 'cn', '中層管理職能模型'),
(498, 'competency_model_title', 33, 'en', ''),
(499, 'competency_title', 53, 'tw', '目標設定'),
(500, 'competency_title', 53, 'cn', '目标设定'),
(501, 'competency_title', 53, 'en', ''),
(502, 'competency_title', 54, 'tw', '計畫組織'),
(503, 'competency_title', 54, 'cn', '计划组织'),
(504, 'competency_title', 54, 'en', ''),
(505, 'competency_title', 55, 'tw', '團隊建立'),
(506, 'competency_title', 55, 'cn', '团队建立'),
(507, 'competency_title', 55, 'en', ''),
(508, 'training_teacher', 19, 'tw', '林雙桂'),
(509, 'training_teacher', 19, 'cn', ''),
(510, 'training_teacher', 19, 'en', ''),
(511, 'course_title', 52, 'tw', '團隊目標設定技巧'),
(512, 'course_title', 52, 'cn', ''),
(513, 'course_title', 52, 'en', ''),
(514, 'course_title', 53, 'tw', '目標設定實務研習'),
(515, 'course_title', 53, 'cn', ''),
(516, 'course_title', 53, 'en', ''),
(517, 'competency_model_title', 0, 'tw', '資訊專業職能模型'),
(518, 'competency_model_title', 0, 'cn', ''),
(519, 'competency_model_title', 0, 'en', ''),
(520, 'competency_model_title', 34, 'tw', '資訊專業職能模型'),
(521, 'competency_model_title', 34, 'cn', ''),
(522, 'competency_model_title', 34, 'en', ''),
(523, 'competency_model_title', 0, 'tw', '測試專業職能模型'),
(524, 'competency_model_title', 0, 'cn', ''),
(525, 'competency_model_title', 0, 'en', ''),
(526, 'competency_title', 56, 'tw', '系統整合與導入'),
(527, 'competency_title', 56, 'cn', ''),
(528, 'competency_title', 56, 'en', ''),
(529, 'competency_title', 57, 'tw', '系統分析'),
(530, 'competency_title', 57, 'cn', ''),
(531, 'competency_title', 57, 'en', ''),
(532, 'competency_title', 58, 'tw', '程式設計能力-程序導向'),
(533, 'competency_title', 58, 'cn', ''),
(534, 'competency_title', 58, 'en', ''),
(535, 'competency_title', 59, 'tw', '程式設計能力-物件導向'),
(536, 'competency_title', 59, 'cn', ''),
(537, 'competency_title', 59, 'en', ''),
(538, 'competency_title', 60, 'tw', '作業系統管理'),
(539, 'competency_title', 60, 'cn', ''),
(540, 'competency_title', 60, 'en', ''),
(541, 'competency_title', 61, 'tw', '網路建置維護'),
(542, 'competency_title', 61, 'cn', ''),
(543, 'competency_title', 61, 'en', ''),
(544, 'competency_title', 62, 'tw', '資訊安全管理'),
(545, 'competency_title', 62, 'cn', ''),
(546, 'competency_title', 62, 'en', ''),
(547, 'competency_level_title', 14, 'tw', '基礎'),
(548, 'competency_level_title', 14, 'cn', ''),
(549, 'competency_level_title', 14, 'en', ''),
(550, 'competency_level_title', 17, 'tw', '精通'),
(551, 'competency_level_title', 17, 'cn', ''),
(552, 'competency_level_title', 17, 'en', ''),
(553, 'competency_level_title', 18, 'tw', '精進'),
(554, 'competency_level_title', 18, 'cn', ''),
(555, 'competency_level_title', 18, 'en', ''),
(556, 'competency_level_title', 19, 'tw', '專家'),
(557, 'competency_level_title', 19, 'cn', ''),
(558, 'competency_level_title', 19, 'en', ''),
(559, 'ability_title', 5, 'tw', '基礎'),
(560, 'ability_title', 5, 'cn', ''),
(561, 'ability_title', 5, 'en', ''),
(562, 'ability_title', 6, 'tw', '基礎'),
(563, 'ability_title', 6, 'cn', ''),
(564, 'ability_title', 6, 'en', ''),
(565, 'job_family_title', 6, 'tw', '業務'),
(566, 'job_family_title', 6, 'cn', ''),
(567, 'job_family_title', 6, 'en', ''),
(568, 'job_type_title', 5, 'tw', '生技'),
(569, 'job_type_title', 5, 'cn', ''),
(570, 'job_type_title', 5, 'en', ''),
(571, 'job_type_title', 6, 'tw', '工程'),
(572, 'job_type_title', 6, 'cn', ''),
(573, 'job_type_title', 6, 'en', ''),
(574, 'job_type_title', 7, 'tw', '開發'),
(575, 'job_type_title', 7, 'cn', ''),
(576, 'job_type_title', 7, 'en', ''),
(577, 'job_family_title', 7, 'tw', '工程師'),
(578, 'job_family_title', 7, 'cn', ''),
(579, 'job_family_title', 7, 'en', ''),
(580, 'job_family_title', 8, 'tw', '行政'),
(581, 'job_family_title', 8, 'cn', ''),
(582, 'job_family_title', 8, 'en', ''),
(583, 'job_family_title', 9, 'tw', '測試員'),
(584, 'job_family_title', 9, 'cn', ''),
(585, 'job_family_title', 9, 'en', ''),
(586, 'job_family_title', 10, 'tw', '外務員'),
(587, 'job_family_title', 10, 'cn', ''),
(588, 'job_family_title', 10, 'en', ''),
(589, 'job_family_title', 11, 'tw', '檢驗員'),
(590, 'job_family_title', 11, 'cn', ''),
(591, 'job_family_title', 11, 'en', ''),
(592, 'job_title', 13, 'tw', '助理業務員'),
(593, 'job_title', 13, 'cn', ''),
(594, 'job_title', 13, 'en', ''),
(595, 'job_title', 14, 'tw', '業務員'),
(596, 'job_title', 14, 'cn', ''),
(597, 'job_title', 14, 'en', ''),
(598, 'job_title', 15, 'tw', '一級業務員'),
(599, 'job_title', 15, 'cn', ''),
(600, 'job_title', 15, 'en', ''),
(601, 'job_title', 16, 'tw', '高級業務員'),
(602, 'job_title', 16, 'cn', ''),
(603, 'job_title', 16, 'en', ''),
(604, 'job_title', 17, 'tw', '師級業務員'),
(605, 'job_title', 17, 'cn', ''),
(606, 'job_title', 17, 'en', ''),
(607, 'job_title', 18, 'tw', '資深業務員'),
(608, 'job_title', 18, 'cn', ''),
(609, 'job_title', 18, 'en', ''),
(610, 'job_title', 19, 'tw', '初級工程師'),
(611, 'job_title', 19, 'cn', ''),
(612, 'job_title', 19, 'en', ''),
(613, 'job_title', 20, 'tw', '助理工程師'),
(614, 'job_title', 20, 'cn', ''),
(615, 'job_title', 20, 'en', ''),
(616, 'job_title', 21, 'tw', '工程師'),
(617, 'job_title', 21, 'cn', ''),
(618, 'job_title', 21, 'en', ''),
(619, 'job_title', 22, 'tw', '二級工程師'),
(620, 'job_title', 22, 'cn', ''),
(621, 'job_title', 22, 'en', ''),
(622, 'job_title', 23, 'tw', '一級工程師'),
(623, 'job_title', 23, 'cn', ''),
(624, 'job_title', 23, 'en', ''),
(625, 'job_title', 24, 'tw', '高級工程師'),
(626, 'job_title', 24, 'cn', ''),
(627, 'job_title', 24, 'en', ''),
(628, 'job_title', 25, 'tw', '資深工程師'),
(629, 'job_title', 25, 'cn', ''),
(630, 'job_title', 25, 'en', ''),
(631, 'job_title', 26, 'tw', '行政助理'),
(632, 'job_title', 26, 'cn', ''),
(633, 'job_title', 26, 'en', ''),
(634, 'job_title', 27, 'tw', '初級管理師'),
(635, 'job_title', 27, 'cn', ''),
(636, 'job_title', 27, 'en', ''),
(637, 'job_title', 28, 'tw', '助理管理師'),
(638, 'job_title', 28, 'cn', ''),
(639, 'job_title', 28, 'en', ''),
(640, 'job_title', 29, 'tw', '管理師'),
(641, 'job_title', 29, 'cn', ''),
(642, 'job_title', 29, 'en', ''),
(643, 'job_title', 30, 'tw', '二級管理師'),
(644, 'job_title', 30, 'cn', ''),
(645, 'job_title', 30, 'en', ''),
(646, 'job_title', 31, 'tw', '一級管理師'),
(647, 'job_title', 31, 'cn', ''),
(648, 'job_title', 31, 'en', ''),
(649, 'job_title', 32, 'tw', '高級管理師'),
(650, 'job_title', 32, 'cn', ''),
(651, 'job_title', 32, 'en', ''),
(652, 'job_title', 33, 'tw', '資深管理師'),
(653, 'job_title', 33, 'cn', ''),
(654, 'job_title', 33, 'en', ''),
(655, 'job_title', 34, 'tw', ''),
(656, 'job_title', 34, 'cn', ''),
(657, 'job_title', 34, 'en', ''),
(658, 'job_title', 35, 'tw', '工程師'),
(659, 'job_title', 35, 'cn', ''),
(660, 'job_title', 35, 'en', ''),
(661, 'job_title', 36, 'tw', '二級工程師'),
(662, 'job_title', 36, 'cn', ''),
(663, 'job_title', 36, 'en', ''),
(664, 'job_title', 37, 'tw', '一級工程師'),
(665, 'job_title', 37, 'cn', ''),
(666, 'job_title', 37, 'en', ''),
(667, 'job_title', 38, 'tw', '高級工程師'),
(668, 'job_title', 38, 'cn', ''),
(669, 'job_title', 38, 'en', ''),
(670, 'b_evalu_table_title', 3, 'tw', '中層管理職能評鑑表'),
(671, 'b_evalu_table_title', 3, 'cn', ''),
(672, 'b_evalu_table_title', 3, 'en', ''),
(673, 'group_title', 0, 'tw', '業務部'),
(674, 'group_title', 0, 'cn', ''),
(675, 'group_title', 0, 'en', ''),
(676, 'group_title', 0, 'tw', '研發部門'),
(677, 'group_title', 0, 'cn', ''),
(678, 'group_title', 0, 'en', ''),
(679, 'group_title', 0, 'tw', '言'),
(680, 'group_title', 0, 'cn', ''),
(681, 'group_title', 0, 'en', ''),
(682, 'group_title', 0, 'tw', '1'),
(683, 'group_title', 0, 'cn', ''),
(684, 'group_title', 0, 'en', ''),
(685, 'group_title', 1, 'tw', '董事會'),
(686, 'group_title', 1, 'cn', ''),
(687, 'group_title', 1, 'en', ''),
(688, 'group_title', 2, 'tw', '研發部'),
(689, 'group_title', 2, 'cn', ''),
(690, 'group_title', 2, 'en', ''),
(691, 'job_family_title', 12, 'tw', '約聘人員'),
(692, 'job_family_title', 12, 'cn', ''),
(693, 'job_family_title', 12, 'en', ''),
(694, 'job_family_title', 13, 'tw', '臨時工'),
(695, 'job_family_title', 13, 'cn', ''),
(696, 'job_family_title', 13, 'en', ''),
(697, 'competency_level_title', 20, 'tw', '1.熟悉企業組織及業務流程 2.檢定或經驗具下列至少一項    a.參與模組導入經驗    b.顧問認證合格    c.內訓通過檢定'),
(698, 'competency_level_title', 20, 'cn', ''),
(699, 'competency_level_title', 20, 'en', ''),
(700, 'competency_level_title', 21, 'tw', '1.維護能力具下列至少一項   a.模組維護滿12個月以上經驗   b.顧問認證合格且模組維護滿      6個月以上'),
(701, 'competency_level_title', 21, 'cn', ''),
(702, 'competency_level_title', 21, 'en', ''),
(703, 'competency_level_title', 22, 'tw', '需求規劃能力    (ERP或BPM/BI/BPC)'),
(704, 'competency_level_title', 22, 'cn', ''),
(705, 'competency_level_title', 22, 'en', ''),
(706, 'competency_level_title', 23, 'tw', '第四級'),
(707, 'competency_level_title', 23, 'cn', ''),
(708, 'competency_level_title', 23, 'en', ''),
(709, 'competency_level_title', 24, 'tw', '第五級'),
(710, 'competency_level_title', 24, 'cn', ''),
(711, 'competency_level_title', 24, 'en', ''),
(712, 'ability_title', 7, 'tw', ''),
(713, 'ability_title', 7, 'cn', ''),
(714, 'ability_title', 7, 'en', ''),
(715, 'ability_title', 8, 'tw', ''),
(716, 'ability_title', 8, 'cn', ''),
(717, 'ability_title', 8, 'en', ''),
(718, 'training_teacher', 20, 'tw', '具有第2級能力者'),
(719, 'training_teacher', 20, 'cn', ''),
(720, 'training_teacher', 20, 'en', ''),
(721, 'training_teacher', 21, 'tw', '廠商'),
(722, 'training_teacher', 21, 'cn', ''),
(723, 'training_teacher', 21, 'en', ''),
(724, 'training_teacher', 22, 'tw', '1.具有第2級能力者 2.廠商'),
(725, 'training_teacher', 22, 'cn', ''),
(726, 'training_teacher', 22, 'en', ''),
(727, 'training_teacher', 23, 'tw', '1.廠商 2.專案經理'),
(728, 'training_teacher', 23, 'cn', ''),
(729, 'training_teacher', 23, 'en', ''),
(730, 'ability_title', 9, 'tw', 'ERP管理師：具備兩個以上    模組第三級能力'),
(731, 'ability_title', 9, 'cn', ''),
(732, 'ability_title', 9, 'en', ''),
(733, 'training_teacher', 24, 'tw', '廠商'),
(734, 'training_teacher', 24, 'cn', ''),
(735, 'training_teacher', 24, 'en', ''),
(736, 'training_teacher', 25, 'tw', '顧問'),
(737, 'training_teacher', 25, 'cn', ''),
(738, 'training_teacher', 25, 'en', ''),
(739, 'competency_model_title', 35, 'tw', '業務職能模型'),
(740, 'competency_model_title', 35, 'cn', ''),
(741, 'competency_model_title', 35, 'en', ''),
(742, 'competency_title', 63, 'tw', '業務職能A'),
(743, 'competency_title', 63, 'cn', ''),
(744, 'competency_title', 63, 'en', ''),
(745, 'competency_title', 64, 'tw', '業務職能B'),
(746, 'competency_title', 64, 'cn', ''),
(747, 'competency_title', 64, 'en', ''),
(748, 'competency_level_title', 25, 'tw', '業務職能A-1'),
(749, 'competency_level_title', 25, 'cn', ''),
(750, 'competency_level_title', 25, 'en', ''),
(751, 'competency_level_title', 26, 'tw', '業務職能A-2'),
(752, 'competency_level_title', 26, 'cn', ''),
(753, 'competency_level_title', 26, 'en', ''),
(754, 'competency_level_title', 27, 'tw', '業務職能A-3'),
(755, 'competency_level_title', 27, 'cn', ''),
(756, 'competency_level_title', 27, 'en', ''),
(757, 'competency_level_title', 28, 'tw', '業務職能A-4'),
(758, 'competency_level_title', 28, 'cn', ''),
(759, 'competency_level_title', 28, 'en', ''),
(760, 'competency_level_title', 29, 'tw', '業務職能A-5'),
(761, 'competency_level_title', 29, 'cn', ''),
(762, 'competency_level_title', 29, 'en', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=922 ;

--
-- 列出以下資料庫的數據： `text`
--

INSERT INTO `text` (`term_id`, `term_title`, `depend_on_id`, `term_language`, `text_content`) VALUES
(628, 'competency_model_definition', 33, 'tw', '中層管理職能模型 for demo'),
(629, 'competency_model_definition', 33, 'cn', '中层管理职能模型 for demo'),
(630, 'competency_model_definition', 33, 'en', ''),
(631, 'competency_definition', 53, 'tw', '依據公司策略發展需求，訂定部門/單位的短中長期目標，做為部門/單位努力的方向。'),
(632, 'competency_definition', 53, 'cn', '依据公司策略发展需求，订定部门/单位的短中长期目标，做为部门/单位努力的方向。'),
(633, 'competency_definition', 53, 'en', ''),
(634, 'competency_definition', 54, 'tw', '能辨識任務的優先等級，擬訂縝密的行動計畫，有效安排所需的人力與資源，建立系統的工作方法與步驟，以確保有效達成既定目標。'),
(635, 'competency_definition', 54, 'cn', '能辨识任务的优先等级，拟订缜密的行动计划，有效安排所需的人力与资源，建立系统的工作方法与步骤，以确保有效达成既定目标。'),
(636, 'competency_definition', 54, 'en', ''),
(637, 'competency_definition', 55, 'tw', '能塑造明確的團隊文化及瞭解個別成員的能力和特性，運用適當、具彈性的互動模式，激勵及指引團隊成功的完成任務。'),
(638, 'competency_definition', 55, 'cn', '能塑造明确的团队文化及了解个别成员的能力和特性，运用适当、具弹性的互动模式，激励及指引团队成功的完成任务。'),
(639, 'competency_definition', 55, 'en', ''),
(640, 'behavior_definition', 14, 'tw', '能依據組織的目標進行部門/單位的目標分解，以明確各職務應承接的個人目標。'),
(641, 'behavior_definition', 14, 'cn', ''),
(642, 'behavior_definition', 14, 'en', ''),
(643, 'behavior_definition', 15, 'tw', '能依據組織的目標進行部門/單位的目標分解，以明確各職務應承接的個人目標。'),
(644, 'behavior_definition', 15, 'cn', ''),
(645, 'behavior_definition', 15, 'en', ''),
(646, 'behavior_definition', 16, 'tw', '除組織的既定目標外，能針對組織的發展需求，訂定本部門更高或更具挑戰性的目標。'),
(647, 'behavior_definition', 16, 'cn', ''),
(648, 'behavior_definition', 16, 'en', ''),
(649, 'behavior_definition', 17, 'tw', '能設定部門階段性目標，以配合組織短、中、長期的發展目標需求。'),
(650, 'behavior_definition', 17, 'cn', ''),
(651, 'behavior_definition', 17, 'en', ''),
(652, 'behavior_definition', 18, 'tw', '能設定部門階段性目標，以配合組織短、中、長期的發展目標需求。'),
(653, 'behavior_definition', 18, 'cn', ''),
(654, 'behavior_definition', 18, 'en', ''),
(655, 'behavior_definition', 19, 'tw', '能依據組織目前與未來目標需求，設定具體的、且彼此關聯與互補的部門/單位績效指標。'),
(656, 'behavior_definition', 19, 'cn', ''),
(657, 'behavior_definition', 19, 'en', ''),
(658, 'behavior_definition', 20, 'tw', '根據組織目標需求，規劃、設定與其他部門/單位的整體性協作目標，做為跨部門合作的方向。'),
(659, 'behavior_definition', 20, 'cn', ''),
(660, 'behavior_definition', 20, 'en', ''),
(661, 'training_method', 10, 'tw', '內部培訓'),
(662, 'training_method', 10, 'cn', ''),
(663, 'training_method', 10, 'en', ''),
(664, 'training_method', 11, 'tw', '派外訓練'),
(665, 'training_method', 11, 'cn', ''),
(666, 'training_method', 11, 'en', ''),
(667, 'training_method', 12, 'tw', '導師制 (工作教導)'),
(668, 'training_method', 12, 'cn', ''),
(669, 'training_method', 12, 'en', ''),
(670, 'course_desc', 52, 'tw', '【課程大綱】\r\n1.設定目標的指導原則\r\n2.瞭解目標設定的要素\r\n3.讓團隊的成員參與設定目標\r\n4.目標設定的績效檢核指標\r\n5.工作目標分解的策略與規劃'),
(671, 'course_desc', 52, 'cn', ''),
(672, 'course_desc', 52, 'en', ''),
(673, 'course_desc', 53, 'tw', '【課程大綱】\r\n1.KPI日常管理要領\r\n2.MBO目標管理實務\r\n3.工作計劃擬定與展開技巧\r\n4.方針管理與衡量指標建置\r\n5.預算編制與管理控制'),
(674, 'course_desc', 53, 'cn', ''),
(675, 'course_desc', 53, 'en', ''),
(676, 'training_material', 12, 'tw', '團隊目標設定技巧學員手冊'),
(677, 'training_material', 12, 'cn', ''),
(678, 'training_material', 12, 'en', ''),
(679, 'training_material', 13, 'tw', '目標設定實務研習指導手冊'),
(680, 'training_material', 13, 'cn', ''),
(681, 'training_material', 13, 'en', ''),
(682, 'behavior_definition', 21, 'tw', '瞭解部門工作的重要性和急迫性，知道該依何種比例，將手邊握有的資源分配在各項工作上。'),
(683, 'behavior_definition', 21, 'cn', ''),
(684, 'behavior_definition', 21, 'en', ''),
(685, 'behavior_definition', 22, 'tw', '能展開及分解計畫，並精確估算執行計畫所需的人力、物力和時間，充分調配部門/單位內可用的資源，使計畫能井然有序並有效的完成。'),
(686, 'behavior_definition', 22, 'cn', ''),
(687, 'behavior_definition', 22, 'en', ''),
(688, 'behavior_definition', 23, 'tw', '在計畫執行過程中，能按時程表檢視與計畫相關的各類最新資訊，並迅速有效的進行資源與時間的調度。'),
(689, 'behavior_definition', 23, 'cn', ''),
(690, 'behavior_definition', 23, 'en', ''),
(691, 'behavior_definition', 24, 'tw', '能同步進行多樣且複雜的計畫，並依據事先做好的詳細規劃，讓各計畫的執行都維持在正常的進度上。'),
(692, 'behavior_definition', 24, 'cn', ''),
(693, 'behavior_definition', 24, 'en', ''),
(694, 'behavior_definition', 25, 'tw', '能在考量公司未來策略方針、內外環境狀況與組織內部資源下，擬訂部門/單位未來發展的規劃藍圖。'),
(695, 'behavior_definition', 25, 'cn', ''),
(696, 'behavior_definition', 25, 'en', ''),
(697, 'behavior_definition', 26, 'tw', '瞭解各類型成員的行事風格及專長差異，能將團隊成員依屬性、專長加以分類並按此分配任務。'),
(698, 'behavior_definition', 26, 'cn', ''),
(699, 'behavior_definition', 26, 'en', ''),
(700, 'behavior_definition', 27, 'tw', '能設計團隊成員的交流活動，增進團隊成員間的瞭解和互動，以建立團隊意識。'),
(701, 'behavior_definition', 27, 'cn', ''),
(702, 'behavior_definition', 27, 'en', ''),
(703, 'behavior_definition', 28, 'tw', '能讓團隊成員清楚瞭解團隊目標，並以實際行動來展現和強化團隊達成目標的承諾。'),
(704, 'behavior_definition', 28, 'cn', ''),
(705, 'behavior_definition', 28, 'en', ''),
(706, 'behavior_definition', 29, 'tw', '會設計獎勵措施來營造團隊合作精神，鼓勵成員的傑出表現。'),
(707, 'behavior_definition', 29, 'cn', ''),
(708, 'behavior_definition', 29, 'en', ''),
(709, 'behavior_definition', 30, 'tw', '對團隊成員充分授權，以建立團隊的自治精神，在必要時提供相應的協助與支持。'),
(710, 'behavior_definition', 30, 'cn', ''),
(711, 'behavior_definition', 30, 'en', ''),
(712, 'competency_model_definition', 0, 'tw', '資訊專業職能模型 for demo'),
(713, 'competency_model_definition', 0, 'cn', ''),
(714, 'competency_model_definition', 0, 'en', ''),
(715, 'competency_model_definition', 34, 'tw', '資訊專業職能模型 for demo'),
(716, 'competency_model_definition', 34, 'cn', ''),
(717, 'competency_model_definition', 34, 'en', ''),
(718, 'competency_model_definition', 0, 'tw', '測試專業職能模型'),
(719, 'competency_model_definition', 0, 'cn', ''),
(720, 'competency_model_definition', 0, 'en', ''),
(721, 'competency_definition', 56, 'tw', '整合企業營運資源，將公司業務流程作最佳e化。'),
(722, 'competency_definition', 56, 'cn', ''),
(723, 'competency_definition', 56, 'en', ''),
(724, 'competency_definition', 57, 'tw', '運用科學的分析工具和方法﹐取得系統的確切需求，作為系統設計﹑系統決策﹑系統實施依據。'),
(725, 'competency_definition', 57, 'cn', ''),
(726, 'competency_definition', 57, 'en', ''),
(727, 'competency_definition', 58, 'tw', '將特定需求轉化為電腦可執行指令並產出預期結果，通常透過某種設計語言為工具，過程包括設計、編碼、編譯、測試、除錯等階段。'),
(728, 'competency_definition', 58, 'cn', ''),
(729, 'competency_definition', 58, 'en', ''),
(730, 'competency_definition', 59, 'tw', '支援發展企業入口網站、流程平台、整合外部商務流程。'),
(731, 'competency_definition', 59, 'cn', ''),
(732, 'competency_definition', 59, 'en', ''),
(733, 'competency_definition', 60, 'tw', '熟悉作業系統之操作、運作、設定與維護，提供穩定快速的資訊服務。'),
(734, 'competency_definition', 60, 'cn', ''),
(735, 'competency_definition', 60, 'en', ''),
(736, 'competency_definition', 61, 'tw', '建構安全、穩定的電腦使用環境。'),
(737, 'competency_definition', 61, 'cn', ''),
(738, 'competency_definition', 61, 'en', ''),
(739, 'competency_definition', 62, 'tw', '維護公司資訊安全，達成高可用性、完整性、機密性、即時性的目標。'),
(740, 'competency_definition', 62, 'cn', ''),
(741, 'competency_definition', 62, 'en', ''),
(742, 'ability_def', 5, 'tw', '熟悉企業組織及業務流程\r\n'),
(743, 'ability_def', 5, 'cn', ''),
(744, 'ability_def', 5, 'en', ''),
(745, 'ability_def', 6, 'tw', '檢定或經驗具下列至少一項：a.參與模組導入經驗、b.顧問認證合格、c.內訓通過檢定\r\n'),
(746, 'ability_def', 6, 'cn', ''),
(747, 'ability_def', 6, 'en', ''),
(748, 'competency_evalation_content', 7, 'tw', '1.簡報審查\r\n2.a.參與專案證明\r\n    b.外部證照\r\n    c.案例實作'),
(749, 'competency_evalation_content', 7, 'cn', ''),
(750, 'competency_evalation_content', 7, 'en', ''),
(751, 'competency_evalation_method', 7, 'tw', '1.處主管\r\n2.具有第2級能力者\r\n3.廠商'),
(752, 'competency_evalation_method', 7, 'cn', ''),
(753, 'competency_evalation_method', 7, 'en', ''),
(754, 'training_method', 13, 'tw', '內訓'),
(755, 'training_method', 13, 'cn', ''),
(756, 'training_method', 13, 'en', ''),
(757, 'training_method', 14, 'tw', '參與專案'),
(758, 'training_method', 14, 'cn', ''),
(759, 'training_method', 14, 'en', ''),
(760, 'training_method', 15, 'tw', '外訓'),
(761, 'training_method', 15, 'cn', ''),
(762, 'training_method', 15, 'en', ''),
(763, 'training_material', 14, 'tw', 'ttt'),
(764, 'training_material', 14, 'cn', ''),
(765, 'training_material', 14, 'en', ''),
(766, 'job_family_dsec', 6, 'tw', ''),
(767, 'job_family_dsec', 6, 'cn', ''),
(768, 'job_family_dsec', 6, 'en', ''),
(769, 'job_family_dsec', 7, 'tw', ''),
(770, 'job_family_dsec', 7, 'cn', ''),
(771, 'job_family_dsec', 7, 'en', ''),
(772, 'job_family_dsec', 8, 'tw', ''),
(773, 'job_family_dsec', 8, 'cn', ''),
(774, 'job_family_dsec', 8, 'en', ''),
(775, 'job_family_dsec', 9, 'tw', ''),
(776, 'job_family_dsec', 9, 'cn', ''),
(777, 'job_family_dsec', 9, 'en', ''),
(778, 'job_family_dsec', 10, 'tw', ''),
(779, 'job_family_dsec', 10, 'cn', ''),
(780, 'job_family_dsec', 10, 'en', ''),
(781, 'job_family_dsec', 11, 'tw', ''),
(782, 'job_family_dsec', 11, 'cn', ''),
(783, 'job_family_dsec', 11, 'en', ''),
(784, 'b_evalu_table_desc', 3, 'tw', ''),
(785, 'b_evalu_table_desc', 3, 'cn', ''),
(786, 'b_evalu_table_desc', 3, 'en', ''),
(787, 'group_desc', 0, 'tw', ''),
(788, 'group_desc', 0, 'cn', ''),
(789, 'group_desc', 0, 'en', ''),
(790, 'group_desc', 0, 'tw', '研發部門'),
(791, 'group_desc', 0, 'cn', ''),
(792, 'group_desc', 0, 'en', ''),
(793, 'group_desc', 0, 'tw', '12'),
(794, 'group_desc', 0, 'cn', ''),
(795, 'group_desc', 0, 'en', ''),
(796, 'group_desc', 0, 'tw', '2'),
(797, 'group_desc', 0, 'cn', ''),
(798, 'group_desc', 0, 'en', ''),
(799, 'group_desc', 1, 'tw', '董事會'),
(800, 'group_desc', 1, 'cn', ''),
(801, 'group_desc', 1, 'en', ''),
(802, 'group_desc', 2, 'tw', '研發部'),
(803, 'group_desc', 2, 'cn', ''),
(804, 'group_desc', 2, 'en', ''),
(805, 'job_family_dsec', 12, 'tw', '約聘人員'),
(806, 'job_family_dsec', 12, 'cn', ''),
(807, 'job_family_dsec', 12, 'en', ''),
(808, 'job_family_dsec', 13, 'tw', ''),
(809, 'job_family_dsec', 13, 'cn', ''),
(810, 'job_family_dsec', 13, 'en', ''),
(811, 'ability_def', 7, 'tw', '1.熟悉企業組\r\n  織及業務流\r\n  程\r\n'),
(812, 'ability_def', 7, 'cn', ''),
(813, 'ability_def', 7, 'en', ''),
(814, 'ability_def', 8, 'tw', '2.檢定或經驗\r\n  具下列至少\r\n  一項\r\n  a.參與模組\r\n     導入經驗\r\n  b.顧問認證\r\n     合格\r\n  c.內訓通過\r\n     檢定\r\n'),
(815, 'ability_def', 8, 'cn', ''),
(816, 'ability_def', 8, 'en', ''),
(817, 'competency_evaluator', 8, 'tw', '1.處主管\r\n2.具有第2級能力者\r\n3.廠商\r\n'),
(818, 'competency_evaluator', 8, 'cn', ''),
(819, 'competency_evaluator', 8, 'en', ''),
(820, 'competency_evaluation_method', 8, 'tw', '1.簡報審查\r\n2.a.參與專案證明\r\n    b.外部證照\r\n    c.案例實作\r\n'),
(821, 'competency_evaluation_method', 8, 'cn', ''),
(822, 'competency_evaluation_method', 8, 'en', ''),
(823, 'training_method', 16, 'tw', '內訓'),
(824, 'training_method', 16, 'cn', ''),
(825, 'training_method', 16, 'en', ''),
(826, 'training_method', 17, 'tw', 'a.參與專案 b.外訓 c.內訓\r\n'),
(827, 'training_method', 17, 'cn', ''),
(828, 'training_method', 17, 'en', ''),
(829, 'training_material', 14, 'tw', '業務流程與組織文件'),
(830, 'training_material', 14, 'cn', ''),
(831, 'training_material', 14, 'en', ''),
(832, 'training_material', 15, 'tw', 'a.工作說明書\r\n     b.外部教材\r\n     c.專案文件\r\n'),
(833, 'training_material', 15, 'cn', ''),
(834, 'training_material', 15, 'en', ''),
(835, 'competency_evaluator', 9, 'tw', '1.部主管\r\n2.處主管\r\n3.具有第3級能力者\r\n'),
(836, 'competency_evaluator', 9, 'cn', ''),
(837, 'competency_evaluator', 9, 'en', ''),
(838, 'competency_evaluation_method', 9, 'tw', '審查維護紀錄及證書\r\n'),
(839, 'competency_evaluation_method', 9, 'cn', ''),
(840, 'competency_evaluation_method', 9, 'en', ''),
(841, 'training_method', 18, 'tw', '1.內訓\r\n2. a.參與專案\r\n     b.外訓\r\n     c.內訓\r\n'),
(842, 'training_method', 18, 'cn', ''),
(843, 'training_method', 18, 'en', ''),
(844, 'training_material', 16, 'tw', '1.業務流程與組織文件\r\n2. a.工作說明書\r\n     b.外部教材\r\n     c.專案文件\r\n'),
(845, 'training_material', 16, 'cn', ''),
(846, 'training_material', 16, 'en', ''),
(847, 'training_method', 19, 'tw', '成果審查\r\n(三件以上)\r\n'),
(848, 'training_method', 19, 'cn', ''),
(849, 'training_method', 19, 'en', ''),
(850, 'competency_evaluator', 10, 'tw', '1.部主管\r\n2.處主管\r\n3.具有第4級能力者\r\n'),
(851, 'competency_evaluator', 10, 'cn', ''),
(852, 'competency_evaluator', 10, 'en', ''),
(853, 'competency_evaluation_method', 10, 'tw', '成果審查\r\n(三件以上)\r\n'),
(854, 'competency_evaluation_method', 10, 'cn', ''),
(855, 'competency_evaluation_method', 10, 'en', ''),
(856, 'training_material', 17, 'tw', '1.外部教材\r\n2.網路教材\r\n3.實際案例\r\n'),
(857, 'training_material', 17, 'cn', ''),
(858, 'training_material', 17, 'en', ''),
(859, 'training_method', 20, 'tw', '1.外訓\r\n2.自我學習\r\n3.專案工作\r\n'),
(860, 'training_method', 20, 'cn', ''),
(861, 'training_method', 20, 'en', ''),
(862, 'competency_evaluator', 11, 'tw', '1.部主管\r\n2.處主管\r\n3.外部顧問\r\n'),
(863, 'competency_evaluator', 11, 'cn', ''),
(864, 'competency_evaluator', 11, 'en', ''),
(865, 'competency_evaluation_method', 11, 'tw', '推甄文件審查\r\n'),
(866, 'competency_evaluation_method', 11, 'cn', ''),
(867, 'competency_evaluation_method', 11, 'en', ''),
(868, 'ability_def', 9, 'tw', 'ERP管理師：具備兩個以上\r\n   模組第三級能力\r\n'),
(869, 'ability_def', 9, 'cn', ''),
(870, 'ability_def', 9, 'en', ''),
(871, 'training_method', 21, 'tw', '輪調\r\n'),
(872, 'training_method', 21, 'cn', ''),
(873, 'training_method', 21, 'en', ''),
(874, 'training_method', 22, 'tw', '自我學習\r\n'),
(875, 'training_method', 22, 'cn', ''),
(876, 'training_method', 22, 'en', ''),
(877, 'training_material', 18, 'tw', '實際案例\r\n'),
(878, 'training_material', 18, 'cn', ''),
(879, 'training_material', 18, 'en', ''),
(880, 'training_material', 19, 'tw', '維護紀錄\r\n'),
(881, 'training_material', 19, 'cn', ''),
(882, 'training_material', 19, 'en', ''),
(883, 'competency_evaluator', 20, 'tw', '1.處主管\r\n2.具有第2級能力者\r\n3.廠商\r\n'),
(884, 'competency_evaluator', 20, 'cn', ''),
(885, 'competency_evaluator', 20, 'en', ''),
(886, 'competency_evaluation_method', 20, 'tw', '1.簡報審查\r\n2.a.參與專案證明\r\n    b.外部證照\r\n    c.案例實作\r\n'),
(887, 'competency_evaluation_method', 20, 'cn', ''),
(888, 'competency_evaluation_method', 20, 'en', ''),
(889, 'competency_evaluator', 21, 'tw', '1.部主管\r\n2.處主管\r\n3.具有第3級能力者\r\n'),
(890, 'competency_evaluator', 21, 'cn', ''),
(891, 'competency_evaluator', 21, 'en', ''),
(892, 'competency_evaluation_method', 21, 'tw', '審查維護紀錄及證書\r\n'),
(893, 'competency_evaluation_method', 21, 'cn', ''),
(894, 'competency_evaluation_method', 21, 'en', ''),
(895, 'competency_evaluator', 22, 'tw', '1.部主管\r\n2.處主管\r\n3.具有第4級能力者\r\n'),
(896, 'competency_evaluator', 22, 'cn', ''),
(897, 'competency_evaluator', 22, 'en', ''),
(898, 'competency_evaluation_method', 22, 'tw', '成果審查\r\n(三件以上)\r\n'),
(899, 'competency_evaluation_method', 22, 'cn', ''),
(900, 'competency_evaluation_method', 22, 'en', ''),
(901, 'competency_evaluator', 24, 'tw', '1.部主管\r\n2.處主管\r\n3.外部顧問（五級)\r\n'),
(902, 'competency_evaluator', 24, 'cn', ''),
(903, 'competency_evaluator', 24, 'en', ''),
(904, 'competency_evaluation_method', 24, 'tw', '推甄文件審查（五級)\r\n'),
(905, 'competency_evaluation_method', 24, 'cn', ''),
(906, 'competency_evaluation_method', 24, 'en', ''),
(907, 'competency_evaluator', 23, 'tw', '1.部主管\r\n2.處主管\r\n3.外部顧問\r\n'),
(908, 'competency_evaluator', 23, 'cn', ''),
(909, 'competency_evaluator', 23, 'en', ''),
(910, 'competency_evaluation_method', 23, 'tw', '推甄文件審查\r\n'),
(911, 'competency_evaluation_method', 23, 'cn', ''),
(912, 'competency_evaluation_method', 23, 'en', ''),
(913, 'competency_model_definition', 35, 'tw', '業務職能模型'),
(914, 'competency_model_definition', 35, 'cn', ''),
(915, 'competency_model_definition', 35, 'en', ''),
(916, 'competency_definition', 63, 'tw', ''),
(917, 'competency_definition', 63, 'cn', ''),
(918, 'competency_definition', 63, 'en', ''),
(919, 'competency_definition', 64, 'tw', ''),
(920, 'competency_definition', 64, 'cn', ''),
(921, 'competency_definition', 64, 'en', '');

-- --------------------------------------------------------

--
-- 資料表格式： `training_material`
--

CREATE TABLE IF NOT EXISTS `training_material` (
  `training_material_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_material_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 列出以下資料庫的數據： `training_material`
--

INSERT INTO `training_material` (`training_material_id`, `competency_level_id`) VALUES
(12, 14),
(13, 14),
(14, 20),
(15, 20),
(16, 21),
(17, 22),
(18, 24),
(19, 24);

-- --------------------------------------------------------

--
-- 資料表格式： `training_method`
--

CREATE TABLE IF NOT EXISTS `training_method` (
  `training_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_method_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 列出以下資料庫的數據： `training_method`
--

INSERT INTO `training_method` (`training_method_id`, `competency_level_id`) VALUES
(10, 14),
(11, 14),
(12, 14),
(13, 14),
(14, 14),
(15, 14),
(16, 20),
(17, 20),
(18, 21),
(20, 22),
(21, 24),
(22, 24);

-- --------------------------------------------------------

--
-- 資料表格式： `training_teacher`
--

CREATE TABLE IF NOT EXISTS `training_teacher` (
  `training_teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_teacher_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 列出以下資料庫的數據： `training_teacher`
--

INSERT INTO `training_teacher` (`training_teacher_id`, `competency_level_id`) VALUES
(19, 14),
(20, 20),
(21, 20),
(22, 21),
(23, 22),
(24, 24),
(25, 24);

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

--
-- 列出以下資料庫的數據： `user_power`
--


-- --------------------------------------------------------

--
-- 資料表格式： `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullName` varchar(10) NOT NULL,
  `user_name_chs` varchar(10) NOT NULL,
  `user_name_eng` varchar(10) NOT NULL,
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
  `account_status` varchar(10) NOT NULL,
  `job_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 列出以下資料庫的數據： `user_profile`
--

INSERT INTO `user_profile` (`user_id`, `fullName`, `user_name_chs`, `user_name_eng`, `user_mps`, `name`, `first_name`, `last_name`, `birth_day`, `birth_month`, `birth_year`, `gender`, `job_title`, `company_id`, `notes`, `city_code`, `address`, `url`, `office_phone`, `home_phone`, `mobile`, `image`, `power_type`, `account_status`, `job_id`, `department_id`) VALUES
(3, '李瑤政', '', '', '', '', '', '', 0, 0, 0, '', '', 0, '', 0, '', '', '', '', '', '', 'N', '', 13, 2),
(7, '林靜秀', '', '', '', '', '', '', 0, 0, 0, '', '', 0, '', 0, '', '', '', '', '', '', 'N', '', 14, 2),
(8, '廖瑜瑄', '', '', '', '', '', '', 0, 0, 0, '', '', 0, '', 0, '', '', '', '', '', '', 'N', '', 38, 2),
(9, '張胤育', '', '', '', '', '', '', 0, 0, 0, '', '', 0, '', 0, '', '', '', '', '', '', 'N', '', 14, 1),
(10, '羅冠志', '', '', '', '', '', '', 0, 0, 0, '', '', 0, '', 0, '', '', '', '', '', '', 'N', '', 25, 2),
(11, '鄧名丹', '', '', '', '', '', '', 0, 0, 0, '', '', 0, '', 0, '', '', '', '', '', '', 'N', '', 27, 1);

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
  PRIMARY KEY (`user_email_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 列出以下資料庫的數據： `user_sso`
--

INSERT INTO `user_sso` (`user_email_id`, `user_email`, `user_live_id`, `user_fb_id`, `user_id`, `user_account`, `password`) VALUES
(3, '', '', '', 3, '李瑤政', ''),
(8, '', '', '', 7, '林靜秀', ''),
(9, '', '', '', 8, '廖瑜瑄', ''),
(10, '', '', '', 9, '張胤育', ''),
(11, '', '', '', 10, '羅冠志', ''),
(12, '', '', '', 11, '鄧名丹', '');
