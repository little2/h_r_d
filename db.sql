-- phpMyAdmin SQL Dump
-- version 2.11.9.5
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 建立日期: Mar 23, 2015, 09:10 AM
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

--
-- 列出以下資料庫的數據： `ability`
--

INSERT INTO `ability` (`ability_id`, `competency_level_id`) VALUES
(5, 14),
(6, 14),
(7, 22),
(8, 22),
(9, 23),
(10, 46),
(11, 46),
(12, 46),
(13, 46),
(14, 47),
(15, 47),
(16, 47),
(17, 48),
(18, 48),
(19, 49),
(20, 49),
(21, 49),
(22, 50),
(23, 50),
(24, 50),
(25, 50),
(26, 50),
(27, 50),
(28, 50),
(29, 50),
(30, 50),
(31, 50),
(32, 51),
(33, 51),
(34, 51),
(35, 51),
(36, 51),
(37, 52),
(38, 52),
(39, 52),
(40, 52),
(41, 52),
(42, 53),
(43, 53),
(44, 54),
(45, 54),
(46, 54),
(47, 54),
(48, 54),
(49, 54),
(50, 55),
(51, 55),
(52, 56),
(53, 56),
(54, 57),
(55, 57),
(56, 58),
(57, 58),
(58, 59),
(59, 59),
(60, 60),
(61, 60),
(62, 60),
(63, 60),
(64, 61),
(65, 62),
(66, 62),
(67, 62),
(68, 62),
(69, 62),
(70, 62),
(71, 63),
(72, 63),
(73, 64),
(74, 64),
(75, 64),
(76, 64),
(77, 65);

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
(3, '', '0', '2015-01-25', 33, 1, '');

-- --------------------------------------------------------

--
-- 資料表格式： `behavior`
--

