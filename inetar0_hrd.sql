-- phpMyAdmin SQL Dump
-- version 2.11.9.5
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 建立日期: Feb 04, 2017, 03:13 PM
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `ability`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=82 ;

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
  `basis_evaluation_evaluator_progress` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_evaluator_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=84 ;

--
-- 列出以下資料庫的數據： `basis_evaluation_evaluator`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 列出以下資料庫的數據： `basis_evaluation_evaluator_competeny`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=126 ;

--
-- 列出以下資料庫的數據： `basis_evaluation_evaluator_detail`
--


-- --------------------------------------------------------

--
-- 資料表格式： `basis_evaluation_open_comment`
--

CREATE TABLE IF NOT EXISTS `basis_evaluation_open_comment` (
  `basis_evaluation_open_comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `basis_evaluation_table_id` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_open_comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `basis_evaluation_open_comment`
--


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

--
-- 列出以下資料庫的數據： `basis_evaluation_report`
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
  `competency_model_id` int(11) DEFAULT '0',
  `evaluation_scale_id` int(11) NOT NULL,
  `basis_evaluation_table_status` varchar(6) NOT NULL,
  `basis_evaluation_table_process` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_table_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 列出以下資料庫的數據： `basis_evaluation_table`
--

INSERT INTO `basis_evaluation_table` (`basis_evaluation_table_id`, `basis_evaluation_table_code`, `is_show_competency`, `due_date`, `competency_model_id`, `evaluation_scale_id`, `basis_evaluation_table_status`, `basis_evaluation_table_process`) VALUES
(3, '2016_HLEVEL', 'F', '2016-10-31', 2, 1, 'EDT', 0);

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

--
-- 列出以下資料庫的數據： `basis_evaluation_user_comment`
--


-- --------------------------------------------------------

--
-- 資料表格式： `behavior`
--

CREATE TABLE IF NOT EXISTS `behavior` (
  `behavior_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_id` int(11) NOT NULL,
  `weight` decimal(10,1) NOT NULL,
  PRIMARY KEY (`behavior_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- 列出以下資料庫的數據： `behavior`
--

INSERT INTO `behavior` (`behavior_id`, `competency_id`, `weight`) VALUES
(1, 1, 1.0),
(2, 1, 1.0),
(3, 1, 1.0),
(4, 1, 1.0),
(5, 1, 1.0),
(6, 2, 1.0),
(7, 2, 1.0),
(8, 2, 1.0),
(9, 2, 1.0),
(10, 2, 1.0),
(11, 3, 1.0),
(12, 3, 1.0),
(13, 3, 1.0),
(14, 3, 1.0),
(15, 3, 1.0),
(16, 4, 1.0),
(17, 4, 1.0),
(18, 4, 1.0),
(19, 4, 1.0),
(20, 4, 1.0),
(21, 5, 1.0),
(22, 5, 1.0),
(23, 5, 1.0),
(24, 5, 1.0),
(25, 5, 1.0),
(26, 6, 1.0),
(27, 6, 1.0),
(28, 6, 1.0),
(29, 6, 1.0),
(30, 6, 1.0),
(31, 7, 1.0),
(32, 7, 1.0),
(33, 7, 1.0),
(34, 7, 1.0),
(35, 7, 1.0),
(36, 8, 1.0),
(37, 8, 1.0),
(38, 8, 1.0),
(39, 8, 1.0),
(40, 8, 1.0),
(41, 10, 1.0),
(42, 10, 1.0),
(43, 10, 1.0),
(44, 10, 1.0),
(45, 10, 1.0),
(46, 11, 1.0),
(47, 11, 1.0),
(48, 11, 1.0),
(49, 11, 1.0),
(50, 11, 1.0),
(51, 12, 1.0),
(52, 12, 1.0),
(53, 12, 1.0),
(54, 12, 1.0),
(55, 12, 1.0),
(56, 13, 1.0),
(57, 13, 1.0),
(58, 13, 1.0),
(59, 13, 1.0),
(60, 13, 1.0),
(61, 14, 1.0),
(62, 14, 1.0),
(63, 14, 1.0),
(64, 14, 1.0),
(65, 14, 1.0),
(66, 15, 1.0),
(67, 15, 1.0),
(68, 15, 1.0),
(69, 15, 1.0),
(70, 15, 1.0),
(71, 16, 1.0),
(72, 16, 1.0),
(73, 16, 1.0),
(74, 16, 1.0),
(75, 16, 1.0);

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
  `class_evaluation_progress` int(11) NOT NULL,
  PRIMARY KEY (`class_evaluation_appraisee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `class_evaluation_appraisee`
--


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `class_evaluation_competency`
--


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
  `evaluated_date` datetime NOT NULL,
  PRIMARY KEY (`class_evaluation_evaluator_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  `competency_sort` int(11) NOT NULL,
  PRIMARY KEY (`competency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 列出以下資料庫的數據： `competency`
--

INSERT INTO `competency` (`competency_id`, `competency_type`, `competency_method`, `competency_model_id`, `competency_weight`, `competency_level_number`, `competency_sort`) VALUES
(1, 'M', 'B', 1, 1.0, 0, 0),
(2, 'M', 'B', 1, 1.0, 0, 0),
(3, 'M', 'B', 1, 1.0, 0, 0),
(4, 'M', 'B', 1, 1.0, 0, 0),
(5, 'M', 'B', 1, 1.0, 0, 0),
(6, 'M', 'B', 2, 1.0, 0, 0),
(7, 'M', 'B', 2, 1.0, 0, 0),
(8, 'M', 'B', 2, 1.0, 0, 0),
(10, 'M', 'B', 2, 1.0, 0, 0),
(11, 'M', 'B', 2, 1.0, 0, 0),
(12, 'M', 'B', 3, 1.0, 0, 0),
(13, 'M', 'B', 3, 1.0, 0, 0),
(14, 'M', 'B', 3, 1.0, 0, 0),
(15, 'M', 'B', 3, 1.0, 0, 0),
(16, 'M', 'B', 3, 1.0, 0, 0);

-- --------------------------------------------------------

--
-- 資料表格式： `competency_dic`
--

CREATE TABLE IF NOT EXISTS `competency_dic` (
  `competency_dic_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_dic_code` varchar(10) DEFAULT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `competency_evaluation`
--


-- --------------------------------------------------------

--
-- 資料表格式： `competency_level`
--

CREATE TABLE IF NOT EXISTS `competency_level` (
  `competency_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_id` int(11) NOT NULL,
  `competency_level` int(11) NOT NULL,
  PRIMARY KEY (`competency_level_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 列出以下資料庫的數據： `competency_level`
--

INSERT INTO `competency_level` (`competency_level_id`, `competency_id`, `competency_level`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 列出以下資料庫的數據： `competency_model`
--

INSERT INTO `competency_model` (`competency_model_id`, `competency_model_count`, `competency_model_type`, `competency_model_method`, `competency_level_number`) VALUES
(1, 5, 'M', 'B', 0),
(2, 5, 'M', 'B', 0),
(3, 5, 'M', 'B', 0);

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

--
-- 列出以下資料庫的數據： `competency_model_standard`
--


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `course_property`
--


-- --------------------------------------------------------

--
-- 資料表格式： `evaluation_relation`
--

CREATE TABLE IF NOT EXISTS `evaluation_relation` (
  `evaluation_relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_relation_code` varchar(10) NOT NULL,
  PRIMARY KEY (`evaluation_relation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 列出以下資料庫的數據： `evaluation_relation`
--

INSERT INTO `evaluation_relation` (`evaluation_relation_id`, `evaluation_relation_code`) VALUES
(5, '1');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 列出以下資料庫的數據： `evaluation_scale`
--

INSERT INTO `evaluation_scale` (`evaluation_scale_id`, `evaluation_scale_item_count`, `evaluation_scale_basis`, `evaluation_scale_status`) VALUES
(1, 7, 1.00, '');

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
  `favorite_title` varchar(50) NOT NULL,
  `favorite_url` varchar(200) NOT NULL,
  PRIMARY KEY (`favorite_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 列出以下資料庫的數據： `favorite_url`
--

INSERT INTO `favorite_url` (`favorite_id`, `favorite_title`, `favorite_url`) VALUES
(1, '職能系統', ''),
(2, '訓練系統', ''),
(3, 'KPI系統', ''),
(4, '績效系統', ''),
(5, '工作說明書', ''),
(6, '人才庫系統', '');

-- --------------------------------------------------------

--
-- 資料表格式： `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `groups_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groups_code` varchar(20) NOT NULL,
  PRIMARY KEY (`groups_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- 列出以下資料庫的數據： `groups`
--

INSERT INTO `groups` (`groups_id`, `groups_code`) VALUES
(102, '102');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=241 ;

--
-- 列出以下資料庫的數據： `group_member`
--

INSERT INTO `group_member` (`group_member_id`, `group_id`, `user_id`, `role`) VALUES
(240, 22, 179, ''),
(239, 32, 178, ''),
(238, 32, 177, ''),
(237, 32, 176, ''),
(236, 31, 175, ''),
(235, 31, 174, ''),
(234, 13, 173, ''),
(233, 31, 172, ''),
(232, 30, 171, ''),
(231, 13, 170, ''),
(230, 18, 169, ''),
(229, 18, 168, ''),
(228, 18, 167, ''),
(227, 17, 166, ''),
(226, 8, 165, ''),
(225, 8, 164, ''),
(224, 27, 163, ''),
(223, 27, 162, ''),
(222, 27, 161, ''),
(221, 27, 160, ''),
(220, 29, 159, ''),
(219, 28, 158, ''),
(218, 28, 157, ''),
(217, 28, 156, ''),
(216, 28, 155, ''),
(215, 28, 154, ''),
(214, 28, 153, ''),
(213, 28, 152, ''),
(212, 12, 151, ''),
(211, 12, 150, ''),
(210, 26, 149, ''),
(209, 26, 148, ''),
(208, 26, 147, ''),
(207, 26, 146, ''),
(206, 26, 145, ''),
(205, 26, 144, ''),
(204, 26, 143, ''),
(203, 26, 142, ''),
(202, 25, 141, ''),
(201, 25, 140, ''),
(200, 25, 139, ''),
(199, 25, 138, ''),
(198, 11, 137, ''),
(197, 11, 136, ''),
(196, 11, 135, ''),
(195, 11, 134, ''),
(194, 21, 133, ''),
(193, 21, 132, ''),
(192, 20, 131, ''),
(191, 20, 130, ''),
(190, 20, 129, ''),
(189, 19, 128, ''),
(188, 19, 127, ''),
(187, 19, 126, ''),
(186, 19, 125, ''),
(185, 9, 124, ''),
(184, 24, 123, ''),
(183, 24, 122, ''),
(182, 23, 121, ''),
(181, 23, 120, ''),
(180, 23, 119, ''),
(179, 22, 118, ''),
(178, 10, 117, ''),
(177, 10, 116, ''),
(176, 6, 115, ''),
(175, 6, 114, ''),
(174, 6, 113, ''),
(173, 6, 112, ''),
(172, 6, 111, ''),
(171, 15, 110, ''),
(170, 16, 109, ''),
(169, 5, 108, ''),
(168, 5, 107, ''),
(167, 5, 106, ''),
(166, 1, 105, ''),
(165, 4, 104, ''),
(164, 3, 103, ''),
(163, 2, 102, ''),
(162, 1, 101, ''),
(161, 1, 100, '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- 列出以下資料庫的數據： `group_property`
--

INSERT INTO `group_property` (`group_id`, `group_type`, `group_title`, `group_parent_id`, `group_code`, `group_level`, `company_id`) VALUES
(1, 'dep', '', 0, '', 0, 102),
(2, 'dep', '', 1, 'HQ_1', 1, 102),
(3, 'dep', '', 1, 'HQ_2', 1, 102),
(4, 'dep', '', 1, 'HQ_3', 1, 102),
(5, 'dep', '', 1, 'HQ-PJ', 2, 102),
(6, 'dep', '', 1, 'HQ-SA', 2, 102),
(7, 'dep', '', 1, 'HQ-AD', 2, 102),
(8, 'dep', '', 3, 'HQ-OP', 2, 102),
(9, 'dep', '', 2, 'HQ-SK', 2, 102),
(10, 'dep', '', 2, 'HQ-RD', 2, 102),
(11, 'dep', '', 2, 'HQ-ED', 2, 102),
(12, 'dep', '', 3, 'HQ-MD', 2, 102),
(13, 'dep', '', 4, 'HQ-PD', 2, 102),
(14, 'dep', '', 7, 'HQ-AD01', 3, 102),
(15, 'dep', '', 7, 'HQ-AD02', 3, 102),
(16, 'dep', '', 7, 'HQ-AD03', 3, 102),
(17, 'dep', '', 8, 'HQ-OP01', 3, 102),
(18, 'dep', '', 8, 'HQ-OP02', 3, 102),
(19, 'dep', '', 9, 'HQ-SK01', 3, 102),
(20, 'dep', '', 9, 'HQ-SK02', 3, 102),
(21, 'dep', '', 9, 'HQ-SK03', 3, 102),
(22, 'dep', '', 10, 'HQ-RD01', 3, 102),
(23, 'dep', '', 10, 'HQ-RD02', 3, 102),
(24, 'dep', '', 10, 'HQ-RD03', 3, 102),
(25, 'dep', '', 11, 'HQ-ED01', 3, 102),
(26, 'dep', '', 11, 'HQ-ED02', 3, 102),
(27, 'dep', '', 12, 'HQ-MD01', 3, 102),
(28, 'dep', '', 12, 'HQ-MD02', 3, 102),
(29, 'dep', '', 12, 'HQ-MD03', 3, 102),
(30, 'dep', '', 13, 'HQ-PD01', 3, 102),
(31, 'dep', '', 13, 'HQ-PD02', 3, 102),
(32, 'dep', '', 13, 'HQ-PD03', 3, 102);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 列出以下資料庫的數據： `job`
--

INSERT INTO `job` (`job_id`, `job_family_id`, `job_level`, `job_type_id`, `core_competency_model_id`, `manage_competency_model_id`, `general_competency_model_id`, `professional_competency_model_id`) VALUES
(1, 1, 11, 0, 0, 0, 0, 0),
(2, 1, 11, 0, 0, 0, 0, 0),
(3, 1, 10, 0, 0, 0, 0, 0),
(4, 1, 9, 0, 0, 0, 0, 0),
(5, 1, 8, 0, 0, 0, 0, 0),
(6, 1, 7, 0, 0, 0, 0, 0),
(7, 1, 6, 0, 0, 0, 0, 0),
(8, 1, 7, 0, 0, 0, 0, 0),
(9, 1, 5, 0, 0, 0, 0, 0),
(10, 1, 4, 0, 0, 0, 0, 0),
(11, 1, 3, 0, 0, 0, 0, 0),
(12, 1, 3, 0, 0, 0, 0, 0),
(13, 0, 0, 0, 0, 0, 0, 0),
(14, 0, 0, 0, 0, 0, 0, 0),
(15, 0, 0, 0, 0, 0, 0, 0),
(16, 0, 0, 0, 0, 0, 0, 0),
(17, 0, 0, 0, 0, 0, 0, 0),
(18, 0, 0, 0, 0, 0, 0, 0),
(19, 0, 0, 0, 0, 0, 0, 0),
(20, 0, 0, 0, 0, 0, 0, 0),
(21, 0, 0, 0, 0, 0, 0, 0),
(22, 0, 0, 0, 0, 0, 0, 0),
(23, 0, 0, 0, 0, 0, 0, 0),
(24, 0, 0, 0, 0, 0, 0, 0),
(25, 0, 0, 0, 0, 0, 0, 0),
(26, 0, 0, 0, 0, 0, 0, 0),
(27, 0, 0, 0, 0, 0, 0, 0),
(28, 0, 0, 0, 0, 0, 0, 0),
(29, 0, 0, 0, 0, 0, 0, 0),
(30, 0, 0, 0, 0, 0, 0, 0),
(31, 0, 0, 0, 0, 0, 0, 0),
(32, 0, 0, 0, 0, 0, 0, 0),
(33, 0, 0, 0, 0, 0, 0, 0),
(34, 0, 0, 0, 0, 0, 0, 0),
(35, 0, 0, 0, 0, 0, 0, 0),
(36, 0, 0, 0, 0, 0, 0, 0),
(37, 0, 0, 0, 0, 0, 0, 0),
(38, 0, 0, 0, 0, 0, 0, 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `job_competency`
--


-- --------------------------------------------------------

--
-- 資料表格式： `job_family`
--

CREATE TABLE IF NOT EXISTS `job_family` (
  `job_family_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`job_family_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 列出以下資料庫的數據： `job_family`
--

INSERT INTO `job_family` (`job_family_id`, `company_id`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- 資料表格式： `job_type`
--

CREATE TABLE IF NOT EXISTS `job_type` (
  `job_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_type_code` varchar(10) NOT NULL,
  PRIMARY KEY (`job_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `job_type`
--


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

--
-- 列出以下資料庫的數據： `mail_poll`
--


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

--
-- 列出以下資料庫的數據： `majoy_company`
--


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

--
-- 列出以下資料庫的數據： `menu_structure`
--

INSERT INTO `menu_structure` (`menuCode`, `active_status`, `menuIndex`, `menuName`, `menuNote`, `menuType`, `menuUrl`, `parentId`, `level`) VALUES
('2-1', 'T', 1, '基本信息', 'NOTE', '1', '', '2', 1),
('2-5', 'T', 1, '職能管理與評鑑系統', 'NOTE', '1', '', '2', 1),
('2-5-1', 'T', 1, '職能評鑑(基準制)', 'NOTE', '1', '\\/competencyevaluation\\/basis\\/list.html', '2-5', 2),
('2-5-2', 'T', 1, '職能評鑑(分級制)', 'NOTE', '1', '\\/competencyevaluation\\/class\\/list.html', '2-5', 2),
('2-5-3', 'T', 1, '查看我的報表', 'NOTE', '1', '\\/export\\/my-report\\/list.html', '2-5', 2),
('7-1', 'T', 1, '職能字典', 'NOTE', '1', '', '7', 1),
('7-1-1', 'T', 1, '核心職能字典', 'NOTE', '1', '\\/competency-dic\\/list\\/list.html?type=C', '7-1', 2),
('7-1-2', 'T', 1, '管理職能字典', 'NOTE', '1', '\\/competency-dic\\/list\\/list.html?type=M', '7-1', 2),
('7-2', 'T', 1, '職能模型管理', 'NOTE', '1', '', '7', 1),
('7-2-1', 'T', 1, '核心職能', 'NOTE', '1', '\\/competencymodel\\/setting\\/list.html?method=B&type=C', '7-2', 2),
('7-2-2', 'T', 1, '管理職能(基準制)', 'NOTE', '1', '\\/competencymodel\\/setting\\/list.html?method=B&type=M', '7-2', 2),
('7-2-3', 'T', 1, '管理職能(分級制)', 'NOTE', '1', '\\/competencymodel\\/setting\\/list.html?method=C&type=M', '7-2', 2),
('7-2-4', 'T', 1, '專業職能(基準制)', 'NOTE', '1', '\\/competencymodel\\/setting\\/list.html?method=B&type=P', '7-2', 2),
('7-2-5', 'T', 1, '專業職能(分級制)', 'NOTE', '1', '\\/competencymodel\\/setting\\/list.html?method=C&type=P', '7-2', 2),
('7-2-6', 'T', 1, '通用職能(基準制)', 'NOTE', '1', '\\/competencymodel\\/setting\\/list.html?method=B&type=G', '7-2', 2),
('7-2-7', 'T', 1, '通用職能(分級制)', 'NOTE', '1', '\\/competencymodel\\/setting\\/list.html?method=C&type=G', '7-2', 2),
('7-3', 'T', 1, '職能標準設定', 'NOTE', '1', '', '7', 1),
('7-3-1', 'T', 1, '管理職能標準', 'NOTE', '1', '\\/competencymodelstandard\\/list\\/list.html?type=M', '7-3', 2),
('7-3-2', 'T', 1, '專業職能標準', 'NOTE', '1', '\\/competencymodelstandard\\/list\\/list.html?type=P', '7-3', 2),
('7-3-3', 'T', 1, '通用職能標準', 'NOTE', '1', '\\/competencymodelstandard\\/list\\/list.html?type=G', '7-3', 2),
('7-4', 'T', 1, '評鑑管理', 'NOTE', '1', '', '7', 1),
('7-4-1', 'T', 1, '評鑑關係設定', 'NOTE', '1', '\\/evaluationrelation\\/list\\/list.html', '7-4', 2),
('7-4-2', 'T', 1, '量表設定', 'NOTE', '1', '\\/evaluationscale\\/list\\/list.html', '7-4', 2),
('7-5', 'T', 1, '評鑑表管理 (基準制)', 'NOTE', '1', '', '7', 1),
('7-5-1', 'T', 1, '編輯中評鑑表', 'NOTE', '1', '\\/basisevaluationtable\\/list\\/list.html?S=EDT', '7-5', 2),
('7-5-2', 'T', 1, '評鑑中評鑑表', 'NOTE', '1', '\\/basisevaluationtable\\/list\\/list.html?S=PUB', '7-5', 2),
('7-5-3', 'T', 1, '已完成評鑑表', 'NOTE', '1', '\\/basisevaluationtable\\/list\\/list.html?S=FNS', '7-5', 2),
('7-6', 'T', 1, '評鑑表管理 (分級制)', 'NOTE', '1', '', '7', 1),
('7-6-1', 'T', 1, '評鑑表設定', 'NOTE', '1', '\\/classevaluationtableappraisee\\/list\\/list.html', '7-6', 2),
('7-7', 'T', 1, 'HR管理模組', 'NOTE', '1', '', '7', 1),
('7-7-1', 'T', 1, '評鑑表審核', 'NOTE', '1', '\\/evaluation-table-review-appraisee\\/list\\/list.html?S=R', '7-7', 2),
('7-7-2', 'T', 1, '評鑑表發佈', 'NOTE', '1', '\\/evaluation-table-review-appraisee\\/list\\/list.html?S=P', '7-7', 2),
('7-7-3', 'T', 1, '評鑑進度管理', 'NOTE', '1', '\\/evaluation-table-review-appraisee\\/list\\/list.html?S=C', '7-7', 2),
('7-7-4', 'T', 1, '評鑑結果調整', 'NOTE', '1', '\\/evaluation-table-review-appraisee\\/list\\/list.html?S=A', '7-7', 2),
('7-7-5', 'T', 1, '警示功能管理', 'NOTE', '1', '\\/alarm\\/detail\\/edit.html', '7-7', 2),
('7-8', 'T', 1, '報表管理', 'NOTE', '1', '', '7', 1),
('7-8-1', 'T', 1, '報告(基準制)', 'NOTE', '1', '\\/report\\/basis\\/list.html', '7-8', 2),
('7-8-2', 'T', 1, '報告(分級制)', 'NOTE', '1', '\\/report\\/class\\/list.html', '7-8', 2),
('3-1', 'T', 1, '組織管理', 'NOTE', '1', '', '3', 1),
('3-1-2', 'T', 1, '公司列表', 'NOTE', '1', '\\/organization\\/companies\\/list.html', '3-1', 2),
('3-2', 'T', 1, '帳號與權限管理', 'NOTE', '1', '', '3', 1),
('3-2-1', 'T', 1, '管理帳號', 'NOTE', '1', '\\/account\\/list\\/list.html?type=M', '3-2', 2),
('3-2-2', 'T', 1, '一般帳號', 'NOTE', '1', '\\/account\\/list\\/list.html?type=N', '3-2', 2),
('3-2-3', 'T', 1, '顧問帳號', 'NOTE', '1', '\\/account\\/list\\/list.html?type=C', '3-2', 2),
('3-3', 'T', 1, '職等職稱表管理', 'NOTE', '1', '', '3', 1),
('3-3-1', 'T', 1, '職等職稱表管理', 'NOTE', '1', '\\/job\\/family\\/list.html', '3-3', 2),
('3-3-2', 'T', 1, '職等職稱矩陣表', 'NOTE', '1', '\\/job-family\\/matrix\\/list.html', '3-3', 2),
('3-3-3', 'T', 1, '工作類別', 'NOTE', '1', '\\/job\\/type\\/list.html', '3-3', 2),
('3-4', 'T', 1, '系統服務器設定', 'NOTE', '1', '', '3', 1),
('3-4-1', 'T', 1, '郵件服務器', 'NOTE', '1', '\\/mail\\/server\\/edit.html?m=1', '3-4', 2),
('3-4-2', 'T', 1, '系統連線網址', 'NOTE', '1', '\\/website\\/url\\/edit.html?m=1', '3-4', 2),
('3-4-3', 'T', 1, '郵件模板', 'NOTE', '1', '\\/mail-tpl\\/list\\/list.html', '3-4', 2),
('3-4-4', 'T', 1, '資料庫管理', 'NOTE', '1', '\\/database\\/backup\\/edit.html?m=1', '3-4', 2),
('3-4-5', 'T', 1, '授權管理', 'NOTE', '1', '\\/regist\\/sn\\/edit.html?m=1', '3-4', 2);

-- --------------------------------------------------------

--
-- 資料表格式： `org_company`
--

CREATE TABLE IF NOT EXISTS `org_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `groups_id` int(11) NOT NULL,
  `company_code` varchar(20) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- 列出以下資料庫的數據： `org_company`
--

INSERT INTO `org_company` (`company_id`, `groups_id`, `company_code`) VALUES
(102, 102, '102');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 列出以下資料庫的數據： `profile_behavior`
--

INSERT INTO `profile_behavior` (`profile_behavior_id`, `user_id`, `behavior_id`, `behavior_arithmetic_avg`, `behavior_geometric_avg`) VALUES
(1, 102, 26, 3.00, 3.00),
(2, 102, 27, 3.33, 3.33),
(3, 102, 28, 3.00, 3.00),
(4, 102, 29, 4.33, 4.33),
(5, 102, 30, 4.33, 4.33),
(6, 102, 31, 3.00, 3.00),
(7, 102, 32, 2.67, 2.67),
(8, 102, 33, 3.33, 3.33),
(9, 102, 34, 6.00, 6.00),
(10, 102, 35, 3.33, 3.33),
(11, 102, 36, 2.33, 2.33),
(12, 102, 37, 4.00, 4.00),
(13, 102, 38, 4.00, 4.00),
(14, 102, 39, 4.33, 4.33),
(15, 102, 40, 3.67, 3.67),
(16, 102, 41, 4.33, 4.33),
(17, 102, 42, 3.67, 3.67),
(18, 102, 43, 3.67, 3.67),
(19, 102, 44, 3.33, 3.33),
(20, 102, 45, 5.00, 5.00),
(21, 102, 46, 4.67, 4.67),
(22, 102, 47, 3.67, 3.67),
(23, 102, 48, 4.00, 4.00),
(24, 102, 49, 3.33, 3.33),
(25, 102, 50, 4.00, 4.00);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- 列出以下資料庫的數據： `profile_behavior_detail`
--

INSERT INTO `profile_behavior_detail` (`profile_behavior_id`, `user_id`, `behavior_id`, `evaluation_relation_id`, `behavior_arithmetic_avg`, `behavior_geometric_avg`) VALUES
(1, 102, 26, 2, 5.00, 0.00),
(2, 102, 27, 2, 3.00, 0.00),
(3, 102, 28, 2, 2.00, 0.00),
(4, 102, 29, 2, 6.00, 0.00),
(5, 102, 30, 2, 3.00, 0.00),
(6, 102, 31, 2, 3.00, 0.00),
(7, 102, 32, 2, 4.00, 0.00),
(8, 102, 33, 2, 2.00, 0.00),
(9, 102, 34, 2, 6.00, 0.00),
(10, 102, 35, 2, 4.00, 0.00),
(11, 102, 36, 2, 1.00, 0.00),
(12, 102, 37, 2, 2.00, 0.00),
(13, 102, 38, 2, 5.00, 0.00),
(14, 102, 39, 2, 4.00, 0.00),
(15, 102, 40, 2, 6.00, 0.00),
(16, 102, 41, 2, 3.00, 0.00),
(17, 102, 42, 2, 2.00, 0.00),
(18, 102, 43, 2, 1.00, 0.00),
(19, 102, 44, 2, 2.00, 0.00),
(20, 102, 45, 2, 5.00, 0.00),
(21, 102, 46, 2, 6.00, 0.00),
(22, 102, 47, 2, 7.00, 0.00),
(23, 102, 48, 2, 5.00, 0.00),
(24, 102, 49, 2, 1.00, 0.00),
(25, 102, 50, 2, 3.00, 0.00),
(26, 102, 26, 4, 2.00, 0.00),
(27, 102, 27, 4, 4.00, 0.00),
(28, 102, 28, 4, 3.00, 0.00),
(29, 102, 29, 4, 4.00, 0.00),
(30, 102, 30, 4, 6.00, 0.00),
(31, 102, 31, 4, 3.00, 0.00),
(32, 102, 32, 4, 2.00, 0.00),
(33, 102, 33, 4, 3.00, 0.00),
(34, 102, 34, 4, 6.00, 0.00),
(35, 102, 35, 4, 4.00, 0.00),
(36, 102, 36, 4, 2.00, 0.00),
(37, 102, 37, 4, 5.00, 0.00),
(38, 102, 38, 4, 3.00, 0.00),
(39, 102, 39, 4, 6.00, 0.00),
(40, 102, 40, 4, 3.00, 0.00),
(41, 102, 41, 4, 4.00, 0.00),
(42, 102, 42, 4, 5.00, 0.00),
(43, 102, 43, 4, 6.00, 0.00),
(44, 102, 44, 4, 3.00, 0.00),
(45, 102, 45, 4, 4.00, 0.00),
(46, 102, 46, 4, 5.00, 0.00),
(47, 102, 47, 4, 2.00, 0.00),
(48, 102, 48, 4, 5.00, 0.00),
(49, 102, 49, 4, 5.00, 0.00),
(50, 102, 50, 4, 6.00, 0.00),
(51, 102, 26, 3, 2.00, 0.00),
(52, 102, 27, 3, 3.00, 0.00),
(53, 102, 28, 3, 4.00, 0.00),
(54, 102, 29, 3, 3.00, 0.00),
(55, 102, 30, 3, 4.00, 0.00),
(56, 102, 31, 3, 3.00, 0.00),
(57, 102, 32, 3, 2.00, 0.00),
(58, 102, 33, 3, 5.00, 0.00),
(59, 102, 34, 3, 6.00, 0.00),
(60, 102, 35, 3, 2.00, 0.00),
(61, 102, 36, 3, 4.00, 0.00),
(62, 102, 37, 3, 5.00, 0.00),
(63, 102, 38, 3, 4.00, 0.00),
(64, 102, 39, 3, 3.00, 0.00),
(65, 102, 40, 3, 2.00, 0.00),
(66, 102, 41, 3, 6.00, 0.00),
(67, 102, 42, 3, 4.00, 0.00),
(68, 102, 43, 3, 4.00, 0.00),
(69, 102, 44, 3, 5.00, 0.00),
(70, 102, 45, 3, 6.00, 0.00),
(71, 102, 46, 3, 3.00, 0.00),
(72, 102, 47, 3, 2.00, 0.00),
(73, 102, 48, 3, 2.00, 0.00),
(74, 102, 49, 3, 4.00, 0.00),
(75, 102, 50, 3, 3.00, 0.00);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 列出以下資料庫的數據： `profile_competency`
--

INSERT INTO `profile_competency` (`profile_competency_id`, `user_id`, `competency_id`, `competency_level`, `arithmetic_avg`, `geometric_avg`) VALUES
(1, 102, 6, 0, 3.60, 3.60),
(2, 102, 7, 0, 3.67, 3.67),
(3, 102, 8, 0, 3.67, 3.67),
(4, 102, 10, 0, 4.00, 4.00),
(5, 102, 11, 0, 3.93, 3.93);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 列出以下資料庫的數據： `profile_competency_detail`
--

INSERT INTO `profile_competency_detail` (`profile_competency_detail_id`, `user_id`, `evaluation_relation_id`, `competency_id`, `competency_level`, `arithmetic_avg`, `geometric_avg`) VALUES
(1, 102, 1, 6, 0, 6.00, 0.00),
(2, 102, 1, 7, 0, 5.20, 0.00),
(3, 102, 1, 8, 0, 5.00, 0.00),
(4, 102, 1, 10, 0, 5.80, 0.00),
(5, 102, 1, 11, 0, 5.20, 0.00),
(6, 102, 2, 6, 0, 3.80, 0.00),
(7, 102, 2, 7, 0, 3.80, 0.00),
(8, 102, 2, 8, 0, 3.60, 0.00),
(9, 102, 2, 10, 0, 2.60, 0.00),
(10, 102, 2, 11, 0, 4.40, 0.00),
(11, 102, 4, 6, 0, 3.80, 0.00),
(12, 102, 4, 7, 0, 3.60, 0.00),
(13, 102, 4, 8, 0, 3.80, 0.00),
(14, 102, 4, 10, 0, 4.40, 0.00),
(15, 102, 4, 11, 0, 4.60, 0.00),
(16, 102, 3, 6, 0, 3.20, 0.00),
(17, 102, 3, 7, 0, 3.60, 0.00),
(18, 102, 3, 8, 0, 3.60, 0.00),
(19, 102, 3, 10, 0, 5.00, 0.00),
(20, 102, 3, 11, 0, 2.80, 0.00);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `profile_competency_model`
--


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `report_company`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 列出以下資料庫的數據： `report_config`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- 列出以下資料庫的數據： `report_group`
--

INSERT INTO `report_group` (`report_group_id`, `report_title_id`, `group_id`, `report_config_id`, `create_time`, `comparison_group_id`, `population_group_id`, `job_id_str`) VALUES
(30, 18, 0, 1, 0, 0, 0, ''),
(29, 17, 0, 1, 0, 0, 0, ''),
(28, 16, 0, 1, 0, 0, 0, ''),
(27, 15, 0, 1, 0, 0, 0, ''),
(26, 14, 0, 1, 0, 0, 0, ''),
(25, 13, 0, 1, 0, 0, 0, ''),
(24, 12, 0, 1, 0, 0, 0, ''),
(23, 11, 0, 1, 0, 0, 0, ''),
(22, 10, 0, 1, 0, 0, 0, ''),
(21, 9, 0, 1, 0, 0, 0, ''),
(50, 18, 0, 2, 0, 0, 0, ''),
(49, 17, 0, 2, 0, 0, 0, ''),
(48, 16, 0, 2, 0, 0, 0, ''),
(47, 15, 0, 2, 0, 0, 0, ''),
(46, 14, 0, 2, 0, 0, 0, ''),
(45, 13, 0, 2, 0, 0, 0, ''),
(44, 12, 0, 2, 0, 0, 0, ''),
(43, 11, 0, 2, 0, 0, 0, ''),
(42, 10, 0, 2, 0, 0, 0, ''),
(41, 9, 0, 2, 0, 0, 0, ''),
(51, 9, 0, 3, 0, 0, 0, ''),
(52, 10, 0, 3, 0, 0, 0, ''),
(53, 11, 0, 3, 0, 0, 0, ''),
(54, 12, 0, 3, 0, 0, 0, ''),
(55, 13, 0, 3, 0, 0, 0, ''),
(56, 14, 0, 3, 0, 0, 0, ''),
(57, 15, 0, 3, 0, 0, 0, ''),
(58, 16, 0, 3, 0, 0, 0, ''),
(59, 17, 0, 3, 0, 0, 0, ''),
(60, 18, 0, 3, 0, 0, 0, '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- 列出以下資料庫的數據： `report_personal`
--

INSERT INTO `report_personal` (`report_id`, `report_title_id`, `user_id`, `report_config_id`, `create_time`) VALUES
(48, 8, 102, 3, 0),
(47, 7, 102, 3, 0),
(46, 6, 102, 3, 0),
(45, 5, 102, 3, 0),
(44, 4, 102, 3, 1476426113),
(43, 3, 102, 3, 0),
(42, 2, 102, 3, 0),
(41, 1, 102, 3, 0);

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

--
-- 列出以下資料庫的數據： `report_title`
--

INSERT INTO `report_title` (`report_title_id`, `report_title`, `report_type`, `report_method`, `report_kind`, `report_filename`) VALUES
(1, '個人總覽', '', 'B', 'P', 'report_person_executive_summary.php'),
(2, '群體比較', '', 'B', 'P', 'report_normative_results.php'),
(3, '職能缺口強化訓練計劃', '', 'B', 'P', 'report_individual_development_plan.php'),
(4, '個人比較分析', '', 'B', 'P', 'report_individual_gap_analysis.php'),
(5, '個人雷達圖', '', 'B', 'P', 'report_personal_rader_chart.php'),
(6, '開放式建議', '', 'B', 'P', 'report_open_comment.php'),
(7, '360度雷達圖', '', 'B', 'P', 'report_360_degree_rader_chart.php'),
(8, '全體回饋明細', '', 'B', 'P', 'report_feedback.php'),
(9, '團體總覽', '', 'B', 'G', 'report_group_executive_summary.php'),
(10, '團體雷達圖', '', 'B', 'G', 'report_group_rader_chart.php'),
(11, '團體比較分析', '', 'B', 'G', 'report_group_gap_analysis.php'),
(12, '開放式建議', '', 'B', 'G', 'report_group_open_comment.php'),
(13, '團體弱項分析', '', 'B', 'G', 'report_group_weaknesses_list.php'),
(14, '團體明細資料', '', 'B', 'G', 'report_group_detail_data.php'),
(15, '個人認知落差分析', '', 'B', 'G', 'report_individual_cognitive_gap.php'),
(16, '全體360度明細', '', 'B', 'G', 'report_group_all_360_degree_detail.php'),
(17, '個人落點區間分布圖', '', 'B', 'G', 'report_group_profile_match.php'),
(18, '未完成/部分完成名單', '', 'B', 'G', 'report_unfinished_list.php'),
(19, '個人各職能勝任率分析', '', 'C', 'P', 'report_individual_competency_summary.php'),
(20, '個人各職能雷達圖', '', 'C', 'P', 'report_personal_competency_rader_chart.php'),
(21, '個人各職能勝任率分析', '', 'C', 'P', 'report_personal_coverage_ratio_ananlysis.php'),
(22, '職能缺口強化訓練計劃', '', 'C', 'P', 'report_class_individual_development_plan.php'),
(23, '團體比較', '', 'B', 'V', 'report_group_comparsion.php'),
(24, '團體比較雷達圖', '', 'B', 'V', 'report_group_comparsion_rader_chart.php'),
(25, '全公司職能別落差分析表', '', 'C', 'C', 'report_company_department_gap_analysis.php'),
(26, '全公司職能別勝任率分析表', '', 'C', 'C', 'report_company_department_coverage_ratio.php'),
(27, '全公司各單項職能落差分析表（專業除外）', '', 'C', 'C', 'report_company_department_gap_analysis_exc_pro.php'),
(28, '個人掃瞄', '', '', '', 'report_individual_profile_match.php'),
(29, '部門人員各職能鑑定記錄表', '', 'C', 'G', 'report_group_competency_score.php'),
(31, '部門人員各職能勝任率與部門平均勝任率分析表', '', 'C', 'G', 'report_group_competency_ratio.php'),
(32, '部門別各項職能落差分析', '', 'C', 'G', 'report_group_competency_gap.php'),
(33, '全公司職稱別各職能落差分析表', '', 'C', 'G', 'report_group_competency_gap_analysis.php'),
(35, '部門別各項職能平均級數', '', 'C', 'G', 'report_group_competency_avg.php'),
(36, '全公司職稱別各職能平均級數', '', 'C', 'G', 'report_group_competency_avg_analysis.php'),
(38, '全公司各單項職能平均級數分析表（專業除外）', '', 'C', 'C', 'report_company_department_spec_avg.php'),
(30, '全公司職能別平均級數分析表（專業除外）', '', 'C', 'C', 'report_company_department_avg.php');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=162 ;

--
-- 列出以下資料庫的數據： `term`
--

INSERT INTO `term` (`term_id`, `term_title`, `depend_on_id`, `term_language`, `term_content`) VALUES
(1, 'company_title', 102, 'tw', '協欣金屬'),
(2, 'company_title', 102, 'cn', ''),
(3, 'company_title', 102, 'en', ''),
(4, 'group_title', 2, 'tw', '協理一(林加斌)'),
(5, 'group_title', 3, 'tw', '協理二(林恆春)'),
(6, 'group_title', 4, 'tw', '協理三(羅水興)'),
(7, 'group_title', 5, 'tw', '專案管理室'),
(8, 'group_title', 6, 'tw', '業務部'),
(9, 'group_title', 7, 'tw', '管理部'),
(10, 'group_title', 8, 'tw', '品管部'),
(11, 'group_title', 9, 'tw', '技術部'),
(12, 'group_title', 10, 'tw', '開發部'),
(13, 'group_title', 11, 'tw', '工機部'),
(14, 'group_title', 12, 'tw', '製造部'),
(15, 'group_title', 13, 'tw', '生管部'),
(16, 'group_title', 14, 'tw', '綜合行政課'),
(17, 'group_title', 15, 'tw', '人事課'),
(18, 'group_title', 16, 'tw', '財務課'),
(19, 'group_title', 17, 'tw', '品保課'),
(20, 'group_title', 18, 'tw', '品檢課'),
(21, 'group_title', 19, 'tw', '技術一課'),
(22, 'group_title', 20, 'tw', '技術二課'),
(23, 'group_title', 21, 'tw', '設計課'),
(24, 'group_title', 22, 'tw', '開發一課'),
(25, 'group_title', 23, 'tw', '開發二課'),
(26, 'group_title', 24, 'tw', '採購課'),
(27, 'group_title', 25, 'tw', '機械課'),
(28, 'group_title', 26, 'tw', '鉗工課'),
(29, 'group_title', 27, 'tw', '溶接課'),
(30, 'group_title', 28, 'tw', '壓造課'),
(31, 'group_title', 29, 'tw', '模修課'),
(32, 'group_title', 30, 'tw', '計畫課'),
(33, 'group_title', 31, 'tw', '物流課'),
(34, 'group_title', 32, 'tw', '工務課'),
(35, 'job_family_title', 1, 'tw', '管理職系'),
(36, 'job_title', 1, 'tw', '董事長'),
(37, 'job_title', 2, 'tw', '總經理'),
(38, 'job_title', 3, 'tw', '副總經理'),
(39, 'job_title', 4, 'tw', '協理'),
(40, 'job_title', 5, 'tw', '經理'),
(41, 'job_title', 6, 'tw', '副理'),
(42, 'job_title', 7, 'tw', '課長'),
(43, 'job_title', 8, 'tw', '高專'),
(44, 'job_title', 9, 'tw', '專員'),
(45, 'job_title', 10, 'tw', '組長'),
(46, 'job_title', 11, 'tw', '工程師'),
(47, 'job_title', 12, 'tw', '管理師'),
(48, 'group_title', 1, 'tw', '協欣金屬'),
(49, 'group_title', 1, 'cn', ''),
(50, 'group_title', 1, 'en', ''),
(51, 'competency_model_title', 1, 'tw', '協欣金屬_中階主管管理職能模型'),
(52, 'competency_model_title', 1, 'cn', ''),
(53, 'competency_model_title', 1, 'en', ''),
(54, 'competency_title', 1, 'tw', '工作管理與執行能力'),
(55, 'competency_title', 1, 'cn', ''),
(56, 'competency_title', 1, 'en', ''),
(57, 'competency_title', 2, 'tw', '效率與品質意識'),
(58, 'competency_title', 2, 'cn', ''),
(59, 'competency_title', 2, 'en', ''),
(60, 'competency_title', 3, 'tw', '團隊建立與領導'),
(61, 'competency_title', 3, 'cn', ''),
(62, 'competency_title', 3, 'en', ''),
(63, 'competency_title', 4, 'tw', '跨部門合作能力'),
(64, 'competency_title', 4, 'cn', ''),
(65, 'competency_title', 4, 'en', ''),
(66, 'competency_title', 5, 'tw', '當責'),
(67, 'competency_title', 5, 'cn', ''),
(68, 'competency_title', 5, 'en', ''),
(69, 'competency_model_title', 2, 'tw', '協欣金屬_高階主管管理職能模型'),
(70, 'competency_model_title', 2, 'cn', ''),
(71, 'competency_model_title', 2, 'en', ''),
(72, 'competency_title', 6, 'tw', '目標管理與落實能力'),
(73, 'competency_title', 6, 'cn', ''),
(74, 'competency_title', 6, 'en', ''),
(75, 'competency_title', 7, 'tw', '績效提升'),
(76, 'competency_title', 7, 'cn', ''),
(77, 'competency_title', 7, 'en', ''),
(78, 'competency_title', 8, 'tw', '跨部門溝通與協調能力'),
(79, 'competency_title', 8, 'cn', ''),
(80, 'competency_title', 8, 'en', ''),
(81, 'competency_title', 9, 'tw', ''),
(82, 'competency_title', 9, 'cn', ''),
(83, 'competency_title', 9, 'en', ''),
(84, 'competency_title', 10, 'tw', '結構化思維能力'),
(85, 'competency_title', 10, 'cn', ''),
(86, 'competency_title', 10, 'en', ''),
(87, 'competency_title', 11, 'tw', '客戶導向'),
(88, 'competency_title', 11, 'cn', ''),
(89, 'competency_title', 11, 'en', ''),
(90, 'competency_model_title', 3, 'tw', '協欣金屬_基層主管管理職能模型'),
(91, 'competency_model_title', 3, 'cn', ''),
(92, 'competency_model_title', 3, 'en', ''),
(93, 'competency_title', 12, 'tw', '執行能力'),
(94, 'competency_title', 12, 'cn', ''),
(95, 'competency_title', 12, 'en', ''),
(96, 'competency_title', 13, 'tw', '品質意識'),
(97, 'competency_title', 13, 'cn', ''),
(98, 'competency_title', 13, 'en', ''),
(99, 'competency_title', 14, 'tw', '溝通能力與技巧'),
(100, 'competency_title', 14, 'cn', ''),
(101, 'competency_title', 14, 'en', ''),
(102, 'competency_title', 15, 'tw', '問題解決能力'),
(103, 'competency_title', 15, 'cn', ''),
(104, 'competency_title', 15, 'en', ''),
(105, 'competency_title', 16, 'tw', '主動積極'),
(106, 'competency_title', 16, 'cn', ''),
(107, 'competency_title', 16, 'en', ''),
(108, 'evaluation_relation_title', 1, 'tw', '自己'),
(109, 'evaluation_relation_title', 1, 'cn', ''),
(110, 'evaluation_relation_title', 1, 'en', ''),
(111, 'evaluation_relation_title', 2, 'tw', '直屬主管'),
(112, 'evaluation_relation_title', 2, 'cn', ''),
(113, 'evaluation_relation_title', 2, 'en', ''),
(114, 'evaluation_relation_title', 3, 'tw', '同事'),
(115, 'evaluation_relation_title', 3, 'cn', ''),
(116, 'evaluation_relation_title', 3, 'en', ''),
(117, 'evaluation_relation_title', 4, 'tw', '部屬'),
(118, 'evaluation_relation_title', 4, 'cn', ''),
(119, 'evaluation_relation_title', 4, 'en', ''),
(120, 'evaluation_scale_title', 1, 'tw', '七分量表'),
(121, 'evaluation_scale_title', 1, 'cn', ''),
(122, 'evaluation_scale_title', 1, 'en', ''),
(123, 'evaluation_scale_item_title', 1, 'tw', '表現程度20%或以下：知道，但大部分都沒有做到'),
(124, 'evaluation_scale_item_title', 1, 'cn', ''),
(125, 'evaluation_scale_item_title', 1, 'en', ''),
(126, 'evaluation_scale_item_title', 0, 'tw', '有認知，少部份能做到'),
(127, 'evaluation_scale_item_title', 0, 'cn', ''),
(128, 'evaluation_scale_item_title', 0, 'en', ''),
(129, 'evaluation_scale_item_title', 2, 'tw', '表現程度21~40%：知道，只有少部分做到'),
(130, 'evaluation_scale_item_title', 2, 'cn', ''),
(131, 'evaluation_scale_item_title', 2, 'en', ''),
(132, 'evaluation_scale_item_title', 3, 'tw', '表現程度41~50%：知道，泰半勉強能做到'),
(133, 'evaluation_scale_item_title', 3, 'cn', ''),
(134, 'evaluation_scale_item_title', 3, 'en', ''),
(135, 'evaluation_scale_item_title', 0, 'tw', '有認知， 一般都能做到'),
(136, 'evaluation_scale_item_title', 0, 'cn', ''),
(137, 'evaluation_scale_item_title', 0, 'en', ''),
(138, 'evaluation_scale_item_title', 4, 'tw', '表現程度51~60%：知道，一般都可以做到'),
(139, 'evaluation_scale_item_title', 4, 'cn', ''),
(140, 'evaluation_scale_item_title', 4, 'en', ''),
(141, 'evaluation_scale_item_title', 5, 'tw', '表現程度61~80%：知道，且大部分都能做到'),
(142, 'evaluation_scale_item_title', 5, 'cn', ''),
(143, 'evaluation_scale_item_title', 5, 'en', ''),
(144, 'evaluation_scale_item_title', 6, 'tw', '表現程度81~90%：能做到且表現優秀'),
(145, 'evaluation_scale_item_title', 6, 'cn', ''),
(146, 'evaluation_scale_item_title', 6, 'en', ''),
(147, 'evaluation_scale_item_title', 0, 'tw', '能做到且表現卓越'),
(148, 'evaluation_scale_item_title', 0, 'cn', ''),
(149, 'evaluation_scale_item_title', 0, 'en', ''),
(150, 'evaluation_scale_item_title', 7, 'tw', '表現程度90%以上：能做到且表現卓越'),
(151, 'evaluation_scale_item_title', 7, 'cn', ''),
(152, 'evaluation_scale_item_title', 7, 'en', ''),
(153, 'b_evalu_table_title', 1, 'tw', '協欣金屬_高階主管管理職能模型'),
(154, 'b_evalu_table_title', 1, 'cn', ''),
(155, 'b_evalu_table_title', 1, 'en', ''),
(156, 'evaluation_relation_title', 5, 'tw', '直屬主管'),
(157, 'evaluation_relation_title', 5, 'cn', ''),
(158, 'evaluation_relation_title', 5, 'en', ''),
(159, 'b_evalu_table_title', 3, 'tw', '2016協欣金屬_高階管理職能模型'),
(160, 'b_evalu_table_title', 3, 'cn', ''),
(161, 'b_evalu_table_title', 3, 'en', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=331 ;

--
-- 列出以下資料庫的數據： `text`
--

INSERT INTO `text` (`term_id`, `term_title`, `depend_on_id`, `term_language`, `text_content`) VALUES
(1, 'company_desc', 102, 'tw', '協欣金屬'),
(2, 'company_desc', 102, 'cn', ''),
(3, 'company_desc', 102, 'en', ''),
(4, 'group_desc', 1, 'tw', ''),
(5, 'group_desc', 1, 'cn', ''),
(6, 'group_desc', 1, 'en', ''),
(7, 'competency_model_definition', 1, 'tw', ''),
(10, 'competency_definition', 1, 'tw', '能夠運用組織各種相關資源，透過標準作業流程，將計畫或任務有效落實，當過程中出現異常時，能彈性做出調整、排除障礙；有效的管理時間和資源，確保工作有效率的完成。'),
(8, 'competency_model_definition', 1, 'cn', ''),
(9, 'competency_model_definition', 1, 'en', ''),
(11, 'competency_definition', 1, 'cn', ''),
(12, 'competency_definition', 1, 'en', ''),
(13, 'behavior_definition', 1, 'tw', '(事前)：能妥善運用組織相關資源，訂定合理的工作進度表，清楚規劃各階段任務的執行及完成時間。'),
(14, 'behavior_definition', 1, 'cn', ''),
(15, 'behavior_definition', 1, 'en', ''),
(16, 'behavior_definition', 2, 'tw', '(事中)：能監控和診斷工作的進度與成效，時時注意執行的過程與方法，確保工作能有效率的完成。'),
(17, 'behavior_definition', 2, 'cn', ''),
(18, 'behavior_definition', 2, 'en', ''),
(19, 'behavior_definition', 3, 'tw', '(事中)：當工作進度落後時，能積極找出落後的原因及補救改進的方法，並盡力達成組織原定的目標。'),
(20, 'behavior_definition', 3, 'cn', ''),
(21, 'behavior_definition', 3, 'en', ''),
(22, 'behavior_definition', 4, 'tw', '(事後)：會檢討工作執行的成效，並找出改善方案持續的改進，讓工作品質或效率都能比上一次更好。'),
(23, 'behavior_definition', 4, 'cn', ''),
(24, 'behavior_definition', 4, 'en', ''),
(25, 'behavior_definition', 5, 'tw', '(事後)：會運用相關表格與工具，將問題解決的經驗、知識與技巧妥善紀錄和保存下來，形成本部門的知識庫。'),
(26, 'behavior_definition', 5, 'cn', ''),
(27, 'behavior_definition', 5, 'en', ''),
(28, 'competency_definition', 2, 'tw', '對於預定的工作計畫或上司交辦的事項，能依據工作輕重緩急的判斷進行工作安排，確實遵循作業標準，注重工作細節與品質，在既定的時間內有效完成工作目標。'),
(29, 'competency_definition', 2, 'cn', ''),
(30, 'competency_definition', 2, 'en', ''),
(31, 'behavior_definition', 6, 'tw', '在執行工作前，會預先思考清楚後，再安排各項工作的先後執行順序。'),
(32, 'behavior_definition', 6, 'cn', ''),
(33, 'behavior_definition', 6, 'en', ''),
(34, 'behavior_definition', 7, 'tw', '能運用各種能提升或改善工作執行成效的軟硬體工具和設備，以提高執行效率。'),
(35, 'behavior_definition', 7, 'cn', ''),
(36, 'behavior_definition', 7, 'en', ''),
(37, 'behavior_definition', 8, 'tw', '能在組織或客戶要求的標準及作業期限前，如質、如量的完成工作任務。'),
(38, 'behavior_definition', 8, 'cn', ''),
(39, 'behavior_definition', 8, 'en', ''),
(40, 'behavior_definition', 9, 'tw', '具成本意識，能不斷改良不經濟的作業流程或操作程序，會留意和減少作業過程中不當的浪費與損耗。'),
(41, 'behavior_definition', 9, 'cn', ''),
(42, 'behavior_definition', 9, 'en', ''),
(43, 'behavior_definition', 10, 'tw', '會持續主動蒐集相關技術或工藝的新知，對於別人所提的新知識或新技術，會嘗試實地執行或演練，以驗證成效，若成效佳則採用之。'),
(44, 'behavior_definition', 10, 'cn', ''),
(45, 'behavior_definition', 10, 'en', ''),
(46, 'competency_definition', 3, 'tw', '在工作執行過程中，能帶領團隊成員透過彼此的互信、分工合作、和支援協調等，共同解決工作上所發生的問題，並達成團隊的目標。'),
(47, 'competency_definition', 3, 'cn', ''),
(48, 'competency_definition', 3, 'en', ''),
(49, 'behavior_definition', 11, 'tw', '能清楚界定團隊成員各自所扮演的角色，使團隊成員感受到在團隊中的重要性，進而產生團隊的向心力與忠誠度。'),
(50, 'behavior_definition', 11, 'cn', ''),
(51, 'behavior_definition', 11, 'en', ''),
(52, 'behavior_definition', 12, 'tw', '遇到問題和困難時，能激勵並協調團隊成員，共同解決問題和困難，使工作任務得以順利達成。'),
(53, 'behavior_definition', 12, 'cn', ''),
(54, 'behavior_definition', 12, 'en', ''),
(55, 'behavior_definition', 13, 'tw', '能冷靜與鎮定的處理平行或上下級間的意見和工作衝突，並共同尋求解決方案。'),
(56, 'behavior_definition', 13, 'cn', ''),
(57, 'behavior_definition', 13, 'en', ''),
(58, 'behavior_definition', 14, 'tw', '能有效執行團隊績效的定期評量機制，真實反饋各團隊成員的績效表現，糾正、改善團隊成員有問題的行為。'),
(59, 'behavior_definition', 14, 'cn', ''),
(60, 'behavior_definition', 14, 'en', ''),
(61, 'behavior_definition', 15, 'tw', '樂於分享工作資訊與意見，並能與他人相處融洽，保持和諧的互動關係。'),
(62, 'behavior_definition', 15, 'cn', ''),
(63, 'behavior_definition', 15, 'en', ''),
(64, 'competency_definition', 4, 'tw', '能與他人通力合作，成為跨部門團隊的一份子，彼此互相溝通協助，解決問題並達成目標。'),
(65, 'competency_definition', 4, 'cn', ''),
(66, 'competency_definition', 4, 'en', ''),
(67, 'behavior_definition', 16, 'tw', '能接納跨部門團隊的工作分配，配合團隊的決議，放下個人利益，善盡個人在團隊中的職責。'),
(68, 'behavior_definition', 16, 'cn', ''),
(69, 'behavior_definition', 16, 'en', ''),
(70, 'behavior_definition', 17, 'tw', '尊重跨部門團隊成員不同的觀點，並能讓他們充份表達自己的意見與想法，不固執個人立場。'),
(71, 'behavior_definition', 17, 'cn', ''),
(72, 'behavior_definition', 17, 'en', ''),
(73, 'behavior_definition', 18, 'tw', '在跨部門合作過程中，能主動、積極地排除困難，並提供有益於解決問題的方案與建議。'),
(74, 'behavior_definition', 18, 'cn', ''),
(75, 'behavior_definition', 18, 'en', ''),
(76, 'behavior_definition', 19, 'tw', '能從團體成就的角度來檢視自己的表現，不邀功，不諉過。'),
(77, 'behavior_definition', 19, 'cn', ''),
(78, 'behavior_definition', 19, 'en', ''),
(79, 'behavior_definition', 20, 'tw', '在有限的時間和資源條件下，會預先協調好上下游部門間的時間與資源分配，以確保任務順利完成。'),
(80, 'behavior_definition', 20, 'cn', ''),
(81, 'behavior_definition', 20, 'en', ''),
(82, 'competency_definition', 5, 'tw', '能夠接受各種挑戰與批評，面對任何的挫敗與打擊，勇於承擔責任，並持續追求改善，永遠不會滿足現況，朝既定目標前進，不達目的絕不中止。'),
(83, 'competency_definition', 5, 'cn', ''),
(84, 'competency_definition', 5, 'en', ''),
(85, 'behavior_definition', 21, 'tw', '面對「內外部客戶」的需求，能以身作則，說到做到，言行合一。'),
(86, 'behavior_definition', 21, 'cn', ''),
(87, 'behavior_definition', 21, 'en', ''),
(88, 'behavior_definition', 22, 'tw', '自願接受挑戰或承擔額外的責任，會主動處理一些較複雜、困難的狀況或任務。'),
(89, 'behavior_definition', 22, 'cn', ''),
(90, 'behavior_definition', 22, 'en', ''),
(91, 'behavior_definition', 23, 'tw', '勇於承擔工作結果，面對任何的困難與打擊，不消極怠惰與推責。'),
(92, 'behavior_definition', 23, 'cn', ''),
(93, 'behavior_definition', 23, 'en', ''),
(94, 'behavior_definition', 24, 'tw', '面對失敗，會檢討缺失，欣然接受同事或客戶的批評，並積極尋求改善與解決方案。'),
(95, 'behavior_definition', 24, 'cn', ''),
(96, 'behavior_definition', 24, 'en', ''),
(97, 'behavior_definition', 25, 'tw', '對於失敗的經驗抱持正面的想法，能因此獲得經驗及更強的驅動力以持續進步成長。'),
(98, 'behavior_definition', 25, 'cn', ''),
(99, 'behavior_definition', 25, 'en', ''),
(100, 'competency_model_definition', 2, 'tw', ''),
(101, 'competency_model_definition', 2, 'cn', ''),
(102, 'competency_model_definition', 2, 'en', ''),
(103, 'competency_definition', 6, 'tw', '有效管理時間和運用相關資源，採取監控、持續追蹤等行動來降低不確定性，以確保在計劃時間內有效率的完成工作或任務，達到公司既定的目標。'),
(104, 'competency_definition', 6, 'cn', ''),
(105, 'competency_definition', 6, 'en', ''),
(106, 'behavior_definition', 26, 'tw', '能將計畫和工作展開與分解，並掌握好每個關鍵的執行檢核點，以確保工作或任務的順利完成。'),
(107, 'behavior_definition', 26, 'cn', ''),
(108, 'behavior_definition', 26, 'en', ''),
(109, 'behavior_definition', 27, 'tw', '能事先思考當計畫發生突變時的應對策略及行動方案，確保當狀況發生時仍能維持各計畫的正常推進。'),
(110, 'behavior_definition', 27, 'cn', ''),
(111, 'behavior_definition', 27, 'en', ''),
(112, 'behavior_definition', 28, 'tw', '在任務執行過程中，會依據工作計劃表來監督、控管與查核任務的執行進度，以及工作的效率、方向與內容的正確性。'),
(113, 'behavior_definition', 28, 'cn', ''),
(114, 'behavior_definition', 28, 'en', ''),
(115, 'behavior_definition', 29, 'tw', '當進度落後或遇到困難時，會立即發出警訊，並尋求相關資源與協助以解決困難或問題，確保在預定時間內完成工作任務。'),
(116, 'behavior_definition', 29, 'cn', ''),
(117, 'behavior_definition', 29, 'en', ''),
(118, 'behavior_definition', 30, 'tw', '能持續地進行改善活動並將建議方案落實於實際的工作中，使工作品質或效率上都能有所提升。'),
(119, 'behavior_definition', 30, 'cn', ''),
(120, 'behavior_definition', 30, 'en', ''),
(121, 'competency_definition', 7, 'tw', '能針對部屬或團隊的工作表現，給予客觀的評價和充分的回饋，與部屬共同討論擬定工作績效改善措施及未來績效發展計畫。'),
(122, 'competency_definition', 7, 'cn', ''),
(123, 'competency_definition', 7, 'en', ''),
(124, 'behavior_definition', 31, 'tw', '依據設定的目標及公司績效評核規則，針對部屬或團隊的工作表現，進行客觀、公平的考核。'),
(125, 'behavior_definition', 31, 'cn', ''),
(126, 'behavior_definition', 31, 'en', ''),
(127, 'behavior_definition', 32, 'tw', '協助部屬找出應發展的能力領域，共同討論擬訂工作績效改善措施及未來績效發展計畫。'),
(128, 'behavior_definition', 32, 'cn', ''),
(129, 'behavior_definition', 32, 'en', ''),
(130, 'behavior_definition', 33, 'tw', '提供部屬足夠的資源與機會幫助部屬克服學習障礙，鼓勵「自我學習」強化自我提升改善的效能。'),
(131, 'behavior_definition', 33, 'cn', ''),
(132, 'behavior_definition', 33, 'en', ''),
(133, 'behavior_definition', 34, 'tw', '利用指導、訓練及工作指派等方式，來加強部屬的知識與技能、提昇部屬的工作績效。'),
(134, 'behavior_definition', 34, 'cn', ''),
(135, 'behavior_definition', 34, 'en', ''),
(136, 'behavior_definition', 35, 'tw', '不以達成既定目標為滿足，願意追求更具挑戰性的目標或更高的績效水準。'),
(137, 'behavior_definition', 35, 'cn', ''),
(138, 'behavior_definition', 35, 'en', ''),
(139, 'competency_definition', 8, 'tw', '有同理心，瞭解他人的感受、需要和觀點，並能清楚表達自己的語意讓對方明瞭；具備對上、下與同儕間的工作說明與協調能力，以達成團隊協作的目標。'),
(140, 'competency_definition', 8, 'cn', ''),
(141, 'competency_definition', 8, 'en', ''),
(142, 'competency_definition', 9, 'tw', '不先入為主，能排除自我意識，以同理心傾聽並站在對方立場，與對方展開良性互動以解決問題或障礙。'),
(143, 'competency_definition', 9, 'cn', ''),
(144, 'competency_definition', 9, 'en', ''),
(145, 'behavior_definition', 36, 'tw', '不先入為主，能排除自我意識，以同理心傾聽並站在對方立場，與對方展開良性互動以解決問題或障礙。'),
(146, 'behavior_definition', 36, 'cn', ''),
(147, 'behavior_definition', 36, 'en', ''),
(148, 'behavior_definition', 37, 'tw', '能運用各種不同的媒介，清楚的對上、對下或對同儕說明表達工作協作的相關訊息。'),
(149, 'behavior_definition', 37, 'cn', ''),
(150, 'behavior_definition', 37, 'en', ''),
(151, 'behavior_definition', 38, 'tw', '處事圓融，能耐心處理，聆聽內、外部客戶的抱怨，能控制情緒不使衝突發生。'),
(152, 'behavior_definition', 38, 'cn', ''),
(153, 'behavior_definition', 38, 'en', ''),
(154, 'behavior_definition', 39, 'tw', '能視不同狀況調整溝通技巧，順利與組織內外部成員溝通。'),
(155, 'behavior_definition', 39, 'cn', ''),
(156, 'behavior_definition', 39, 'en', ''),
(157, 'behavior_definition', 40, 'tw', '跨部門協調時，會主動與該部門主管先行知會說明，達到意見整合，完成共識。'),
(158, 'behavior_definition', 40, 'cn', ''),
(159, 'behavior_definition', 40, 'en', ''),
(160, 'competency_definition', 10, 'tw', '能蒐集、整合及有效運用不同來源的資料，以工具或經驗針對議題進行系統性與邏輯性的分析與表達。'),
(161, 'competency_definition', 10, 'cn', ''),
(162, 'competency_definition', 10, 'en', ''),
(163, 'behavior_definition', 41, 'tw', '遇到問題時，能蒐集、整合及有效運用不同來源的資料，以找出問題組成結構之間的因果關係。'),
(164, 'behavior_definition', 41, 'cn', ''),
(165, 'behavior_definition', 41, 'en', ''),
(166, 'behavior_definition', 42, 'tw', '能夠分辨問題組成結構之間的重要性與處理的優先順序。'),
(167, 'behavior_definition', 42, 'cn', ''),
(168, 'behavior_definition', 42, 'en', ''),
(169, 'behavior_definition', 43, 'tw', '能運用工具，將問題或欲陳述的議題，以結構化、條理化的方式清楚表達與說明。'),
(170, 'behavior_definition', 43, 'cn', ''),
(171, 'behavior_definition', 43, 'en', ''),
(172, 'behavior_definition', 44, 'tw', '面對客戶需求或問題，能運用專業知識、經驗、工具與方法進行邏輯性分析，並找出合適的解決方案。'),
(173, 'behavior_definition', 44, 'cn', ''),
(174, 'behavior_definition', 44, 'en', ''),
(175, 'behavior_definition', 45, 'tw', '能客觀有效的評估各種解決方案的效益與優缺點，以建議或決定最終的解決方案。'),
(176, 'behavior_definition', 45, 'cn', ''),
(177, 'behavior_definition', 45, 'en', ''),
(178, 'competency_definition', 11, 'tw', '在互信互利的基礎上，將「內外部客戶」的需求視為第一要務，與客戶建立及維持良性的互動及合作關係。'),
(179, 'competency_definition', 11, 'cn', ''),
(180, 'competency_definition', 11, 'en', ''),
(181, 'behavior_definition', 46, 'tw', '用積極正向、就事論事的態度來排除內、外部客戶的衝突，並共同尋求解決方案。'),
(182, 'behavior_definition', 46, 'cn', ''),
(183, 'behavior_definition', 46, 'en', ''),
(184, 'behavior_definition', 47, 'tw', '具備成本意識，能以自身專業知識及有效方法，滿足內、外部客戶的期望與需要。'),
(185, 'behavior_definition', 47, 'cn', ''),
(186, 'behavior_definition', 47, 'en', ''),
(187, 'behavior_definition', 48, 'tw', '能運用有效的方法來了解評估客戶的不滿意問題及回饋，並進行檢討與改善。'),
(188, 'behavior_definition', 48, 'cn', ''),
(189, 'behavior_definition', 48, 'en', ''),
(190, 'behavior_definition', 49, 'tw', '能夠協助客戶解決問題滿足客戶需求，以建立良性的合作關係。'),
(191, 'behavior_definition', 49, 'cn', ''),
(192, 'behavior_definition', 49, 'en', ''),
(193, 'behavior_definition', 50, 'tw', '除了客戶主動提出的要求外，能夠預先找出或告知內外部客戶可能發生的各種潛在問題或需求。'),
(194, 'behavior_definition', 50, 'cn', ''),
(195, 'behavior_definition', 50, 'en', ''),
(196, 'competency_model_definition', 3, 'tw', ''),
(197, 'competency_model_definition', 3, 'cn', ''),
(198, 'competency_model_definition', 3, 'en', ''),
(199, 'competency_definition', 12, 'tw', '有效的運用人力、物力資源，確保在計劃時間內，有效率的完成工作。'),
(200, 'competency_definition', 12, 'cn', ''),
(201, 'competency_definition', 12, 'en', ''),
(202, 'behavior_definition', 51, 'tw', '能妥善利用人力、物力資源，積極辦理與落實公司各項決策。'),
(203, 'behavior_definition', 51, 'cn', ''),
(204, 'behavior_definition', 51, 'en', ''),
(205, 'behavior_definition', 52, 'tw', '能確實向所屬單位宣導公司政策，推動政策的執行及成效的管控。'),
(206, 'behavior_definition', 52, 'cn', ''),
(207, 'behavior_definition', 52, 'en', ''),
(208, 'behavior_definition', 53, 'tw', '能按時間表追縱工作進度，在預定時間內完成工作任務。'),
(209, 'behavior_definition', 53, 'cn', ''),
(210, 'behavior_definition', 53, 'en', ''),
(211, 'behavior_definition', 54, 'tw', '注重工作時效，能妥善運用自己的時間與資源，有效管理工作的流程與進度。'),
(212, 'behavior_definition', 54, 'cn', ''),
(213, 'behavior_definition', 54, 'en', ''),
(214, 'behavior_definition', 55, 'tw', '會依任務的不同性質，主動回報主管或夥伴階段性或最終的執行成果。'),
(215, 'behavior_definition', 55, 'cn', ''),
(216, 'behavior_definition', 55, 'en', ''),
(217, 'competency_definition', 13, 'tw', '確實遵循作業標準，注重工作細節，運用自主檢驗找出品質問題並回報主管進行改善，不斷提升工作及\r\n產品的品質。\r\n'),
(218, 'competency_definition', 13, 'cn', ''),
(219, 'competency_definition', 13, 'en', ''),
(220, 'behavior_definition', 56, 'tw', '能夠在產品進入下一個流程前進行檢查，確定所製做的產品符合品質要求。'),
(221, 'behavior_definition', 56, 'cn', ''),
(222, 'behavior_definition', 56, 'en', ''),
(223, 'behavior_definition', 57, 'tw', '在生產過程中依據品質標準，自我進行產品的抽查檢驗，維持應有的品質標準。'),
(224, 'behavior_definition', 57, 'cn', ''),
(225, 'behavior_definition', 57, 'en', ''),
(226, 'behavior_definition', 58, 'tw', '個人的工作良率高，能讓人充分的信賴。'),
(227, 'behavior_definition', 58, 'cn', ''),
(228, 'behavior_definition', 58, 'en', ''),
(229, 'behavior_definition', 59, 'tw', '能善用品質檢驗手法找出產品品質不良的原因，並持續改善。'),
(230, 'behavior_definition', 59, 'cn', ''),
(231, 'behavior_definition', 59, 'en', ''),
(232, 'behavior_definition', 60, 'tw', '能夠注重作業過程中所有環節，包括原料、半成品、成品的品質狀況。'),
(233, 'behavior_definition', 60, 'cn', ''),
(234, 'behavior_definition', 60, 'en', ''),
(235, 'competency_definition', 14, 'tw', '能夠利用不同的媒介或方式，對他人或團體清楚的表達訊息或意見；在表達的過程中，能吸引他人的注意，使他人理解所要表達的重點。'),
(236, 'competency_definition', 14, 'cn', ''),
(237, 'competency_definition', 14, 'en', ''),
(238, 'behavior_definition', 61, 'tw', '在溝通過程中，能清楚的表明此次溝通的目的，會以詢問或重述的方式來確認對方已了解所要表達的訊息。'),
(239, 'behavior_definition', 61, 'cn', ''),
(240, 'behavior_definition', 61, 'en', ''),
(241, 'behavior_definition', 62, 'tw', '能視溝通的對象，採取不同的談話方式 (例如：按邏輯順序或直接重點表明…等)，音量、速度皆適中，並具有抑揚頓挫。'),
(242, 'behavior_definition', 62, 'cn', ''),
(243, 'behavior_definition', 62, 'en', ''),
(244, 'behavior_definition', 63, 'tw', '使用聽者慣用的語言來與對方溝通，並能避免使用對方聽不懂的術語。'),
(245, 'behavior_definition', 63, 'cn', ''),
(246, 'behavior_definition', 63, 'en', ''),
(247, 'behavior_definition', 64, 'tw', '能運用例子、比喻、輔助工具或肢體語言，來吸引對方注意或幫助其溝通理解。'),
(248, 'behavior_definition', 64, 'cn', ''),
(249, 'behavior_definition', 64, 'en', ''),
(250, 'behavior_definition', 65, 'tw', '確保自己了解對方的問題，能尊重不同的意見，並給予適當的回應。'),
(251, 'behavior_definition', 65, 'cn', ''),
(252, 'behavior_definition', 65, 'en', ''),
(253, 'competency_definition', 15, 'tw', '當遇見問題時，能確認、了解問題的本質，蒐集、比較不同來源的資料，找並制訂可行的解決方案。'),
(254, 'competency_definition', 15, 'cn', ''),
(255, 'competency_definition', 15, 'en', ''),
(256, 'behavior_definition', 66, 'tw', '當問題發生時，能將問題具體描繪清楚，確定其關鍵點並找出問題的根源。'),
(257, 'behavior_definition', 66, 'cn', ''),
(258, 'behavior_definition', 66, 'en', ''),
(259, 'behavior_definition', 67, 'tw', '能針對日常工作中所面臨的障礙與問題，提出行動改善計畫及解決方案。'),
(260, 'behavior_definition', 67, 'cn', ''),
(261, 'behavior_definition', 67, 'en', ''),
(262, 'behavior_definition', 68, 'tw', '針對自身決策範圍內的問題，提出可行的解決方案，整合相關人員共同執行以達成最終期望的結果。'),
(263, 'behavior_definition', 68, 'cn', ''),
(264, 'behavior_definition', 68, 'en', ''),
(265, 'behavior_definition', 69, 'tw', '對於非自身決策範圍或由許多因素所構成的複雜問題，能在現有條件限制下，規劃出多種可能的解決方法與方案，提供上級決策。'),
(266, 'behavior_definition', 69, 'cn', ''),
(267, 'behavior_definition', 69, 'en', ''),
(268, 'behavior_definition', 70, 'tw', '能將解決問題的知識與技巧妥善紀錄、保存與管理，做為以後處理類似問題的參考。'),
(269, 'behavior_definition', 70, 'cn', ''),
(270, 'behavior_definition', 70, 'en', ''),
(271, 'competency_definition', 16, 'tw', '能自發性的學習或採取行動，以改善與增加工作效益、避免問題的發生，創造更多效益。'),
(272, 'competency_definition', 16, 'cn', ''),
(273, 'competency_definition', 16, 'en', ''),
(274, 'behavior_definition', 71, 'tw', '不需要他人的跟催，能夠自動自發、盡心盡力完成工作任務，達成組織交付的工作目標。'),
(275, 'behavior_definition', 71, 'cn', ''),
(276, 'behavior_definition', 71, 'en', ''),
(277, 'behavior_definition', 72, 'tw', '當同事遇見工作瓶頸時，能發揮同事愛，主動教導或分享自身經驗，協助同事解決困難。'),
(278, 'behavior_definition', 72, 'cn', ''),
(279, 'behavior_definition', 72, 'en', ''),
(280, 'behavior_definition', 73, 'tw', '自願投入超出工作範圍的任務與活動，提昇自己的工作成就。'),
(281, 'behavior_definition', 73, 'cn', ''),
(282, 'behavior_definition', 73, 'en', ''),
(283, 'behavior_definition', 74, 'tw', '當獨自一人無法完成工作時，能主動尋求資源或他人的協助與意見，以如期完成工作。'),
(284, 'behavior_definition', 74, 'cn', ''),
(285, 'behavior_definition', 74, 'en', ''),
(286, 'behavior_definition', 75, 'tw', '能有不害怕改變的信念，追求明日比今日更進步一點的行動表現。'),
(287, 'behavior_definition', 75, 'cn', ''),
(288, 'behavior_definition', 75, 'en', ''),
(289, 'evaluation_scale_item_desc', 1, 'tw', '約有20%能觀察到此行為表現'),
(290, 'evaluation_scale_item_desc', 1, 'cn', ''),
(291, 'evaluation_scale_item_desc', 1, 'en', ''),
(292, 'evaluation_scale_item_desc', 0, 'tw', '約有21%~40%能觀察到此行為表現'),
(293, 'evaluation_scale_item_desc', 0, 'cn', ''),
(294, 'evaluation_scale_item_desc', 0, 'en', ''),
(295, 'evaluation_scale_item_desc', 2, 'tw', '約有21%~40%能觀察到此行為表現'),
(296, 'evaluation_scale_item_desc', 2, 'cn', ''),
(297, 'evaluation_scale_item_desc', 2, 'en', ''),
(298, 'evaluation_scale_item_desc', 3, 'tw', '約有41%~50%能觀察到此行為表現'),
(299, 'evaluation_scale_item_desc', 3, 'cn', ''),
(300, 'evaluation_scale_item_desc', 3, 'en', ''),
(301, 'evaluation_scale_item_desc', 0, 'tw', '約有51%~60%能觀察到此行為表現'),
(302, 'evaluation_scale_item_desc', 0, 'cn', ''),
(303, 'evaluation_scale_item_desc', 0, 'en', ''),
(304, 'evaluation_scale_item_desc', 4, 'tw', '約有51%~60%能觀察到此行為表現'),
(305, 'evaluation_scale_item_desc', 4, 'cn', ''),
(306, 'evaluation_scale_item_desc', 4, 'en', ''),
(307, 'evaluation_scale_item_desc', 5, 'tw', '約有61%~80%能觀察到此行為表現'),
(308, 'evaluation_scale_item_desc', 5, 'cn', ''),
(309, 'evaluation_scale_item_desc', 5, 'en', ''),
(310, 'evaluation_scale_item_desc', 6, 'tw', '約有81%~90%能觀察到此行為表現'),
(311, 'evaluation_scale_item_desc', 6, 'cn', ''),
(312, 'evaluation_scale_item_desc', 6, 'en', ''),
(313, 'evaluation_scale_item_desc', 0, 'tw', '約有91%以上能觀察到此行為表現'),
(314, 'evaluation_scale_item_desc', 0, 'cn', ''),
(315, 'evaluation_scale_item_desc', 0, 'en', ''),
(316, 'evaluation_scale_item_desc', 7, 'tw', '約有91%以上能觀察到此行為表現'),
(317, 'evaluation_scale_item_desc', 7, 'cn', ''),
(318, 'evaluation_scale_item_desc', 7, 'en', ''),
(319, 'basis_evaluation_desc', 1, 'tw', '協欣金屬_高階主管管理職能模型'),
(320, 'basis_evaluation_desc', 1, 'cn', ''),
(321, 'basis_evaluation_desc', 1, 'en', ''),
(322, 'b_evalu_table_desc', 1, 'tw', ''),
(323, 'b_evalu_table_desc', 1, 'cn', ''),
(324, 'b_evalu_table_desc', 1, 'en', ''),
(325, 'basis_evaluation_desc', 3, 'tw', ''),
(326, 'basis_evaluation_desc', 3, 'cn', ''),
(327, 'basis_evaluation_desc', 3, 'en', ''),
(328, 'b_evalu_table_desc', 3, 'tw', ''),
(329, 'b_evalu_table_desc', 3, 'cn', ''),
(330, 'b_evalu_table_desc', 3, 'en', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 列出以下資料庫的數據： `tpl`
--

INSERT INTO `tpl` (`tpl_id`, `tpl_title`, `tpl_sender`, `tpl_content`, `tpl_trigger`) VALUES
(1, '360度職能評鑑邀請函', '360 Degree Assessment Administrator', '親愛的 {fullName} 您好：\r\n\r\n  在您收到這封郵件時，表示您已被邀請參與本次管理職能360度評鑑。\r\n  本次評鑑目的是為了給參與本次評鑑的受評人，提供更明確的管理職能回饋訊息，俾便受評人建立更具針對性的個人發展計畫(IDP)。\r\n  您的真實回饋訊息，對受評人建立IDP至關重要，請依據您日常對受評人的實際觀察，提供客觀、真實的反饋。\r\n\r\n 您至少有一份以上的問卷尚待填寫，請使用google瀏覽器(Chrome)登入 {sysURL} 填寫評鑑表，並請您務必在9月17日(星期四)午夜12點前，將所有評鑑表填寫完畢。\r\n\r\n 您的登入信息如下：\r\n 帳號：{user_account}\r\n 密碼：{password}\r\n\r\n 請注意：\r\n 1、當您填寫問卷過程中需暫時離開系統時，請務必點選「保存」按鈕，以免數據遺失）\r\n 2、如您要回家做問卷，請抄下網址、帳號及密碼，回家輸入網址後，登入帳號密碼即可填寫問卷。\r\n 3、填寫完畢後，請務必按「交卷」按鈕，以確認問卷填寫完畢。\r\n\r\n 若您在填寫問卷過程當中有任何問題，請洽 分機xxx。\r\n\r\n 謝謝您的參與！\r\n\r\n主管領導力提升專案工作小組 敬上', ''),
(2, '360度職能評鑑通知函 (評鑑期限即將到期)', '360 Degree Assessment Administrator', '親愛的 {fullName} 您好：\r\n\r\n  由於您還有360度管理職能評鑑問卷尚未完成，且評鑑期限即將到期(9月17日 星期四，午夜12:00)，請您儘快撥空登入 {sysURL}  填寫問卷，謝謝您！\r\n\r\n  您的登入信息如下：\r\n  帳號：{user_account} \r\n  密碼：{password}\r\n\r\n請注意：\r\n\r\n1、當您填寫問卷過程中需暫時離開系統時，請務必點選「保存」按鈕，以免數據遺失）\r\n2、如您要回家做問卷，請抄下網址、帳號及密碼，回家輸入網址後，登入帳號密碼即可填寫問卷。\r\n3、填寫完畢後，請務必按「交卷」按鈕，以確認問卷填寫完畢。\r\n\r\n 若您在填寫問卷過程當中有任何問題，請洽 分機xxx。\r\n\r\n 謝謝您的參與！\r\n\r\n主管領導力提升專案工作小組 敬上', '');

-- --------------------------------------------------------

--
-- 資料表格式： `training_material`
--

CREATE TABLE IF NOT EXISTS `training_material` (
  `training_material_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_material_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `training_material`
--


-- --------------------------------------------------------

--
-- 資料表格式： `training_method`
--

CREATE TABLE IF NOT EXISTS `training_method` (
  `training_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_method_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `training_method`
--


-- --------------------------------------------------------

--
-- 資料表格式： `training_teacher`
--

CREATE TABLE IF NOT EXISTS `training_teacher` (
  `training_teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_teacher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `training_teacher`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=180 ;

--
-- 列出以下資料庫的數據： `user_profile`
--

INSERT INTO `user_profile` (`user_id`, `fullName`, `user_name_chs`, `user_name_eng`, `user_mps`, `name`, `first_name`, `last_name`, `birth_day`, `birth_month`, `birth_year`, `gender`, `job_title`, `company_id`, `notes`, `city_code`, `address`, `url`, `office_phone`, `home_phone`, `mobile`, `image`, `power_type`, `account_status`, `job_id`, `department_id`, `user_code`, `login_count`, `login_date`) VALUES
(1, 'admin', 'admin', 'admin', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'M', 'T', 0, 0, 'admin', 33, '2017-02-04 22:12:54'),
(100, '鍾錫源', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 1, 1, '980202A', 0, '0000-00-00 00:00:00'),
(101, '郭富評', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 3, 1, '160104A', 0, '0000-00-00 00:00:00'),
(102, '林加斌', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 4, 2, '130401A', 7, '2016-10-14 14:08:39'),
(103, '林恆春', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 4, 3, '160701A', 2, '2016-10-13 17:31:41'),
(104, '羅水興', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 4, 4, '990308A', 0, '0000-00-00 00:00:00'),
(105, '洪東顯', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 1, '801015A', 2, '2016-10-13 17:33:27'),
(106, '陳俊亮', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 8, 5, '790815A', 1, '2016-10-13 17:35:17'),
(107, '陳春景', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 6, 5, '790810A', 0, '0000-00-00 00:00:00'),
(108, '許丕男', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 8, 5, '970220A', 0, '0000-00-00 00:00:00'),
(109, '吳美青', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 6, 16, '981027A', 0, '0000-00-00 00:00:00'),
(110, '羅慧萍', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 6, 15, '980223B', 0, '0000-00-00 00:00:00'),
(111, '邱公傑', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 8, 6, '120524A', 0, '0000-00-00 00:00:00'),
(112, '洪明全', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 6, 6, '791001B', 0, '0000-00-00 00:00:00'),
(113, '蘇建通', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 8, 6, '830729A', 0, '0000-00-00 00:00:00'),
(114, '朱煌慶', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 6, '811001A', 0, '0000-00-00 00:00:00'),
(115, '徐意明', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 6, '900208A', 0, '0000-00-00 00:00:00'),
(116, '王瑞昇', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 8, 10, '160104B', 0, '0000-00-00 00:00:00'),
(117, '盧勝方', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 10, '790720A', 0, '0000-00-00 00:00:00'),
(118, '張運松', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 6, 22, '850409A', 0, '0000-00-00 00:00:00'),
(119, '林德民', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 23, '840214A', 0, '0000-00-00 00:00:00'),
(120, '謝清全', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 23, '860328A', 0, '0000-00-00 00:00:00'),
(121, '陳似禹', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 23, '991116A', 0, '0000-00-00 00:00:00'),
(122, '游金松', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 6, 24, '790801C', 0, '0000-00-00 00:00:00'),
(123, '張安潤', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 24, '960822A', 0, '0000-00-00 00:00:00'),
(124, '劉世芳', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 8, 9, '810701B', 0, '0000-00-00 00:00:00'),
(125, '蘇金海', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 19, '811216B', 0, '0000-00-00 00:00:00'),
(126, '宋明恭', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 19, '140714B', 0, '0000-00-00 00:00:00'),
(127, '游兆宏', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 4, 19, '850605A', 0, '0000-00-00 00:00:00'),
(128, '陳俊宏', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 4, 19, '940704I', 0, '0000-00-00 00:00:00'),
(129, '謝國華', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 6, 20, '790816B', 0, '0000-00-00 00:00:00'),
(130, '廖振山', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 4, 20, '790925A', 0, '0000-00-00 00:00:00'),
(131, '李永煌', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 4, 20, '830406A', 0, '0000-00-00 00:00:00'),
(132, '林淑敏', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 6, 21, '790917A', 0, '0000-00-00 00:00:00'),
(133, '邱瑞偉', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 4, 21, '930706A', 0, '0000-00-00 00:00:00'),
(134, '彭錦順', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 8, 11, '800603D', 0, '0000-00-00 00:00:00'),
(135, '鄧根發', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 8, 11, '790910A', 0, '0000-00-00 00:00:00'),
(136, '沈銘德', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 11, '791101D', 0, '0000-00-00 00:00:00'),
(137, '鄭天華', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 11, '800221C', 0, '0000-00-00 00:00:00'),
(138, '陳彥州', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 4, 25, '870907A', 0, '0000-00-00 00:00:00'),
(139, '王鼎鑫', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 4, 25, '860320B', 0, '0000-00-00 00:00:00'),
(140, '賴重成', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 4, 25, '890410A', 0, '0000-00-00 00:00:00'),
(141, '樊真知', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 5, 25, '810316A', 0, '0000-00-00 00:00:00'),
(142, '劉德良', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 7, 26, '810221C', 0, '0000-00-00 00:00:00'),
(143, '陳鋌', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 26, '800711C', 0, '0000-00-00 00:00:00'),
(144, '林玉豐', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 26, '810411A', 0, '0000-00-00 00:00:00'),
(145, '莊朝榜', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 26, '810824A', 0, '0000-00-00 00:00:00'),
(146, '游豐富', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 26, '860407A', 0, '0000-00-00 00:00:00'),
(147, '杜台元', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 26, '871001A', 0, '0000-00-00 00:00:00'),
(148, '郭長來', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 26, '931001A', 0, '0000-00-00 00:00:00'),
(149, '李清城', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 26, '810224A', 0, '0000-00-00 00:00:00'),
(150, '賴富秀', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 5, 12, '121015A', 0, '0000-00-00 00:00:00'),
(151, '姜義洋', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 12, '110201A', 0, '0000-00-00 00:00:00'),
(152, '簡明煌', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 7, 28, '131209B', 0, '0000-00-00 00:00:00'),
(153, '黃金山', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 28, '890622D', 0, '0000-00-00 00:00:00'),
(154, '楊對成', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 28, '990301C', 0, '0000-00-00 00:00:00'),
(155, '傅惇建', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 28, '940822C', 0, '0000-00-00 00:00:00'),
(156, '鍾志賢', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 28, '930505C', 0, '0000-00-00 00:00:00'),
(157, '湯仁傑', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 28, '890918A', 0, '0000-00-00 00:00:00'),
(158, '陳松賢', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 28, '810727A', 0, '0000-00-00 00:00:00'),
(159, '彭永富', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 7, 29, '980302A', 0, '0000-00-00 00:00:00'),
(160, '許維帆', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 7, 27, '110602A', 0, '0000-00-00 00:00:00'),
(161, '江信義', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 27, '791101E', 0, '0000-00-00 00:00:00'),
(162, '裴慶富', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 27, '930226A', 0, '0000-00-00 00:00:00'),
(163, '張為偉', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 27, '990323D', 0, '0000-00-00 00:00:00'),
(164, '游振男', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 6, 8, '830518A', 0, '0000-00-00 00:00:00'),
(165, '吳僑英', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 8, '810622A', 0, '0000-00-00 00:00:00'),
(166, '陳羽德', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 7, 17, '960621A', 0, '0000-00-00 00:00:00'),
(167, '湯發良', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 7, 18, '900220A', 0, '0000-00-00 00:00:00'),
(168, '李清源', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 18, '900905A', 0, '0000-00-00 00:00:00'),
(169, '樊秀知', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 18, '820517A', 0, '0000-00-00 00:00:00'),
(170, '陳宗枝', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 5, 13, '790716B', 0, '0000-00-00 00:00:00'),
(171, '戴翰喬', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 7, 30, '940913D', 0, '0000-00-00 00:00:00'),
(172, '劉守深', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 7, 31, '980803D', 0, '0000-00-00 00:00:00'),
(173, '吳鳳嬌', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 13, '880224A', 0, '0000-00-00 00:00:00'),
(174, '謝新良', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 31, '981118A', 0, '0000-00-00 00:00:00'),
(175, '鍾沅成', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 31, '120221A', 0, '0000-00-00 00:00:00'),
(176, '黃大原', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 7, 32, '791201J', 0, '0000-00-00 00:00:00'),
(177, '曾繁旺', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 32, '900423A', 0, '0000-00-00 00:00:00'),
(178, '李震球', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 10, 32, '860304A', 0, '0000-00-00 00:00:00'),
(179, '孫道行', '', '', '', '', '', '', 0, 0, 0, '', '', 102, '', 0, '', '', '', '', '', '', 'N', 'T', 9, 22, '930503A', 0, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=242 ;

--
-- 列出以下資料庫的數據： `user_sso`
--

INSERT INTO `user_sso` (`user_email_id`, `user_email`, `user_live_id`, `user_fb_id`, `user_id`, `user_account`, `password`) VALUES
(1, '', '', '', 1, 'admin', 'admin'),
(162, 's_jong@twcoc.com.tw', '', '', 100, '980202A', '980202A'),
(163, 'kfp@twcoc.com.tw', '', '', 101, '160104A', '160104A'),
(164, 'ym130401@ymht.com.tw', '', '', 102, '130401A', '130401A'),
(165, 'hclin@twcoc.com.tw', '', '', 103, '160701A', '160701A'),
(166, 'Hsin@twcoc.com.tw', '', '', 104, '990308A', '990308A'),
(167, 'tung-hsien@twcoc.com.tw', '', '', 105, '801015A', '801015A'),
(168, 'clchen@twcoc.com.tw', '', '', 106, '790815A', '790815A'),
(169, '790810@twcoc.com.tw', '', '', 107, '790810A', '790810A'),
(170, 'hsupinan@twcoc.com.tw', '', '', 108, '970220A', '970220A'),
(171, '981027@twcoc.com.tw', '', '', 109, '981027A', '981027A'),
(172, 'joyce_lo@twcoc.com.tw', '', '', 110, '980223B', '980223B'),
(173, 'kcchiou@twcoc.com.tw', '', '', 111, '120524A', '120524A'),
(174, 'marrlice@twcoc.com.tw', '', '', 112, '791001B', '791001B'),
(175, 'tung@twcoc.com.tw', '', '', 113, '830729A', '830729A'),
(176, 'alan-chu@twcoc.com.tw', '', '', 114, '811001A', '811001A'),
(177, 'tonyhsu@twcoc.com.tw', '', '', 115, '900208A', '900208A'),
(178, 'she@twcoc.com.tw', '', '', 116, '160104B', '160104B'),
(179, '790720@twcoc.com.tw', '', '', 117, '790720A', '790720A'),
(180, '850409@twcoc.com.tw', '', '', 118, '850409A', '850409A'),
(181, '840214@twcoc.com.tw', '', '', 119, '840214A', '840214A'),
(182, '860328@twcoc.com.tw', '', '', 120, '860328A', '860328A'),
(183, '991116@twcoc.com.tw', '', '', 121, '991116A', '991116A'),
(184, '790801c@twcoc.com.tw', '', '', 122, '790801C', '790801C'),
(185, '960822@twcoc.com.tw', '', '', 123, '960822A', '960822A'),
(186, '810701b@twcoc.com.tw', '', '', 124, '810701B', '810701B'),
(187, '811216b@twcoc.com.tw', '', '', 125, '811216B', '811216B'),
(188, '140714b@twcoc.com.tw', '', '', 126, '140714B', '140714B'),
(189, '850605@twcoc.com.tw', '', '', 127, '850605A', '850605A'),
(190, '940704i@twcoc.com.tw', '', '', 128, '940704I', '940704I'),
(191, '790816b@twcoc.com.tw', '', '', 129, '790816B', '790816B'),
(192, '790925@twcoc.com.tw', '', '', 130, '790925A', '790925A'),
(193, '830406@twcoc.com.tw', '', '', 131, '830406A', '830406A'),
(194, '790917@twcoc.com.tw', '', '', 132, '790917A', '790917A'),
(195, '930706@twcoc.com.tw', '', '', 133, '930706A', '930706A'),
(196, '800603d@twcoc.com.tw', '', '', 134, '800603D', '800603D'),
(197, '790910@twcoc.com.tw', '', '', 135, '790910A', '790910A'),
(198, '791101d@twcoc.com.tw', '', '', 136, '791101D', '791101D'),
(199, '800221c@twcoc.com.tw', '', '', 137, '800221C', '800221C'),
(200, '870907@twcoc.com.tw', '', '', 138, '870907A', '870907A'),
(201, '860320b@twcoc.com.tw', '', '', 139, '860320B', '860320B'),
(202, '890410@twcoc.com.tw', '', '', 140, '890410A', '890410A'),
(203, '810316@twcoc.com.tw', '', '', 141, '810316A', '810316A'),
(204, '810221c@twcoc.com.tw', '', '', 142, '810221C', '810221C'),
(205, '800711@twcoc.com.tw', '', '', 143, '800711C', '800711C'),
(206, '810411@twcoc.com.tw', '', '', 144, '810411A', '810411A'),
(207, '810824@twcoc.com.tw', '', '', 145, '810824A', '810824A'),
(208, '860407@twcoc.com.tw', '', '', 146, '860407A', '860407A'),
(209, '871001@twcoc.com.tw', '', '', 147, '871001A', '871001A'),
(210, '931001@twcoc.com.tw', '', '', 148, '931001A', '931001A'),
(211, '810224@twcoc.com.tw', '', '', 149, '810224A', '810224A'),
(212, 'fxlai@twcoc.com.tw', '', '', 150, '121015A', '121015A'),
(213, '980608c@twcoc.com.tw', '', '', 151, '110201A', '110201A'),
(214, '131209b@twcoc.com.tw', '', '', 152, '131209B', '131209B'),
(215, '890622d@twcoc.com.tw', '', '', 153, '890622D', '890622D'),
(216, '990301c@twcoc.com.tw', '', '', 154, '990301C', '990301C'),
(217, '940822c@twcoc.com.tw', '', '', 155, '940822C', '940822C'),
(218, '930505c@twcoc.com.tw', '', '', 156, '930505C', '930505C'),
(219, '890918@twcoc.com.tw', '', '', 157, '890918A', '890918A'),
(220, '810727@twcoc.com.tw', '', '', 158, '810727A', '810727A'),
(221, 'jansom@twcoc.com.tw', '', '', 159, '980302A', '980302A'),
(222, '110602@twcoc.com.tw', '', '', 160, '110602A', '110602A'),
(223, '791101e@twcoc.com.tw', '', '', 161, '791101E', '791101E'),
(224, '930226@twcoc.com.tw', '', '', 162, '930226A', '930226A'),
(225, '930226d@twcoc.com.tw', '', '', 163, '990323D', '990323D'),
(226, '830518@twcoc.com.tw', '', '', 164, '830518A', '830518A'),
(227, '810622@twcoc.com.tw', '', '', 165, '810622A', '810622A'),
(228, '960621@twcoc.com.tw', '', '', 166, '960621A', '960621A'),
(229, '900220@twcoc.com.tw', '', '', 167, '900220A', '900220A'),
(230, '900905@twcoc.com.tw', '', '', 168, '900905A', '900905A'),
(231, '820517@twcoc.com.tw', '', '', 169, '820517A', '820517A'),
(232, 'tcchen@twcoc.com.tw', '', '', 170, '790716B', '790716B'),
(233, '940913d@twcoc.com.tw', '', '', 171, '940913D', '940913D'),
(234, '980803@twcoc.com.tw', '', '', 172, '980803D', '980803D'),
(235, '880224@twcoc.com.tw', '', '', 173, '880224A', '880224A'),
(236, '981118@twcoc.com.tw', '', '', 174, '981118A', '981118A'),
(237, '120221@twcoc.com.tw', '', '', 175, '120221A', '120221A'),
(238, '791201j@twcoc.com.tw', '', '', 176, '791201J', '791201J'),
(239, '900423@twcoc.com.tw', '', '', 177, '900423A', '900423A'),
(240, '860304@twcoc.com.tw', '', '', 178, '860304A', '860304A'),
(241, '930503@twcoc.com.tw', '', '', 179, '930503A', '930503A');
