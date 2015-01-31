-- phpMyAdmin SQL Dump
-- version 2.11.9.5
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 建立日期: Jan 31, 2015, 03:39 AM
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

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
-- 資料表格式： `basis_evaluation_table`
--

CREATE TABLE IF NOT EXISTS `basis_evaluation_table` (
  `basis_evaluation_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `basis_evaluation_table_code` varchar(30) NOT NULL,
  `is_show_competency` varchar(1) NOT NULL,
  `due_date` date NOT NULL,
  `competency_model_id` int(11) NOT NULL,
  `evaluation_scale_id` int(11) NOT NULL,
  `basis_evaluation_table_status` varchar(6) NOT NULL,
  PRIMARY KEY (`basis_evaluation_table_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 資料表格式： `behavior`
--

CREATE TABLE IF NOT EXISTS `behavior` (
  `behavior_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_id` int(11) NOT NULL,
  `weight` decimal(10,1) NOT NULL,
  PRIMARY KEY (`behavior_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

-- --------------------------------------------------------

--
-- 資料表格式： `competency_evalation`
--

CREATE TABLE IF NOT EXISTS `competency_evalation` (
  `competency_evalation_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`competency_evalation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 資料表格式： `competency_level`
--

CREATE TABLE IF NOT EXISTS `competency_level` (
  `competency_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_id` int(11) NOT NULL,
  `competency_level` int(11) NOT NULL,
  PRIMARY KEY (`competency_level_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

-- --------------------------------------------------------

--
-- 資料表格式： `evaluation_relation`
--

CREATE TABLE IF NOT EXISTS `evaluation_relation` (
  `evaluation_relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_relation_code` varchar(10) NOT NULL,
  PRIMARY KEY (`evaluation_relation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 資料表格式： `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_family_id` int(10) unsigned DEFAULT NULL COMMENT '職系',
  `job_level` int(10) unsigned DEFAULT NULL COMMENT '職等',
  `job_type_id` int(10) unsigned DEFAULT NULL COMMENT '工作類別',
  `competency_model_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 資料表格式： `job_family`
--

CREATE TABLE IF NOT EXISTS `job_family` (
  `job_family_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`job_family_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 資料表格式： `job_type`
--

CREATE TABLE IF NOT EXISTS `job_type` (
  `job_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_type_code` varchar(10) NOT NULL,
  PRIMARY KEY (`job_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=496 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=628 ;

-- --------------------------------------------------------

--
-- 資料表格式： `training_material`
--

CREATE TABLE IF NOT EXISTS `training_material` (
  `training_material_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_material_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 資料表格式： `training_method`
--

CREATE TABLE IF NOT EXISTS `training_method` (
  `training_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_method_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 資料表格式： `training_teacher`
--

CREATE TABLE IF NOT EXISTS `training_teacher` (
  `training_teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_teacher_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;
