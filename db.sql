-- phpMyAdmin SQL Dump
-- version 2.11.9.5
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 建立日期: Aug 11, 2015, 03:26 AM
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;
