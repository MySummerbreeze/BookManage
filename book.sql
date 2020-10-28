/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50643
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50643
File Encoding         : 65001

Date: 2020-10-28 16:41:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bid` int(255) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '书名',
  `author` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '作者',
  `detail` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '详情',
  `status` int(255) NOT NULL COMMENT '书的状态分为两种，第一种是存在1，第二种是被借0',
  `price` int(255) NOT NULL COMMENT '价格',
  `category` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '类别',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for bookorder
-- ----------------------------
DROP TABLE IF EXISTS `bookorder`;
CREATE TABLE `bookorder` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `orderstatus` int(255) NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `grade` int(255) NOT NULL COMMENT '0是超级管理员：能够进入系统管理界面，1是普通用户，进入普通用户界面，能够进行借书还书操作',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
