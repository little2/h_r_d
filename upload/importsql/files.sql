-- WP Live Server Deploy MySQL Dump 0.2
--
-- Host: localhost    Database: inetar0_hrd
-- ------------------------------------------------------
-- Server version	
-- 
-- Table structure for table `ability`
--

DROP TABLE IF EXISTS `ability`;
CREATE TABLE `ability` (
  `ability_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`ability_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `ability`
--

LOCK TABLES `ability` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `user_name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
)  ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `basis_evaluation_appraisee`
--

DROP TABLE IF EXISTS `basis_evaluation_appraisee`;
CREATE TABLE `basis_evaluation_appraisee` (
  `basis_evaluation_appraisee_id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisee_uid` int(11) NOT NULL,
  `basis_evaluation_table_id` int(11) NOT NULL,
  `basis_evaluation_progress` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_appraisee_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `basis_evaluation_appraisee`
--

LOCK TABLES `basis_evaluation_appraisee` WRITE;
INSERT INTO `basis_evaluation_appraisee` VALUES ('204', '790716', '5', '');
INSERT INTO `basis_evaluation_appraisee` VALUES ('203', '121015', '5', '');
INSERT INTO `basis_evaluation_appraisee` VALUES ('202', '800603', '5', '');
INSERT INTO `basis_evaluation_appraisee` VALUES ('201', '160104', '5', '');
INSERT INTO `basis_evaluation_appraisee` VALUES ('200', '120524', '5', '');
INSERT INTO `basis_evaluation_appraisee` VALUES ('199', '790815', '5', '');
INSERT INTO `basis_evaluation_appraisee` VALUES ('198', '830518', '5', '');
INSERT INTO `basis_evaluation_appraisee` VALUES ('197', '791001', '5', '');
INSERT INTO `basis_evaluation_appraisee` VALUES ('196', '790810', '5', '');
INSERT INTO `basis_evaluation_appraisee` VALUES ('195', '790910', '5', '');
INSERT INTO `basis_evaluation_appraisee` VALUES ('194', '810701', '5', '');
INSERT INTO `basis_evaluation_appraisee` VALUES ('193', '830729', '5', '');
INSERT INTO `basis_evaluation_appraisee` VALUES ('192', '970220', '5', '');
UNLOCK TABLES;
-- 
-- Table structure for table `basis_evaluation_evaluator`
--

DROP TABLE IF EXISTS `basis_evaluation_evaluator`;
CREATE TABLE `basis_evaluation_evaluator` (
  `basis_evaluation_evaluator_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `basis_evaluation_appraisee_id` int(11) NOT NULL,
  `basis_evaluation_evaluator_uid` int(11) NOT NULL,
  `basis_evaluation_evaluator_relation` int(11) NOT NULL,
  `basis_evaluation_evaluator_progress` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_evaluator_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=358 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `basis_evaluation_evaluator`
--

LOCK TABLES `basis_evaluation_evaluator` WRITE;
INSERT INTO `basis_evaluation_evaluator` VALUES ('357', '204', '790716', '1', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('356', '204', '990308', '2', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('355', '203', '121015', '1', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('354', '203', '160701', '2', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('353', '202', '800603', '1', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('352', '202', '130401', '2', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('351', '201', '160104', '1', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('350', '201', '130401', '2', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('349', '200', '120524', '1', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('348', '200', '160104', '2', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('347', '199', '790815', '1', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('346', '199', '160104', '2', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('345', '198', '830518', '1', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('344', '198', '160701', '2', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('343', '197', '791001', '1', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('342', '197', '120524', '2', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('341', '196', '790810', '1', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('340', '196', '790815', '2', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('339', '195', '790910', '1', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('338', '195', '800603', '2', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('337', '194', '810701', '1', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('336', '194', '130401', '2', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('335', '193', '810701', '3', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('334', '193', '130401', '4', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('333', '193', '830729', '1', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('332', '193', '120524', '2', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('331', '192', '970220', '1', '');
INSERT INTO `basis_evaluation_evaluator` VALUES ('330', '192', '790815', '2', '');
UNLOCK TABLES;
-- 
-- Table structure for table `basis_evaluation_evaluator_competeny`
--

DROP TABLE IF EXISTS `basis_evaluation_evaluator_competeny`;
CREATE TABLE `basis_evaluation_evaluator_competeny` (
  `basis_evaluation_evaluator_competency_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `basis_evaluation_evaluator_id` int(11) NOT NULL,
  `competency_id` int(11) NOT NULL,
  `evaluation_competency_grade` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_evaluator_competency_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `basis_evaluation_evaluator_competeny`
--

LOCK TABLES `basis_evaluation_evaluator_competeny` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `basis_evaluation_evaluator_detail`
--

DROP TABLE IF EXISTS `basis_evaluation_evaluator_detail`;
CREATE TABLE `basis_evaluation_evaluator_detail` (
  `basis_evaluation_evaluator_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `basis_evaluation_evaluator_id` int(11) NOT NULL,
  `behavior_id` int(11) NOT NULL,
  `evaluation_scale_item_grade` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_evaluator_detail_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `basis_evaluation_evaluator_detail`
--

LOCK TABLES `basis_evaluation_evaluator_detail` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `basis_evaluation_open_comment`
--

DROP TABLE IF EXISTS `basis_evaluation_open_comment`;
CREATE TABLE `basis_evaluation_open_comment` (
  `basis_evaluation_open_comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `basis_evaluation_table_id` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_open_comment_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `basis_evaluation_open_comment`
--

LOCK TABLES `basis_evaluation_open_comment` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `basis_evaluation_report`
--

DROP TABLE IF EXISTS `basis_evaluation_report`;
CREATE TABLE `basis_evaluation_report` (
  `basis_evaluation_report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `basis_evaluation_table_id` int(11) NOT NULL,
  `basis_evaluation_report_desc` text NOT NULL,
  PRIMARY KEY (`basis_evaluation_report_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `basis_evaluation_report`
--

LOCK TABLES `basis_evaluation_report` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `basis_evaluation_table`
--

DROP TABLE IF EXISTS `basis_evaluation_table`;
CREATE TABLE `basis_evaluation_table` (
  `basis_evaluation_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `basis_evaluation_table_code` varchar(30) NULL,
  `is_show_competency` varchar(1) NOT NULL,
  `due_date` date NOT NULL,
  `competency_model_id` int(11) DEFAULT '0',
  `evaluation_scale_id` int(11) NOT NULL,
  `basis_evaluation_table_status` varchar(6) NOT NULL,
  `basis_evaluation_table_process` int(11) NOT NULL,
  PRIMARY KEY (`basis_evaluation_table_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `basis_evaluation_table`
--

LOCK TABLES `basis_evaluation_table` WRITE;
INSERT INTO `basis_evaluation_table` VALUES ('5', '2016高階匯入測試', 'F', '2016-11-28', '1', '1', 'EDT', '');
UNLOCK TABLES;
-- 
-- Table structure for table `basis_evaluation_user_comment`
--

DROP TABLE IF EXISTS `basis_evaluation_user_comment`;
CREATE TABLE `basis_evaluation_user_comment` (
  `basis_evaluation_user_comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `basis_evaluation_open_comment_id` int(11) NOT NULL,
  `evalutor_uid` int(11) NOT NULL,
  `basis_evaluation_appraisee_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`basis_evaluation_user_comment_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `basis_evaluation_user_comment`
--

LOCK TABLES `basis_evaluation_user_comment` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `behavior`
--

DROP TABLE IF EXISTS `behavior`;
CREATE TABLE `behavior` (
  `behavior_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_id` int(11) NOT NULL,
  `weight` decimal(10,1) NOT NULL,
  PRIMARY KEY (`behavior_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `behavior`
--

LOCK TABLES `behavior` WRITE;
INSERT INTO `behavior` VALUES ('1', '11', '1.0');
INSERT INTO `behavior` VALUES ('2', '11', '1.0');
INSERT INTO `behavior` VALUES ('3', '11', '1.0');
INSERT INTO `behavior` VALUES ('4', '11', '1.0');
INSERT INTO `behavior` VALUES ('5', '11', '1.0');
INSERT INTO `behavior` VALUES ('6', '12', '1.0');
INSERT INTO `behavior` VALUES ('7', '12', '1.0');
INSERT INTO `behavior` VALUES ('8', '12', '1.0');
INSERT INTO `behavior` VALUES ('9', '12', '1.0');
INSERT INTO `behavior` VALUES ('10', '12', '1.0');
INSERT INTO `behavior` VALUES ('11', '13', '1.0');
INSERT INTO `behavior` VALUES ('12', '13', '1.0');
INSERT INTO `behavior` VALUES ('13', '13', '1.0');
INSERT INTO `behavior` VALUES ('14', '13', '1.0');
INSERT INTO `behavior` VALUES ('15', '13', '1.0');
INSERT INTO `behavior` VALUES ('16', '14', '1.0');
INSERT INTO `behavior` VALUES ('17', '14', '1.0');
INSERT INTO `behavior` VALUES ('18', '14', '1.0');
INSERT INTO `behavior` VALUES ('19', '14', '1.0');
INSERT INTO `behavior` VALUES ('20', '14', '1.0');
INSERT INTO `behavior` VALUES ('21', '15', '1.0');
INSERT INTO `behavior` VALUES ('22', '15', '1.0');
INSERT INTO `behavior` VALUES ('23', '15', '1.0');
INSERT INTO `behavior` VALUES ('24', '15', '1.0');
INSERT INTO `behavior` VALUES ('25', '15', '1.0');
INSERT INTO `behavior` VALUES ('26', '6', '1.0');
INSERT INTO `behavior` VALUES ('27', '6', '1.0');
INSERT INTO `behavior` VALUES ('28', '6', '1.0');
INSERT INTO `behavior` VALUES ('29', '6', '1.0');
INSERT INTO `behavior` VALUES ('30', '6', '1.0');
INSERT INTO `behavior` VALUES ('31', '8', '1.0');
INSERT INTO `behavior` VALUES ('32', '8', '1.0');
INSERT INTO `behavior` VALUES ('33', '8', '1.0');
INSERT INTO `behavior` VALUES ('34', '8', '1.0');
INSERT INTO `behavior` VALUES ('35', '8', '1.0');
INSERT INTO `behavior` VALUES ('36', '9', '1.0');
INSERT INTO `behavior` VALUES ('37', '9', '1.0');
INSERT INTO `behavior` VALUES ('38', '9', '1.0');
INSERT INTO `behavior` VALUES ('39', '9', '1.0');
INSERT INTO `behavior` VALUES ('40', '9', '1.0');
INSERT INTO `behavior` VALUES ('41', '1', '1.0');
INSERT INTO `behavior` VALUES ('42', '1', '1.0');
INSERT INTO `behavior` VALUES ('43', '1', '1.0');
INSERT INTO `behavior` VALUES ('44', '1', '1.0');
INSERT INTO `behavior` VALUES ('45', '1', '1.0');
INSERT INTO `behavior` VALUES ('46', '3', '1.0');
INSERT INTO `behavior` VALUES ('47', '3', '1.0');
INSERT INTO `behavior` VALUES ('48', '3', '1.0');
INSERT INTO `behavior` VALUES ('49', '3', '1.0');
INSERT INTO `behavior` VALUES ('50', '3', '1.0');
INSERT INTO `behavior` VALUES ('51', '5', '1.0');
INSERT INTO `behavior` VALUES ('52', '5', '1.0');
INSERT INTO `behavior` VALUES ('53', '5', '1.0');
INSERT INTO `behavior` VALUES ('54', '5', '1.0');
INSERT INTO `behavior` VALUES ('55', '5', '1.0');
INSERT INTO `behavior` VALUES ('56', '2', '1.0');
INSERT INTO `behavior` VALUES ('57', '2', '1.0');
INSERT INTO `behavior` VALUES ('58', '2', '1.0');
INSERT INTO `behavior` VALUES ('59', '2', '1.0');
INSERT INTO `behavior` VALUES ('60', '2', '1.0');
INSERT INTO `behavior` VALUES ('61', '4', '1.0');
INSERT INTO `behavior` VALUES ('62', '4', '1.0');
INSERT INTO `behavior` VALUES ('63', '4', '1.0');
INSERT INTO `behavior` VALUES ('64', '4', '1.0');
INSERT INTO `behavior` VALUES ('65', '4', '1.0');
INSERT INTO `behavior` VALUES ('66', '7', '1.0');
INSERT INTO `behavior` VALUES ('67', '7', '1.0');
INSERT INTO `behavior` VALUES ('68', '7', '1.0');
INSERT INTO `behavior` VALUES ('69', '7', '1.0');
INSERT INTO `behavior` VALUES ('70', '7', '1.0');
INSERT INTO `behavior` VALUES ('71', '10', '1.0');
INSERT INTO `behavior` VALUES ('72', '10', '1.0');
INSERT INTO `behavior` VALUES ('73', '10', '1.0');
INSERT INTO `behavior` VALUES ('74', '10', '1.0');
INSERT INTO `behavior` VALUES ('75', '10', '1.0');
UNLOCK TABLES;
-- 
-- Table structure for table `class_evaluation_appraisee`
--

DROP TABLE IF EXISTS `class_evaluation_appraisee`;
CREATE TABLE `class_evaluation_appraisee` (
  `class_evaluation_appraisee_id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisee_uid` int(11) NOT NULL,
  `core_competency_model_id` int(10) unsigned NOT NULL,
  `manage_competency_model_id` int(10) unsigned NOT NULL,
  `general_competency_model_id` int(10) unsigned NOT NULL,
  `professional_competency_model_id` int(10) unsigned NOT NULL,
  `class_evaluation_appraisee_stauts` varchar(3) NOT NULL DEFAULT 'EDT',
  `class_evaluation_progress` int(11) NOT NULL,
  PRIMARY KEY (`class_evaluation_appraisee_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `class_evaluation_appraisee`
--

LOCK TABLES `class_evaluation_appraisee` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `class_evaluation_competency`
--

DROP TABLE IF EXISTS `class_evaluation_competency`;
CREATE TABLE `class_evaluation_competency` (
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
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `class_evaluation_competency`
--

LOCK TABLES `class_evaluation_competency` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `class_evaluation_evaluator`
--

DROP TABLE IF EXISTS `class_evaluation_evaluator`;
CREATE TABLE `class_evaluation_evaluator` (
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
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `class_evaluation_evaluator`
--

LOCK TABLES `class_evaluation_evaluator` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `competency`
--

DROP TABLE IF EXISTS `competency`;
CREATE TABLE `competency` (
  `competency_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `competency_type` varchar(10) NOT NULL,
  `competency_method` varchar(30) NOT NULL,
  `competency_model_id` int(10) NOT NULL,
  `competency_weight` decimal(10,1) NOT NULL DEFAULT '1.0',
  `competency_level_number` int(1) NOT NULL,
  `competency_sort` int(11) NOT NULL,
  PRIMARY KEY (`competency_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `competency`
--

LOCK TABLES `competency` WRITE;
INSERT INTO `competency` VALUES ('1', 'M', 'B', '1', '1.0', '', '');
INSERT INTO `competency` VALUES ('2', 'M', 'B', '1', '1.0', '', '');
INSERT INTO `competency` VALUES ('3', 'M', 'B', '1', '1.0', '', '');
INSERT INTO `competency` VALUES ('4', 'M', 'B', '1', '1.0', '', '');
INSERT INTO `competency` VALUES ('5', 'M', 'B', '1', '1.0', '', '');
INSERT INTO `competency` VALUES ('6', 'M', 'B', '2', '1.0', '', '');
INSERT INTO `competency` VALUES ('7', 'M', 'B', '2', '1.0', '', '');
INSERT INTO `competency` VALUES ('8', 'M', 'B', '2', '1.0', '', '');
INSERT INTO `competency` VALUES ('9', 'M', 'B', '2', '1.0', '', '');
INSERT INTO `competency` VALUES ('10', 'M', 'B', '2', '1.0', '', '');
INSERT INTO `competency` VALUES ('11', 'M', 'B', '3', '1.0', '', '');
INSERT INTO `competency` VALUES ('12', 'M', 'B', '3', '1.0', '', '');
INSERT INTO `competency` VALUES ('13', 'M', 'B', '3', '1.0', '', '');
INSERT INTO `competency` VALUES ('14', 'M', 'B', '3', '1.0', '', '');
INSERT INTO `competency` VALUES ('15', 'M', 'B', '3', '1.0', '', '');
UNLOCK TABLES;
-- 
-- Table structure for table `competency_dic`
--

DROP TABLE IF EXISTS `competency_dic`;
CREATE TABLE `competency_dic` (
  `competency_dic_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_dic_code` varchar(10) NULL,
  `competency_type` varchar(5) NOT NULL,
  PRIMARY KEY (`competency_dic_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `competency_dic`
--

LOCK TABLES `competency_dic` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `competency_dic_course`
--

DROP TABLE IF EXISTS `competency_dic_course`;
CREATE TABLE `competency_dic_course` (
  `competency_dic_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_dic_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`competency_dic_course_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `competency_dic_course`
--

LOCK TABLES `competency_dic_course` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `competency_evaluation`
--

DROP TABLE IF EXISTS `competency_evaluation`;
CREATE TABLE `competency_evaluation` (
  `competency_evaluation_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`competency_evaluation_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `competency_evaluation`
--

LOCK TABLES `competency_evaluation` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `competency_level`
--

DROP TABLE IF EXISTS `competency_level`;
CREATE TABLE `competency_level` (
  `competency_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_id` int(11) NOT NULL,
  `competency_level` int(11) NOT NULL,
  PRIMARY KEY (`competency_level_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `competency_level`
--

LOCK TABLES `competency_level` WRITE;
INSERT INTO `competency_level` VALUES ('1', '1', '1');
INSERT INTO `competency_level` VALUES ('2', '2', '1');
INSERT INTO `competency_level` VALUES ('3', '3', '1');
INSERT INTO `competency_level` VALUES ('4', '4', '1');
INSERT INTO `competency_level` VALUES ('5', '5', '1');
INSERT INTO `competency_level` VALUES ('6', '6', '1');
INSERT INTO `competency_level` VALUES ('7', '7', '1');
INSERT INTO `competency_level` VALUES ('8', '8', '1');
INSERT INTO `competency_level` VALUES ('9', '9', '1');
INSERT INTO `competency_level` VALUES ('10', '10', '1');
INSERT INTO `competency_level` VALUES ('11', '11', '1');
INSERT INTO `competency_level` VALUES ('12', '12', '1');
INSERT INTO `competency_level` VALUES ('13', '13', '1');
INSERT INTO `competency_level` VALUES ('14', '14', '1');
INSERT INTO `competency_level` VALUES ('15', '15', '1');
UNLOCK TABLES;
-- 
-- Table structure for table `competency_model`
--

DROP TABLE IF EXISTS `competency_model`;
CREATE TABLE `competency_model` (
  `competency_model_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_model_count` int(11) DEFAULT '0',
  `competency_model_type` varchar(10) NOT NULL,
  `competency_model_method` varchar(10) NOT NULL,
  `competency_level_number` int(1) DEFAULT '0',
  PRIMARY KEY (`competency_model_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `competency_model`
--

LOCK TABLES `competency_model` WRITE;
INSERT INTO `competency_model` VALUES ('1', '5', 'M', 'B', '');
INSERT INTO `competency_model` VALUES ('2', '5', 'M', 'B', '');
INSERT INTO `competency_model` VALUES ('3', '5', 'M', 'B', '');
UNLOCK TABLES;
-- 
-- Table structure for table `competency_model_standard`
--

DROP TABLE IF EXISTS `competency_model_standard`;
CREATE TABLE `competency_model_standard` (
  `competency_model_id` int(11) NOT NULL,
  `update_date` datetime NOT NULL,
  `maintainer_uid` int(11) NOT NULL,
  PRIMARY KEY (`competency_model_id`),
  UNIQUE KEY `competency_model_id` (`competency_model_id`)
)  ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `competency_model_standard`
--

LOCK TABLES `competency_model_standard` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `course_property`
--

DROP TABLE IF EXISTS `course_property`;
CREATE TABLE `course_property` (
  `course_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_code` varchar(20) NULL,
  `catalog_id` int(11) NULL,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `course_property`
--

LOCK TABLES `course_property` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `evaluation_relation`
--

DROP TABLE IF EXISTS `evaluation_relation`;
CREATE TABLE `evaluation_relation` (
  `evaluation_relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_relation_code` varchar(10) NOT NULL,
  PRIMARY KEY (`evaluation_relation_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `evaluation_relation`
--

LOCK TABLES `evaluation_relation` WRITE;
INSERT INTO `evaluation_relation` VALUES ('1', '1');
INSERT INTO `evaluation_relation` VALUES ('2', '2');
UNLOCK TABLES;
-- 
-- Table structure for table `evaluation_scale`
--

DROP TABLE IF EXISTS `evaluation_scale`;
CREATE TABLE `evaluation_scale` (
  `evaluation_scale_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_scale_item_count` int(11) NOT NULL,
  `evaluation_scale_basis` decimal(10,2) NOT NULL,
  `evaluation_scale_status` varchar(10) NULL,
  PRIMARY KEY (`evaluation_scale_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `evaluation_scale`
--

LOCK TABLES `evaluation_scale` WRITE;
INSERT INTO `evaluation_scale` VALUES ('1', '7', '5.00', '');
UNLOCK TABLES;
-- 
-- Table structure for table `evaluation_scale_item`
--

DROP TABLE IF EXISTS `evaluation_scale_item`;
CREATE TABLE `evaluation_scale_item` (
  `evaluation_scale_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_scale_id` int(11) NOT NULL,
  `evaluation_scale_item_sort` int(11) NOT NULL,
  `evaluation_scale_item_grade` int(11) NOT NULL,
  `evaluation_scale_item_self` varchar(1) NOT NULL DEFAULT 'T',
  PRIMARY KEY (`evaluation_scale_item_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `evaluation_scale_item`
--

LOCK TABLES `evaluation_scale_item` WRITE;
INSERT INTO `evaluation_scale_item` VALUES ('1', '1', '', '1', 'F');
INSERT INTO `evaluation_scale_item` VALUES ('2', '1', '', '2', 'F');
INSERT INTO `evaluation_scale_item` VALUES ('3', '1', '', '3', 'F');
INSERT INTO `evaluation_scale_item` VALUES ('4', '1', '', '4', 'F');
INSERT INTO `evaluation_scale_item` VALUES ('5', '1', '', '5', 'F');
INSERT INTO `evaluation_scale_item` VALUES ('6', '1', '', '6', 'F');
INSERT INTO `evaluation_scale_item` VALUES ('7', '1', '', '7', 'F');
UNLOCK TABLES;
-- 
-- Table structure for table `favorite_url`
--

DROP TABLE IF EXISTS `favorite_url`;
CREATE TABLE `favorite_url` (
  `favorite_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `favorite_title` varchar(50) NOT NULL,
  `favorite_url` varchar(200) NOT NULL,
  PRIMARY KEY (`favorite_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `favorite_url`
--

LOCK TABLES `favorite_url` WRITE;
INSERT INTO `favorite_url` VALUES ('1', '職能系統', '');
INSERT INTO `favorite_url` VALUES ('2', '訓練系統', '');
INSERT INTO `favorite_url` VALUES ('3', 'KPI系統', '');
INSERT INTO `favorite_url` VALUES ('4', '績效系統', '');
INSERT INTO `favorite_url` VALUES ('5', '工作說明書', '');
INSERT INTO `favorite_url` VALUES ('6', '人才庫系統', '');
UNLOCK TABLES;
-- 
-- Table structure for table `group_member`
--

DROP TABLE IF EXISTS `group_member`;
CREATE TABLE `group_member` (
  `group_member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `role` varchar(3) NOT NULL,
  PRIMARY KEY (`group_member_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=283 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `group_member`
--

LOCK TABLES `group_member` WRITE;
INSERT INTO `group_member` VALUES ('282', '28', '240', '');
INSERT INTO `group_member` VALUES ('281', '28', '239', '');
INSERT INTO `group_member` VALUES ('280', '27', '238', '');
INSERT INTO `group_member` VALUES ('279', '27', '237', '');
INSERT INTO `group_member` VALUES ('278', '14', '236', '');
INSERT INTO `group_member` VALUES ('277', '14', '235', '');
INSERT INTO `group_member` VALUES ('276', '14', '234', '');
INSERT INTO `group_member` VALUES ('275', '16', '233', '');
INSERT INTO `group_member` VALUES ('274', '16', '232', '');
INSERT INTO `group_member` VALUES ('273', '16', '231', '');
INSERT INTO `group_member` VALUES ('272', '16', '230', '');
INSERT INTO `group_member` VALUES ('271', '15', '229', '');
INSERT INTO `group_member` VALUES ('270', '15', '228', '');
INSERT INTO `group_member` VALUES ('269', '6', '227', '');
INSERT INTO `group_member` VALUES ('268', '6', '226', '');
INSERT INTO `group_member` VALUES ('267', '24', '225', '');
INSERT INTO `group_member` VALUES ('266', '24', '224', '');
INSERT INTO `group_member` VALUES ('265', '24', '223', '');
INSERT INTO `group_member` VALUES ('264', '24', '222', '');
INSERT INTO `group_member` VALUES ('263', '5', '221', '');
INSERT INTO `group_member` VALUES ('262', '5', '220', '');
INSERT INTO `group_member` VALUES ('261', '18', '219', '');
INSERT INTO `group_member` VALUES ('260', '18', '218', '');
INSERT INTO `group_member` VALUES ('259', '18', '217', '');
INSERT INTO `group_member` VALUES ('258', '17', '216', '');
INSERT INTO `group_member` VALUES ('257', '17', '215', '');
INSERT INTO `group_member` VALUES ('256', '17', '214', '');
INSERT INTO `group_member` VALUES ('255', '17', '213', '');
INSERT INTO `group_member` VALUES ('254', '17', '212', '');
INSERT INTO `group_member` VALUES ('253', '17', '211', '');
INSERT INTO `group_member` VALUES ('252', '17', '210', '');
INSERT INTO `group_member` VALUES ('251', '20', '209', '');
INSERT INTO `group_member` VALUES ('250', '20', '208', '');
INSERT INTO `group_member` VALUES ('249', '21', '207', '');
INSERT INTO `group_member` VALUES ('248', '21', '206', '');
INSERT INTO `group_member` VALUES ('247', '21', '205', '');
INSERT INTO `group_member` VALUES ('246', '21', '204', '');
INSERT INTO `group_member` VALUES ('245', '21', '203', '');
INSERT INTO `group_member` VALUES ('244', '21', '202', '');
INSERT INTO `group_member` VALUES ('243', '21', '201', '');
INSERT INTO `group_member` VALUES ('242', '21', '200', '');
INSERT INTO `group_member` VALUES ('241', '9', '199', '');
INSERT INTO `group_member` VALUES ('240', '19', '198', '');
INSERT INTO `group_member` VALUES ('239', '19', '197', '');
INSERT INTO `group_member` VALUES ('238', '19', '196', '');
INSERT INTO `group_member` VALUES ('237', '19', '195', '');
INSERT INTO `group_member` VALUES ('236', '19', '194', '');
INSERT INTO `group_member` VALUES ('235', '19', '193', '');
INSERT INTO `group_member` VALUES ('234', '19', '192', '');
INSERT INTO `group_member` VALUES ('233', '19', '191', '');
INSERT INTO `group_member` VALUES ('232', '19', '190', '');
INSERT INTO `group_member` VALUES ('231', '34', '189', '');
INSERT INTO `group_member` VALUES ('230', '34', '188', '');
INSERT INTO `group_member` VALUES ('229', '33', '187', '');
INSERT INTO `group_member` VALUES ('228', '33', '186', '');
INSERT INTO `group_member` VALUES ('227', '33', '185', '');
INSERT INTO `group_member` VALUES ('226', '31', '184', '');
INSERT INTO `group_member` VALUES ('225', '26', '183', '');
INSERT INTO `group_member` VALUES ('224', '26', '182', '');
INSERT INTO `group_member` VALUES ('223', '11', '181', '');
INSERT INTO `group_member` VALUES ('222', '11', '180', '');
INSERT INTO `group_member` VALUES ('221', '22', '179', '');
INSERT INTO `group_member` VALUES ('220', '32', '178', '');
INSERT INTO `group_member` VALUES ('219', '32', '177', '');
INSERT INTO `group_member` VALUES ('218', '32', '176', '');
INSERT INTO `group_member` VALUES ('217', '31', '175', '');
INSERT INTO `group_member` VALUES ('216', '31', '174', '');
INSERT INTO `group_member` VALUES ('215', '13', '173', '');
INSERT INTO `group_member` VALUES ('214', '31', '172', '');
INSERT INTO `group_member` VALUES ('213', '30', '171', '');
INSERT INTO `group_member` VALUES ('212', '13', '170', '');
INSERT INTO `group_member` VALUES ('211', '18', '169', '');
INSERT INTO `group_member` VALUES ('210', '18', '168', '');
INSERT INTO `group_member` VALUES ('209', '18', '167', '');
INSERT INTO `group_member` VALUES ('208', '17', '166', '');
INSERT INTO `group_member` VALUES ('207', '8', '165', '');
INSERT INTO `group_member` VALUES ('206', '8', '164', '');
INSERT INTO `group_member` VALUES ('205', '27', '163', '');
INSERT INTO `group_member` VALUES ('204', '27', '162', '');
INSERT INTO `group_member` VALUES ('203', '27', '161', '');
INSERT INTO `group_member` VALUES ('202', '27', '160', '');
INSERT INTO `group_member` VALUES ('201', '29', '159', '');
INSERT INTO `group_member` VALUES ('200', '28', '158', '');
INSERT INTO `group_member` VALUES ('199', '28', '157', '');
INSERT INTO `group_member` VALUES ('198', '28', '156', '');
INSERT INTO `group_member` VALUES ('197', '28', '155', '');
INSERT INTO `group_member` VALUES ('196', '28', '154', '');
INSERT INTO `group_member` VALUES ('195', '28', '153', '');
INSERT INTO `group_member` VALUES ('194', '28', '152', '');
INSERT INTO `group_member` VALUES ('193', '12', '151', '');
INSERT INTO `group_member` VALUES ('192', '12', '150', '');
INSERT INTO `group_member` VALUES ('191', '26', '149', '');
INSERT INTO `group_member` VALUES ('190', '26', '148', '');
INSERT INTO `group_member` VALUES ('189', '26', '147', '');
INSERT INTO `group_member` VALUES ('188', '26', '146', '');
INSERT INTO `group_member` VALUES ('187', '26', '145', '');
INSERT INTO `group_member` VALUES ('186', '26', '144', '');
INSERT INTO `group_member` VALUES ('185', '26', '143', '');
INSERT INTO `group_member` VALUES ('184', '26', '142', '');
INSERT INTO `group_member` VALUES ('183', '25', '141', '');
INSERT INTO `group_member` VALUES ('182', '25', '140', '');
INSERT INTO `group_member` VALUES ('181', '25', '139', '');
INSERT INTO `group_member` VALUES ('180', '25', '138', '');
INSERT INTO `group_member` VALUES ('179', '11', '137', '');
INSERT INTO `group_member` VALUES ('178', '11', '136', '');
INSERT INTO `group_member` VALUES ('177', '11', '135', '');
INSERT INTO `group_member` VALUES ('176', '11', '134', '');
INSERT INTO `group_member` VALUES ('175', '21', '133', '');
INSERT INTO `group_member` VALUES ('174', '21', '132', '');
INSERT INTO `group_member` VALUES ('173', '20', '131', '');
INSERT INTO `group_member` VALUES ('172', '20', '130', '');
INSERT INTO `group_member` VALUES ('171', '20', '129', '');
INSERT INTO `group_member` VALUES ('170', '19', '128', '');
INSERT INTO `group_member` VALUES ('169', '19', '127', '');
INSERT INTO `group_member` VALUES ('168', '19', '126', '');
INSERT INTO `group_member` VALUES ('167', '19', '125', '');
INSERT INTO `group_member` VALUES ('166', '9', '124', '');
INSERT INTO `group_member` VALUES ('165', '24', '123', '');
INSERT INTO `group_member` VALUES ('164', '24', '122', '');
INSERT INTO `group_member` VALUES ('163', '23', '121', '');
INSERT INTO `group_member` VALUES ('162', '23', '120', '');
INSERT INTO `group_member` VALUES ('161', '23', '119', '');
INSERT INTO `group_member` VALUES ('160', '22', '118', '');
INSERT INTO `group_member` VALUES ('159', '10', '117', '');
INSERT INTO `group_member` VALUES ('158', '10', '116', '');
INSERT INTO `group_member` VALUES ('157', '6', '115', '');
INSERT INTO `group_member` VALUES ('156', '6', '114', '');
INSERT INTO `group_member` VALUES ('155', '6', '113', '');
INSERT INTO `group_member` VALUES ('154', '6', '112', '');
INSERT INTO `group_member` VALUES ('153', '6', '111', '');
INSERT INTO `group_member` VALUES ('152', '15', '110', '');
INSERT INTO `group_member` VALUES ('151', '16', '109', '');
INSERT INTO `group_member` VALUES ('150', '5', '108', '');
INSERT INTO `group_member` VALUES ('149', '5', '107', '');
INSERT INTO `group_member` VALUES ('148', '5', '106', '');
INSERT INTO `group_member` VALUES ('147', '1', '105', '');
INSERT INTO `group_member` VALUES ('146', '4', '104', '');
INSERT INTO `group_member` VALUES ('145', '3', '103', '');
INSERT INTO `group_member` VALUES ('144', '2', '102', '');
INSERT INTO `group_member` VALUES ('143', '1', '101', '');
INSERT INTO `group_member` VALUES ('142', '1', '100', '');
UNLOCK TABLES;
-- 
-- Table structure for table `group_property`
--

DROP TABLE IF EXISTS `group_property`;
CREATE TABLE `group_property` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_type` varchar(3) NOT NULL DEFAULT 'dep',
  `group_title` varchar(30) NOT NULL,
  `group_parent_id` int(10) unsigned NOT NULL,
  `group_code` varchar(30) NULL,
  `group_level` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `group_property`
--

LOCK TABLES `group_property` WRITE;
INSERT INTO `group_property` VALUES ('1', 'dep', '', '', 'HQ', '', '102');
INSERT INTO `group_property` VALUES ('2', 'dep', '', '1', 'HQ_1', '1', '102');
INSERT INTO `group_property` VALUES ('3', 'dep', '', '1', 'HQ_2', '1', '102');
INSERT INTO `group_property` VALUES ('4', 'dep', '', '1', 'HQ_3', '1', '102');
INSERT INTO `group_property` VALUES ('5', 'dep', '', '1', 'HQ-PJ', '2', '102');
INSERT INTO `group_property` VALUES ('6', 'dep', '', '1', 'HQ-SA', '2', '102');
INSERT INTO `group_property` VALUES ('7', 'dep', '', '1', 'HQ-AD', '2', '102');
INSERT INTO `group_property` VALUES ('8', 'dep', '', '3', 'HQ-OP', '2', '102');
INSERT INTO `group_property` VALUES ('9', 'dep', '', '2', 'HQ-SK', '2', '102');
INSERT INTO `group_property` VALUES ('10', 'dep', '', '2', 'HQ-RD', '2', '102');
INSERT INTO `group_property` VALUES ('11', 'dep', '', '2', 'HQ-ED', '2', '102');
INSERT INTO `group_property` VALUES ('12', 'dep', '', '3', 'HQ-MD', '2', '102');
INSERT INTO `group_property` VALUES ('13', 'dep', '', '4', 'HQ-PD', '2', '102');
INSERT INTO `group_property` VALUES ('14', 'dep', '', '7', 'HQ-AD01', '3', '102');
INSERT INTO `group_property` VALUES ('15', 'dep', '', '7', 'HQ-AD02', '3', '102');
INSERT INTO `group_property` VALUES ('16', 'dep', '', '7', 'HQ-AD03', '3', '102');
INSERT INTO `group_property` VALUES ('17', 'dep', '', '8', 'HQ-OP01', '3', '102');
INSERT INTO `group_property` VALUES ('18', 'dep', '', '8', 'HQ-OP02', '3', '102');
INSERT INTO `group_property` VALUES ('19', 'dep', '', '9', 'HQ-SK01', '3', '102');
INSERT INTO `group_property` VALUES ('20', 'dep', '', '9', 'HQ-SK02', '3', '102');
INSERT INTO `group_property` VALUES ('21', 'dep', '', '9', 'HQ-SK03', '3', '102');
INSERT INTO `group_property` VALUES ('22', 'dep', '', '10', 'HQ-RD01', '3', '102');
INSERT INTO `group_property` VALUES ('23', 'dep', '', '10', 'HQ-RD02', '3', '102');
INSERT INTO `group_property` VALUES ('24', 'dep', '', '10', 'HQ-RD03', '3', '102');
INSERT INTO `group_property` VALUES ('25', 'dep', '', '11', 'HQ-ED01', '3', '102');
INSERT INTO `group_property` VALUES ('26', 'dep', '', '11', 'HQ-ED02', '3', '102');
INSERT INTO `group_property` VALUES ('27', 'dep', '', '12', 'HQ-MD01', '3', '102');
INSERT INTO `group_property` VALUES ('28', 'dep', '', '12', 'HQ-MD02', '3', '102');
INSERT INTO `group_property` VALUES ('29', 'dep', '', '12', 'HQ-MD03', '3', '102');
INSERT INTO `group_property` VALUES ('30', 'dep', '', '13', 'HQ-PD01', '3', '102');
INSERT INTO `group_property` VALUES ('31', 'dep', '', '13', 'HQ-PD02', '3', '102');
INSERT INTO `group_property` VALUES ('32', 'dep', '', '13', 'HQ-PD03', '3', '102');
INSERT INTO `group_property` VALUES ('33', 'dep', '', '4', 'HQ_3A', '3', '102');
UNLOCK TABLES;
-- 
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `groups_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groups_code` varchar(20) NOT NULL,
  PRIMARY KEY (`groups_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
INSERT INTO `groups` VALUES ('102', '102');
UNLOCK TABLES;
-- 
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_family_id` int(10) unsigned NULL,
  `job_level` int(10) unsigned NULL,
  `job_type_id` int(10) unsigned NULL,
  `core_competency_model_id` int(10) unsigned NULL,
  `manage_competency_model_id` int(11) unsigned NULL,
  `general_competency_model_id` int(11) unsigned NULL,
  `professional_competency_model_id` int(11) unsigned NULL,
  PRIMARY KEY (`job_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
INSERT INTO `job` VALUES ('1', '1', '11', '', '', '', '', '');
INSERT INTO `job` VALUES ('2', '1', '11', '', '', '', '', '');
INSERT INTO `job` VALUES ('3', '1', '10', '', '', '', '', '');
INSERT INTO `job` VALUES ('4', '1', '9', '', '', '', '', '');
INSERT INTO `job` VALUES ('5', '1', '8', '', '', '', '', '');
INSERT INTO `job` VALUES ('6', '1', '7', '', '', '', '', '');
INSERT INTO `job` VALUES ('7', '1', '6', '', '', '', '', '');
INSERT INTO `job` VALUES ('8', '1', '7', '', '', '', '', '');
INSERT INTO `job` VALUES ('9', '1', '5', '', '', '', '', '');
INSERT INTO `job` VALUES ('10', '1', '4', '', '', '', '', '');
INSERT INTO `job` VALUES ('11', '1', '3', '', '', '', '', '');
INSERT INTO `job` VALUES ('12', '1', '3', '', '', '', '', '');
INSERT INTO `job` VALUES ('13', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('14', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('15', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('16', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('17', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('18', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('19', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('20', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('21', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('22', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('23', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('24', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('25', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('26', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('27', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('28', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('29', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('30', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('31', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('32', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('33', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('34', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('35', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('36', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('37', '', '', '', '', '', '', '');
INSERT INTO `job` VALUES ('38', '', '', '', '', '', '', '');
UNLOCK TABLES;
-- 
-- Table structure for table `job_competency`
--

DROP TABLE IF EXISTS `job_competency`;
CREATE TABLE `job_competency` (
  `job_competency_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `competency_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`job_competency_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `job_competency`
--

LOCK TABLES `job_competency` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `job_family`
--

DROP TABLE IF EXISTS `job_family`;
CREATE TABLE `job_family` (
  `job_family_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`job_family_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `job_family`
--

LOCK TABLES `job_family` WRITE;
INSERT INTO `job_family` VALUES ('1', '1');
UNLOCK TABLES;
-- 
-- Table structure for table `job_type`
--

DROP TABLE IF EXISTS `job_type`;
CREATE TABLE `job_type` (
  `job_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_type_code` varchar(10) NOT NULL,
  PRIMARY KEY (`job_type_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `job_type`
--

LOCK TABLES `job_type` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `mail_poll`
--

DROP TABLE IF EXISTS `mail_poll`;
CREATE TABLE `mail_poll` (
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
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `mail_poll`
--

LOCK TABLES `mail_poll` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `majoy_company`
--

DROP TABLE IF EXISTS `majoy_company`;
CREATE TABLE `majoy_company` (
  `majoy_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_update` int(1) NULL,
  PRIMARY KEY (`majoy_company_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `majoy_company`
--

LOCK TABLES `majoy_company` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `menu_structure`
--

DROP TABLE IF EXISTS `menu_structure`;
CREATE TABLE `menu_structure` (
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
)  ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `menu_structure`
--

LOCK TABLES `menu_structure` WRITE;
INSERT INTO `menu_structure` VALUES ('2-1', 'T', '1', '基本信息', 'NOTE', '1', '', '2', '1');
INSERT INTO `menu_structure` VALUES ('2-5', 'T', '1', '職能管理與評鑑系統', 'NOTE', '1', '', '2', '1');
INSERT INTO `menu_structure` VALUES ('2-5-1', 'T', '1', '職能評鑑', 'NOTE', '1', '\\/competencyevaluation\\/basis\\/list.html', '2-5', '2');
INSERT INTO `menu_structure` VALUES ('2-5-2', 'F', '1', '職能評鑑', 'NOTE', '1', '\\/competencyevaluation\\/class\\/list.html', '2-5', '2');
INSERT INTO `menu_structure` VALUES ('2-5-3', 'F', '1', '查看我的報表', 'NOTE', '1', '\\/export\\/my-report\\/list.html', '2-5', '2');
INSERT INTO `menu_structure` VALUES ('7-1', 'T', '1', '職能字典', 'NOTE', '1', '', '7', '1');
INSERT INTO `menu_structure` VALUES ('7-1-1', 'T', '1', '核心職能字典', 'NOTE', '1', '\\/competency-dic\\/list\\/list.html?type=C', '7-1', '2');
INSERT INTO `menu_structure` VALUES ('7-1-2', 'T', '1', '管理職能字典', 'NOTE', '1', '\\/competency-dic\\/list\\/list.html?type=M', '7-1', '2');
INSERT INTO `menu_structure` VALUES ('7-2', 'T', '1', '職能模型管理', 'NOTE', '1', '', '7', '1');
INSERT INTO `menu_structure` VALUES ('7-2-1', 'T', '1', '核心職能', 'NOTE', '1', '\\/competencymodel\\/setting\\/list.html?method=B&type=C', '7-2', '2');
INSERT INTO `menu_structure` VALUES ('7-2-2', 'T', '1', '管理職能', 'NOTE', '1', '\\/competencymodel\\/setting\\/list.html?method=B&type=M', '7-2', '2');
INSERT INTO `menu_structure` VALUES ('7-2-3', 'F', '1', '管理職能', 'NOTE', '1', '\\/competencymodel\\/setting\\/list.html?method=C&type=M', '7-2', '2');
INSERT INTO `menu_structure` VALUES ('7-2-4', 'F', '1', '專業職能', 'NOTE', '1', '\\/competencymodel\\/setting\\/list.html?method=B&type=P', '7-2', '2');
INSERT INTO `menu_structure` VALUES ('7-2-5', 'T', '1', '專業職能', 'NOTE', '1', '\\/competencymodel\\/setting\\/list.html?method=C&type=P', '7-2', '2');
INSERT INTO `menu_structure` VALUES ('7-2-6', 'F', '1', '通用職能', 'NOTE', '1', '\\/competencymodel\\/setting\\/list.html?method=B&type=G', '7-2', '2');
INSERT INTO `menu_structure` VALUES ('7-2-7', 'F', '1', '通用職能', 'NOTE', '1', '\\/competencymodel\\/setting\\/list.html?method=C&type=G', '7-2', '2');
INSERT INTO `menu_structure` VALUES ('7-3', 'T', '1', '職能標準設定', 'NOTE', '1', '', '7', '1');
INSERT INTO `menu_structure` VALUES ('7-3-1', 'F', '1', '管理職能標準', 'NOTE', '1', '\\/competencymodelstandard\\/list\\/list.html?type=M', '7-3', '2');
INSERT INTO `menu_structure` VALUES ('7-3-2', 'T', '1', '專業職能標準', 'NOTE', '1', '\\/competencymodelstandard\\/list\\/list.html?type=P', '7-3', '2');
INSERT INTO `menu_structure` VALUES ('7-3-3', 'F', '1', '通用職能標準', 'NOTE', '1', '\\/competencymodelstandard\\/list\\/list.html?type=G', '7-3', '2');
INSERT INTO `menu_structure` VALUES ('7-4', 'T', '1', '評鑑管理', 'NOTE', '1', '', '7', '1');
INSERT INTO `menu_structure` VALUES ('7-4-1', 'T', '1', '評鑑關係設定', 'NOTE', '1', '\\/evaluationrelation\\/list\\/list.html', '7-4', '2');
INSERT INTO `menu_structure` VALUES ('7-4-2', 'T', '1', '量表設定', 'NOTE', '1', '\\/evaluationscale\\/list\\/list.html', '7-4', '2');
INSERT INTO `menu_structure` VALUES ('7-5', 'T', '1', '評鑑表管理 ', 'NOTE', '1', '', '7', '1');
INSERT INTO `menu_structure` VALUES ('7-5-1', 'T', '1', '編輯中評鑑表', 'NOTE', '1', '\\/basisevaluationtable\\/list\\/list.html?S=EDT', '7-5', '2');
INSERT INTO `menu_structure` VALUES ('7-5-2', 'T', '1', '評鑑中評鑑表', 'NOTE', '1', '\\/basisevaluationtable\\/list\\/list.html?S=PUB', '7-5', '2');
INSERT INTO `menu_structure` VALUES ('7-5-3', 'T', '1', '已完成評鑑表', 'NOTE', '1', '\\/basisevaluationtable\\/list\\/list.html?S=FNS', '7-5', '2');
INSERT INTO `menu_structure` VALUES ('7-6', 'F', '1', '評鑑表管理 ', 'NOTE', '1', '', '7', '1');
INSERT INTO `menu_structure` VALUES ('7-6-1', 'F', '1', '評鑑表設定', 'NOTE', '1', '\\/classevaluationtableappraisee\\/list\\/list.html', '7-6', '2');
INSERT INTO `menu_structure` VALUES ('7-7', 'F', '1', 'HR管理模組', 'NOTE', '1', '', '7', '1');
INSERT INTO `menu_structure` VALUES ('7-7-1', 'F', '1', '評鑑表審核', 'NOTE', '1', '\\/evaluation-table-review-appraisee\\/list\\/list.html?S=R', '7-7', '2');
INSERT INTO `menu_structure` VALUES ('7-7-2', 'F', '1', '評鑑表發佈', 'NOTE', '1', '\\/evaluation-table-review-appraisee\\/list\\/list.html?S=P', '7-7', '2');
INSERT INTO `menu_structure` VALUES ('7-7-3', 'F', '1', '評鑑進度管理', 'NOTE', '1', '\\/evaluation-table-review-appraisee\\/list\\/list.html?S=C', '7-7', '2');
INSERT INTO `menu_structure` VALUES ('7-7-4', 'F', '1', '評鑑結果調整', 'NOTE', '1', '\\/evaluation-table-review-appraisee\\/list\\/list.html?S=A', '7-7', '2');
INSERT INTO `menu_structure` VALUES ('7-7-5', 'F', '1', '警示功能管理', 'NOTE', '1', '\\/alarm\\/detail\\/edit.html', '7-7', '2');
INSERT INTO `menu_structure` VALUES ('7-8', 'T', '1', '報表管理', 'NOTE', '1', '', '7', '1');
INSERT INTO `menu_structure` VALUES ('7-8-1', 'T', '1', '報告', 'NOTE', '1', '\\/report\\/basis\\/list.html', '7-8', '2');
INSERT INTO `menu_structure` VALUES ('7-8-2', 'F', '1', '報告', 'NOTE', '1', '\\/report\\/class\\/list.html', '7-8', '2');
INSERT INTO `menu_structure` VALUES ('3-1', 'T', '1', '組織管理', 'NOTE', '1', '', '3', '1');
INSERT INTO `menu_structure` VALUES ('3-1-2', 'T', '1', '公司列表', 'NOTE', '1', '\\/organization\\/companies\\/list.html', '3-1', '2');
INSERT INTO `menu_structure` VALUES ('3-2', 'T', '1', '帳號與權限管理', 'NOTE', '1', '', '3', '1');
INSERT INTO `menu_structure` VALUES ('3-2-1', 'T', '1', '管理帳號', 'NOTE', '1', '\\/account\\/list\\/list.html?type=M', '3-2', '2');
INSERT INTO `menu_structure` VALUES ('3-2-2', 'T', '1', '一般帳號', 'NOTE', '1', '\\/account\\/list\\/list.html?type=N', '3-2', '2');
INSERT INTO `menu_structure` VALUES ('3-2-3', 'F', '1', '顧問帳號', 'NOTE', '1', '\\/account\\/list\\/list.html?type=C', '3-2', '2');
INSERT INTO `menu_structure` VALUES ('3-3', 'T', '1', '職等職稱表管理', 'NOTE', '1', '', '3', '1');
INSERT INTO `menu_structure` VALUES ('3-3-1', 'T', '1', '職等職稱表管理', 'NOTE', '1', '\\/job\\/family\\/list.html', '3-3', '2');
INSERT INTO `menu_structure` VALUES ('3-3-2', 'T', '1', '職等職稱矩陣表', 'NOTE', '1', '\\/job-family\\/matrix\\/list.html', '3-3', '2');
INSERT INTO `menu_structure` VALUES ('3-3-3', 'T', '1', '工作類別', 'NOTE', '1', '\\/job\\/type\\/list.html', '3-3', '2');
INSERT INTO `menu_structure` VALUES ('3-4', 'T', '1', '系統服務器設定', 'NOTE', '1', '', '3', '1');
INSERT INTO `menu_structure` VALUES ('3-4-1', 'T', '1', '郵件服務器', 'NOTE', '1', '\\/mail\\/server\\/edit.html?m=1', '3-4', '2');
INSERT INTO `menu_structure` VALUES ('3-4-2', 'T', '1', '系統連線網址', 'NOTE', '1', '\\/website\\/url\\/edit.html?m=1', '3-4', '2');
INSERT INTO `menu_structure` VALUES ('3-4-3', 'T', '1', '郵件模板', 'NOTE', '1', '\\/mail-tpl\\/list\\/list.html', '3-4', '2');
INSERT INTO `menu_structure` VALUES ('3-4-4', 'T', '1', '資料庫管理', 'NOTE', '1', '\\/database\\/backup\\/edit.html?m=1', '3-4', '2');
INSERT INTO `menu_structure` VALUES ('3-4-5', 'T', '1', '授權管理', 'NOTE', '1', '\\/regist\\/sn\\/edit.html?m=1', '3-4', '2');
INSERT INTO `menu_structure` VALUES ('2-1-1', 'T', '1', '個人資訊', 'NOTE', '1', '\\/user\\/password\\/edit.html', '2-1', '2');
UNLOCK TABLES;
-- 
-- Table structure for table `org_company`
--

DROP TABLE IF EXISTS `org_company`;
CREATE TABLE `org_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `groups_id` int(11) NOT NULL,
  `company_code` varchar(20) NOT NULL,
  PRIMARY KEY (`company_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `org_company`
--

LOCK TABLES `org_company` WRITE;
INSERT INTO `org_company` VALUES ('102', '102', '102');
UNLOCK TABLES;
-- 
-- Table structure for table `profile_behavior`
--

DROP TABLE IF EXISTS `profile_behavior`;
CREATE TABLE `profile_behavior` (
  `profile_behavior_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `behavior_id` int(11) NOT NULL,
  `behavior_arithmetic_avg` decimal(10,2) NOT NULL,
  `behavior_geometric_avg` decimal(10,2) NOT NULL,
  PRIMARY KEY (`profile_behavior_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `profile_behavior`
--

LOCK TABLES `profile_behavior` WRITE;
INSERT INTO `profile_behavior` VALUES ('1', '106', '41', '5.00', '5.00');
INSERT INTO `profile_behavior` VALUES ('2', '106', '42', '6.00', '6.00');
INSERT INTO `profile_behavior` VALUES ('3', '106', '43', '3.00', '3.00');
INSERT INTO `profile_behavior` VALUES ('4', '106', '44', '4.00', '4.00');
INSERT INTO `profile_behavior` VALUES ('5', '106', '45', '6.00', '6.00');
INSERT INTO `profile_behavior` VALUES ('6', '106', '46', '4.00', '4.00');
INSERT INTO `profile_behavior` VALUES ('7', '106', '47', '3.00', '3.00');
INSERT INTO `profile_behavior` VALUES ('8', '106', '48', '6.00', '6.00');
INSERT INTO `profile_behavior` VALUES ('9', '106', '49', '4.00', '4.00');
INSERT INTO `profile_behavior` VALUES ('10', '106', '50', '5.00', '5.00');
INSERT INTO `profile_behavior` VALUES ('11', '106', '51', '3.00', '3.00');
INSERT INTO `profile_behavior` VALUES ('12', '106', '52', '4.00', '4.00');
INSERT INTO `profile_behavior` VALUES ('13', '106', '53', '6.00', '6.00');
INSERT INTO `profile_behavior` VALUES ('14', '106', '54', '3.00', '3.00');
INSERT INTO `profile_behavior` VALUES ('15', '106', '55', '2.00', '2.00');
UNLOCK TABLES;
-- 
-- Table structure for table `profile_behavior_detail`
--

DROP TABLE IF EXISTS `profile_behavior_detail`;
CREATE TABLE `profile_behavior_detail` (
  `profile_behavior_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `behavior_id` int(11) NOT NULL,
  `evaluation_relation_id` int(11) NOT NULL,
  `behavior_arithmetic_avg` decimal(10,2) NOT NULL,
  `behavior_geometric_avg` decimal(10,2) NOT NULL,
  PRIMARY KEY (`profile_behavior_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `profile_behavior_detail`
--

LOCK TABLES `profile_behavior_detail` WRITE;
INSERT INTO `profile_behavior_detail` VALUES ('1', '106', '41', '2', '5.00', '0.00');
INSERT INTO `profile_behavior_detail` VALUES ('2', '106', '42', '2', '6.00', '0.00');
INSERT INTO `profile_behavior_detail` VALUES ('3', '106', '43', '2', '3.00', '0.00');
INSERT INTO `profile_behavior_detail` VALUES ('4', '106', '44', '2', '4.00', '0.00');
INSERT INTO `profile_behavior_detail` VALUES ('5', '106', '45', '2', '6.00', '0.00');
INSERT INTO `profile_behavior_detail` VALUES ('6', '106', '46', '2', '4.00', '0.00');
INSERT INTO `profile_behavior_detail` VALUES ('7', '106', '47', '2', '3.00', '0.00');
INSERT INTO `profile_behavior_detail` VALUES ('8', '106', '48', '2', '6.00', '0.00');
INSERT INTO `profile_behavior_detail` VALUES ('9', '106', '49', '2', '4.00', '0.00');
INSERT INTO `profile_behavior_detail` VALUES ('10', '106', '50', '2', '5.00', '0.00');
INSERT INTO `profile_behavior_detail` VALUES ('11', '106', '51', '2', '3.00', '0.00');
INSERT INTO `profile_behavior_detail` VALUES ('12', '106', '52', '2', '4.00', '0.00');
INSERT INTO `profile_behavior_detail` VALUES ('13', '106', '53', '2', '6.00', '0.00');
INSERT INTO `profile_behavior_detail` VALUES ('14', '106', '54', '2', '3.00', '0.00');
INSERT INTO `profile_behavior_detail` VALUES ('15', '106', '55', '2', '2.00', '0.00');
UNLOCK TABLES;
-- 
-- Table structure for table `profile_competency`
--

DROP TABLE IF EXISTS `profile_competency`;
CREATE TABLE `profile_competency` (
  `profile_competency_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `competency_id` int(11) NOT NULL,
  `competency_level` int(11) NOT NULL,
  `arithmetic_avg` decimal(10,2) NOT NULL,
  `geometric_avg` decimal(10,2) NOT NULL,
  PRIMARY KEY (`profile_competency_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `profile_competency`
--

LOCK TABLES `profile_competency` WRITE;
INSERT INTO `profile_competency` VALUES ('1', '106', '1', '', '4.80', '4.80');
INSERT INTO `profile_competency` VALUES ('2', '106', '3', '', '4.40', '4.40');
INSERT INTO `profile_competency` VALUES ('3', '106', '5', '', '3.60', '3.60');
UNLOCK TABLES;
-- 
-- Table structure for table `profile_competency_detail`
--

DROP TABLE IF EXISTS `profile_competency_detail`;
CREATE TABLE `profile_competency_detail` (
  `profile_competency_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `evaluation_relation_id` int(11) NOT NULL,
  `competency_id` int(11) NOT NULL,
  `competency_level` int(11) NOT NULL,
  `arithmetic_avg` decimal(10,2) NOT NULL,
  `geometric_avg` decimal(10,2) NOT NULL,
  PRIMARY KEY (`profile_competency_detail_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `profile_competency_detail`
--

LOCK TABLES `profile_competency_detail` WRITE;
INSERT INTO `profile_competency_detail` VALUES ('1', '106', '2', '1', '', '4.80', '0.00');
INSERT INTO `profile_competency_detail` VALUES ('2', '106', '2', '3', '', '4.40', '0.00');
INSERT INTO `profile_competency_detail` VALUES ('3', '106', '2', '5', '', '3.60', '0.00');
INSERT INTO `profile_competency_detail` VALUES ('4', '106', '1', '1', '', '4.40', '0.00');
INSERT INTO `profile_competency_detail` VALUES ('5', '106', '1', '3', '', '4.00', '0.00');
INSERT INTO `profile_competency_detail` VALUES ('6', '106', '1', '5', '', '5.00', '0.00');
UNLOCK TABLES;
-- 
-- Table structure for table `profile_competency_model`
--

DROP TABLE IF EXISTS `profile_competency_model`;
CREATE TABLE `profile_competency_model` (
  `profile_competency_model_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `competency_model_id` int(11) NOT NULL,
  `arithmetic_avg` decimal(10,2) NOT NULL,
  `geometric_avg` decimal(10,2) NOT NULL,
  PRIMARY KEY (`profile_competency_model_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `profile_competency_model`
--

LOCK TABLES `profile_competency_model` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `report_company`
--

DROP TABLE IF EXISTS `report_company`;
CREATE TABLE `report_company` (
  `report_company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_title_id` int(10) NOT NULL,
  `company_id` int(11) NOT NULL,
  `report_config_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`report_company_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `report_company`
--

LOCK TABLES `report_company` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `report_config`
--

DROP TABLE IF EXISTS `report_config`;
CREATE TABLE `report_config` (
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
)  ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `report_config`
--

LOCK TABLES `report_config` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `report_group`
--

DROP TABLE IF EXISTS `report_group`;
CREATE TABLE `report_group` (
  `report_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_title_id` int(10) NOT NULL,
  `group_id` int(11) NOT NULL,
  `report_config_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `comparison_group_id` int(11) NOT NULL DEFAULT '0',
  `population_group_id` int(11) NOT NULL DEFAULT '0',
  `job_id_str` text NOT NULL,
  PRIMARY KEY (`report_group_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `report_group`
--

LOCK TABLES `report_group` WRITE;
INSERT INTO `report_group` VALUES ('1', '9', '', '1', '1477448576', '', '', '');
INSERT INTO `report_group` VALUES ('2', '10', '', '1', '1477448577', '', '', '');
INSERT INTO `report_group` VALUES ('3', '11', '', '1', '1477448590', '', '', '');
INSERT INTO `report_group` VALUES ('4', '13', '', '1', '1477448591', '', '', '');
INSERT INTO `report_group` VALUES ('5', '14', '', '1', '1477448592', '', '', '');
INSERT INTO `report_group` VALUES ('6', '15', '', '1', '1477448593', '', '', '');
INSERT INTO `report_group` VALUES ('7', '16', '', '1', '1477448594', '', '', '');
INSERT INTO `report_group` VALUES ('8', '17', '', '1', '1477448595', '', '', '');
UNLOCK TABLES;
-- 
-- Table structure for table `report_personal`
--

DROP TABLE IF EXISTS `report_personal`;
CREATE TABLE `report_personal` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_title_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `report_config_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`report_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `report_personal`
--

LOCK TABLES `report_personal` WRITE;
INSERT INTO `report_personal` VALUES ('1', '1', '106', '1', '1477447499');
INSERT INTO `report_personal` VALUES ('2', '2', '106', '1', '1477447500');
INSERT INTO `report_personal` VALUES ('3', '4', '106', '1', '1477447501');
INSERT INTO `report_personal` VALUES ('4', '5', '106', '1', '1477447502');
INSERT INTO `report_personal` VALUES ('5', '7', '106', '1', '1477447513');
UNLOCK TABLES;
-- 
-- Table structure for table `report_title`
--

DROP TABLE IF EXISTS `report_title`;
CREATE TABLE `report_title` (
  `report_title_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_title` varchar(30) NOT NULL,
  `report_type` varchar(30) NOT NULL,
  `report_method` varchar(30) NOT NULL,
  `report_kind` varchar(30) NOT NULL,
  `report_filename` varchar(50) NOT NULL,
  PRIMARY KEY (`report_title_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `report_title`
--

LOCK TABLES `report_title` WRITE;
INSERT INTO `report_title` VALUES ('1', '個人總覽', '', 'B', 'P', 'report_person_executive_summary.php');
INSERT INTO `report_title` VALUES ('2', '群體比較', '', 'B', 'P', 'report_normative_results.php');
INSERT INTO `report_title` VALUES ('3', '職能缺口強化訓練計劃', '', 'B', 'P', 'report_individual_development_plan.php');
INSERT INTO `report_title` VALUES ('4', '個人比較分析', '', 'B', 'P', 'report_individual_gap_analysis.php');
INSERT INTO `report_title` VALUES ('5', '個人雷達圖', '', 'B', 'P', 'report_personal_rader_chart.php');
INSERT INTO `report_title` VALUES ('6', '開放式建議', '', 'B', 'P', 'report_open_comment.php');
INSERT INTO `report_title` VALUES ('7', '360度雷達圖', '', 'B', 'P', 'report_360_degree_rader_chart.php');
INSERT INTO `report_title` VALUES ('8', '全體回饋明細', '', 'B', 'P', 'report_feedback.php');
INSERT INTO `report_title` VALUES ('9', '團體總覽', '', 'B', 'G', 'report_group_executive_summary.php');
INSERT INTO `report_title` VALUES ('10', '團體雷達圖', '', 'B', 'G', 'report_group_rader_chart.php');
INSERT INTO `report_title` VALUES ('11', '團體比較分析', '', 'B', 'G', 'report_group_gap_analysis.php');
INSERT INTO `report_title` VALUES ('12', '開放式建議', '', 'B', 'G', 'report_group_open_comment.php');
INSERT INTO `report_title` VALUES ('13', '團體弱項分析', '', 'B', 'G', 'report_group_weaknesses_list.php');
INSERT INTO `report_title` VALUES ('14', '團體明細資料', '', 'B', 'G', 'report_group_detail_data.php');
INSERT INTO `report_title` VALUES ('15', '個人認知落差分析', '', 'B', 'G', 'report_individual_cognitive_gap.php');
INSERT INTO `report_title` VALUES ('16', '全體360度明細', '', 'B', 'G', 'report_group_all_360_degree_detail.php');
INSERT INTO `report_title` VALUES ('17', '個人落點區間分布圖', '', 'B', 'G', 'report_group_profile_match.php');
INSERT INTO `report_title` VALUES ('18', '未完成/部分完成名單', '', 'B', 'G', 'report_unfinished_list.php');
INSERT INTO `report_title` VALUES ('19', '個人各職能勝任率分析', '', 'C', 'P', 'report_individual_competency_summary.php');
INSERT INTO `report_title` VALUES ('20', '個人各職能雷達圖', '', 'C', 'P', 'report_personal_competency_rader_chart.php');
INSERT INTO `report_title` VALUES ('21', '個人各職能勝任率分析', '', 'C', 'P', 'report_personal_coverage_ratio_ananlysis.php');
INSERT INTO `report_title` VALUES ('22', '職能缺口強化訓練計劃', '', 'C', 'P', 'report_class_individual_development_plan.php');
INSERT INTO `report_title` VALUES ('23', '團體比較', '', 'B', 'V', 'report_group_comparsion.php');
INSERT INTO `report_title` VALUES ('24', '團體比較雷達圖', '', 'B', 'V', 'report_group_comparsion_rader_chart.php');
INSERT INTO `report_title` VALUES ('25', '全公司職能別落差分析表', '', 'C', 'C', 'report_company_department_gap_analysis.php');
INSERT INTO `report_title` VALUES ('26', '全公司職能別勝任率分析表', '', 'C', 'C', 'report_company_department_coverage_ratio.php');
INSERT INTO `report_title` VALUES ('27', '全公司各單項職能落差分析表（專業除外）', '', 'C', 'C', 'report_company_department_gap_analysis_exc_pro.php');
INSERT INTO `report_title` VALUES ('28', '個人掃瞄', '', '', '', 'report_individual_profile_match.php');
INSERT INTO `report_title` VALUES ('29', '部門人員各職能鑑定記錄表', '', 'C', 'G', 'report_group_competency_score.php');
INSERT INTO `report_title` VALUES ('31', '部門人員各職能勝任率與部門平均勝任率分析表', '', 'C', 'G', 'report_group_competency_ratio.php');
INSERT INTO `report_title` VALUES ('32', '部門別各項職能落差分析', '', 'C', 'G', 'report_group_competency_gap.php');
INSERT INTO `report_title` VALUES ('33', '全公司職稱別各職能落差分析表', '', 'C', 'G', 'report_group_competency_gap_analysis.php');
INSERT INTO `report_title` VALUES ('35', '部門別各項職能平均級數', '', 'C', 'G', 'report_group_competency_avg.php');
INSERT INTO `report_title` VALUES ('36', '全公司職稱別各職能平均級數', '', 'C', 'G', 'report_group_competency_avg_analysis.php');
INSERT INTO `report_title` VALUES ('38', '全公司各單項職能平均級數分析表（專業除外）', '', 'C', 'C', 'report_company_department_spec_avg.php');
INSERT INTO `report_title` VALUES ('30', '全公司職能別平均級數分析表（專業除外）', '', 'C', 'C', 'report_company_department_avg.php');
UNLOCK TABLES;
-- 
-- Table structure for table `smtp`
--

DROP TABLE IF EXISTS `smtp`;
CREATE TABLE `smtp` (
  `smtp_account` varchar(30) NOT NULL,
  `smtp_password` varchar(30) NOT NULL,
  `smtp_server` varchar(30) NOT NULL,
  `smtp_ssl` varchar(1) NOT NULL,
  `smtp_port` int(3) NOT NULL,
  UNIQUE KEY `smtp_server` (`smtp_server`),
  KEY `smtp_server_2` (`smtp_server`)
)  ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `smtp`
--

LOCK TABLES `smtp` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `term`
--

DROP TABLE IF EXISTS `term`;
CREATE TABLE `term` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term_title` varchar(50) NOT NULL,
  `depend_on_id` int(10) NOT NULL,
  `term_language` varchar(10) NOT NULL,
  `term_content` varchar(100) NOT NULL,
  PRIMARY KEY (`term_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `term`
--

LOCK TABLES `term` WRITE;
INSERT INTO `term` VALUES ('1', 'company_title', '102', 'tw', '協欣金屬工業股份有限公司');
INSERT INTO `term` VALUES ('2', 'company_title', '102', 'cn', '');
INSERT INTO `term` VALUES ('3', 'company_title', '102', 'en', '');
INSERT INTO `term` VALUES ('4', 'group_title', '2', 'tw', '協理一(林加斌)');
INSERT INTO `term` VALUES ('5', 'group_title', '3', 'tw', '協理二(林恆春)');
INSERT INTO `term` VALUES ('6', 'group_title', '4', 'tw', '協理三(羅水興)');
INSERT INTO `term` VALUES ('7', 'group_title', '5', 'tw', '專案管理室');
INSERT INTO `term` VALUES ('8', 'group_title', '6', 'tw', '業務部');
INSERT INTO `term` VALUES ('9', 'group_title', '7', 'tw', '管理部');
INSERT INTO `term` VALUES ('10', 'group_title', '8', 'tw', '品管部');
INSERT INTO `term` VALUES ('11', 'group_title', '9', 'tw', '技術部');
INSERT INTO `term` VALUES ('12', 'group_title', '10', 'tw', '開發部');
INSERT INTO `term` VALUES ('13', 'group_title', '11', 'tw', '工機部');
INSERT INTO `term` VALUES ('14', 'group_title', '12', 'tw', '製造部');
INSERT INTO `term` VALUES ('15', 'group_title', '13', 'tw', '生管部');
INSERT INTO `term` VALUES ('16', 'group_title', '14', 'tw', '綜合行政課');
INSERT INTO `term` VALUES ('17', 'group_title', '15', 'tw', '人事課');
INSERT INTO `term` VALUES ('18', 'group_title', '16', 'tw', '財務課');
INSERT INTO `term` VALUES ('19', 'group_title', '17', 'tw', '品保課');
INSERT INTO `term` VALUES ('20', 'group_title', '18', 'tw', '品檢課');
INSERT INTO `term` VALUES ('21', 'group_title', '19', 'tw', '技術一課');
INSERT INTO `term` VALUES ('22', 'group_title', '20', 'tw', '技術二課');
INSERT INTO `term` VALUES ('23', 'group_title', '21', 'tw', '設計課');
INSERT INTO `term` VALUES ('24', 'group_title', '22', 'tw', '開發一課');
INSERT INTO `term` VALUES ('25', 'group_title', '23', 'tw', '開發二課');
INSERT INTO `term` VALUES ('26', 'group_title', '24', 'tw', '採購課');
INSERT INTO `term` VALUES ('27', 'group_title', '25', 'tw', '機械課');
INSERT INTO `term` VALUES ('28', 'group_title', '26', 'tw', '鉗工課');
INSERT INTO `term` VALUES ('29', 'group_title', '27', 'tw', '溶接課');
INSERT INTO `term` VALUES ('30', 'group_title', '28', 'tw', '壓造課');
INSERT INTO `term` VALUES ('31', 'group_title', '29', 'tw', '模修課');
INSERT INTO `term` VALUES ('32', 'group_title', '30', 'tw', '計劃課');
INSERT INTO `term` VALUES ('33', 'group_title', '31', 'tw', '物流課');
INSERT INTO `term` VALUES ('34', 'group_title', '32', 'tw', '工務課');
INSERT INTO `term` VALUES ('35', 'group_title', '1', 'tw', '協欣金屬');
INSERT INTO `term` VALUES ('36', 'group_title', '1', 'cn', '');
INSERT INTO `term` VALUES ('37', 'group_title', '1', 'en', '');
INSERT INTO `term` VALUES ('38', 'job_family_title', '1', 'tw', '管理職系');
INSERT INTO `term` VALUES ('39', 'job_title', '1', 'tw', '董事長');
INSERT INTO `term` VALUES ('40', 'job_title', '2', 'tw', '總經理');
INSERT INTO `term` VALUES ('41', 'job_title', '3', 'tw', '副總經理');
INSERT INTO `term` VALUES ('42', 'job_title', '4', 'tw', '協理');
INSERT INTO `term` VALUES ('43', 'job_title', '5', 'tw', '經理');
INSERT INTO `term` VALUES ('44', 'job_title', '6', 'tw', '副理');
INSERT INTO `term` VALUES ('45', 'job_title', '7', 'tw', '課長');
INSERT INTO `term` VALUES ('46', 'job_title', '8', 'tw', '高專');
INSERT INTO `term` VALUES ('47', 'job_title', '9', 'tw', '專員');
INSERT INTO `term` VALUES ('48', 'job_title', '10', 'tw', '組長');
INSERT INTO `term` VALUES ('49', 'job_title', '11', 'tw', '工程師');
INSERT INTO `term` VALUES ('50', 'job_title', '12', 'tw', '管理師');
INSERT INTO `term` VALUES ('51', 'job_family_title', '1', 'cn', '');
INSERT INTO `term` VALUES ('52', 'job_family_title', '1', 'en', '');
INSERT INTO `term` VALUES ('53', 'competency_model_title', '1', 'tw', '協欣金屬_高階主管管理職能模型');
INSERT INTO `term` VALUES ('54', 'competency_model_title', '1', 'cn', '');
INSERT INTO `term` VALUES ('55', 'competency_model_title', '1', 'en', '');
INSERT INTO `term` VALUES ('56', 'competency_model_title', '2', 'tw', '協欣金屬_中層主管管理職能模型');
INSERT INTO `term` VALUES ('57', 'competency_model_title', '2', 'cn', '');
INSERT INTO `term` VALUES ('58', 'competency_model_title', '2', 'en', '');
INSERT INTO `term` VALUES ('59', 'competency_model_title', '3', 'tw', '協欣金屬_基層主管管理職能模型');
INSERT INTO `term` VALUES ('60', 'competency_model_title', '3', 'cn', '');
INSERT INTO `term` VALUES ('61', 'competency_model_title', '3', 'en', '');
INSERT INTO `term` VALUES ('62', 'competency_title', '1', 'tw', '目標管理與落實能力');
INSERT INTO `term` VALUES ('63', 'competency_title', '1', 'cn', '');
INSERT INTO `term` VALUES ('64', 'competency_title', '1', 'en', '');
INSERT INTO `term` VALUES ('65', 'competency_title', '2', 'tw', '培養組織優秀人才(培育部屬)');
INSERT INTO `term` VALUES ('66', 'competency_title', '2', 'cn', '');
INSERT INTO `term` VALUES ('67', 'competency_title', '2', 'en', '');
INSERT INTO `term` VALUES ('68', 'competency_title', '3', 'tw', '跨部門溝通與協調能力');
INSERT INTO `term` VALUES ('69', 'competency_title', '3', 'cn', '');
INSERT INTO `term` VALUES ('70', 'competency_title', '3', 'en', '');
INSERT INTO `term` VALUES ('71', 'competency_title', '4', 'tw', '分享/激勵他人');
INSERT INTO `term` VALUES ('72', 'competency_title', '4', 'cn', '');
INSERT INTO `term` VALUES ('73', 'competency_title', '4', 'en', '');
INSERT INTO `term` VALUES ('74', 'competency_title', '5', 'tw', '顧客導向');
INSERT INTO `term` VALUES ('75', 'competency_title', '5', 'cn', '');
INSERT INTO `term` VALUES ('76', 'competency_title', '5', 'en', '');
INSERT INTO `term` VALUES ('77', 'competency_title', '6', 'tw', '工作管理與執行能力');
INSERT INTO `term` VALUES ('78', 'competency_title', '6', 'cn', '');
INSERT INTO `term` VALUES ('79', 'competency_title', '6', 'en', '');
INSERT INTO `term` VALUES ('80', 'competency_title', '7', 'tw', '指導部屬');
INSERT INTO `term` VALUES ('81', 'competency_title', '7', 'cn', '');
INSERT INTO `term` VALUES ('82', 'competency_title', '7', 'en', '');
INSERT INTO `term` VALUES ('83', 'competency_title', '8', 'tw', '團隊建立與領導');
INSERT INTO `term` VALUES ('84', 'competency_title', '8', 'cn', '');
INSERT INTO `term` VALUES ('85', 'competency_title', '8', 'en', '');
INSERT INTO `term` VALUES ('86', 'competency_title', '9', 'tw', '跨部門合作能力');
INSERT INTO `term` VALUES ('87', 'competency_title', '9', 'cn', '');
INSERT INTO `term` VALUES ('88', 'competency_title', '9', 'en', '');
INSERT INTO `term` VALUES ('89', 'competency_title', '10', 'tw', '流程改善與問題解決');
INSERT INTO `term` VALUES ('90', 'competency_title', '10', 'cn', '');
INSERT INTO `term` VALUES ('91', 'competency_title', '10', 'en', '');
INSERT INTO `term` VALUES ('92', 'competency_title', '11', 'tw', '執行能力');
INSERT INTO `term` VALUES ('93', 'competency_title', '11', 'cn', '');
INSERT INTO `term` VALUES ('94', 'competency_title', '11', 'en', '');
INSERT INTO `term` VALUES ('95', 'competency_title', '12', 'tw', '當責');
INSERT INTO `term` VALUES ('96', 'competency_title', '12', 'cn', '');
INSERT INTO `term` VALUES ('97', 'competency_title', '12', 'en', '');
INSERT INTO `term` VALUES ('98', 'competency_title', '13', 'tw', '溝通能力與技巧');
INSERT INTO `term` VALUES ('99', 'competency_title', '13', 'cn', '');
INSERT INTO `term` VALUES ('100', 'competency_title', '13', 'en', '');
INSERT INTO `term` VALUES ('101', 'competency_title', '14', 'tw', '問題解決能力');
INSERT INTO `term` VALUES ('102', 'competency_title', '14', 'cn', '');
INSERT INTO `term` VALUES ('103', 'competency_title', '14', 'en', '');
INSERT INTO `term` VALUES ('104', 'competency_title', '15', 'tw', '主動積極');
INSERT INTO `term` VALUES ('105', 'competency_title', '15', 'cn', '');
INSERT INTO `term` VALUES ('106', 'competency_title', '15', 'en', '');
INSERT INTO `term` VALUES ('107', 'evaluation_relation_title', '1', 'tw', '自己');
INSERT INTO `term` VALUES ('108', 'evaluation_relation_title', '1', 'cn', '自己');
INSERT INTO `term` VALUES ('109', 'evaluation_relation_title', '1', 'en', '自己');
INSERT INTO `term` VALUES ('110', 'evaluation_relation_title', '2', 'tw', '直屬主管');
INSERT INTO `term` VALUES ('111', 'evaluation_relation_title', '2', 'cn', '直屬主管');
INSERT INTO `term` VALUES ('112', 'evaluation_relation_title', '2', 'en', '直屬主管');
INSERT INTO `term` VALUES ('113', 'evaluation_scale_title', '1', 'tw', '七分量表_協欣版');
INSERT INTO `term` VALUES ('114', 'evaluation_scale_title', '1', 'cn', '');
INSERT INTO `term` VALUES ('115', 'evaluation_scale_title', '1', 'en', '');
INSERT INTO `term` VALUES ('116', 'evaluation_scale_item_title', '1', 'tw', '表現程度20%或以下：知道，但大部分都沒有做到');
INSERT INTO `term` VALUES ('117', 'evaluation_scale_item_title', '1', 'cn', '');
INSERT INTO `term` VALUES ('118', 'evaluation_scale_item_title', '1', 'en', '');
INSERT INTO `term` VALUES ('119', 'evaluation_scale_item_title', '2', 'tw', '表現程度21~40%：知道，只有少部分做到');
INSERT INTO `term` VALUES ('120', 'evaluation_scale_item_title', '2', 'cn', '');
INSERT INTO `term` VALUES ('121', 'evaluation_scale_item_title', '2', 'en', '');
INSERT INTO `term` VALUES ('122', 'evaluation_scale_item_title', '3', 'tw', '表現程度41~50%：知道，泰半勉強能做到');
INSERT INTO `term` VALUES ('123', 'evaluation_scale_item_title', '3', 'cn', '');
INSERT INTO `term` VALUES ('124', 'evaluation_scale_item_title', '3', 'en', '');
INSERT INTO `term` VALUES ('125', 'evaluation_scale_item_title', '4', 'tw', '表現程度51~60%：知道，一般都可以做到');
INSERT INTO `term` VALUES ('126', 'evaluation_scale_item_title', '4', 'cn', '');
INSERT INTO `term` VALUES ('127', 'evaluation_scale_item_title', '4', 'en', '');
INSERT INTO `term` VALUES ('128', 'evaluation_scale_item_title', '5', 'tw', '表現程度61~80%：知道，且大部分都能做到');
INSERT INTO `term` VALUES ('129', 'evaluation_scale_item_title', '5', 'cn', '');
INSERT INTO `term` VALUES ('130', 'evaluation_scale_item_title', '5', 'en', '');
INSERT INTO `term` VALUES ('131', 'evaluation_scale_item_title', '6', 'tw', '表現程度81~90%：都能做到且表現優秀');
INSERT INTO `term` VALUES ('132', 'evaluation_scale_item_title', '6', 'cn', '');
INSERT INTO `term` VALUES ('133', 'evaluation_scale_item_title', '6', 'en', '');
INSERT INTO `term` VALUES ('134', 'evaluation_scale_item_title', '7', 'tw', '表現程度90%以上：都能做到且表現卓越');
INSERT INTO `term` VALUES ('135', 'evaluation_scale_item_title', '7', 'cn', '');
INSERT INTO `term` VALUES ('136', 'evaluation_scale_item_title', '7', 'en', '');
INSERT INTO `term` VALUES ('137', 'b_evalu_table_title', '1', 'tw', '協欣金屬高階主管管理職能評鑑表');
INSERT INTO `term` VALUES ('138', 'b_evalu_table_title', '1', 'cn', '');
INSERT INTO `term` VALUES ('139', 'b_evalu_table_title', '1', 'en', '');
INSERT INTO `term` VALUES ('140', 'b_evalu_table_title', '2', 'tw', '協欣金屬中層主管管理職能評鑑表');
INSERT INTO `term` VALUES ('141', 'b_evalu_table_title', '2', 'cn', '');
INSERT INTO `term` VALUES ('142', 'b_evalu_table_title', '2', 'en', '');
INSERT INTO `term` VALUES ('143', 'b_evalu_table_title', '3', 'tw', '協欣金屬組級主管管理職能評鑑表');
INSERT INTO `term` VALUES ('144', 'b_evalu_table_title', '3', 'cn', '');
INSERT INTO `term` VALUES ('145', 'b_evalu_table_title', '3', 'en', '');
INSERT INTO `term` VALUES ('146', 'b_evalu_table_title', '4', 'tw', '協欣金屬師級主管管理職能評鑑表');
INSERT INTO `term` VALUES ('147', 'b_evalu_table_title', '4', 'cn', '');
INSERT INTO `term` VALUES ('148', 'b_evalu_table_title', '4', 'en', '');
INSERT INTO `term` VALUES ('149', 'group_title', '30', 'cn', '');
INSERT INTO `term` VALUES ('150', 'group_title', '30', 'en', '');
INSERT INTO `term` VALUES ('151', 'group_title', '33', 'tw', '安全衛生室');
INSERT INTO `term` VALUES ('152', 'group_title', '33', 'cn', '');
INSERT INTO `term` VALUES ('153', 'group_title', '33', 'en', '');
INSERT INTO `term` VALUES ('154', 'b_evalu_table_title', '5', 'tw', '2016高階匯入測試');
INSERT INTO `term` VALUES ('155', 'b_evalu_table_title', '5', 'cn', '');
INSERT INTO `term` VALUES ('156', 'b_evalu_table_title', '5', 'en', '');
INSERT INTO `term` VALUES ('157', 'b_evalu_table_title', '6', 'tw', '2016高階匯入測試');
INSERT INTO `term` VALUES ('158', 'b_evalu_table_title', '6', 'cn', '');
INSERT INTO `term` VALUES ('159', 'b_evalu_table_title', '6', 'en', '');
UNLOCK TABLES;
-- 
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
CREATE TABLE `text` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term_title` varchar(30) NOT NULL,
  `depend_on_id` int(10) NOT NULL,
  `term_language` varchar(10) NOT NULL,
  `text_content` text NOT NULL,
  PRIMARY KEY (`term_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=352 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
INSERT INTO `text` VALUES ('1', 'company_desc', '102', 'tw', '');
INSERT INTO `text` VALUES ('2', 'company_desc', '102', 'cn', '');
INSERT INTO `text` VALUES ('3', 'company_desc', '102', 'en', '');
INSERT INTO `text` VALUES ('4', 'group_desc', '1', 'tw', '');
INSERT INTO `text` VALUES ('5', 'group_desc', '1', 'cn', '');
INSERT INTO `text` VALUES ('6', 'group_desc', '1', 'en', '');
INSERT INTO `text` VALUES ('7', 'job_family_dsec', '1', 'tw', '');
INSERT INTO `text` VALUES ('8', 'job_family_dsec', '1', 'cn', '');
INSERT INTO `text` VALUES ('9', 'job_family_dsec', '1', 'en', '');
INSERT INTO `text` VALUES ('10', 'competency_model_definition', '1', 'tw', '七職等以上(副理、高專、經理)');
INSERT INTO `text` VALUES ('11', 'competency_model_definition', '1', 'cn', '');
INSERT INTO `text` VALUES ('12', 'competency_model_definition', '1', 'en', '');
INSERT INTO `text` VALUES ('13', 'competency_model_definition', '2', 'tw', '五、六職能(專員、課長)');
INSERT INTO `text` VALUES ('14', 'competency_model_definition', '2', 'cn', '');
INSERT INTO `text` VALUES ('15', 'competency_model_definition', '2', 'en', '');
INSERT INTO `text` VALUES ('16', 'competency_model_definition', '3', 'tw', '三、四職能(師集、組長)');
INSERT INTO `text` VALUES ('17', 'competency_model_definition', '3', 'cn', '');
INSERT INTO `text` VALUES ('18', 'competency_model_definition', '3', 'en', '');
INSERT INTO `text` VALUES ('19', 'competency_definition', '1', 'tw', '有效管理時間和運用相關資源，採取監控、持續追蹤等行動來降低不確定性，以確保在計劃時間內有效率的完成工作或任務，達到公司既定的目標。');
INSERT INTO `text` VALUES ('20', 'competency_definition', '1', 'cn', '');
INSERT INTO `text` VALUES ('21', 'competency_definition', '1', 'en', '');
INSERT INTO `text` VALUES ('22', 'competency_definition', '2', 'tw', '提供及時的鼓勵與指導，幫助部屬強化所需的知識/技巧，以達成目標或解決問題。發掘、培育發展、及儲備公司內優秀人才，以支持組織長期發展目標的達成。');
INSERT INTO `text` VALUES ('23', 'competency_definition', '2', 'cn', '');
INSERT INTO `text` VALUES ('24', 'competency_definition', '2', 'en', '');
INSERT INTO `text` VALUES ('25', 'competency_definition', '3', 'tw', '有同理心，瞭解他人的感受、需要和觀點，並能清楚表達自己的語意讓對方明瞭；具備對上、下與同儕間的工作說明與協調能力，以達成團隊協作的目標。');
INSERT INTO `text` VALUES ('26', 'competency_definition', '3', 'cn', '');
INSERT INTO `text` VALUES ('27', 'competency_definition', '3', 'en', '');
INSERT INTO `text` VALUES ('28', 'competency_definition', '4', 'tw', '將自我能力與成就經驗分享他人，考量他人需求提供適當的資源或工作環境，以提高工作認同及工作士氣。');
INSERT INTO `text` VALUES ('29', 'competency_definition', '4', 'cn', '');
INSERT INTO `text` VALUES ('30', 'competency_definition', '4', 'en', '');
INSERT INTO `text` VALUES ('31', 'competency_definition', '5', 'tw', '在互信互利的基礎上，將「內外部客戶」的需求視為第一要務，與客戶建立及維持良性的互動及合作關係。');
INSERT INTO `text` VALUES ('32', 'competency_definition', '5', 'cn', '');
INSERT INTO `text` VALUES ('33', 'competency_definition', '5', 'en', '');
INSERT INTO `text` VALUES ('34', 'competency_definition', '6', 'tw', '能夠運用組織各種相關資源，透過標準作業流程，將計畫或任務有效落實，當過程中出現異常時，能彈性做出調整、排除障礙；有效的管理時間和資源，確保工作有效率的完成。');
INSERT INTO `text` VALUES ('35', 'competency_definition', '6', 'cn', '');
INSERT INTO `text` VALUES ('36', 'competency_definition', '6', 'en', '');
INSERT INTO `text` VALUES ('37', 'competency_definition', '7', 'tw', '針對部屬工作能力不足之處，提供示範和練習應用的機會；發揮部屬的潛力，持續追蹤並適時給予指導。');
INSERT INTO `text` VALUES ('38', 'competency_definition', '7', 'cn', '');
INSERT INTO `text` VALUES ('39', 'competency_definition', '7', 'en', '');
INSERT INTO `text` VALUES ('40', 'competency_definition', '8', 'tw', '在工作執行過程中，能帶領團隊成員透過彼此的互信、分工合作、和支援協調等，共同解決工作上所發生的問題，並達成團隊的目標。');
INSERT INTO `text` VALUES ('41', 'competency_definition', '8', 'cn', '');
INSERT INTO `text` VALUES ('42', 'competency_definition', '8', 'en', '');
INSERT INTO `text` VALUES ('43', 'competency_definition', '9', 'tw', '能與他人通力合作，成為跨部門團隊的一份子，彼此互相溝通協助，解決問題並達成目標。');
INSERT INTO `text` VALUES ('44', 'competency_definition', '9', 'cn', '');
INSERT INTO `text` VALUES ('45', 'competency_definition', '9', 'en', '');
INSERT INTO `text` VALUES ('46', 'competency_definition', '10', 'tw', '能發掘任務執行流程的問題點，針對發生障礙的原因擬定對策，找出排除困難的執行方法。');
INSERT INTO `text` VALUES ('47', 'competency_definition', '10', 'cn', '');
INSERT INTO `text` VALUES ('48', 'competency_definition', '10', 'en', '');
INSERT INTO `text` VALUES ('49', 'competency_definition', '11', 'tw', '有效的運用人力、物力資源，確保在計劃時間內，有效率的完成工作。');
INSERT INTO `text` VALUES ('50', 'competency_definition', '11', 'cn', '');
INSERT INTO `text` VALUES ('51', 'competency_definition', '11', 'en', '');
INSERT INTO `text` VALUES ('52', 'competency_definition', '12', 'tw', '能夠接受各種挑戰與批評，面對任何的挫敗與打擊，勇於承擔責任，並持續追求改善，永遠不會滿足現況，朝既定目標前進，不達目的絕不中止。');
INSERT INTO `text` VALUES ('53', 'competency_definition', '12', 'cn', '');
INSERT INTO `text` VALUES ('54', 'competency_definition', '12', 'en', '');
INSERT INTO `text` VALUES ('55', 'competency_definition', '13', 'tw', '能夠利用不同的媒介或方式，對他人或團體清楚的表達訊息或意見；在表達的過程中，能吸引他人的注意，使他人理解所要表達的重點。');
INSERT INTO `text` VALUES ('56', 'competency_definition', '13', 'cn', '');
INSERT INTO `text` VALUES ('57', 'competency_definition', '13', 'en', '');
INSERT INTO `text` VALUES ('58', 'competency_definition', '14', 'tw', '指能確認、了解問題的本質，並能收集、比較不同來源的資料，提出可行的解決方案。');
INSERT INTO `text` VALUES ('59', 'competency_definition', '14', 'cn', '');
INSERT INTO `text` VALUES ('60', 'competency_definition', '14', 'en', '');
INSERT INTO `text` VALUES ('61', 'competency_definition', '15', 'tw', '能自發性的學習或採取行動，以改善與增加工作效益、避免問題的發生，創造更多效益。');
INSERT INTO `text` VALUES ('62', 'competency_definition', '15', 'cn', '');
INSERT INTO `text` VALUES ('63', 'competency_definition', '15', 'en', '');
INSERT INTO `text` VALUES ('64', 'behavior_definition', '1', 'tw', '能妥善利用人力、物力資源，積極辦理與落實公司各項決策。');
INSERT INTO `text` VALUES ('65', 'behavior_definition', '1', 'cn', '');
INSERT INTO `text` VALUES ('66', 'behavior_definition', '1', 'en', '');
INSERT INTO `text` VALUES ('67', 'behavior_definition', '2', 'tw', '能確實向所屬單位宣導公司政策，推動政策的執行及成效的管控。');
INSERT INTO `text` VALUES ('68', 'behavior_definition', '2', 'cn', '');
INSERT INTO `text` VALUES ('69', 'behavior_definition', '2', 'en', '');
INSERT INTO `text` VALUES ('70', 'behavior_definition', '3', 'tw', '能按時間表追縱工作進度，在預定時間內完成工作任務。');
INSERT INTO `text` VALUES ('71', 'behavior_definition', '3', 'cn', '');
INSERT INTO `text` VALUES ('72', 'behavior_definition', '3', 'en', '');
INSERT INTO `text` VALUES ('73', 'behavior_definition', '4', 'tw', '注重工作時效，能妥善運用自己的時間與資源，有效管理工作的流程與進度。');
INSERT INTO `text` VALUES ('74', 'behavior_definition', '4', 'cn', '');
INSERT INTO `text` VALUES ('75', 'behavior_definition', '4', 'en', '');
INSERT INTO `text` VALUES ('76', 'behavior_definition', '5', 'tw', '會依任務的不同性質，主動回報主管或夥伴階段性或最終的執行成果。');
INSERT INTO `text` VALUES ('77', 'behavior_definition', '5', 'cn', '');
INSERT INTO `text` VALUES ('78', 'behavior_definition', '5', 'en', '');
INSERT INTO `text` VALUES ('79', 'behavior_definition', '6', 'tw', '面對「內外部客戶」的需求，能以身作則，說到做到，言行合一。');
INSERT INTO `text` VALUES ('80', 'behavior_definition', '6', 'cn', '');
INSERT INTO `text` VALUES ('81', 'behavior_definition', '6', 'en', '');
INSERT INTO `text` VALUES ('82', 'behavior_definition', '7', 'tw', '自願接受挑戰或承擔額外的責任，會主動處理一些較複雜、困難的狀況或任務。');
INSERT INTO `text` VALUES ('83', 'behavior_definition', '7', 'cn', '');
INSERT INTO `text` VALUES ('84', 'behavior_definition', '7', 'en', '');
INSERT INTO `text` VALUES ('85', 'behavior_definition', '8', 'tw', '勇於承擔工作結果，面對任何的困難與打擊，不消極怠惰與推責。');
INSERT INTO `text` VALUES ('86', 'behavior_definition', '8', 'cn', '');
INSERT INTO `text` VALUES ('87', 'behavior_definition', '8', 'en', '');
INSERT INTO `text` VALUES ('88', 'behavior_definition', '9', 'tw', '面對失敗，會檢討缺失，欣然接受同事或客戶的批評，並積極尋求改善與解決方案。');
INSERT INTO `text` VALUES ('89', 'behavior_definition', '9', 'cn', '');
INSERT INTO `text` VALUES ('90', 'behavior_definition', '9', 'en', '');
INSERT INTO `text` VALUES ('91', 'behavior_definition', '10', 'tw', '對於失敗的經驗抱持正面的想法，能因此獲得經驗及更強的驅動力以持續進步成長。');
INSERT INTO `text` VALUES ('92', 'behavior_definition', '10', 'cn', '');
INSERT INTO `text` VALUES ('93', 'behavior_definition', '10', 'en', '');
INSERT INTO `text` VALUES ('94', 'behavior_definition', '11', 'tw', '在溝通過程中，能清楚的表明此次溝通的目的，會以詢問或重述的方式來確認對方已了解所要表達的訊息。');
INSERT INTO `text` VALUES ('95', 'behavior_definition', '11', 'cn', '');
INSERT INTO `text` VALUES ('96', 'behavior_definition', '11', 'en', '');
INSERT INTO `text` VALUES ('97', 'behavior_definition', '12', 'tw', '能視溝通的對象，採取不同的談話方式 (例如：按邏輯順序或直接重點表明…等)，音量、速度皆適中，並具有抑揚頓挫。');
INSERT INTO `text` VALUES ('98', 'behavior_definition', '12', 'cn', '');
INSERT INTO `text` VALUES ('99', 'behavior_definition', '12', 'en', '');
INSERT INTO `text` VALUES ('100', 'behavior_definition', '13', 'tw', '使用聽者慣用的語言來與對方溝通，並能避免使用對方聽不懂的術語。');
INSERT INTO `text` VALUES ('101', 'behavior_definition', '13', 'cn', '');
INSERT INTO `text` VALUES ('102', 'behavior_definition', '13', 'en', '');
INSERT INTO `text` VALUES ('103', 'behavior_definition', '14', 'tw', '能運用例子、比喻、輔助工具或肢體語言，來吸引對方注意或幫助其溝通理解。');
INSERT INTO `text` VALUES ('104', 'behavior_definition', '14', 'cn', '');
INSERT INTO `text` VALUES ('105', 'behavior_definition', '14', 'en', '');
INSERT INTO `text` VALUES ('106', 'behavior_definition', '15', 'tw', '確保自己了解對方的問題，能尊重不同的意見，並給予適當的回應。');
INSERT INTO `text` VALUES ('107', 'behavior_definition', '15', 'cn', '');
INSERT INTO `text` VALUES ('108', 'behavior_definition', '15', 'en', '');
INSERT INTO `text` VALUES ('109', 'behavior_definition', '16', 'tw', '當遇見問題時，能將該問題的情況與主要關鍵點具體說明清楚。');
INSERT INTO `text` VALUES ('110', 'behavior_definition', '16', 'cn', '');
INSERT INTO `text` VALUES ('111', 'behavior_definition', '16', 'en', '');
INSERT INTO `text` VALUES ('112', 'behavior_definition', '17', 'tw', '會主動搜集並查證相關資料或數據的完整與正確性，做為查找問題原因的依據(例如：詢問他人、查閱檔案、報表文件等)。');
INSERT INTO `text` VALUES ('113', 'behavior_definition', '17', 'cn', '');
INSERT INTO `text` VALUES ('114', 'behavior_definition', '17', 'en', '');
INSERT INTO `text` VALUES ('115', 'behavior_definition', '18', 'tw', '對於無法數據化的問題，能運用本身的經驗與洞察力來協助釐清問題的原因、本質與因果關係。');
INSERT INTO `text` VALUES ('116', 'behavior_definition', '18', 'cn', '');
INSERT INTO `text` VALUES ('117', 'behavior_definition', '18', 'en', '');
INSERT INTO `text` VALUES ('118', 'behavior_definition', '19', 'tw', '針對日常工作中所面臨的障礙與問題，主動提出可行的改善計畫與解決方案。');
INSERT INTO `text` VALUES ('119', 'behavior_definition', '19', 'cn', '');
INSERT INTO `text` VALUES ('120', 'behavior_definition', '19', 'en', '');
INSERT INTO `text` VALUES ('121', 'behavior_definition', '20', 'tw', '不但能有效解決問題，還能將解決問題的知識與技巧妥善紀錄、保存與管理，做為以後處理類似問題的參考。');
INSERT INTO `text` VALUES ('122', 'behavior_definition', '20', 'cn', '');
INSERT INTO `text` VALUES ('123', 'behavior_definition', '20', 'en', '');
INSERT INTO `text` VALUES ('124', 'behavior_definition', '21', 'tw', '不需要他人的跟催，能夠自動自發、盡心盡力完成工作任務，達成組織交付的工作目標。');
INSERT INTO `text` VALUES ('125', 'behavior_definition', '21', 'cn', '');
INSERT INTO `text` VALUES ('126', 'behavior_definition', '21', 'en', '');
INSERT INTO `text` VALUES ('127', 'behavior_definition', '22', 'tw', '當同事遇見工作瓶頸時，能發揮同事愛，主動教導或分享自身經驗，協助同事解決困難。');
INSERT INTO `text` VALUES ('128', 'behavior_definition', '22', 'cn', '');
INSERT INTO `text` VALUES ('129', 'behavior_definition', '22', 'en', '');
INSERT INTO `text` VALUES ('130', 'behavior_definition', '23', 'tw', '自願投入超出工作範圍的任務與活動，提昇自己的工作成就。');
INSERT INTO `text` VALUES ('131', 'behavior_definition', '23', 'cn', '');
INSERT INTO `text` VALUES ('132', 'behavior_definition', '23', 'en', '');
INSERT INTO `text` VALUES ('133', 'behavior_definition', '24', 'tw', '當獨自一人無法完成工作時，能主動尋求資源或他人的協助與意見，以如期完成工作。');
INSERT INTO `text` VALUES ('134', 'behavior_definition', '24', 'cn', '');
INSERT INTO `text` VALUES ('135', 'behavior_definition', '24', 'en', '');
INSERT INTO `text` VALUES ('136', 'behavior_definition', '25', 'tw', '能有不害怕改變的信念，追求明日比今日更進步一點的行動表現。');
INSERT INTO `text` VALUES ('137', 'behavior_definition', '25', 'cn', '');
INSERT INTO `text` VALUES ('138', 'behavior_definition', '25', 'en', '');
INSERT INTO `text` VALUES ('139', 'behavior_definition', '26', 'tw', '(事前)：能妥善運用組織相關資源，訂定合理的工作進度表，清楚規劃各階段任務的執行及完成時間。');
INSERT INTO `text` VALUES ('140', 'behavior_definition', '26', 'cn', '');
INSERT INTO `text` VALUES ('141', 'behavior_definition', '26', 'en', '');
INSERT INTO `text` VALUES ('142', 'behavior_definition', '27', 'tw', '(事中)：能監控和診斷工作的進度與成效，時時注意執行的過程與方法，確保工作能有效率的完成。');
INSERT INTO `text` VALUES ('143', 'behavior_definition', '27', 'cn', '');
INSERT INTO `text` VALUES ('144', 'behavior_definition', '27', 'en', '');
INSERT INTO `text` VALUES ('145', 'behavior_definition', '28', 'tw', '(事中)：當工作進度落後時，能積極找出落後的原因及補救改進的方法，並盡力達成組織原定的目標。');
INSERT INTO `text` VALUES ('146', 'behavior_definition', '28', 'cn', '');
INSERT INTO `text` VALUES ('147', 'behavior_definition', '28', 'en', '');
INSERT INTO `text` VALUES ('148', 'behavior_definition', '29', 'tw', '(事後)：會檢討工作執行的成效，並找出改善方案持續的改進，讓工作品質或效率都能比上一次更好。');
INSERT INTO `text` VALUES ('149', 'behavior_definition', '29', 'cn', '');
INSERT INTO `text` VALUES ('150', 'behavior_definition', '29', 'en', '');
INSERT INTO `text` VALUES ('151', 'behavior_definition', '30', 'tw', '(事後)：會運用相關表格與工具，將問題解決的經驗、知識與技巧妥善紀錄和保存下來，形成本部門的知識庫。');
INSERT INTO `text` VALUES ('152', 'behavior_definition', '30', 'cn', '');
INSERT INTO `text` VALUES ('153', 'behavior_definition', '30', 'en', '');
INSERT INTO `text` VALUES ('154', 'behavior_definition', '31', 'tw', '能清楚界定團隊成員各自所扮演的角色，使團隊成員感受到在團隊中的重要性，進而產生團隊的向心力與忠誠度。');
INSERT INTO `text` VALUES ('155', 'behavior_definition', '31', 'cn', '');
INSERT INTO `text` VALUES ('156', 'behavior_definition', '31', 'en', '');
INSERT INTO `text` VALUES ('157', 'behavior_definition', '32', 'tw', '遇到問題和困難時，能激勵並協調團隊成員，共同解決問題和困難，使工作任務得以順利達成。');
INSERT INTO `text` VALUES ('158', 'behavior_definition', '32', 'cn', '');
INSERT INTO `text` VALUES ('159', 'behavior_definition', '32', 'en', '');
INSERT INTO `text` VALUES ('160', 'behavior_definition', '33', 'tw', '能冷靜與鎮定的處理平行或上下級間的意見和工作衝突，並共同尋求解決方案。');
INSERT INTO `text` VALUES ('161', 'behavior_definition', '33', 'cn', '');
INSERT INTO `text` VALUES ('162', 'behavior_definition', '33', 'en', '');
INSERT INTO `text` VALUES ('163', 'behavior_definition', '34', 'tw', '能有效執行團隊績效的定期評量機制，真實反饋各團隊成員的績效表現，糾正、改善團隊成員有問題的行為。');
INSERT INTO `text` VALUES ('164', 'behavior_definition', '34', 'cn', '');
INSERT INTO `text` VALUES ('165', 'behavior_definition', '34', 'en', '');
INSERT INTO `text` VALUES ('166', 'behavior_definition', '35', 'tw', '樂於分享工作資訊與意見，並能與他人相處融洽，保持和諧的互動關係。');
INSERT INTO `text` VALUES ('167', 'behavior_definition', '35', 'cn', '');
INSERT INTO `text` VALUES ('168', 'behavior_definition', '35', 'en', '');
INSERT INTO `text` VALUES ('169', 'behavior_definition', '36', 'tw', '能接納跨部門團隊的工作分配，配合團隊的決議，放下個人利益，善盡個人在團隊中的職責。');
INSERT INTO `text` VALUES ('170', 'behavior_definition', '36', 'cn', '');
INSERT INTO `text` VALUES ('171', 'behavior_definition', '36', 'en', '');
INSERT INTO `text` VALUES ('172', 'behavior_definition', '37', 'tw', '尊重跨部門團隊成員不同的觀點，並能讓他們充份表達自己的意見與想法，不固執個人立場。');
INSERT INTO `text` VALUES ('173', 'behavior_definition', '37', 'cn', '');
INSERT INTO `text` VALUES ('174', 'behavior_definition', '37', 'en', '');
INSERT INTO `text` VALUES ('175', 'behavior_definition', '38', 'tw', '在跨部門合作過程中，能主動、積極地排除困難，並提供有益於解決問題的方案與建議。');
INSERT INTO `text` VALUES ('176', 'behavior_definition', '38', 'cn', '');
INSERT INTO `text` VALUES ('177', 'behavior_definition', '38', 'en', '');
INSERT INTO `text` VALUES ('178', 'behavior_definition', '39', 'tw', '能從團體成就的角度來檢視自己的表現，不邀功，不諉過。');
INSERT INTO `text` VALUES ('179', 'behavior_definition', '39', 'cn', '');
INSERT INTO `text` VALUES ('180', 'behavior_definition', '39', 'en', '');
INSERT INTO `text` VALUES ('181', 'behavior_definition', '40', 'tw', '在有限的時間和資源條件下，會預先協調好上下游部門間的時間與資源分配，以確保任務順利完成。');
INSERT INTO `text` VALUES ('182', 'behavior_definition', '40', 'cn', '');
INSERT INTO `text` VALUES ('183', 'behavior_definition', '40', 'en', '');
INSERT INTO `text` VALUES ('184', 'behavior_definition', '41', 'tw', '能將計畫和工作展開與分解，並掌握好每個關鍵的執行檢核點，以確保工作或任務的順利完成。');
INSERT INTO `text` VALUES ('185', 'behavior_definition', '41', 'cn', '');
INSERT INTO `text` VALUES ('186', 'behavior_definition', '41', 'en', '');
INSERT INTO `text` VALUES ('187', 'behavior_definition', '42', 'tw', '能事先思考當計畫發生突變時的應對策略及行動方案，確保當狀況發生時仍能維持各計畫的正常推進。');
INSERT INTO `text` VALUES ('188', 'behavior_definition', '42', 'cn', '');
INSERT INTO `text` VALUES ('189', 'behavior_definition', '42', 'en', '');
INSERT INTO `text` VALUES ('190', 'behavior_definition', '43', 'tw', '在任務執行過程中，會依據工作計劃表來監督、控管與查核任務的執行進度，以及工作的效率、方向與內容的正確性。');
INSERT INTO `text` VALUES ('191', 'behavior_definition', '43', 'cn', '');
INSERT INTO `text` VALUES ('192', 'behavior_definition', '43', 'en', '');
INSERT INTO `text` VALUES ('193', 'behavior_definition', '44', 'tw', '當進度落後或遇到困難時，會立即發出警訊，並尋求相關資源與協助以解決困難或問題，確保在預定時間內完成工作任務。');
INSERT INTO `text` VALUES ('194', 'behavior_definition', '44', 'cn', '');
INSERT INTO `text` VALUES ('195', 'behavior_definition', '44', 'en', '');
INSERT INTO `text` VALUES ('196', 'behavior_definition', '45', 'tw', '能持續地進行改善活動並將建議方案落實於實際的工作中，使工作品質或效率上都能有所提升。');
INSERT INTO `text` VALUES ('197', 'behavior_definition', '45', 'cn', '');
INSERT INTO `text` VALUES ('198', 'behavior_definition', '45', 'en', '');
INSERT INTO `text` VALUES ('199', 'behavior_definition', '46', 'tw', '不先入為主，能排除自我意識，以同理心傾聽並站在對方立場，與對方展開良性互動以解決問題或障礙。');
INSERT INTO `text` VALUES ('200', 'behavior_definition', '46', 'cn', '');
INSERT INTO `text` VALUES ('201', 'behavior_definition', '46', 'en', '');
INSERT INTO `text` VALUES ('202', 'behavior_definition', '47', 'tw', '能運用各種不同的媒介，清楚的對上、對下或對同儕說明表達工作協作的相關訊息。');
INSERT INTO `text` VALUES ('203', 'behavior_definition', '47', 'cn', '');
INSERT INTO `text` VALUES ('204', 'behavior_definition', '47', 'en', '');
INSERT INTO `text` VALUES ('205', 'behavior_definition', '48', 'tw', '處事圓融，能耐心處理，聆聽內、外部客戶的抱怨，能控制情緒不使衝突發生。');
INSERT INTO `text` VALUES ('206', 'behavior_definition', '48', 'cn', '');
INSERT INTO `text` VALUES ('207', 'behavior_definition', '48', 'en', '');
INSERT INTO `text` VALUES ('208', 'behavior_definition', '49', 'tw', '能視不同狀況調整溝通技巧，順利與組織內外部成員溝通。');
INSERT INTO `text` VALUES ('209', 'behavior_definition', '49', 'cn', '');
INSERT INTO `text` VALUES ('210', 'behavior_definition', '49', 'en', '');
INSERT INTO `text` VALUES ('211', 'behavior_definition', '50', 'tw', '跨部門協調時，會主動與該部門主管先行知會說明，達到意見整合，完成共識。');
INSERT INTO `text` VALUES ('212', 'behavior_definition', '50', 'cn', '');
INSERT INTO `text` VALUES ('213', 'behavior_definition', '50', 'en', '');
INSERT INTO `text` VALUES ('214', 'behavior_definition', '51', 'tw', '用積極正向、就事論事的態度來排除內、外部客戶的衝突，並共同尋求解決方案。');
INSERT INTO `text` VALUES ('215', 'behavior_definition', '51', 'cn', '');
INSERT INTO `text` VALUES ('216', 'behavior_definition', '51', 'en', '');
INSERT INTO `text` VALUES ('217', 'behavior_definition', '52', 'tw', '具備成本意識，能以自身專業知識及有效方法，滿足內、外部客戶的期望與需要。');
INSERT INTO `text` VALUES ('218', 'behavior_definition', '52', 'cn', '');
INSERT INTO `text` VALUES ('219', 'behavior_definition', '52', 'en', '');
INSERT INTO `text` VALUES ('220', 'behavior_definition', '53', 'tw', '能運用有效的方法來了解評估客戶的不滿意問題及回饋，並進行檢討與改善。');
INSERT INTO `text` VALUES ('221', 'behavior_definition', '53', 'cn', '');
INSERT INTO `text` VALUES ('222', 'behavior_definition', '53', 'en', '');
INSERT INTO `text` VALUES ('223', 'behavior_definition', '54', 'tw', '能夠協助客戶解決問題滿足客戶需求，以建立良性的合作關係。');
INSERT INTO `text` VALUES ('224', 'behavior_definition', '54', 'cn', '');
INSERT INTO `text` VALUES ('225', 'behavior_definition', '54', 'en', '');
INSERT INTO `text` VALUES ('226', 'behavior_definition', '55', 'tw', '除了客戶主動提出的要求外，能夠預先找出或告知內外部客戶可能發生的各種潛在問題或需求。');
INSERT INTO `text` VALUES ('227', 'behavior_definition', '55', 'cn', '');
INSERT INTO `text` VALUES ('228', 'behavior_definition', '55', 'en', '');
INSERT INTO `text` VALUES ('229', 'evaluation_scale_item_desc', '1', 'tw', '約有20%能觀察到此行為表現。');
INSERT INTO `text` VALUES ('230', 'evaluation_scale_item_desc', '1', 'cn', '');
INSERT INTO `text` VALUES ('231', 'evaluation_scale_item_desc', '1', 'en', '');
INSERT INTO `text` VALUES ('232', 'evaluation_scale_item_desc', '2', 'tw', '約有21%~40%能觀察到此行為表現。');
INSERT INTO `text` VALUES ('233', 'evaluation_scale_item_desc', '2', 'cn', '');
INSERT INTO `text` VALUES ('234', 'evaluation_scale_item_desc', '2', 'en', '');
INSERT INTO `text` VALUES ('235', 'evaluation_scale_item_desc', '3', 'tw', '約有41%~50%能觀察到此行為表現。');
INSERT INTO `text` VALUES ('236', 'evaluation_scale_item_desc', '3', 'cn', '');
INSERT INTO `text` VALUES ('237', 'evaluation_scale_item_desc', '3', 'en', '');
INSERT INTO `text` VALUES ('238', 'evaluation_scale_item_desc', '4', 'tw', '約有51%~60%能觀察到此行為表現。');
INSERT INTO `text` VALUES ('239', 'evaluation_scale_item_desc', '4', 'cn', '');
INSERT INTO `text` VALUES ('240', 'evaluation_scale_item_desc', '4', 'en', '');
INSERT INTO `text` VALUES ('241', 'evaluation_scale_item_desc', '5', 'tw', '約有61%~80%能觀察到此行為表現。');
INSERT INTO `text` VALUES ('242', 'evaluation_scale_item_desc', '5', 'cn', '');
INSERT INTO `text` VALUES ('243', 'evaluation_scale_item_desc', '5', 'en', '');
INSERT INTO `text` VALUES ('244', 'evaluation_scale_item_desc', '6', 'tw', '約有81%~90%能觀察到此行為表現。');
INSERT INTO `text` VALUES ('245', 'evaluation_scale_item_desc', '6', 'cn', '');
INSERT INTO `text` VALUES ('246', 'evaluation_scale_item_desc', '6', 'en', '');
INSERT INTO `text` VALUES ('247', 'evaluation_scale_item_desc', '7', 'tw', '約有91%以上能觀察到此行為表現。');
INSERT INTO `text` VALUES ('248', 'evaluation_scale_item_desc', '7', 'cn', '');
INSERT INTO `text` VALUES ('249', 'evaluation_scale_item_desc', '7', 'en', '');
INSERT INTO `text` VALUES ('250', 'basis_evaluation_desc', '1', 'tw', '');
INSERT INTO `text` VALUES ('251', 'basis_evaluation_desc', '1', 'cn', '');
INSERT INTO `text` VALUES ('252', 'basis_evaluation_desc', '1', 'en', '');
INSERT INTO `text` VALUES ('253', 'b_evalu_table_desc', '1', 'tw', '');
INSERT INTO `text` VALUES ('254', 'b_evalu_table_desc', '1', 'cn', '');
INSERT INTO `text` VALUES ('255', 'b_evalu_table_desc', '1', 'en', '');
INSERT INTO `text` VALUES ('256', 'basis_evaluation_desc', '2', 'tw', '');
INSERT INTO `text` VALUES ('257', 'basis_evaluation_desc', '2', 'cn', '');
INSERT INTO `text` VALUES ('258', 'basis_evaluation_desc', '2', 'en', '');
INSERT INTO `text` VALUES ('259', 'b_evalu_table_desc', '2', 'tw', '');
INSERT INTO `text` VALUES ('260', 'b_evalu_table_desc', '2', 'cn', '');
INSERT INTO `text` VALUES ('261', 'b_evalu_table_desc', '2', 'en', '');
INSERT INTO `text` VALUES ('262', 'basis_evaluation_desc', '3', 'tw', '');
INSERT INTO `text` VALUES ('263', 'basis_evaluation_desc', '3', 'cn', '');
INSERT INTO `text` VALUES ('264', 'basis_evaluation_desc', '3', 'en', '');
INSERT INTO `text` VALUES ('265', 'b_evalu_table_desc', '3', 'tw', '');
INSERT INTO `text` VALUES ('266', 'b_evalu_table_desc', '3', 'cn', '');
INSERT INTO `text` VALUES ('267', 'b_evalu_table_desc', '3', 'en', '');
INSERT INTO `text` VALUES ('268', 'basis_evaluation_desc', '4', 'tw', '');
INSERT INTO `text` VALUES ('269', 'basis_evaluation_desc', '4', 'cn', '');
INSERT INTO `text` VALUES ('270', 'basis_evaluation_desc', '4', 'en', '');
INSERT INTO `text` VALUES ('271', 'b_evalu_table_desc', '4', 'tw', '');
INSERT INTO `text` VALUES ('272', 'b_evalu_table_desc', '4', 'cn', '');
INSERT INTO `text` VALUES ('273', 'b_evalu_table_desc', '4', 'en', '');
INSERT INTO `text` VALUES ('274', 'behavior_definition', '56', 'tw', '針對公司現在及未來發展目標，能訂定出目前組織成員需要發展與尚待培養的能力。');
INSERT INTO `text` VALUES ('275', 'behavior_definition', '56', 'cn', '');
INSERT INTO `text` VALUES ('276', 'behavior_definition', '56', 'en', '');
INSERT INTO `text` VALUES ('277', 'behavior_definition', '57', 'tw', '願意提供實質的、詳細的指導與諮詢，來幫助組織成員解決工作上的問題。');
INSERT INTO `text` VALUES ('278', 'behavior_definition', '57', 'cn', '');
INSERT INTO `text` VALUES ('279', 'behavior_definition', '57', 'en', '');
INSERT INTO `text` VALUES ('280', 'behavior_definition', '58', 'tw', '對組織成員充分授權，以提升組織成員勇於面對問題與承擔責任的勇氣與能力。');
INSERT INTO `text` VALUES ('281', 'behavior_definition', '58', 'cn', '');
INSERT INTO `text` VALUES ('282', 'behavior_definition', '58', 'en', '');
INSERT INTO `text` VALUES ('283', 'behavior_definition', '59', 'tw', '能啟發部屬瞭解其自身的優缺點，傾聽部屬的發展需求，並幫助他們擬訂合適的個人能力提升計畫。');
INSERT INTO `text` VALUES ('284', 'behavior_definition', '59', 'cn', '');
INSERT INTO `text` VALUES ('285', 'behavior_definition', '59', 'en', '');
INSERT INTO `text` VALUES ('286', 'behavior_definition', '60', 'tw', '對於具發展潛力的人才，能給予具挑戰性的工作，並幫助其建立信心、做好未來職涯發展規劃。');
INSERT INTO `text` VALUES ('287', 'behavior_definition', '60', 'cn', '');
INSERT INTO `text` VALUES ('288', 'behavior_definition', '60', 'en', '');
INSERT INTO `text` VALUES ('289', 'behavior_definition', '61', 'tw', '樂於將個人專業知識、工作和管理經驗，進行系統性的整理並與他人分享。');
INSERT INTO `text` VALUES ('290', 'behavior_definition', '61', 'cn', '');
INSERT INTO `text` VALUES ('291', 'behavior_definition', '61', 'en', '');
INSERT INTO `text` VALUES ('292', 'behavior_definition', '62', 'tw', '當遇到困難時，會以身作則或採取有效的方法來激勵、鼓舞團隊士氣，共同完成團隊目標。');
INSERT INTO `text` VALUES ('293', 'behavior_definition', '62', 'cn', '');
INSERT INTO `text` VALUES ('294', 'behavior_definition', '62', 'en', '');
INSERT INTO `text` VALUES ('295', 'behavior_definition', '63', 'tw', '能激勵團隊成員積極參與團隊決議的過程，使成員們能充份表達自己的意見與想法。');
INSERT INTO `text` VALUES ('296', 'behavior_definition', '63', 'cn', '');
INSERT INTO `text` VALUES ('297', 'behavior_definition', '63', 'en', '');
INSERT INTO `text` VALUES ('298', 'behavior_definition', '64', 'tw', '在部門日常管理中，會主動關心與瞭解部屬及同事的近況。');
INSERT INTO `text` VALUES ('299', 'behavior_definition', '64', 'cn', '');
INSERT INTO `text` VALUES ('300', 'behavior_definition', '64', 'en', '');
INSERT INTO `text` VALUES ('301', 'behavior_definition', '65', 'tw', '當部屬/同事/客戶遭遇挫折或情緒低落時，會視需要適時給予協助與支持。');
INSERT INTO `text` VALUES ('302', 'behavior_definition', '65', 'cn', '');
INSERT INTO `text` VALUES ('303', 'behavior_definition', '65', 'en', '');
INSERT INTO `text` VALUES ('304', 'behavior_definition', '66', 'tw', '樂意將經驗分享給部屬，並能以身作則來教導部屬。');
INSERT INTO `text` VALUES ('305', 'behavior_definition', '66', 'cn', '');
INSERT INTO `text` VALUES ('306', 'behavior_definition', '66', 'en', '');
INSERT INTO `text` VALUES ('307', 'behavior_definition', '67', 'tw', '能因材施教、有計劃並持續透過不同情境案例的訓練或實作等方式，來增強部屬的能力。');
INSERT INTO `text` VALUES ('308', 'behavior_definition', '67', 'cn', '');
INSERT INTO `text` VALUES ('309', 'behavior_definition', '67', 'en', '');
INSERT INTO `text` VALUES ('310', 'behavior_definition', '68', 'tw', '能正確評估部屬的能力，並依此安排特定且持續的指導和訓練。');
INSERT INTO `text` VALUES ('311', 'behavior_definition', '68', 'cn', '');
INSERT INTO `text` VALUES ('312', 'behavior_definition', '68', 'en', '');
INSERT INTO `text` VALUES ('313', 'behavior_definition', '69', 'tw', '在可控範圍內容忍部屬犯錯，並給予及時的指導，當部屬有疑惑時，除了告訴他們如何解決外，也會告訴他們實際的原因為何。');
INSERT INTO `text` VALUES ('314', 'behavior_definition', '69', 'cn', '');
INSERT INTO `text` VALUES ('315', 'behavior_definition', '69', 'en', '');
INSERT INTO `text` VALUES ('316', 'behavior_definition', '70', 'tw', '除遵守SOP文件的規定外，還能以自身的專業技能來督導部屬的工作表現，以符合公司最終利益。');
INSERT INTO `text` VALUES ('317', 'behavior_definition', '70', 'cn', '');
INSERT INTO `text` VALUES ('318', 'behavior_definition', '70', 'en', '');
INSERT INTO `text` VALUES ('319', 'behavior_definition', '71', 'tw', '遇到問題時，會蒐集、整合各種不同來源的資料，運用專業知識、經驗、工具與方法，找出問題的主要根源與關鍵點。');
INSERT INTO `text` VALUES ('320', 'behavior_definition', '71', 'cn', '');
INSERT INTO `text` VALUES ('321', 'behavior_definition', '71', 'en', '');
INSERT INTO `text` VALUES ('322', 'behavior_definition', '72', 'tw', '針對自身決策範圍內的問題，提出可行的解決方案，整合相關人員共同執行以達成最終期望的結果。');
INSERT INTO `text` VALUES ('323', 'behavior_definition', '72', 'cn', '');
INSERT INTO `text` VALUES ('324', 'behavior_definition', '72', 'en', '');
INSERT INTO `text` VALUES ('325', 'behavior_definition', '73', 'tw', '對於由許多因素所構成的複雜問題，能在現有條件限制下，提出幾種可行的解決方案，供上級決策。');
INSERT INTO `text` VALUES ('326', 'behavior_definition', '73', 'cn', '');
INSERT INTO `text` VALUES ('327', 'behavior_definition', '73', 'en', '');
INSERT INTO `text` VALUES ('328', 'behavior_definition', '74', 'tw', '針對不同的流程改善與問題解決方案，能客觀有效的評估其預期效益與優缺點。');
INSERT INTO `text` VALUES ('329', 'behavior_definition', '74', 'cn', '');
INSERT INTO `text` VALUES ('330', 'behavior_definition', '74', 'en', '');
INSERT INTO `text` VALUES ('331', 'behavior_definition', '75', 'tw', '具備成本意識，能持續精進現有的作業流程或操作程序，以提升工作效率與效益。');
INSERT INTO `text` VALUES ('332', 'behavior_definition', '75', 'cn', '');
INSERT INTO `text` VALUES ('333', 'behavior_definition', '75', 'en', '');
INSERT INTO `text` VALUES ('334', 'group_desc', '30', 'tw', '');
INSERT INTO `text` VALUES ('335', 'group_desc', '30', 'cn', '');
INSERT INTO `text` VALUES ('336', 'group_desc', '30', 'en', '');
INSERT INTO `text` VALUES ('337', 'group_desc', '33', 'tw', '');
INSERT INTO `text` VALUES ('338', 'group_desc', '33', 'cn', '');
INSERT INTO `text` VALUES ('339', 'group_desc', '33', 'en', '');
INSERT INTO `text` VALUES ('340', 'basis_evaluation_desc', '5', 'tw', '2016高階匯入測試');
INSERT INTO `text` VALUES ('341', 'basis_evaluation_desc', '5', 'cn', '');
INSERT INTO `text` VALUES ('342', 'basis_evaluation_desc', '5', 'en', '');
INSERT INTO `text` VALUES ('343', 'b_evalu_table_desc', '5', 'tw', '');
INSERT INTO `text` VALUES ('344', 'b_evalu_table_desc', '5', 'cn', '');
INSERT INTO `text` VALUES ('345', 'b_evalu_table_desc', '5', 'en', '');
INSERT INTO `text` VALUES ('346', 'basis_evaluation_desc', '6', 'tw', '2016高階匯入測試');
INSERT INTO `text` VALUES ('347', 'basis_evaluation_desc', '6', 'cn', '');
INSERT INTO `text` VALUES ('348', 'basis_evaluation_desc', '6', 'en', '');
INSERT INTO `text` VALUES ('349', 'b_evalu_table_desc', '6', 'tw', '');
INSERT INTO `text` VALUES ('350', 'b_evalu_table_desc', '6', 'cn', '');
INSERT INTO `text` VALUES ('351', 'b_evalu_table_desc', '6', 'en', '');
UNLOCK TABLES;
-- 
-- Table structure for table `tpl`
--

DROP TABLE IF EXISTS `tpl`;
CREATE TABLE `tpl` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tpl_title` varchar(100) NOT NULL,
  `tpl_sender` varchar(100) NOT NULL,
  `tpl_content` text NOT NULL,
  `tpl_trigger` varchar(10) NOT NULL,
  PRIMARY KEY (`tpl_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `tpl`
--

LOCK TABLES `tpl` WRITE;
INSERT INTO `tpl` VALUES ('1', '360度職能評鑑邀請函', '360 Degree Assessment Administrator', '親愛的 {fullName} 您好：

  在您收到這封郵件時，表示您已被邀請參與本次管理職能360度評鑑。
  本次評鑑目的是為了給參與本次評鑑的受評人，提供更明確的管理職能回饋訊息，俾便受評人建立更具針對性的個人發展計畫(IDP)。
  您的真實回饋訊息，對受評人建立IDP至關重要，請依據您日常對受評人的實際觀察，提供客觀、真實的反饋。

 您至少有一份以上的問卷尚待填寫，請使用google瀏覽器(Chrome)登入 {sysURL} 填寫評鑑表，並請您務必在9月17日(星期四)午夜12點前，將所有評鑑表填寫完畢。

 您的登入信息如下：
 帳號：{user_account}
 密碼：{password}

 請注意：
 1、當您填寫問卷過程中需暫時離開系統時，請務必點選「保存」按鈕，以免數據遺失）
 2、如您要回家做問卷，請抄下網址、帳號及密碼，回家輸入網址後，登入帳號密碼即可填寫問卷。
 3、填寫完畢後，請務必按「交卷」按鈕，以確認問卷填寫完畢。

 若您在填寫問卷過程當中有任何問題，請洽 分機xxx。

 謝謝您的參與！

主管領導力提升專案工作小組 敬上', 'INVITE');
INSERT INTO `tpl` VALUES ('2', '360度職能評鑑通知函 (評鑑期限即將到期)', '360 Degree Assessment Administrator', '親愛的 {fullName} 您好：

  由於您還有360度管理職能評鑑問卷尚未完成，且評鑑期限即將到期(9月17日 星期四，午夜12:00)，請您儘快撥空登入 {sysURL}  填寫問卷，謝謝您！

  您的登入信息如下：
  帳號：{user_account} 
  密碼：{password}

請注意：

1、當您填寫問卷過程中需暫時離開系統時，請務必點選「保存」按鈕，以免數據遺失）
2、如您要回家做問卷，請抄下網址、帳號及密碼，回家輸入網址後，登入帳號密碼即可填寫問卷。
3、填寫完畢後，請務必按「交卷」按鈕，以確認問卷填寫完畢。

 若您在填寫問卷過程當中有任何問題，請洽 分機xxx。

 謝謝您的參與！

主管領導力提升專案工作小組 敬上', 'PUSH');
UNLOCK TABLES;
-- 
-- Table structure for table `training_material`
--

DROP TABLE IF EXISTS `training_material`;
CREATE TABLE `training_material` (
  `training_material_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_material_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `training_material`
--

LOCK TABLES `training_material` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `training_method`
--

DROP TABLE IF EXISTS `training_method`;
CREATE TABLE `training_method` (
  `training_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_method_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `training_method`
--

LOCK TABLES `training_method` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `training_teacher`
--

DROP TABLE IF EXISTS `training_teacher`;
CREATE TABLE `training_teacher` (
  `training_teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_level_id` int(11) NOT NULL,
  PRIMARY KEY (`training_teacher_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `training_teacher`
--

LOCK TABLES `training_teacher` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `user_power`
--

DROP TABLE IF EXISTS `user_power`;
CREATE TABLE `user_power` (
  `user_power_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `power_code` varchar(20) NOT NULL,
  PRIMARY KEY (`user_power_id`)
)  ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `user_power`
--

LOCK TABLES `user_power` WRITE;
UNLOCK TABLES;
-- 
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullName` varchar(10) NOT NULL,
  `user_name_chs` varchar(10) NOT NULL,
  `user_name_eng` varchar(10) NULL,
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
)  ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
INSERT INTO `user_profile` VALUES ('1', 'admin', 'admin', 'admin', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'M', 'T', '', '', 'admin', '47', '2017-04-10 14:39:41');
INSERT INTO `user_profile` VALUES ('100', '鍾錫源', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '1', '1', '980202A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('101', '郭富評', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '3', '1', '160104A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('102', '林加斌', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '4', '2', '130401A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('103', '林恆春', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '4', '3', '160701A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('104', '羅水興', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '4', '4', '990308A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('105', '洪東顯', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '1', '801015A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('106', '陳俊亮', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '5', '5', '790815A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('107', '陳春景', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '6', '5', '790810A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('108', '許丕男', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '8', '5', '970220A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('109', '吳美青', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '16', '981027A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('110', '羅慧萍', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '15', '980223B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('111', '邱公傑', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '5', '6', '120524A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('112', '洪明全', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '6', '6', '791001B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('113', '蘇建通', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '8', '6', '830729A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('114', '朱煌慶', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '6', '811001A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('115', '徐意明', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '6', '900208A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('116', '王瑞昇', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '5', '10', '160104B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('117', '盧勝方', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '10', '790720A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('118', '張運松', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '22', '850409A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('119', '林德民', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '23', '840214A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('120', '謝清全', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '23', '860328A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('121', '陳似禹', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '23', '991116A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('122', '游金松', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '24', '790801C', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('123', '張安潤', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '24', '960822A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('124', '劉世芳', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '8', '9', '810701B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('125', '蘇金海', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '19', '811216B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('126', '宋明恭', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '19', '140714B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('127', '游兆宏', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '19', '850605A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('128', '陳俊宏', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '19', '940704I', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('129', '謝國華', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '20', '790816B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('130', '廖振山', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '20', '790925A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('131', '李永煌', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '20', '830406A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('132', '林淑敏', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '21', '790917A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('133', '邱瑞偉', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '21', '930706A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('134', '彭錦順', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '5', '11', '800603D', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('135', '鄧根發', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '8', '11', '790910A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('136', '沈銘德', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '11', '791101D', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('137', '鄭天華', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '11', '800221C', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('138', '陳彥州', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '25', '870907A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('139', '王鼎鑫', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '25', '860320B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('140', '賴重成', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '25', '890410A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('141', '樊真知', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '25', '810316A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('142', '劉德良', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '26', '810221C', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('143', '陳鋌', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '26', '800711C', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('144', '林玉豐', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '26', '810411A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('145', '莊朝榜', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '26', '810824A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('146', '游豐富', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '26', '860407A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('147', '杜台元', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '26', '871001A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('148', '郭長來', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '26', '931001A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('149', '李清城', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '26', '810224A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('150', '賴富秀', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '5', '12', '121015A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('151', '姜義洋', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '12', '110201A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('152', '簡明煌', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '28', '131209B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('153', '黃金山', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '28', '890622D', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('154', '楊對成', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '28', '990301C', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('155', '傅惇建', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '28', '940822C', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('156', '鍾志賢', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '28', '930505C', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('157', '湯仁傑', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '28', '890918A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('158', '陳松賢', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '28', '810727A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('159', '彭永富', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '29', '980302A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('160', '許維帆', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '27', '110602A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('161', '江信義', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '27', '791101E', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('162', '裴慶富', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '27', '930226A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('163', '張為偉', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '27', '990323D', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('164', '游振男', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '6', '8', '830518A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('165', '吳僑英', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '8', '810622A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('166', '陳羽德', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '17', '960621A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('167', '湯發良', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '18', '900220A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('168', '李清源', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '18', '900905A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('169', '樊秀知', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '18', '820517A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('170', '陳宗枝', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '5', '13', '790716B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('171', '戴翰喬', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '30', '940913D', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('172', '劉守深', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '31', '980803D', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('173', '吳鳳嬌', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '13', '880224A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('174', '謝新良', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '31', '981118A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('175', '鍾沅成', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '31', '120221A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('176', '黃大原', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '7', '32', '791201J', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('177', '曾繁旺', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '32', '900423A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('178', '李震球', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '10', '32', '860304A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('179', '孫道行', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '9', '22', '930503A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('180', '王政偉', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '11', '140818A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('181', '曹端', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '11', '160815A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('182', '徐偉傑', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '26', '931012A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('183', '陳暉詠', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '26', '980803A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('184', '劉醇良', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '31', '120213A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('185', '翁再里', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '33', '130603A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('186', '李盈逸', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '33', '150407A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('187', '黃浚家', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '33', '130819A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('188', '祝瓊英', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '34', '110406A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('189', '簡正宏', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '34', '140321A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('190', '康家豪', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '19', '160711A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('191', '彭賢維', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '19', '921020B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('192', '高永文', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '19', '820223A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('193', '夏應祥', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '19', '840414A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('194', '蘇志業', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '19', '930922A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('195', '鄧大正', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '19', '960625A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('196', '許匡維', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '19', '141204A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('197', '林承頡', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '19', '850905A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('198', '陳志家', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '19', '890821A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('199', '戴靖涵', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '9', '160901A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('200', '蕭佑軒', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '21', '141201A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('201', '陳郁中', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '21', '141209A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('202', '蔡林港', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '21', '150518A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('203', '王建鈞', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '21', '160419A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('204', '賴淑真', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '21', '150302A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('205', '張家瑋', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '21', '130325A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('206', '鍾明勳', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '21', '140605A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('207', '徐尉倫', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '21', '151201A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('208', '陳曉甄', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '20', '861201A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('209', '陳思吟', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '20', '950301B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('210', '陳佳松', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '17', '110425A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('211', '周康宇', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '17', '110620A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('212', '林士舜', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '17', '130415A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('213', '王識銘', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '17', '160509A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('214', '張魯萍', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '17', '931109A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('215', '羅彪', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '17', '850906A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('216', '黃嘉慶', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '17', '860331A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('217', '許壬豪', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '18', '940426A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('218', '張祖銘', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '18', '990301E', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('219', '邱俊豪', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '18', '900903A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('220', '藍裕現', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '5', '131209A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('221', '羅坤祥', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '5', '880104B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('222', '呂學昇', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '24', '930823A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('223', '沈冠璿', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '24', '120201A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('224', '葉英傑', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '24', '990308B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('225', '葉信娣', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '24', '830216A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('226', '湯銘富', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '6', '140428A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('227', '潘怡君', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '6', '890913A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('228', '吳桃嬌', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '15', '791001A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('229', '謝麗苓', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '15', '110112A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('230', '呂玉梅', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '16', '121126A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('231', '陳淑媛', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '16', '870904A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('232', '王筱萍', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '16', '981007A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('233', '黃育伶', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '16', '990301B', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('234', '何豫臺', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '14', '920317A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('235', '曾郁雯', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '14', '920915A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('236', '游清漢', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '12', '14', '940214A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('237', '朱鍠龍', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '27', '920922A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('238', '陳達成', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '27', '931019E', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('239', '邱祥龍', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '28', '930308A', '', '0000-00-00 00:00:00');
INSERT INTO `user_profile` VALUES ('240', '徐宏規', '', '', '', '', '', '', '', '', '', '', '', '102', '', '', '', '', '', '', '', '', 'N', 'T', '11', '28', '920818B', '', '0000-00-00 00:00:00');
UNLOCK TABLES;
-- 
-- Table structure for table `user_sso`
--

DROP TABLE IF EXISTS `user_sso`;
CREATE TABLE `user_sso` (
  `user_email_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) NOT NULL,
  `user_live_id` varchar(20) NOT NULL,
  `user_fb_id` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_account` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`user_email_id`),
  UNIQUE KEY `user_id` (`user_id`)
)  ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `user_sso`
--

LOCK TABLES `user_sso` WRITE;
INSERT INTO `user_sso` VALUES ('1', '', '', '', '1', 'admin', 'admin');
INSERT INTO `user_sso` VALUES ('143', 's_jong@twcoc.com.tw', '', '', '100', '980202A', '980202A');
INSERT INTO `user_sso` VALUES ('144', 'kfp@twcoc.com.tw', '', '', '101', '160104A', '160104A');
INSERT INTO `user_sso` VALUES ('145', 'ym130401@ymht.com.tw', '', '', '102', '130401A', '130401A');
INSERT INTO `user_sso` VALUES ('146', 'hclin@twcoc.com.tw', '', '', '103', '160701A', '160701A');
INSERT INTO `user_sso` VALUES ('147', 'Hsin@twcoc.com.tw', '', '', '104', '990308A', '990308A');
INSERT INTO `user_sso` VALUES ('148', 'tung-hsien@twcoc.com.tw', '', '', '105', '801015A', '801015A');
INSERT INTO `user_sso` VALUES ('149', 'clchen@twcoc.com.tw', '', '', '106', '790815A', '790815A');
INSERT INTO `user_sso` VALUES ('150', '790810@twcoc.com.tw', '', '', '107', '790810A', '790810A');
INSERT INTO `user_sso` VALUES ('151', 'hsupinan@twcoc.com.tw', '', '', '108', '970220A', '970220A');
INSERT INTO `user_sso` VALUES ('152', '981027@twcoc.com.tw', '', '', '109', '981027A', '981027A');
INSERT INTO `user_sso` VALUES ('153', 'joyce_lo@twcoc.com.tw', '', '', '110', '980223B', '980223B');
INSERT INTO `user_sso` VALUES ('154', 'kcchiou@twcoc.com.tw', '', '', '111', '120524A', '120524A');
INSERT INTO `user_sso` VALUES ('155', 'marrlice@twcoc.com.tw', '', '', '112', '791001B', '791001B');
INSERT INTO `user_sso` VALUES ('156', 'tung@twcoc.com.tw', '', '', '113', '830729A', '830729A');
INSERT INTO `user_sso` VALUES ('157', 'alan-chu@twcoc.com.tw', '', '', '114', '811001A', '811001A');
INSERT INTO `user_sso` VALUES ('158', 'tonyhsu@twcoc.com.tw', '', '', '115', '900208A', '900208A');
INSERT INTO `user_sso` VALUES ('159', 'she@twcoc.com.tw', '', '', '116', '160104B', '160104B');
INSERT INTO `user_sso` VALUES ('160', '790720@twcoc.com.tw', '', '', '117', '790720A', '790720A');
INSERT INTO `user_sso` VALUES ('161', '850409@twcoc.com.tw', '', '', '118', '850409A', '850409A');
INSERT INTO `user_sso` VALUES ('162', '840214@twcoc.com.tw', '', '', '119', '840214A', '840214A');
INSERT INTO `user_sso` VALUES ('163', '860328@twcoc.com.tw', '', '', '120', '860328A', '860328A');
INSERT INTO `user_sso` VALUES ('164', '991116@twcoc.com.tw', '', '', '121', '991116A', '991116A');
INSERT INTO `user_sso` VALUES ('165', '790801c@twcoc.com.tw', '', '', '122', '790801C', '790801C');
INSERT INTO `user_sso` VALUES ('166', '960822@twcoc.com.tw', '', '', '123', '960822A', '960822A');
INSERT INTO `user_sso` VALUES ('167', '810701b@twcoc.com.tw', '', '', '124', '810701B', '810701B');
INSERT INTO `user_sso` VALUES ('168', '811216b@twcoc.com.tw', '', '', '125', '811216B', '811216B');
INSERT INTO `user_sso` VALUES ('169', '140714b@twcoc.com.tw', '', '', '126', '140714B', '140714B');
INSERT INTO `user_sso` VALUES ('170', '850605@twcoc.com.tw', '', '', '127', '850605A', '850605A');
INSERT INTO `user_sso` VALUES ('171', '940704i@twcoc.com.tw', '', '', '128', '940704I', '940704I');
INSERT INTO `user_sso` VALUES ('172', '790816b@twcoc.com.tw', '', '', '129', '790816B', '790816B');
INSERT INTO `user_sso` VALUES ('173', '790925@twcoc.com.tw', '', '', '130', '790925A', '790925A');
INSERT INTO `user_sso` VALUES ('174', '830406@twcoc.com.tw', '', '', '131', '830406A', '830406A');
INSERT INTO `user_sso` VALUES ('175', '790917@twcoc.com.tw', '', '', '132', '790917A', '790917A');
INSERT INTO `user_sso` VALUES ('176', '930706@twcoc.com.tw', '', '', '133', '930706A', '930706A');
INSERT INTO `user_sso` VALUES ('177', '800603d@twcoc.com.tw', '', '', '134', '800603D', '800603D');
INSERT INTO `user_sso` VALUES ('178', '790910@twcoc.com.tw', '', '', '135', '790910A', '790910A');
INSERT INTO `user_sso` VALUES ('179', '791101d@twcoc.com.tw', '', '', '136', '791101D', '791101D');
INSERT INTO `user_sso` VALUES ('180', '800221c@twcoc.com.tw', '', '', '137', '800221C', '800221C');
INSERT INTO `user_sso` VALUES ('181', '870907@twcoc.com.tw', '', '', '138', '870907A', '870907A');
INSERT INTO `user_sso` VALUES ('182', '860320b@twcoc.com.tw', '', '', '139', '860320B', '860320B');
INSERT INTO `user_sso` VALUES ('183', '890410@twcoc.com.tw', '', '', '140', '890410A', '890410A');
INSERT INTO `user_sso` VALUES ('184', '810316@twcoc.com.tw', '', '', '141', '810316A', '810316A');
INSERT INTO `user_sso` VALUES ('185', '810221c@twcoc.com.tw', '', '', '142', '810221C', '810221C');
INSERT INTO `user_sso` VALUES ('186', '800711@twcoc.com.tw', '', '', '143', '800711C', '800711C');
INSERT INTO `user_sso` VALUES ('187', '810411@twcoc.com.tw', '', '', '144', '810411A', '810411A');
INSERT INTO `user_sso` VALUES ('188', '810824@twcoc.com.tw', '', '', '145', '810824A', '810824A');
INSERT INTO `user_sso` VALUES ('189', '860407@twcoc.com.tw', '', '', '146', '860407A', '860407A');
INSERT INTO `user_sso` VALUES ('190', '871001@twcoc.com.tw', '', '', '147', '871001A', '871001A');
INSERT INTO `user_sso` VALUES ('191', '931001@twcoc.com.tw', '', '', '148', '931001A', '931001A');
INSERT INTO `user_sso` VALUES ('192', '810224@twcoc.com.tw', '', '', '149', '810224A', '810224A');
INSERT INTO `user_sso` VALUES ('193', 'fxlai@twcoc.com.tw', '', '', '150', '121015A', '121015A');
INSERT INTO `user_sso` VALUES ('194', '980608c@twcoc.com.tw', '', '', '151', '110201A', '110201A');
INSERT INTO `user_sso` VALUES ('195', '131209b@twcoc.com.tw', '', '', '152', '131209B', '131209B');
INSERT INTO `user_sso` VALUES ('196', '890622d@twcoc.com.tw', '', '', '153', '890622D', '890622D');
INSERT INTO `user_sso` VALUES ('197', '990301c@twcoc.com.tw', '', '', '154', '990301C', '990301C');
INSERT INTO `user_sso` VALUES ('198', '940822c@twcoc.com.tw', '', '', '155', '940822C', '940822C');
INSERT INTO `user_sso` VALUES ('199', '930505c@twcoc.com.tw', '', '', '156', '930505C', '930505C');
INSERT INTO `user_sso` VALUES ('200', '890918@twcoc.com.tw', '', '', '157', '890918A', '890918A');
INSERT INTO `user_sso` VALUES ('201', '810727@twcoc.com.tw', '', '', '158', '810727A', '810727A');
INSERT INTO `user_sso` VALUES ('202', 'jansom@twcoc.com.tw', '', '', '159', '980302A', '980302A');
INSERT INTO `user_sso` VALUES ('203', '110602@twcoc.com.tw', '', '', '160', '110602A', '110602A');
INSERT INTO `user_sso` VALUES ('204', '791101e@twcoc.com.tw', '', '', '161', '791101E', '791101E');
INSERT INTO `user_sso` VALUES ('205', '930226@twcoc.com.tw', '', '', '162', '930226A', '930226A');
INSERT INTO `user_sso` VALUES ('206', '930226d@twcoc.com.tw', '', '', '163', '990323D', '990323D');
INSERT INTO `user_sso` VALUES ('207', '830518@twcoc.com.tw', '', '', '164', '830518A', '830518A');
INSERT INTO `user_sso` VALUES ('208', '810622@twcoc.com.tw', '', '', '165', '810622A', '810622A');
INSERT INTO `user_sso` VALUES ('209', '960621@twcoc.com.tw', '', '', '166', '960621A', '960621A');
INSERT INTO `user_sso` VALUES ('210', '900220@twcoc.com.tw', '', '', '167', '900220A', '900220A');
INSERT INTO `user_sso` VALUES ('211', '900905@twcoc.com.tw', '', '', '168', '900905A', '900905A');
INSERT INTO `user_sso` VALUES ('212', '820517@twcoc.com.tw', '', '', '169', '820517A', '820517A');
INSERT INTO `user_sso` VALUES ('213', 'tcchen@twcoc.com.tw', '', '', '170', '790716B', '790716B');
INSERT INTO `user_sso` VALUES ('214', '940913d@twcoc.com.tw', '', '', '171', '940913D', '940913D');
INSERT INTO `user_sso` VALUES ('215', '980803@twcoc.com.tw', '', '', '172', '980803D', '980803D');
INSERT INTO `user_sso` VALUES ('216', '880224@twcoc.com.tw', '', '', '173', '880224A', '880224A');
INSERT INTO `user_sso` VALUES ('217', '981118@twcoc.com.tw', '', '', '174', '981118A', '981118A');
INSERT INTO `user_sso` VALUES ('218', '120221@twcoc.com.tw', '', '', '175', '120221A', '120221A');
INSERT INTO `user_sso` VALUES ('219', '791201j@twcoc.com.tw', '', '', '176', '791201J', '791201J');
INSERT INTO `user_sso` VALUES ('220', '900423@twcoc.com.tw', '', '', '177', '900423A', '900423A');
INSERT INTO `user_sso` VALUES ('221', '860304@twcoc.com.tw', '', '', '178', '860304A', '860304A');
INSERT INTO `user_sso` VALUES ('222', '930503@twcoc.com.tw', '', '', '179', '930503A', '930503A');
INSERT INTO `user_sso` VALUES ('223', '140818@twcoc.com.tw', '', '', '180', '140818A', '140818A');
INSERT INTO `user_sso` VALUES ('224', '160815@twcoc.com.tw', '', '', '181', '160815A', '160815A');
INSERT INTO `user_sso` VALUES ('225', '931012@twcoc.com.tw', '', '', '182', '931012A', '931012A');
INSERT INTO `user_sso` VALUES ('226', '980803@twcoc.com.tw', '', '', '183', '980803A', '980803A');
INSERT INTO `user_sso` VALUES ('227', '120213@twcoc.com.tw', '', '', '184', '120213A', '120213A');
INSERT INTO `user_sso` VALUES ('228', '130603@twcoc.com.tw', '', '', '185', '130603A', '130603A');
INSERT INTO `user_sso` VALUES ('229', '150407@twcoc.com.tw', '', '', '186', '150407A', '150407A');
INSERT INTO `user_sso` VALUES ('230', '130819@twcoc.com.tw', '', '', '187', '130819A', '130819A');
INSERT INTO `user_sso` VALUES ('231', '110406@twcoc.com.tw', '', '', '188', '110406A', '110406A');
INSERT INTO `user_sso` VALUES ('232', '140321@twcoc.com.tw', '', '', '189', '140321A', '140321A');
INSERT INTO `user_sso` VALUES ('233', '160711@twcoc.com.tw', '', '', '190', '160711A', '160711A');
INSERT INTO `user_sso` VALUES ('234', '921020b@twcoc.com.tw', '', '', '191', '921020B', '921020B');
INSERT INTO `user_sso` VALUES ('235', '820223@twcoc.com.tw', '', '', '192', '820223A', '820223A');
INSERT INTO `user_sso` VALUES ('236', '840414@twcoc.com.tw', '', '', '193', '840414A', '840414A');
INSERT INTO `user_sso` VALUES ('237', '930922@twcoc.com.tw', '', '', '194', '930922A', '930922A');
INSERT INTO `user_sso` VALUES ('238', '960625@twcoc.com.tw', '', '', '195', '960625A', '960625A');
INSERT INTO `user_sso` VALUES ('239', '141204@twcoc.com.tw', '', '', '196', '141204A', '141204A');
INSERT INTO `user_sso` VALUES ('240', '850905@twcoc.com.tw', '', '', '197', '850905A', '850905A');
INSERT INTO `user_sso` VALUES ('241', '890821@twcoc.com.tw', '', '', '198', '890821A', '890821A');
INSERT INTO `user_sso` VALUES ('242', '160901@twcoc.com.tw', '', '', '199', '160901A', '160901A');
INSERT INTO `user_sso` VALUES ('243', '141201@twcoc.com.tw', '', '', '200', '141201A', '141201A');
INSERT INTO `user_sso` VALUES ('244', '141209@twcoc.com.tw', '', '', '201', '141209A', '141209A');
INSERT INTO `user_sso` VALUES ('245', '150518@twcoc.com.tw', '', '', '202', '150518A', '150518A');
INSERT INTO `user_sso` VALUES ('246', '140714b@twcoc.com.tw', '', '', '203', '160419A', '160419A');
INSERT INTO `user_sso` VALUES ('247', '150302@twcoc.com.tw', '', '', '204', '150302A', '150302A');
INSERT INTO `user_sso` VALUES ('248', '130325@twcoc.com.tw', '', '', '205', '130325A', '130325A');
INSERT INTO `user_sso` VALUES ('249', '140605@twcoc.com.tw', '', '', '206', '140605A', '140605A');
INSERT INTO `user_sso` VALUES ('250', '151201@twcoc.com.tw', '', '', '207', '151201A', '151201A');
INSERT INTO `user_sso` VALUES ('251', '861201@twcoc.com.tw', '', '', '208', '861201A', '861201A');
INSERT INTO `user_sso` VALUES ('252', '950301b@twcoc.com.tw', '', '', '209', '950301B', '950301B');
INSERT INTO `user_sso` VALUES ('253', '110425@twcoc.com.tw', '', '', '210', '110425A', '110425A');
INSERT INTO `user_sso` VALUES ('254', '110620@twcoc.com.tw', '', '', '211', '110620A', '110620A');
INSERT INTO `user_sso` VALUES ('255', '130415@twcoc.com.tw', '', '', '212', '130415A', '130415A');
INSERT INTO `user_sso` VALUES ('256', '160509@twcoc.com.tw', '', '', '213', '160509A', '160509A');
INSERT INTO `user_sso` VALUES ('257', '931109@twcoc.com.tw', '', '', '214', '931109A', '931109A');
INSERT INTO `user_sso` VALUES ('258', '850906@twcoc.com.tw', '', '', '215', '850906A', '850906A');
INSERT INTO `user_sso` VALUES ('259', '860331@twcoc.com.tw', '', '', '216', '860331A', '860331A');
INSERT INTO `user_sso` VALUES ('260', '940426@twcoc.com.tw', '', '', '217', '940426A', '940426A');
INSERT INTO `user_sso` VALUES ('261', '990301e@twcoc.com.tw', '', '', '218', '990301E', '990301E');
INSERT INTO `user_sso` VALUES ('262', '900903@twcoc.com.tw', '', '', '219', '900903A', '900903A');
INSERT INTO `user_sso` VALUES ('263', '131209@twcoc.com.tw', '', '', '220', '131209A', '131209A');
INSERT INTO `user_sso` VALUES ('264', '880104b@twcoc.com.tw', '', '', '221', '880104B', '880104B');
INSERT INTO `user_sso` VALUES ('265', '930823@twcoc.com.tw', '', '', '222', '930823A', '930823A');
INSERT INTO `user_sso` VALUES ('266', '120201@twcoc.com.tw', '', '', '223', '120201A', '120201A');
INSERT INTO `user_sso` VALUES ('267', '990308b@twcoc.com.tw', '', '', '224', '990308B', '990308B');
INSERT INTO `user_sso` VALUES ('268', '830216@twcoc.com.tw', '', '', '225', '830216A', '830216A');
INSERT INTO `user_sso` VALUES ('269', 'raymond.tang@twcoc.com.tw', '', '', '226', '140428A', '140428A');
INSERT INTO `user_sso` VALUES ('270', '890913@twcoc.com.tw', '', '', '227', '890913A', '890913A');
INSERT INTO `user_sso` VALUES ('271', '791001@twcoc.com.tw', '', '', '228', '791001A', '791001A');
INSERT INTO `user_sso` VALUES ('272', '110112@twcoc.com.tw', '', '', '229', '110112A', '110112A');
INSERT INTO `user_sso` VALUES ('273', '121126@twcoc.com.tw', '', '', '230', '121126A', '121126A');
INSERT INTO `user_sso` VALUES ('274', '870904@twcoc.com.tw', '', '', '231', '870904A', '870904A');
INSERT INTO `user_sso` VALUES ('275', '981007@twcoc.com.tw', '', '', '232', '981007A', '981007A');
INSERT INTO `user_sso` VALUES ('276', '990301b@twcoc.com.tw', '', '', '233', '990301B', '990301B');
INSERT INTO `user_sso` VALUES ('277', 'dennes@twcoc.com.tw', '', '', '234', '920317A', '920317A');
INSERT INTO `user_sso` VALUES ('278', '920915@twcoc.com.tw', '', '', '235', '920915A', '920915A');
INSERT INTO `user_sso` VALUES ('279', '940214@twcoc.com.tw', '', '', '236', '940214A', '940214A');
INSERT INTO `user_sso` VALUES ('280', '920922@twcoc.com.tw', '', '', '237', '920922A', '920922A');
INSERT INTO `user_sso` VALUES ('281', '931019e@twcoc.com.tw', '', '', '238', '931019E', '931019E');
INSERT INTO `user_sso` VALUES ('282', '930308@twcoc.com.tw', '', '', '239', '930308A', '930308A');
INSERT INTO `user_sso` VALUES ('283', '920818b@twcoc.com.tw', '', '', '240', '920818B', '920818B');
UNLOCK TABLES;