CREATE TABLE IF NOT EXISTS `behavior` (
  `behavior_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_id` int(11) NOT NULL,
  `weight` decimal(10,1) NOT NULL,
  PRIMARY KEY (`behavior_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

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
(30, 55, 1.0),
(31, 68, 1.0),
(32, 68, 1.0),
(33, 68, 1.0),
(34, 68, 1.0),
(35, 68, 1.0),
(36, 69, 1.0),
(37, 69, 1.0),
(38, 69, 1.0),
(39, 69, 1.0),
(40, 69, 1.0),
(41, 70, 1.0),
(42, 70, 1.0),
(43, 70, 1.0),
(44, 70, 1.0),
(45, 70, 1.0),
(46, 71, 1.0),
(47, 71, 1.0),
(48, 71, 1.0),
(49, 71, 1.0),
(50, 71, 1.0),
(51, 72, 1.0),
(52, 72, 1.0),
(53, 72, 1.0),
(54, 72, 1.0),
(55, 72, 1.0),
(56, 73, 1.0),
(57, 73, 1.0),
(58, 73, 1.0),
(59, 73, 1.0),
(60, 73, 1.0);

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
(1, 1, 0, 0, 0, 0, 'EDT'),
(2, 0, 0, 0, 0, 0, 'EDT');

-- --------------------------------------------------------

--
-- 資料表格式： `class_evaluation_competency`
--

CREATE TABLE IF NOT EXISTS `class_evaluation_competency` (
  `class_evaluation_competency_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_evaluation_appraisee_id` int(11) NOT NULL,
  `competency_id` int(11) NOT NULL,
  `competency_level` int(11) NOT NULL,
  `class_evaluation_competency_status` varchar(3) CHARACTER SET utf8 NOT NULL DEFAULT 'EDT',
  `due_date` date NOT NULL,
  `competency_score` decimal(10,2) NOT NULL,
  `competency_score_adjusted` decimal(10,2) NOT NULL,
  `evaluate_result` varchar(3) CHARACTER SET utf8 NOT NULL,
  `competency_adjusted_date` datetime NOT NULL,
  PRIMARY KEY (`class_evaluation_competency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 列出以下資料庫的數據： `class_evaluation_competency`
--

INSERT INTO `class_evaluation_competency` (`class_evaluation_competency_id`, `class_evaluation_appraisee_id`, `competency_id`, `competency_level`, `class_evaluation_competency_status`, `due_date`, `competency_score`, `competency_score_adjusted`, `evaluate_result`, `competency_adjusted_date`) VALUES
(1, 1, 56, 2, 'EDT', '0000-00-00', 0.00, 0.00, '', '0000-00-00 00:00:00');

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
  `class_evaluation_evaluator_status` varchar(3) CHARACTER SET utf8 NOT NULL DEFAULT 'EDT' COMMENT 'EDT/REW/PAS',
  `evalutor_score_adjusted` decimal(10,2) NOT NULL,
  `weight_adjusted` int(11) NOT NULL,
  `adjusted_date` datetime NOT NULL,
  PRIMARY KEY (`class_evaluation_evaluator_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `class_evaluation_evaluator`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

--
-- 列出以下資料庫的數據： `competency`
--

INSERT INTO `competency` (`competency_id`, `competency_type`, `competency_method`, `competency_model_id`, `competency_weight`, `competency_level_number`) VALUES
(53, 'M', 'B', 33, 1.0, 0),
(54, 'M', 'B', 33, 1.0, 0),
(55, 'M', 'B', 33, 1.0, 0),
(56, 'P', 'C', 34, 0.0, 0),
(57, 'P', 'C', 34, 0.0, 0),
(58, 'P', 'C', 34, 0.0, 0),
(59, 'P', 'C', 34, 0.0, 0),
(60, 'P', 'C', 34, 0.0, 0),
(61, 'P', 'C', 34, 0.0, 0),
(62, 'P', 'C', 34, 0.0, 0),
(69, 'M', 'B', 38, 1.0, 0),
(68, 'M', 'B', 38, 1.0, 0),
(67, 'C', 'B', 0, 0.0, 0),
(70, 'M', 'B', 38, 1.0, 0),
(71, 'M', 'B', 38, 1.0, 0),
(72, 'M', 'B', 38, 1.0, 0),
(73, 'M', 'B', 38, 1.0, 0),
(74, 'M', 'B', 39, 1.0, 0),
(75, 'M', 'B', 39, 1.0, 0),
(76, 'M', 'B', 39, 1.0, 0),
(77, 'M', 'B', 39, 1.0, 0),
(78, 'M', 'B', 39, 1.0, 0),
(79, 'M', 'B', 39, 1.0, 0),
(80, 'M', 'B', 40, 1.0, 0),
(81, 'M', 'B', 40, 1.0, 0),
(82, 'M', 'B', 40, 1.0, 0),
(83, 'M', 'B', 40, 1.0, 0),
(84, 'M', 'B', 40, 1.0, 0),
(85, 'P', 'C', 42, 0.0, 0),
(87, 'P', 'C', 42, 0.0, 0),
(88, 'P', 'C', 42, 0.0, 0),
(89, 'P', 'C', 42, 0.0, 0),
(90, 'P', 'C', 42, 0.0, 0);

-- --------------------------------------------------------

--
-- 資料表格式： `competency_dic`
--

CREATE TABLE IF NOT EXISTS `competency_dic` (
  `competency_dic_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_type` varchar(5) NOT NULL,
  PRIMARY KEY (`competency_dic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `competency_dic`
--


-- --------------------------------------------------------

--
-- 資料表格式： `competency_dic_course`
--

CREATE TABLE IF NOT EXISTS `competency_dic_course` (
  `competency_dic_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_dic_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`competency_dic_course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `competency_dic_course`
--


-- --------------------------------------------------------

--
-- 資料表格式： `competency_evaluation`
--

CREATE TABLE IF NOT EXISTS `competency_evaluation` (
  `competency_evaluation_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`competency_evaluation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 列出以下資料庫的數據： `competency_evaluation`
--

INSERT INTO `competency_evaluation` (`competency_evaluation_id`, `competency_level_id`) VALUES
(7, 14);

-- --------------------------------------------------------

--
-- 資料表格式： `competency_level`
--

CREATE TABLE IF NOT EXISTS `competency_level` (
  `competency_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_id` int(11) NOT NULL,
  `competency_level` int(11) NOT NULL,
  PRIMARY KEY (`competency_level_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- 列出以下資料庫的數據： `competency_level`
--

INSERT INTO `competency_level` (`competency_level_id`, `competency_id`, `competency_level`) VALUES
(14, 0, 1),
(18, 0, 3),
(17, 0, 2),
(19, 0, 4),
(20, 63, 1),
(21, 64, 1),
(22, 56, 1),
(23, 56, 2),
(24, 56, 3),
(25, 56, 4),
(26, 65, 1),
(27, 66, 1),
(28, 67, 1),
(29, 68, 1),
(30, 69, 1),
(31, 70, 1),
(32, 71, 1),
(33, 72, 1),
(34, 73, 1),
(35, 74, 1),
(36, 75, 1),
(37, 76, 1),
(38, 77, 1),
(39, 78, 1),
(40, 79, 1),
(41, 80, 1),
(42, 81, 1),
(43, 82, 1),
(44, 83, 1),
(45, 84, 1),
(46, 85, 1),
(47, 85, 2),
(48, 85, 3),
(49, 85, 4),
(50, 87, 1),
(51, 87, 2),
(52, 87, 3),
(53, 87, 4),
(54, 88, 1),
(55, 88, 2),
(56, 88, 3),
(57, 88, 4),
(58, 89, 1),
(59, 89, 2),
(60, 89, 3),
(61, 89, 4),
(62, 90, 1),
(63, 90, 2),
(64, 90, 3),
(65, 90, 4);

-- --------------------------------------------------------

--
-- 資料表格式： `competency_model`
--

CREATE TABLE IF NOT EXISTS `competency_model` (
  `competency_model_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_model_count` int(11) NOT NULL,
  `competency_model_type` varchar(10) NOT NULL,
  `competency_model_method` varchar(10) NOT NULL COMMENT '���Ũ�ΰ�Ǩ�',
  `competency_level_number` int(1) NOT NULL,
  PRIMARY KEY (`competency_model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- 列出以下資料庫的數據： `competency_model`
--

INSERT INTO `competency_model` (`competency_model_id`, `competency_model_count`, `competency_model_type`, `competency_model_method`, `competency_level_number`) VALUES
(39, 6, 'M', 'B', 0),
(34, 7, 'P', 'C', 0),
(35, 1, 'C', 'B', 0),
(38, 6, 'M', 'B', 0),
(40, 5, 'M', 'B', 0),
(42, 5, 'P', 'C', 0);

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
(35, '0000-00-00 00:00:00', 0),
(41, '0000-00-00 00:00:00', 0),
(42, '0000-00-00 00:00:00', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- 列出以下資料庫的數據： `course_property`
--

INSERT INTO `course_property` (`course_id`, `course_code`, `catalog_id`, `competency_level_id`) VALUES
(52, '', 0, 14),
(53, '', 0, 14),
(54, '', 0, 22);

-- --------------------------------------------------------

--
-- 資料表格式： `evaluation_relation`
--

CREATE TABLE IF NOT EXISTS `evaluation_relation` (
  `evaluation_relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_relation_code` varchar(10) NOT NULL,
  PRIMARY KEY (`evaluation_relation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 列出以下資料庫的數據： `evaluation_relation`
--

INSERT INTO `evaluation_relation` (`evaluation_relation_id`, `evaluation_relation_code`) VALUES
(1, ''),
(2, ''),
(3, ''),
(4, '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- 列出以下資料庫的數據： `evaluation_scale`
--

INSERT INTO `evaluation_scale` (`evaluation_scale_id`, `evaluation_scale_item_count`, `evaluation_scale_basis`, `evaluation_scale_status`) VALUES
(1, 0, 5.00, NULL),
(2, 0, 3.00, NULL);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 列出以下資料庫的數據： `evaluation_scale_item`
--

INSERT INTO `evaluation_scale_item` (`evaluation_scale_item_id`, `evaluation_scale_id`, `evaluation_scale_item_sort`, `evaluation_scale_item_grade`, `evaluation_scale_item_self`) VALUES
(1, 1, 0, 1, 'F'),
(2, 1, 0, 2, 'F'),
(3, 1, 0, 3, 'F'),
(4, 1, 0, 4, 'F'),
(5, 1, 0, 5, 'F'),
(6, 1, 0, 6, 'F'),
(7, 1, 0, 7, 'F');

-- --------------------------------------------------------

--
-- 資料表格式： `favorite_url`
--

CREATE TABLE IF NOT EXISTS `favorite_url` (
  `favorite_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `favorite_title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `favorite_url` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`favorite_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `favorite_url`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `group_property`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- 列出以下資料庫的數據： `job`
--

INSERT INTO `job` (`job_id`, `job_family_id`, `job_level`, `job_type_id`, `core_competency_model_id`, `manage_competency_model_id`, `general_competency_model_id`, `professional_competency_model_id`) VALUES
(13, 6, 3, 0, NULL, 33, NULL, 0),
(14, 6, 3, 0, NULL, NULL, NULL, 0),
(15, 6, 4, 0, NULL, 37, NULL, 0),
(16, 6, 5, 0, NULL, NULL, NULL, 0),
(17, 6, 6, 0, NULL, NULL, NULL, 0),
(18, 6, 7, 0, NULL, NULL, NULL, 0),
(19, 7, 3, 0, NULL, NULL, NULL, 0),
(20, 7, 3, 0, NULL, NULL, NULL, 34),
(21, 7, 4, 0, NULL, NULL, NULL, 34),
(22, 7, 4, 0, NULL, NULL, NULL, 0),
(23, 7, 5, 0, NULL, NULL, NULL, 0),
(24, 7, 5, 0, NULL, NULL, NULL, 0),
(25, 7, 6, 0, NULL, NULL, NULL, 0),
(26, 8, 2, 0, NULL, NULL, NULL, 0),
(27, 8, 3, 0, NULL, NULL, NULL, 0),
(28, 8, 3, 0, NULL, NULL, NULL, 0),
(29, 8, 4, 0, NULL, 33, NULL, 0),
(30, 8, 4, 0, NULL, NULL, NULL, 0),
(31, 8, 5, 0, NULL, NULL, NULL, 0),
(32, 8, 5, 0, NULL, NULL, NULL, 0),
(33, 8, 6, 0, NULL, NULL, NULL, 0),
(34, 0, 0, 0, NULL, NULL, NULL, 0),
(35, 7, 4, 0, NULL, NULL, NULL, 0),
(36, 7, 4, 0, NULL, 0, NULL, 0),
(37, 7, 5, 0, NULL, NULL, NULL, 34),
(38, 7, 5, 0, NULL, NULL, NULL, 0),
(39, 7, NULL, NULL, NULL, 0, NULL, NULL);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

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
(17, 36, 56, 1),
(18, 36, 57, 1),
(19, 36, 58, 3),
(20, 36, 59, 3),
(21, 36, 60, 2),
(22, 36, 61, 2),
(23, 36, 62, 2),
(24, 13, 53, 2),
(25, 13, 54, 1),
(26, 13, 55, 1),
(27, 13, 64, 1),
(28, 29, 53, 2),
(29, 29, 54, 2),
(30, 29, 55, 2),
(31, 29, 64, 2),
(32, 21, 56, 1),
(33, 21, 57, 1),
(34, 21, 58, 3),
(35, 21, 59, 3),
(36, 21, 60, 2),
(37, 21, 61, 2),
(38, 21, 62, 2),
(39, 20, 56, 0),
(40, 20, 57, 2),
(41, 20, 58, 2),
(42, 20, 59, 1),
(43, 20, 60, 2),
(44, 20, 61, 1),
(45, 20, 62, 0),
(46, 37, 56, 2),
(47, 37, 57, 2),
(48, 37, 58, 3),
(49, 37, 59, 3),
(50, 37, 60, 2),
(51, 37, 61, 3),
(52, 37, 62, 2),
(53, 15, 66, 2);

-- --------------------------------------------------------

--
-- 資料表格式： `job_family`
--

CREATE TABLE IF NOT EXISTS `job_family` (
  `job_family_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`job_family_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 列出以下資料庫的數據： `job_family`
--

INSERT INTO `job_family` (`job_family_id`, `company_id`) VALUES
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 列出以下資料庫的數據： `org_company`
--

INSERT INTO `org_company` (`company_id`, `groups_id`, `company_code`) VALUES
(1, 0, '');

-- --------------------------------------------------------

--
-- 資料表格式： `smtp`
--

CREATE TABLE IF NOT EXISTS `smtp` (
  `smtp_account` varchar(30) NOT NULL,
  `smtp_password` varchar(30) NOT NULL,
  `smtp_server` varchar(30) NOT NULL,
  `smtp_ssl` varchar(1) NOT NULL,
  `smtp_port` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `smtp`
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1120 ;

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
(670, 'b_evalu_table_title', 3, 'tw', '基層管理職能評鑑表'),
(671, 'b_evalu_table_title', 3, 'cn', ''),
(672, 'b_evalu_table_title', 3, 'en', ''),
(673, 'competency_model_title', 35, 'tw', '核心職能模型'),
(674, 'competency_model_title', 35, 'cn', '核心职能模型'),
(675, 'competency_model_title', 35, 'en', ''),
(676, 'competency_title', 63, 'tw', 'test'),
(677, 'competency_title', 63, 'cn', ''),
(678, 'competency_title', 63, 'en', ''),
(679, 'competency_title', 64, 'tw', 'test2'),
(680, 'competency_title', 64, 'cn', ''),
(681, 'competency_title', 64, 'en', ''),
(682, 'evaluation_relation_title', 1, 'tw', '自己'),
(683, 'evaluation_relation_title', 1, 'cn', ''),
(684, 'evaluation_relation_title', 1, 'en', ''),
(685, 'evaluation_relation_title', 2, 'tw', '直屬主管'),
(686, 'evaluation_relation_title', 2, 'cn', ''),
(687, 'evaluation_relation_title', 2, 'en', ''),
(688, 'evaluation_relation_title', 3, 'tw', '同事'),
(689, 'evaluation_relation_title', 3, 'cn', ''),
(690, 'evaluation_relation_title', 3, 'en', ''),
(691, 'evaluation_relation_title', 4, 'tw', '部屬'),
(692, 'evaluation_relation_title', 4, 'cn', ''),
(693, 'evaluation_relation_title', 4, 'en', ''),
(694, 'evaluation_scale_title', 1, 'tw', '七分量表'),
(695, 'evaluation_scale_title', 1, 'cn', ''),
(696, 'evaluation_scale_title', 1, 'en', ''),
(697, 'evaluation_scale_title', 2, 'tw', '五分量表'),
(698, 'evaluation_scale_title', 2, 'cn', ''),
(699, 'evaluation_scale_title', 2, 'en', ''),
(700, 'company_title', 1, 'tw', '緯任數位科技'),
(701, 'company_title', 1, 'cn', ''),
(702, 'company_title', 1, 'en', ''),
(703, 'group_title', 0, 'tw', '諮詢部'),
(704, 'group_title', 0, 'cn', ''),
(705, 'group_title', 0, 'en', ''),
(706, 'competency_level_title', 22, 'tw', '基礎'),
(707, 'competency_level_title', 22, 'cn', ''),
(708, 'competency_level_title', 22, 'en', ''),
(709, 'competency_level_title', 23, 'tw', '精通'),
(710, 'competency_level_title', 23, 'cn', ''),
(711, 'competency_level_title', 23, 'en', ''),
(712, 'competency_level_title', 24, 'tw', '精進'),
(713, 'competency_level_title', 24, 'cn', ''),
(714, 'competency_level_title', 24, 'en', ''),
(715, 'competency_level_title', 25, 'tw', '專家'),
(716, 'competency_level_title', 25, 'cn', ''),
(717, 'competency_level_title', 25, 'en', ''),
(718, 'ability_title', 7, 'tw', '基礎'),
(719, 'ability_title', 7, 'cn', ''),
(720, 'ability_title', 7, 'en', ''),
(721, 'ability_title', 8, 'tw', '基礎'),
(722, 'ability_title', 8, 'cn', ''),
(723, 'ability_title', 8, 'en', ''),
(724, 'training_teacher', 20, 'tw', '具有第2級能力者'),
(725, 'training_teacher', 20, 'cn', ''),
(726, 'training_teacher', 20, 'en', ''),
(727, 'training_teacher', 21, 'tw', '廠商'),
(728, 'training_teacher', 21, 'cn', ''),
(729, 'training_teacher', 21, 'en', ''),
(730, 'course_title', 54, 'tw', '系統整合與導入第一級課程'),
(731, 'course_title', 54, 'cn', ''),
(732, 'course_title', 54, 'en', ''),
(733, 'evaluation_scale_item_title', 1, 'tw', '有認知，大多未做到'),
(734, 'evaluation_scale_item_title', 1, 'cn', ''),
(735, 'evaluation_scale_item_title', 1, 'en', ''),
(736, 'evaluation_scale_item_title', 2, 'tw', '有認知，少部份能做到'),
(737, 'evaluation_scale_item_title', 2, 'cn', ''),
(738, 'evaluation_scale_item_title', 2, 'en', ''),
(739, 'evaluation_scale_item_title', 3, 'tw', '有認知，部份能做到'),
(740, 'evaluation_scale_item_title', 3, 'cn', ''),
(741, 'evaluation_scale_item_title', 3, 'en', ''),
(742, 'evaluation_scale_item_title', 4, 'tw', '有認知， 一般都能做到'),
(743, 'evaluation_scale_item_title', 4, 'cn', ''),
(744, 'evaluation_scale_item_title', 4, 'en', ''),
(745, 'evaluation_scale_item_title', 5, 'tw', '大部份能做到'),
(746, 'evaluation_scale_item_title', 5, 'cn', ''),
(747, 'evaluation_scale_item_title', 5, 'en', ''),
(748, 'evaluation_scale_item_title', 6, 'tw', '能做到且表現優秀'),
(749, 'evaluation_scale_item_title', 6, 'cn', ''),
(750, 'evaluation_scale_item_title', 6, 'en', ''),
(751, 'evaluation_scale_item_title', 7, 'tw', '能做到且表現卓越'),
(752, 'evaluation_scale_item_title', 7, 'cn', ''),
(753, 'evaluation_scale_item_title', 7, 'en', ''),
(754, 'competency_model_title', 36, 'tw', 'test'),
(755, 'competency_model_title', 36, 'cn', ''),
(756, 'competency_model_title', 36, 'en', ''),
(757, 'competency_title', 65, 'tw', '溝通'),
(758, 'competency_title', 65, 'cn', ''),
(759, 'competency_title', 65, 'en', ''),
(760, 'competency_model_title', 37, 'tw', '中層管理職能模型'),
(761, 'competency_model_title', 37, 'cn', ''),
(762, 'competency_model_title', 37, 'en', ''),
(763, 'ability_title', 9, 'tw', '精通'),
(764, 'ability_title', 9, 'cn', ''),
(765, 'ability_title', 9, 'en', ''),
(766, 'competency_title', 66, 'tw', 'SSSSSSS'),
(767, 'competency_title', 66, 'cn', ''),
(768, 'competency_title', 66, 'en', ''),
(769, 'competency_title', 67, 'tw', '感動服務'),
(770, 'competency_title', 67, 'cn', ''),
(771, 'competency_title', 67, 'en', ''),
(772, 'competency_model_title', 38, 'tw', '高層管理職能模型'),
(773, 'competency_model_title', 38, 'cn', ''),
(774, 'competency_model_title', 38, 'en', ''),
(775, 'competency_model_title', 39, 'tw', '中層管理職能模型'),
(776, 'competency_model_title', 39, 'cn', ''),
(777, 'competency_model_title', 39, 'en', ''),
(778, 'competency_model_title', 40, 'tw', '基層管理職能模型'),
(779, 'competency_model_title', 40, 'cn', ''),
(780, 'competency_model_title', 40, 'en', ''),
(781, 'competency_title', 68, 'tw', '策略思考'),
(782, 'competency_title', 68, 'cn', ''),
(783, 'competency_title', 68, 'en', ''),
(784, 'competency_title', 69, 'tw', '組織領導'),
(785, 'competency_title', 69, 'cn', ''),
(786, 'competency_title', 69, 'en', ''),
(787, 'competency_title', 70, 'tw', '組織溝通與協調'),
(788, 'competency_title', 70, 'cn', ''),
(789, 'competency_title', 70, 'en', ''),
(790, 'competency_title', 71, 'tw', '人際影響'),
(791, 'competency_title', 71, 'cn', ''),
(792, 'competency_title', 71, 'en', ''),
(793, 'competency_title', 72, 'tw', '績效提升'),
(794, 'competency_title', 72, 'cn', ''),
(795, 'competency_title', 72, 'en', ''),
(796, 'competency_title', 73, 'tw', '培養組織優秀人才'),
(797, 'competency_title', 73, 'cn', ''),
(798, 'competency_title', 73, 'en', ''),
(799, 'competency_title', 74, 'tw', '目標設定'),
(800, 'competency_title', 74, 'cn', ''),
(801, 'competency_title', 74, 'en', ''),
(802, 'competency_title', 75, 'tw', '計畫組織'),
(803, 'competency_title', 75, 'cn', ''),
(804, 'competency_title', 75, 'en', ''),
(805, 'competency_title', 76, 'tw', '團隊建立'),
(806, 'competency_title', 76, 'cn', ''),
(807, 'competency_title', 76, 'en', ''),
(808, 'competency_title', 77, 'tw', '談判協商'),
(809, 'competency_title', 77, 'cn', ''),
(810, 'competency_title', 77, 'en', ''),
(811, 'competency_title', 78, 'tw', '效率意識'),
(812, 'competency_title', 78, 'cn', ''),
(813, 'competency_title', 78, 'en', ''),
(814, 'competency_title', 79, 'tw', '決策能力'),
(815, 'competency_title', 79, 'cn', ''),
(816, 'competency_title', 79, 'en', ''),
(817, 'competency_title', 80, 'tw', '計畫能力'),
(818, 'competency_title', 80, 'cn', ''),
(819, 'competency_title', 80, 'en', ''),
(820, 'competency_title', 81, 'tw', '團隊合作'),
(821, 'competency_title', 81, 'cn', ''),
(822, 'competency_title', 81, 'en', ''),
(823, 'competency_title', 82, 'tw', '溝通技巧'),
(824, 'competency_title', 82, 'cn', ''),
(825, 'competency_title', 82, 'en', ''),
(826, 'competency_title', 83, 'tw', '工作管理'),
(827, 'competency_title', 83, 'cn', ''),
(828, 'competency_title', 83, 'en', ''),
(829, 'competency_title', 84, 'tw', '問題解決能力'),
(830, 'competency_title', 84, 'cn', ''),
(831, 'competency_title', 84, 'en', ''),
(832, 'competency_model_title', 41, 'tw', 'aaaaaa'),
(833, 'competency_model_title', 41, 'cn', ''),
(834, 'competency_model_title', 41, 'en', ''),
(835, 'competency_model_title', 42, 'tw', '財務專業職能模型'),
(836, 'competency_model_title', 42, 'cn', '财务专业职能模型'),
(837, 'competency_model_title', 42, 'en', ''),
(838, 'competency_title', 85, 'tw', '快速報表產出及經營分析能力'),
(839, 'competency_title', 85, 'cn', ''),
(840, 'competency_title', 85, 'en', ''),
(841, 'competency_title', 86, 'tw', '快速報表產出及經營分析能力'),
(842, 'competency_title', 86, 'cn', ''),
(843, 'competency_title', 86, 'en', ''),
(844, 'competency_title', 87, 'tw', '帳務問題解決能力'),
(845, 'competency_title', 87, 'cn', ''),
(846, 'competency_title', 87, 'en', ''),
(847, 'competency_title', 88, 'tw', '內控內稽制度規劃執行管控能力'),
(848, 'competency_title', 88, 'cn', ''),
(849, 'competency_title', 88, 'en', ''),
(850, 'competency_title', 89, 'tw', '預算與專案規劃管理能力'),
(851, 'competency_title', 89, 'cn', ''),
(852, 'competency_title', 89, 'en', ''),
(853, 'competency_title', 90, 'tw', '投資理財及稅務規劃'),
(854, 'competency_title', 90, 'cn', ''),
(855, 'competency_title', 90, 'en', ''),
(856, 'competency_level_title', 46, 'tw', '編製執行'),
(857, 'competency_level_title', 46, 'cn', ''),
(858, 'competency_level_title', 46, 'en', ''),
(859, 'competency_level_title', 47, 'tw', '分析及運用'),
(860, 'competency_level_title', 47, 'cn', ''),
(861, 'competency_level_title', 47, 'en', ''),
(862, 'competency_level_title', 48, 'tw', '改善'),
(863, 'competency_level_title', 48, 'cn', ''),
(864, 'competency_level_title', 48, 'en', ''),
(865, 'competency_level_title', 49, 'tw', '規劃'),
(866, 'competency_level_title', 49, 'cn', ''),
(867, 'competency_level_title', 49, 'en', ''),
(868, 'ability_title', 10, 'tw', '編製執行'),
(869, 'ability_title', 10, 'cn', ''),
(870, 'ability_title', 10, 'en', ''),
(871, 'ability_title', 11, 'tw', '編製執行'),
(872, 'ability_title', 11, 'cn', ''),
(873, 'ability_title', 11, 'en', ''),
(874, 'ability_title', 12, 'tw', ''),
(875, 'ability_title', 12, 'cn', ''),
(876, 'ability_title', 12, 'en', ''),
(877, 'ability_title', 13, 'tw', ''),
(878, 'ability_title', 13, 'cn', ''),
(879, 'ability_title', 13, 'en', ''),
(880, 'ability_title', 14, 'tw', ''),
(881, 'ability_title', 14, 'cn', ''),
(882, 'ability_title', 14, 'en', ''),
(883, 'ability_title', 15, 'tw', ''),
(884, 'ability_title', 15, 'cn', ''),
(885, 'ability_title', 15, 'en', ''),
(886, 'ability_title', 16, 'tw', ''),
(887, 'ability_title', 16, 'cn', ''),
(888, 'ability_title', 16, 'en', ''),
(889, 'ability_title', 17, 'tw', ''),
(890, 'ability_title', 17, 'cn', ''),
(891, 'ability_title', 17, 'en', ''),
(892, 'ability_title', 18, 'tw', ''),
(893, 'ability_title', 18, 'cn', ''),
(894, 'ability_title', 18, 'en', ''),
(895, 'ability_title', 19, 'tw', ''),
(896, 'ability_title', 19, 'cn', ''),
(897, 'ability_title', 19, 'en', ''),
(898, 'ability_title', 20, 'tw', ''),
(899, 'ability_title', 20, 'cn', ''),
(900, 'ability_title', 20, 'en', ''),
(901, 'ability_title', 21, 'tw', ''),
(902, 'ability_title', 21, 'cn', ''),
(903, 'ability_title', 21, 'en', ''),
(904, 'competency_level_title', 50, 'tw', '執行'),
(905, 'competency_level_title', 50, 'cn', ''),
(906, 'competency_level_title', 50, 'en', ''),
(907, 'competency_level_title', 51, 'tw', '異常處理'),
(908, 'competency_level_title', 51, 'cn', ''),
(909, 'competency_level_title', 51, 'en', ''),
(910, 'competency_level_title', 52, 'tw', '改善'),
(911, 'competency_level_title', 52, 'cn', ''),
(912, 'competency_level_title', 52, 'en', ''),
(913, 'competency_level_title', 53, 'tw', '規劃'),
(914, 'competency_level_title', 53, 'cn', ''),
(915, 'competency_level_title', 53, 'en', ''),
(916, 'ability_title', 22, 'tw', ''),
(917, 'ability_title', 22, 'cn', ''),
(918, 'ability_title', 22, 'en', ''),
(919, 'ability_title', 23, 'tw', ''),
(920, 'ability_title', 23, 'cn', ''),
(921, 'ability_title', 23, 'en', ''),
(922, 'ability_title', 24, 'tw', ''),
(923, 'ability_title', 24, 'cn', ''),
(924, 'ability_title', 24, 'en', ''),
(925, 'ability_title', 25, 'tw', ''),
(926, 'ability_title', 25, 'cn', ''),
(927, 'ability_title', 25, 'en', ''),
(928, 'ability_title', 26, 'tw', ''),
(929, 'ability_title', 26, 'cn', ''),
(930, 'ability_title', 26, 'en', ''),
(931, 'ability_title', 27, 'tw', ''),
(932, 'ability_title', 27, 'cn', ''),
(933, 'ability_title', 27, 'en', ''),
(934, 'ability_title', 28, 'tw', ''),
(935, 'ability_title', 28, 'cn', ''),
(936, 'ability_title', 28, 'en', ''),
(937, 'ability_title', 29, 'tw', ''),
(938, 'ability_title', 29, 'cn', ''),
(939, 'ability_title', 29, 'en', ''),
(940, 'ability_title', 30, 'tw', ''),
(941, 'ability_title', 30, 'cn', ''),
(942, 'ability_title', 30, 'en', ''),
(943, 'ability_title', 31, 'tw', ''),
(944, 'ability_title', 31, 'cn', ''),
(945, 'ability_title', 31, 'en', ''),
(946, 'ability_title', 32, 'tw', ''),
(947, 'ability_title', 32, 'cn', ''),
(948, 'ability_title', 32, 'en', ''),
(949, 'ability_title', 33, 'tw', ''),
(950, 'ability_title', 33, 'cn', ''),
(951, 'ability_title', 33, 'en', ''),
(952, 'ability_title', 34, 'tw', ''),
(953, 'ability_title', 34, 'cn', ''),
(954, 'ability_title', 34, 'en', ''),
(955, 'ability_title', 35, 'tw', ''),
(956, 'ability_title', 35, 'cn', ''),
(957, 'ability_title', 35, 'en', ''),
(958, 'ability_title', 36, 'tw', ''),
(959, 'ability_title', 36, 'cn', ''),
(960, 'ability_title', 36, 'en', ''),
(961, 'ability_title', 37, 'tw', ''),
(962, 'ability_title', 37, 'cn', ''),
(963, 'ability_title', 37, 'en', ''),
(964, 'ability_title', 38, 'tw', ''),
(965, 'ability_title', 38, 'cn', ''),
(966, 'ability_title', 38, 'en', ''),
(967, 'ability_title', 39, 'tw', ''),
(968, 'ability_title', 39, 'cn', ''),
(969, 'ability_title', 39, 'en', ''),
(970, 'ability_title', 40, 'tw', ''),
(971, 'ability_title', 40, 'cn', ''),
(972, 'ability_title', 40, 'en', ''),
(973, 'ability_title', 41, 'tw', ''),
(974, 'ability_title', 41, 'cn', ''),
(975, 'ability_title', 41, 'en', ''),
(976, 'ability_title', 42, 'tw', ''),
(977, 'ability_title', 42, 'cn', ''),
(978, 'ability_title', 42, 'en', ''),
(979, 'ability_title', 43, 'tw', ''),
(980, 'ability_title', 43, 'cn', ''),
(981, 'ability_title', 43, 'en', ''),
(982, 'competency_level_title', 54, 'tw', '對公司規章制度了解'),
(983, 'competency_level_title', 54, 'cn', ''),
(984, 'competency_level_title', 54, 'en', ''),
(985, 'competency_level_title', 55, 'tw', '未符事項發覺'),
(986, 'competency_level_title', 55, 'cn', ''),
(987, 'competency_level_title', 55, 'en', ''),
(988, 'competency_level_title', 56, 'tw', '積極跟進'),
(989, 'competency_level_title', 56, 'cn', ''),
(990, 'competency_level_title', 56, 'en', ''),
(991, 'competency_level_title', 57, 'tw', '再發防止'),
(992, 'competency_level_title', 57, 'cn', ''),
(993, 'competency_level_title', 57, 'en', ''),
(994, 'ability_title', 44, 'tw', ''),
(995, 'ability_title', 44, 'cn', ''),
(996, 'ability_title', 44, 'en', ''),
(997, 'ability_title', 45, 'tw', ''),
(998, 'ability_title', 45, 'cn', ''),
(999, 'ability_title', 45, 'en', ''),
(1000, 'ability_title', 46, 'tw', ''),
(1001, 'ability_title', 46, 'cn', ''),
(1002, 'ability_title', 46, 'en', ''),
(1003, 'ability_title', 47, 'tw', ''),
(1004, 'ability_title', 47, 'cn', ''),
(1005, 'ability_title', 47, 'en', ''),
(1006, 'ability_title', 48, 'tw', ''),
(1007, 'ability_title', 48, 'cn', ''),
(1008, 'ability_title', 48, 'en', ''),
(1009, 'ability_title', 49, 'tw', ''),
(1010, 'ability_title', 49, 'cn', ''),
(1011, 'ability_title', 49, 'en', ''),
(1012, 'ability_title', 50, 'tw', ''),
(1013, 'ability_title', 50, 'cn', ''),
(1014, 'ability_title', 50, 'en', ''),
(1015, 'ability_title', 51, 'tw', ''),
(1016, 'ability_title', 51, 'cn', ''),
(1017, 'ability_title', 51, 'en', ''),
(1018, 'ability_title', 52, 'tw', ''),
(1019, 'ability_title', 52, 'cn', ''),
(1020, 'ability_title', 52, 'en', ''),
(1021, 'ability_title', 53, 'tw', ''),
(1022, 'ability_title', 53, 'cn', ''),
(1023, 'ability_title', 53, 'en', ''),
(1024, 'ability_title', 54, 'tw', ''),
(1025, 'ability_title', 54, 'cn', ''),
(1026, 'ability_title', 54, 'en', ''),
(1027, 'ability_title', 55, 'tw', ''),
(1028, 'ability_title', 55, 'cn', ''),
(1029, 'ability_title', 55, 'en', ''),
(1030, 'competency_level_title', 58, 'tw', '預算追踨管控及專案進度掌控'),
(1031, 'competency_level_title', 58, 'cn', ''),
(1032, 'competency_level_title', 58, 'en', ''),
(1033, 'competency_level_title', 59, 'tw', '編制指導及專案進度掌控'),
(1034, 'competency_level_title', 59, 'cn', ''),
(1035, 'competency_level_title', 59, 'en', ''),
(1036, 'competency_level_title', 60, 'tw', '問題排除及差異分析'),
(1037, 'competency_level_title', 60, 'cn', ''),
(1038, 'competency_level_title', 60, 'en', ''),
(1039, 'competency_level_title', 61, 'tw', '改善建議及對策及專案規劃'),
(1040, 'competency_level_title', 61, 'cn', ''),
(1041, 'competency_level_title', 61, 'en', ''),
(1042, 'competency_level_title', 62, 'tw', '基礎'),
(1043, 'competency_level_title', 62, 'cn', ''),
(1044, 'competency_level_title', 62, 'en', ''),
(1045, 'competency_level_title', 63, 'tw', '熟悉'),
(1046, 'competency_level_title', 63, 'cn', ''),
(1047, 'competency_level_title', 63, 'en', ''),
(1048, 'competency_level_title', 64, 'tw', '精進'),
(1049, 'competency_level_title', 64, 'cn', ''),
(1050, 'competency_level_title', 64, 'en', ''),
(1051, 'competency_level_title', 65, 'tw', '專家'),
(1052, 'competency_level_title', 65, 'cn', ''),
(1053, 'competency_level_title', 65, 'en', ''),
(1054, 'ability_title', 56, 'tw', ''),
(1055, 'ability_title', 56, 'cn', ''),
(1056, 'ability_title', 56, 'en', ''),
(1057, 'ability_title', 57, 'tw', ''),
(1058, 'ability_title', 57, 'cn', ''),
(1059, 'ability_title', 57, 'en', ''),
(1060, 'ability_title', 58, 'tw', ''),
(1061, 'ability_title', 58, 'cn', ''),
(1062, 'ability_title', 58, 'en', ''),
(1063, 'ability_title', 59, 'tw', ''),
(1064, 'ability_title', 59, 'cn', ''),
(1065, 'ability_title', 59, 'en', ''),
(1066, 'ability_title', 60, 'tw', ''),
(1067, 'ability_title', 60, 'cn', ''),
(1068, 'ability_title', 60, 'en', ''),
(1069, 'ability_title', 61, 'tw', ''),
(1070, 'ability_title', 61, 'cn', ''),
(1071, 'ability_title', 61, 'en', ''),
(1072, 'ability_title', 62, 'tw', ''),
(1073, 'ability_title', 62, 'cn', ''),
(1074, 'ability_title', 62, 'en', ''),
(1075, 'ability_title', 63, 'tw', ''),
(1076, 'ability_title', 63, 'cn', ''),
(1077, 'ability_title', 63, 'en', ''),
(1078, 'ability_title', 64, 'tw', ''),
(1079, 'ability_title', 64, 'cn', ''),
(1080, 'ability_title', 64, 'en', ''),
(1081, 'ability_title', 65, 'tw', ''),
(1082, 'ability_title', 65, 'cn', ''),
(1083, 'ability_title', 65, 'en', ''),
(1084, 'ability_title', 66, 'tw', ''),
(1085, 'ability_title', 66, 'cn', ''),
(1086, 'ability_title', 66, 'en', ''),
(1087, 'ability_title', 67, 'tw', ''),
(1088, 'ability_title', 67, 'cn', ''),
(1089, 'ability_title', 67, 'en', ''),
(1090, 'ability_title', 68, 'tw', ''),
(1091, 'ability_title', 68, 'cn', ''),
(1092, 'ability_title', 68, 'en', ''),
(1093, 'ability_title', 69, 'tw', ''),
(1094, 'ability_title', 69, 'cn', ''),
(1095, 'ability_title', 69, 'en', ''),
(1096, 'ability_title', 70, 'tw', ''),
(1097, 'ability_title', 70, 'cn', ''),
(1098, 'ability_title', 70, 'en', ''),
(1099, 'ability_title', 71, 'tw', ''),
(1100, 'ability_title', 71, 'cn', ''),
(1101, 'ability_title', 71, 'en', ''),
(1102, 'ability_title', 72, 'tw', ''),
(1103, 'ability_title', 72, 'cn', ''),
(1104, 'ability_title', 72, 'en', ''),
(1105, 'ability_title', 73, 'tw', ''),
(1106, 'ability_title', 73, 'cn', ''),
(1107, 'ability_title', 73, 'en', ''),
(1108, 'ability_title', 74, 'tw', ''),
(1109, 'ability_title', 74, 'cn', ''),
(1110, 'ability_title', 74, 'en', ''),
(1111, 'ability_title', 75, 'tw', ''),
(1112, 'ability_title', 75, 'cn', ''),
(1113, 'ability_title', 75, 'en', ''),
(1114, 'ability_title', 76, 'tw', ''),
(1115, 'ability_title', 76, 'cn', ''),
(1116, 'ability_title', 76, 'en', ''),
(1117, 'ability_title', 77, 'tw', ''),
(1118, 'ability_title', 77, 'cn', ''),
(1119, 'ability_title', 77, 'en', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1258 ;

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
(784, 'b_evalu_table_desc', 3, 'tw', '緯任數位科技的基層主管管理職能評鑑表'),
(785, 'b_evalu_table_desc', 3, 'cn', ''),
(786, 'b_evalu_table_desc', 3, 'en', ''),
(787, 'competency_model_definition', 35, 'tw', '核心職能模型 for demo'),
(788, 'competency_model_definition', 35, 'cn', '核心职能模型 for demo'),
(789, 'competency_model_definition', 35, 'en', ''),
(790, 'competency_definition', 63, 'tw', ''),
(791, 'competency_definition', 63, 'cn', ''),
(792, 'competency_definition', 63, 'en', ''),
(793, 'competency_definition', 64, 'tw', ''),
(794, 'competency_definition', 64, 'cn', ''),
(795, 'competency_definition', 64, 'en', ''),
(796, 'company_desc', 1, 'tw', '提供人才發展(HRD)整體解決方案'),
(797, 'company_desc', 1, 'cn', ''),
(798, 'company_desc', 1, 'en', ''),
(799, 'group_desc', 0, 'tw', ''),
(800, 'group_desc', 0, 'cn', ''),
(801, 'group_desc', 0, 'en', ''),
(802, 'ability_def', 7, 'tw', '熟悉企業組織及業務流程'),
(803, 'ability_def', 7, 'cn', ''),
(804, 'ability_def', 7, 'en', ''),
(805, 'ability_def', 8, 'tw', '檢定或經驗具下列至少一項：a.參與模組導入經驗、b.顧問認證合格、c.內訓通過檢定\r\n'),
(806, 'ability_def', 8, 'cn', ''),
(807, 'ability_def', 8, 'en', ''),
(808, 'training_method', 16, 'tw', '內訓\r\n'),
(865, 'training_method', 17, 'tw', '參與專案'),
(809, 'training_method', 16, 'cn', ''),
(810, 'training_method', 16, 'en', ''),
(811, 'competency_evaluator', 22, 'tw', '1.處主管、2.具有第2級能力者、3.廠商\r\n'),
(812, 'competency_evaluator', 22, 'cn', ''),
(813, 'competency_evaluator', 22, 'en', ''),
(814, 'competency_evaluation_method', 22, 'tw', '1.簡報審查、2.參與專案證明、3.外部證照、4.案例實作\r\n'),
(815, 'competency_evaluation_method', 22, 'cn', ''),
(816, 'competency_evaluation_method', 22, 'en', ''),
(817, 'training_material', 14, 'tw', '業務流程與組織文件'),
(820, 'training_material', 15, 'tw', '工作說明書'),
(818, 'training_material', 14, 'cn', ''),
(819, 'training_material', 14, 'en', ''),
(821, 'training_material', 15, 'cn', ''),
(822, 'training_material', 15, 'en', ''),
(823, 'training_material', 16, 'tw', '外部教材'),
(824, 'training_material', 16, 'cn', ''),
(825, 'training_material', 16, 'en', ''),
(826, 'training_material', 17, 'tw', '專案文件'),
(827, 'training_material', 17, 'cn', ''),
(828, 'training_material', 17, 'en', ''),
(829, 'course_desc', 54, 'tw', '系統整合與導入的第一級課程，由資訊部自行開發'),
(830, 'course_desc', 54, 'cn', ''),
(831, 'course_desc', 54, 'en', ''),
(832, 'evaluation_scale_item_desc', 1, 'tw', '約有20%能觀察到此行為表現'),
(833, 'evaluation_scale_item_desc', 1, 'cn', ''),
(834, 'evaluation_scale_item_desc', 1, 'en', ''),
(835, 'evaluation_scale_item_desc', 2, 'tw', '約有21%~40%能觀察到此行為表現'),
(836, 'evaluation_scale_item_desc', 2, 'cn', ''),
(837, 'evaluation_scale_item_desc', 2, 'en', ''),
(838, 'evaluation_scale_item_desc', 3, 'tw', '約有41%~50%能觀察到此行為表現'),
(839, 'evaluation_scale_item_desc', 3, 'cn', ''),
(840, 'evaluation_scale_item_desc', 3, 'en', ''),
(841, 'evaluation_scale_item_desc', 4, 'tw', '約有51%~60%能觀察到此行為表現'),
(842, 'evaluation_scale_item_desc', 4, 'cn', ''),
(843, 'evaluation_scale_item_desc', 4, 'en', ''),
(844, 'evaluation_scale_item_desc', 5, 'tw', '約有61%~80%能觀察到此行為表現'),
(845, 'evaluation_scale_item_desc', 5, 'cn', ''),
(846, 'evaluation_scale_item_desc', 5, 'en', ''),
(847, 'evaluation_scale_item_desc', 6, 'tw', '約有81%~90%能觀察到此行為表現'),
(848, 'evaluation_scale_item_desc', 6, 'cn', ''),
(849, 'evaluation_scale_item_desc', 6, 'en', ''),
(850, 'evaluation_scale_item_desc', 7, 'tw', '約有91%以上能觀察到此行為表現'),
(851, 'evaluation_scale_item_desc', 7, 'cn', ''),
(852, 'evaluation_scale_item_desc', 7, 'en', ''),
(853, 'competency_model_definition', 36, 'tw', 'test22222'),
(854, 'competency_model_definition', 36, 'cn', ''),
(855, 'competency_model_definition', 36, 'en', ''),
(856, 'competency_definition', 65, 'tw', ''),
(857, 'competency_definition', 65, 'cn', ''),
(858, 'competency_definition', 65, 'en', ''),
(859, 'competency_model_definition', 37, 'tw', '緯任數位科技中層管理 for demo'),
(860, 'competency_model_definition', 37, 'cn', ''),
(861, 'competency_model_definition', 37, 'en', ''),
(862, 'ability_def', 9, 'tw', 'sssss'),
(863, 'ability_def', 9, 'cn', ''),
(864, 'ability_def', 9, 'en', ''),
(866, 'training_method', 17, 'cn', ''),
(867, 'training_method', 17, 'en', ''),
(868, 'training_method', 18, 'tw', '外訓'),
(869, 'training_method', 18, 'cn', ''),
(870, 'training_method', 18, 'en', ''),
(871, 'training_method', 19, 'tw', '內訓'),
(872, 'training_method', 19, 'cn', ''),
(873, 'training_method', 19, 'en', ''),
(874, 'competency_definition', 66, 'tw', ''),
(875, 'competency_definition', 66, 'cn', ''),
(876, 'competency_definition', 66, 'en', ''),
(877, 'competency_definition', 67, 'tw', ''),
(878, 'competency_definition', 67, 'cn', ''),
(879, 'competency_definition', 67, 'en', ''),
(880, 'competency_model_definition', 38, 'tw', '高層管理職能模型 for Demo'),
(881, 'competency_model_definition', 38, 'cn', ''),
(882, 'competency_model_definition', 38, 'en', ''),
(883, 'competency_model_definition', 39, 'tw', '中層管理職能模型 for Demo'),
(884, 'competency_model_definition', 39, 'cn', ''),
(885, 'competency_model_definition', 39, 'en', ''),
(886, 'competency_model_definition', 40, 'tw', '基層管理職能模型 for Demo'),
(887, 'competency_model_definition', 40, 'cn', ''),
(888, 'competency_model_definition', 40, 'en', ''),
(889, 'competency_definition', 68, 'tw', '能夠掌握產業趨勢，分析組織在產業競爭態勢中所具備的優、劣勢與所面對的機會與威脅，進而擬定公司的發展策略。'),
(890, 'competency_definition', 68, 'cn', ''),
(891, 'competency_definition', 68, 'en', ''),
(892, 'competency_definition', 69, 'tw', '能建立組織的願景及目標、凝聚組織成員的向心力，促進組織內成員的合作以達成組織目標。'),
(893, 'competency_definition', 69, 'cn', ''),
(894, 'competency_definition', 69, 'en', ''),
(895, 'competency_definition', 70, 'tw', '有同理心，瞭解他人的感受、需要和觀點，並能清楚表達自己的語意讓對方明瞭；具備對上、下與同儕間的工作說明與協調能力，以達成團隊協作的目標。'),
(896, 'competency_definition', 70, 'cn', ''),
(897, 'competency_definition', 70, 'en', ''),
(898, 'competency_definition', 71, 'tw', '在跨組織或對外關係上，能運用對他人的理解，以不同的方法、技巧或形式，來達到說服、影響或感動他人，使他人接受自己的觀點或建議，以產生特定的影響。'),
(899, 'competency_definition', 71, 'cn', ''),
(900, 'competency_definition', 71, 'en', ''),
(901, 'competency_definition', 72, 'tw', '能針對部屬的工作表現，給予客觀的評比和充分的回饋，與部屬共同討論擬定績效改善措施及未來績效發展計畫。'),
(902, 'competency_definition', 72, 'cn', ''),
(903, 'competency_definition', 72, 'en', ''),
(904, 'competency_definition', 73, 'tw', '營造一個適合員工發揮能力的工作環境，發掘、培育發展、及儲備公司內優秀人才，以支持組織長期發展目標的達成。'),
(905, 'competency_definition', 73, 'cn', ''),
(906, 'competency_definition', 73, 'en', ''),
(907, 'behavior_definition', 31, 'tw', '清楚掌握內部環境資訊，能瞭解公司未來發展方向及在產業中所具備的優、劣勢，但尚未能提出有效的策略規劃。'),
(908, 'behavior_definition', 31, 'cn', ''),
(909, 'behavior_definition', 31, 'en', ''),
(910, 'behavior_definition', 32, 'tw', '清楚公司目前的策略定位及未來走向，制定明確的績效指標做為工作上的規劃及執行成效的考核依據。'),
(911, 'behavior_definition', 32, 'cn', ''),
(912, 'behavior_definition', 32, 'en', ''),
(913, 'behavior_definition', 33, 'tw', '收集內外部環境的相關資訊並加以分析，能應對市場變化提出策略上的回應。'),
(914, 'behavior_definition', 33, 'cn', ''),
(915, 'behavior_definition', 33, 'en', ''),
(916, 'behavior_definition', 34, 'tw', '能掌握產業趨勢及市場發展的機會點，提出下一步策略規劃，以發揮公司強處、維持競爭優勢。'),
(917, 'behavior_definition', 34, 'cn', ''),
(918, 'behavior_definition', 34, 'en', ''),
(919, 'behavior_definition', 35, 'tw', '隨時留意產業的動態變化，做出明確的分析與判斷，擬訂公司中長期發展方針與策略規劃。'),
(920, 'behavior_definition', 35, 'cn', ''),
(921, 'behavior_definition', 35, 'en', ''),
(922, 'behavior_definition', 36, 'tw', '與組織成員溝通；當決策與組織成員相關時，能將決策內容適時向成員們充分告知與說明。'),
(923, 'behavior_definition', 36, 'cn', ''),
(924, 'behavior_definition', 36, 'en', ''),
(925, 'behavior_definition', 37, 'tw', '促進組織成員合作；確保組織成員瞭解並接受任務與計畫，使組織成員一起努力達成目標。'),
(926, 'behavior_definition', 37, 'cn', ''),
(927, 'behavior_definition', 37, 'en', ''),
(928, 'behavior_definition', 38, 'tw', '提升組織效能；能運用有效的策略或方法提升組織的士氣和產值。'),
(929, 'behavior_definition', 38, 'cn', ''),
(930, 'behavior_definition', 38, 'en', ''),
(931, 'behavior_definition', 39, 'tw', '增進組織成員忠誠度；付出心力，公平的使用職權對待組織成員。'),
(932, 'behavior_definition', 39, 'cn', ''),
(933, 'behavior_definition', 39, 'en', ''),
(934, 'behavior_definition', 40, 'tw', '凝聚組織成員向心力；能設定具挑戰性的目標，並提出合理且足以激勵人心的獎勵措施。'),
(935, 'behavior_definition', 40, 'cn', ''),
(936, 'behavior_definition', 40, 'en', ''),
(937, 'behavior_definition', 41, 'tw', '不先入為主、排除自我意識、能傾聽並接受別人所欲傳達的訊息。'),
(938, 'behavior_definition', 41, 'cn', ''),
(939, 'behavior_definition', 41, 'en', ''),
(940, 'behavior_definition', 42, 'tw', '以同理心，站在對方立場與對方展開良性互動以排除問題或障礙。'),
(941, 'behavior_definition', 42, 'cn', ''),
(942, 'behavior_definition', 42, 'en', ''),
(943, 'behavior_definition', 43, 'tw', '能運用各種不同的媒介，清楚的對上、對下或對同儕說明表達工作協作的相關訊息。'),
(944, 'behavior_definition', 43, 'cn', ''),
(945, 'behavior_definition', 43, 'en', ''),
(946, 'behavior_definition', 44, 'tw', '處事圓融，能耐心處理，聆聽內、外部顧客抱怨，能控制情緒不使衝突發生。'),
(947, 'behavior_definition', 44, 'cn', ''),
(948, 'behavior_definition', 44, 'en', ''),
(949, 'behavior_definition', 45, 'tw', '能視不同狀況調整溝通技巧，順利與組織內外部成員溝通。'),
(950, 'behavior_definition', 45, 'cn', ''),
(951, 'behavior_definition', 45, 'en', ''),
(952, 'behavior_definition', 46, 'tw', '會嘗試找出多方面的例證或說法來支持自己的論點，或加以說服、影響別人。'),
(953, 'behavior_definition', 46, 'cn', ''),
(954, 'behavior_definition', 46, 'en', ''),
(955, 'behavior_definition', 47, 'tw', '會採取適當的行動來印證自己的觀點，以說服或影響他人。'),
(956, 'behavior_definition', 47, 'cn', ''),
(957, 'behavior_definition', 47, 'en', ''),
(958, 'behavior_definition', 48, 'tw', '能預期計劃中的行動會產生那些特定人、事、物的影響，並會利用群體影響效應來達成其目的。'),
(959, 'behavior_definition', 48, 'cn', ''),
(960, 'behavior_definition', 48, 'en', ''),
(961, 'behavior_definition', 49, 'tw', '能訂出一些檢核指標，來檢視或評估因自己的溝通和行動結果而影響他人的程度。'),
(962, 'behavior_definition', 49, 'cn', ''),
(963, 'behavior_definition', 49, 'en', ''),
(964, 'behavior_definition', 50, 'tw', '能針對特定情境設計不同的策略，運用外部人際關係力量來改變他人的決定，以達到影響他人、達成公司營運目標的效果。'),
(965, 'behavior_definition', 50, 'cn', ''),
(966, 'behavior_definition', 50, 'en', ''),
(967, 'behavior_definition', 51, 'tw', '針對部屬的工作表現，依據設定目標及公司績效評核規則，進行客觀、公平的考核。'),
(968, 'behavior_definition', 51, 'cn', ''),
(969, 'behavior_definition', 51, 'en', ''),
(970, 'behavior_definition', 52, 'tw', '協助部屬找出應發展的能力領域，共同討論擬訂績效改善措施及未來績效發展計畫。'),
(971, 'behavior_definition', 52, 'cn', ''),
(972, 'behavior_definition', 52, 'en', ''),
(973, 'behavior_definition', 53, 'tw', '提供部屬足夠的資源與機會，來提升、發展個人的能力與績效。'),
(974, 'behavior_definition', 53, 'cn', ''),
(975, 'behavior_definition', 53, 'en', ''),
(976, 'behavior_definition', 54, 'tw', '幫助部屬克服學習障礙，鼓勵「自我學習」強化自我提升改善的效能。'),
(977, 'behavior_definition', 54, 'cn', ''),
(978, 'behavior_definition', 54, 'en', ''),
(979, 'behavior_definition', 55, 'tw', '利用指導、訓練及工作指派等方式，來加強部屬的知識與技能、提昇部屬的工作績效。'),
(980, 'behavior_definition', 55, 'cn', ''),
(981, 'behavior_definition', 55, 'en', ''),
(982, 'behavior_definition', 56, 'tw', '針對公司現在及未來發展目標，能訂定出目前組織成員需要發展與尚待培養的能力。'),
(983, 'behavior_definition', 56, 'cn', ''),
(984, 'behavior_definition', 56, 'en', ''),
(985, 'behavior_definition', 57, 'tw', '願意提供實質的、詳細的指導與諮詢，來幫助組織成員解決工作上的問題。'),
(986, 'behavior_definition', 57, 'cn', ''),
(987, 'behavior_definition', 57, 'en', ''),
(988, 'behavior_definition', 58, 'tw', '對組織成員充分授權，以提升組織成員勇於面對問題與承擔責任的勇氣與能力。'),
(989, 'behavior_definition', 58, 'cn', ''),
(990, 'behavior_definition', 58, 'en', ''),
(991, 'behavior_definition', 59, 'tw', '對於具發展潛力的人才，能給予具挑戰性的工作，並幫助其建立信心、做好未來職涯發展規劃。'),
(992, 'behavior_definition', 59, 'cn', ''),
(993, 'behavior_definition', 59, 'en', ''),
(994, 'behavior_definition', 60, 'tw', '能將個人專業知識、工作和管理經驗，做有系統的整理與分享，提供部屬學習與參考。'),
(995, 'behavior_definition', 60, 'cn', ''),
(996, 'behavior_definition', 60, 'en', ''),
(997, 'competency_definition', 74, 'tw', '依據公司策略發展需求，訂定部門/單位的短中長期目標，做為部門/單位努力的方向。'),
(998, 'competency_definition', 74, 'cn', ''),
(999, 'competency_definition', 74, 'en', ''),
(1000, 'competency_definition', 75, 'tw', '能辨識任務的優先等級，擬訂縝密的行動計畫，有效安排所需的人力與資源，建立系統的工作方法與步驟，以確保有效達成既定目標。'),
(1001, 'competency_definition', 75, 'cn', ''),
(1002, 'competency_definition', 75, 'en', ''),
(1003, 'competency_definition', 76, 'tw', '能塑造明確的團隊文化及瞭解個別成員的能力和特性，運用適當、具彈性的互動模式，激勵及指引團隊成功的完成任務。'),
(1004, 'competency_definition', 76, 'cn', ''),
(1005, 'competency_definition', 76, 'en', ''),
(1006, 'competency_definition', 77, 'tw', '能運用策略及技巧，促成他人與己互動，並能設法影響及說服他人接受自己的想法、採取行動或促進目標的達成。'),
(1007, 'competency_definition', 77, 'cn', ''),
(1008, 'competency_definition', 77, 'en', ''),
(1009, 'competency_definition', 78, 'tw', '對於預定的工作計畫或上司交辦的事項，能意識到時間的急迫性，在既定的時間內迅速、有效的加以完成，以達成預定的工作目標。'),
(1010, 'competency_definition', 78, 'cn', ''),
(1011, 'competency_definition', 78, 'en', ''),
(1012, 'competency_definition', 79, 'tw', '遇到問題時，能蒐集決策所需的資訊進行分析思考，依據決策標準考量相關影響，選擇合適、有效的方案加以執行。'),
(1013, 'competency_definition', 79, 'cn', ''),
(1014, 'competency_definition', 79, 'en', ''),
(1015, 'competency_definition', 80, 'tw', '能依單位工作或專案任務預先擬定良好的執行步驟、時程進度與應變方案，並事先協調整合所需資源，以確保任務順利完成。'),
(1016, 'competency_definition', 80, 'cn', ''),
(1017, 'competency_definition', 80, 'en', ''),
(1018, 'competency_definition', 81, 'tw', '在工作執行過程中，能帶領團隊成員透過彼此的互信、分工合作、和支援協調等，共同解決工作上所發生的問題，並達成團隊的目標。'),
(1019, 'competency_definition', 81, 'cn', ''),
(1020, 'competency_definition', 81, 'en', ''),
(1021, 'competency_definition', 82, 'tw', '能視談話對象調整溝通方式，有條理的清楚表達想法，並正確解讀與回應他人所傳達的訊息。'),
(1022, 'competency_definition', 82, 'cn', ''),
(1023, 'competency_definition', 82, 'en', ''),
(1024, 'competency_definition', 83, 'tw', '運用組織各種相關資源，透過一定的作業程序，將計畫或任務有效落實，當過程中出現異常時，能彈性做出調整、排除障礙，達成單位既定的目標。'),
(1025, 'competency_definition', 83, 'cn', ''),
(1026, 'competency_definition', 83, 'en', ''),
(1027, 'competency_definition', 84, 'tw', '能發掘單位執行任務時的問題點，針對發生障礙的原因擬定對策，找出排除困難的執行方法。'),
(1028, 'competency_definition', 84, 'cn', ''),
(1029, 'competency_definition', 84, 'en', ''),
(1030, 'competency_model_definition', 41, 'tw', 'aaaaaaa'),
(1031, 'competency_model_definition', 41, 'cn', ''),
(1032, 'competency_model_definition', 41, 'en', ''),
(1033, 'competency_model_definition', 42, 'tw', '財務專業職能模型 for Demo'),
(1034, 'competency_model_definition', 42, 'cn', '财务专业职能模型 For Demo'),
(1035, 'competency_model_definition', 42, 'en', ''),
(1036, 'competency_definition', 85, 'tw', '能快速了解交易事實並靈活操作資訊系統以快速及正確的提供財務報表並能於閱讀分析後提供有效的經營資訊。'),
(1037, 'competency_definition', 85, 'cn', ''),
(1038, 'competency_definition', 85, 'en', ''),
(1039, 'competency_definition', 86, 'tw', '能快速了解交易事實並靈活操作資訊系統以快速及正確的提供財務報表並能於閱讀分析後提供有效的經營資訊。'),
(1040, 'competency_definition', 86, 'cn', ''),
(1041, 'competency_definition', 86, 'en', ''),
(1042, 'competency_definition', 87, 'tw', '針對帳務、稅務問題能有發現問題、解決問題的能力，並可透過問題分析以進行工作改善及流程合理化，以提升部門績效。'),
(1043, 'competency_definition', 87, 'cn', ''),
(1044, 'competency_definition', 87, 'en', ''),
(1045, 'competency_definition', 88, 'tw', '能依據交易行為規劃及執行合宜的內控、內稽制度，以確保公司權益。'),
(1046, 'competency_definition', 88, 'cn', ''),
(1047, 'competency_definition', 88, 'en', ''),
(1048, 'competency_definition', 89, 'tw', '有效溝通部門間的運作，以順利推動(規劃.展開)及控制專案進度。'),
(1049, 'competency_definition', 89, 'cn', ''),
(1050, 'competency_definition', 89, 'en', ''),
(1051, 'competency_definition', 90, 'tw', '能以正確的方法、專業的水準來規劃執行財稅相關政策制度。'),
(1052, 'competency_definition', 90, 'cn', ''),
(1053, 'competency_definition', 90, 'en', ''),
(1054, 'ability_def', 10, 'tw', '公司經營交易(產品.通路習性)流程的了解。'),
(1055, 'ability_def', 10, 'cn', ''),
(1056, 'ability_def', 10, 'en', ''),
(1057, 'ability_def', 11, 'tw', '基本經營管理知識(折讓率,邊際貢獻,價量差..等)'),
(1058, 'ability_def', 11, 'cn', ''),
(1059, 'ability_def', 11, 'en', ''),
(1060, 'ability_def', 12, 'tw', '資訊系統操作能力(EIS) '),
(1061, 'ability_def', 12, 'cn', ''),
(1062, 'ability_def', 12, 'en', ''),
(1063, 'ability_def', 13, 'tw', '基本報表彙編能力'),
(1064, 'ability_def', 13, 'cn', ''),
(1065, 'ability_def', 13, 'en', ''),
(1066, 'ability_def', 14, 'tw', '財務管理報表擬定原則規劃能力'),
(1067, 'ability_def', 14, 'cn', ''),
(1068, 'ability_def', 14, 'en', ''),
(1069, 'ability_def', 15, 'tw', '財務報表分析知識'),
(1070, 'ability_def', 15, 'cn', ''),
(1071, 'ability_def', 15, 'en', ''),
(1072, 'ability_def', 16, 'tw', '能審查財務報表.判斷問題點'),
(1073, 'ability_def', 16, 'cn', ''),
(1074, 'ability_def', 16, 'en', ''),
(1075, 'ability_def', 17, 'tw', '能透過財報解析.提出經營改善方向'),
(1076, 'ability_def', 17, 'cn', ''),
(1077, 'ability_def', 17, 'en', ''),
(1078, 'ability_def', 18, 'tw', '推動各部門經營改善'),
(1079, 'ability_def', 18, 'cn', ''),
(1080, 'ability_def', 18, 'en', ''),
(1081, 'ability_def', 19, 'tw', '具財務目標擬定能力'),
(1082, 'ability_def', 19, 'cn', ''),
(1083, 'ability_def', 19, 'en', ''),
(1084, 'ability_def', 20, 'tw', '具財務目標執行及追蹤改善能力'),
(1085, 'ability_def', 20, 'cn', ''),
(1086, 'ability_def', 20, 'en', ''),
(1087, 'ability_def', 21, 'tw', '具財務預警能力'),
(1088, 'ability_def', 21, 'cn', ''),
(1089, 'ability_def', 21, 'en', ''),
(1090, 'ability_def', 22, 'tw', '熟悉作業標準流程'),
(1091, 'ability_def', 22, 'cn', ''),
(1092, 'ability_def', 22, 'en', ''),
(1093, 'ability_def', 23, 'tw', '初會觀念知識 '),
(1094, 'ability_def', 23, 'cn', ''),
(1095, 'ability_def', 23, 'en', ''),
(1096, 'ability_def', 24, 'tw', '熟悉基本資訊系統操作'),
(1097, 'ability_def', 24, 'cn', ''),
(1098, 'ability_def', 24, 'en', ''),
(1099, 'ability_def', 25, 'tw', '會計實務運用'),
(1100, 'ability_def', 25, 'cn', ''),
(1101, 'ability_def', 25, 'en', ''),
(1102, 'ability_def', 26, 'tw', '資訊工具連結實務運用'),
(1103, 'ability_def', 26, 'cn', ''),
(1104, 'ability_def', 26, 'en', ''),
(1105, 'ability_def', 27, 'tw', '具備初級會計知識'),
(1106, 'ability_def', 27, 'cn', ''),
(1107, 'ability_def', 27, 'en', ''),
(1108, 'ability_def', 28, 'tw', '具備中級會計及成本會計知識'),
(1109, 'ability_def', 28, 'cn', ''),
(1110, 'ability_def', 28, 'en', ''),
(1111, 'ability_def', 29, 'tw', '具備管理會計知識 '),
(1112, 'ability_def', 29, 'cn', ''),
(1113, 'ability_def', 29, 'en', ''),
(1114, 'ability_def', 30, 'tw', '具備各項稅法知識'),
(1115, 'ability_def', 30, 'cn', ''),
(1116, 'ability_def', 30, 'en', ''),
(1117, 'ability_def', 31, 'tw', '具備票據法相關知識'),
(1118, 'ability_def', 31, 'cn', ''),
(1119, 'ability_def', 31, 'en', ''),
(1120, 'ability_def', 32, 'tw', '獨立解決問題,作出決策'),
(1121, 'ability_def', 32, 'cn', ''),
(1122, 'ability_def', 32, 'en', ''),
(1123, 'ability_def', 33, 'tw', '了解各項稅務規劃方式'),
(1124, 'ability_def', 33, 'cn', ''),
(1125, 'ability_def', 33, 'en', ''),
(1126, 'ability_def', 34, 'tw', '公司交易流程熟悉並整合能力'),
(1127, 'ability_def', 34, 'cn', ''),
(1128, 'ability_def', 34, 'en', ''),
(1129, 'ability_def', 35, 'tw', '對最新政策法規能解讀,分析進而建議因應對策'),
(1130, 'ability_def', 35, 'cn', ''),
(1131, 'ability_def', 35, 'en', ''),
(1132, 'ability_def', 36, 'tw', '與國稅局溝通協調及談判能力'),
(1133, 'ability_def', 36, 'cn', ''),
(1134, 'ability_def', 36, 'en', ''),
(1135, 'ability_def', 37, 'tw', '簡化改善流程提高效率與正確性'),
(1136, 'ability_def', 37, 'cn', ''),
(1137, 'ability_def', 37, 'en', ''),
(1138, 'ability_def', 38, 'tw', '協助指導團隊會計實務'),
(1139, 'ability_def', 38, 'cn', ''),
(1140, 'ability_def', 38, 'en', ''),
(1141, 'ability_def', 39, 'tw', '提出系統改善提升效率'),
(1142, 'ability_def', 39, 'cn', ''),
(1143, 'ability_def', 39, 'en', ''),
(1144, 'ability_def', 40, 'tw', '合法節稅的實務操作'),
(1145, 'ability_def', 40, 'cn', ''),
(1146, 'ability_def', 40, 'en', ''),
(1147, 'ability_def', 41, 'tw', '作業時程及管控人員安排'),
(1148, 'ability_def', 41, 'cn', ''),
(1149, 'ability_def', 41, 'en', ''),
(1150, 'ability_def', 42, 'tw', '流程規劃能力'),
(1151, 'ability_def', 42, 'cn', ''),
(1152, 'ability_def', 42, 'en', ''),
(1153, 'ability_def', 43, 'tw', '財務規劃能力'),
(1154, 'ability_def', 43, 'cn', ''),
(1155, 'ability_def', 43, 'en', ''),
(1156, 'ability_def', 44, 'tw', '熟悉內稽實務觀念'),
(1157, 'ability_def', 44, 'cn', ''),
(1158, 'ability_def', 44, 'en', ''),
(1159, 'ability_def', 45, 'tw', '熟悉公司交易流程及制度規章'),
(1160, 'ability_def', 45, 'cn', ''),
(1161, 'ability_def', 45, 'en', ''),
(1162, 'ability_def', 46, 'tw', '熟悉內控制度規範'),
(1163, 'ability_def', 46, 'cn', ''),
(1164, 'ability_def', 46, 'en', ''),
(1165, 'ability_def', 47, 'tw', '熟悉勞基法'),
(1166, 'ability_def', 47, 'cn', ''),
(1167, 'ability_def', 47, 'en', ''),
(1168, 'ability_def', 48, 'tw', '可清楚陳述作業程序'),
(1169, 'ability_def', 48, 'cn', ''),
(1170, 'ability_def', 48, 'en', ''),
(1171, 'ability_def', 49, 'tw', '熟悉公司法'),
(1172, 'ability_def', 49, 'cn', ''),
(1173, 'ability_def', 49, 'en', ''),
(1174, 'ability_def', 50, 'tw', '內稽異常問題流程發現能力'),
(1175, 'ability_def', 50, 'cn', ''),
(1176, 'ability_def', 50, 'en', ''),
(1177, 'ability_def', 51, 'tw', '分析內控風險與評估'),
(1178, 'ability_def', 51, 'cn', ''),
(1179, 'ability_def', 51, 'en', ''),
(1180, 'ability_def', 52, 'tw', '改善提升內稽流程'),
(1181, 'ability_def', 52, 'cn', ''),
(1182, 'ability_def', 52, 'en', ''),
(1183, 'ability_def', 53, 'tw', '風險管理提出有效內控改善'),
(1184, 'ability_def', 53, 'cn', ''),
(1185, 'ability_def', 53, 'en', ''),
(1186, 'ability_def', 54, 'tw', '規劃控制及制度改善'),
(1187, 'ability_def', 54, 'cn', ''),
(1188, 'ability_def', 54, 'en', ''),
(1189, 'ability_def', 55, 'tw', '持續評估並提升內控有效性'),
(1190, 'ability_def', 55, 'cn', ''),
(1191, 'ability_def', 55, 'en', ''),
(1192, 'ability_def', 56, 'tw', '對專案提案內容熟悉'),
(1193, 'ability_def', 56, 'cn', ''),
(1194, 'ability_def', 56, 'en', ''),
(1195, 'ability_def', 57, 'tw', '對專案計晝方向了解'),
(1196, 'ability_def', 57, 'cn', ''),
(1197, 'ability_def', 57, 'en', ''),
(1198, 'ability_def', 58, 'tw', '對提案內容定義問題需求及設定目標範疇的能力'),
(1199, 'ability_def', 58, 'cn', ''),
(1200, 'ability_def', 58, 'en', ''),
(1201, 'ability_def', 59, 'tw', '對組織運作及成員能力的了解'),
(1202, 'ability_def', 59, 'cn', ''),
(1203, 'ability_def', 59, 'en', ''),
(1204, 'ability_def', 60, 'tw', '對專案計劃之整合及規劃“人、事、時、地、物、財”之能力'),
(1205, 'ability_def', 60, 'cn', ''),
(1206, 'ability_def', 60, 'en', ''),
(1207, 'ability_def', 61, 'tw', '對專案執行能力產出工作任務各階段及最終實際成果的能力'),
(1208, 'ability_def', 61, 'cn', ''),
(1209, 'ability_def', 61, 'en', ''),
(1210, 'ability_def', 62, 'tw', '對專案控管之追蹤、查核、記錄、分析、報告、及更正的能力'),
(1211, 'ability_def', 62, 'cn', ''),
(1212, 'ability_def', 62, 'en', ''),
(1213, 'ability_def', 63, 'tw', '對專案結案之驗收、檢討、改善各階段及最終成果的能力'),
(1214, 'ability_def', 63, 'cn', ''),
(1215, 'ability_def', 63, 'en', ''),
(1216, 'ability_def', 64, 'tw', '規劃專案管理能力有效地掌控工作任務的「範疇」、「時間」、「預算」、「資源」、「品質」、「風險」、「團隊」、「溝通」等重要活動元素，有效的產出最佳的績效成果'),
(1217, 'ability_def', 64, 'cn', ''),
(1218, 'ability_def', 64, 'en', ''),
(1219, 'ability_def', 65, 'tw', '具最新政策法規的蒐集能力'),
(1220, 'ability_def', 65, 'cn', ''),
(1221, 'ability_def', 65, 'en', ''),
(1222, 'ability_def', 66, 'tw', '票據法'),
(1223, 'ability_def', 66, 'cn', ''),
(1224, 'ability_def', 66, 'en', ''),
(1225, 'ability_def', 67, 'tw', '金融相關知識'),
(1226, 'ability_def', 67, 'cn', ''),
(1227, 'ability_def', 67, 'en', ''),
(1228, 'ability_def', 68, 'tw', '各項投資商品知識'),
(1229, 'ability_def', 68, 'cn', ''),
(1230, 'ability_def', 68, 'en', ''),
(1231, 'ability_def', 69, 'tw', '銀行及財經知識'),
(1232, 'ability_def', 69, 'cn', ''),
(1233, 'ability_def', 69, 'en', ''),
(1234, 'ability_def', 70, 'tw', '具備金融相關知識'),
(1235, 'ability_def', 70, 'cn', ''),
(1236, 'ability_def', 70, 'en', ''),
(1237, 'ability_def', 71, 'tw', '投資理財商品的操作'),
(1238, 'ability_def', 71, 'cn', ''),
(1239, 'ability_def', 71, 'en', ''),
(1240, 'ability_def', 72, 'tw', '銀行實務操作'),
(1241, 'ability_def', 72, 'cn', ''),
(1242, 'ability_def', 72, 'en', ''),
(1243, 'ability_def', 73, 'tw', '對最新政策法規能解讀,分析進而建議因應對策'),
(1244, 'ability_def', 73, 'cn', ''),
(1245, 'ability_def', 73, 'en', ''),
(1246, 'ability_def', 74, 'tw', '稅務規劃能力'),
(1247, 'ability_def', 74, 'cn', ''),
(1248, 'ability_def', 74, 'en', ''),
(1249, 'ability_def', 75, 'tw', '資金規劃能力'),
(1250, 'ability_def', 75, 'cn', ''),
(1251, 'ability_def', 75, 'en', ''),
(1252, 'ability_def', 76, 'tw', '資金風險管理'),
(1253, 'ability_def', 76, 'cn', ''),
(1254, 'ability_def', 76, 'en', ''),
(1255, 'ability_def', 77, 'tw', '規劃財稅相閞政策及制度建立能力'),
(1256, 'ability_def', 77, 'cn', ''),
(1257, 'ability_def', 77, 'en', '');

-- --------------------------------------------------------

--
-- 資料表格式： `tpl`
--

CREATE TABLE IF NOT EXISTS `tpl` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tpl_title` varchar(100) NOT NULL,
  `tpl_sender` varchar(100) NOT NULL,
  `tpl_content` text NOT NULL,
  PRIMARY KEY (`tpl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `tpl`
--


-- --------------------------------------------------------

--
-- 資料表格式： `training_material`
--

CREATE TABLE IF NOT EXISTS `training_material` (
  `training_material_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_material_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 列出以下資料庫的數據： `training_material`
--

INSERT INTO `training_material` (`training_material_id`, `competency_level_id`) VALUES
(12, 14),
(13, 14),
(14, 22),
(15, 22),
(16, 22),
(17, 22);

-- --------------------------------------------------------

--
-- 資料表格式： `training_method`
--

CREATE TABLE IF NOT EXISTS `training_method` (
  `training_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_method_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

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
(16, 22),
(17, 22),
(18, 22),
(19, 22);

-- --------------------------------------------------------

--
-- 資料表格式： `training_teacher`
--

CREATE TABLE IF NOT EXISTS `training_teacher` (
  `training_teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_teacher_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 列出以下資料庫的數據： `training_teacher`
--

INSERT INTO `training_teacher` (`training_teacher_id`, `competency_level_id`) VALUES
(19, 14),
(20, 22),
(21, 22);

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
  `account_status` varchar(1) NOT NULL DEFAULT 'T',
  `job_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_code` varchar(10) NOT NULL,
  `login_count` int(10) unsigned NOT NULL,
  `login_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 列出以下資料庫的數據： `user_profile`
--

INSERT INTO `user_profile` (`user_id`, `fullName`, `user_name_chs`, `user_name_eng`, `user_mps`, `name`, `first_name`, `last_name`, `birth_day`, `birth_month`, `birth_year`, `gender`, `job_title`, `company_id`, `notes`, `city_code`, `address`, `url`, `office_phone`, `home_phone`, `mobile`, `image`, `power_type`, `account_status`, `job_id`, `department_id`, `user_code`, `login_count`, `login_date`) VALUES
(1, '陳志維', '陈志维', 'James Chen', '', '', '', '', 0, 0, 0, '', '', 0, '', 0, '', '', '', '', '', '', 'M', '', 0, 0, '', 0, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 列出以下資料庫的數據： `user_sso`
--

INSERT INTO `user_sso` (`user_email_id`, `user_email`, `user_live_id`, `user_fb_id`, `user_id`, `user_account`, `password`) VALUES
(1, 'james@bhrsp.com', '', '', 1, 'james', '12345');
