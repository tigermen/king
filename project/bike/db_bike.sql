/*
 Navicat Premium Data Transfer

 Source Server         : tiger-mysql
 Source Server Type    : MySQL
 Source Server Version : 50560
 Source Host           : localhost:3306
 Source Schema         : db_bike

 Target Server Type    : MySQL
 Target Server Version : 50560
 File Encoding         : 65001

 Date: 21/05/2018 20:34:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tsys_menu
-- ----------------------------
DROP TABLE IF EXISTS `tsys_menu`;
CREATE TABLE `tsys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `url` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `parent` int(11) NULL DEFAULT NULL,
  `level` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tsys_menu
-- ----------------------------
INSERT INTO `tsys_menu` VALUES (1, '系统菜单', NULL, 0, 0, 1, NULL);
INSERT INTO `tsys_menu` VALUES (2, '系统管理', NULL, 1, 1, 1, NULL);
INSERT INTO `tsys_menu` VALUES (3, '车辆管理', NULL, 1, 1, 2, NULL);
INSERT INTO `tsys_menu` VALUES (4, '卡业务管理', NULL, 1, 1, 3, NULL);
INSERT INTO `tsys_menu` VALUES (5, '报表管理', NULL, 1, 1, 4, NULL);
INSERT INTO `tsys_menu` VALUES (6, '系统菜单设置', NULL, 2, 2, 1, NULL);
INSERT INTO `tsys_menu` VALUES (7, '角色设置', NULL, 2, 2, 2, NULL);
INSERT INTO `tsys_menu` VALUES (8, '用户设置', NULL, 2, 2, 3, NULL);

-- ----------------------------
-- Table structure for tsys_menurole
-- ----------------------------
DROP TABLE IF EXISTS `tsys_menurole`;
CREATE TABLE `tsys_menurole`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tsys_role
-- ----------------------------
DROP TABLE IF EXISTS `tsys_role`;
CREATE TABLE `tsys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tsys_user
-- ----------------------------
DROP TABLE IF EXISTS `tsys_user`;
CREATE TABLE `tsys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usercode` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `qqacc` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sinaacc` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `wechatacc` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tsys_userrole
-- ----------------------------
DROP TABLE IF EXISTS `tsys_userrole`;
CREATE TABLE `tsys_userrole`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Function structure for getPriority
-- ----------------------------
DROP FUNCTION IF EXISTS `getPriority`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getPriority`(menu_id INT) RETURNS varchar(255) CHARSET utf8 COLLATE utf8_bin
    DETERMINISTIC
begin  
    DECLARE parent_id INT DEFAULT 0;  
    DECLARE order_id INT DEFAULT 0;  
    DECLARE gPriority VARCHAR(255) DEFAULT '';  
     
    SELECT parent,`order` INTO parent_id,order_id FROM tsys_menu WHERE id = menu_id;  
  
    if parent_id > 0 then   
    SET gPriority = CONCAT(order_id,menu_id);  
    else   
    SET gPriority = menu_id;  
    end if;       
           
    WHILE parent_id > 0 DO  /*0为根*/  
      SET gPriority = CONCAT(parent_id, '.', gPriority);  
      SELECT parent INTO parent_id FROM tsys_menu WHERE id = parent_id;  
    END WHILE;   
    RETURN gPriority;  
  end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
