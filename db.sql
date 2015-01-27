-- phpMyAdmin SQL Dump
-- version 2.11.9.5
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 建立日期: Jan 27, 2015, 06:22 PM
-- 伺服器版本: 5.6.15
-- PHP 版本: 5.4.24

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

-- --------------------------------------------------------

--
-- 資料表格式： `competency_evalation`
--

CREATE TABLE IF NOT EXISTS `competency_evalation` (
  `competency_evalation_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`competency_evalation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 資料表格式： `competency_level`
--

CREATE TABLE IF NOT EXISTS `competency_level` (
  `competency_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_id` int(11) NOT NULL,
  `competency_level` int(11) NOT NULL,
  PRIMARY KEY (`competency_level_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 資料表格式： `competency_model`
--

CREATE TABLE IF NOT EXISTS `competency_model` (
  `competency_model_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_model_count` int(11) NOT NULL,
  `competency_model_type` varchar(10) NOT NULL,
  `competency_model_method` varchar(10) NOT NULL COMMENT '分級制或基準制',
  PRIMARY KEY (`competency_model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=271 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=487 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 資料表格式： `training_teacher`
--

CREATE TABLE IF NOT EXISTS `training_teacher` (
  `training_teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_teacher_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;
