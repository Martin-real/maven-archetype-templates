/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : springboot-easyadmin

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-05-25 13:49:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表主键',
  `name` varchar(20) NOT NULL COMMENT '用户名',
  `psw` varchar(32) NOT NULL COMMENT '用户密码MD5加密',
  `email` varchar(32) NOT NULL COMMENT '用户邮箱',
  `creator` int(11) NOT NULL COMMENT '创建人，0为初始化',
  `flag` int(1) NOT NULL DEFAULT '1' COMMENT '用户状态，1启用，0禁用',
  `last_login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `update_user` int(11) DEFAULT NULL COMMENT '更新者id',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('-1', 'root', 'E10ADC3949BA59ABBE56E057F20F883E', 'admin@raye.wang', '0', '1', '2018-01-04 15:32:15', '1', '2017-04-07 22:23:15');
INSERT INTO `admin_user` VALUES ('1', 'test', 'E10ADC3949BA59ABBE56E057F20F883E', 'test@raye.wang', '20', '1', '2018-01-04 15:30:04', '1', '2017-04-05 22:55:17');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `url` varchar(500) DEFAULT NULL COMMENT '网址',
  `icon` varchar(20) DEFAULT NULL COMMENT '显示的图标',
  `menu_type` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '类型，0 菜单，1 连接网址,2 隐藏连接',
  `display` int(11) NOT NULL DEFAULT '1' COMMENT '显示排序',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级的id，引用本表id字段',
  `creator` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id，0为超级管理员',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '更新者id',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '是否启用，0 禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '系统首页', '/admin/index', null, '2', '1', '0', '0', '2017-03-31 20:16:57', '0', null, '1');
INSERT INTO `menu` VALUES ('2', '修改密码', '/admin/user/updatepass', 'fa-wrench', '2', '0', '0', '0', '2017-04-05 21:33:39', '0', null, '1');
INSERT INTO `menu` VALUES ('3', '系统配置', '12', 'fa-wrench', '0', '1', '0', '0', '2017-03-31 20:16:43', '0', '2017-04-05 20:30:53', '1');
INSERT INTO `menu` VALUES ('4', '菜单配置', '/admin/menu', 'fa-list', '0', '1', '3', '0', '2017-03-31 20:16:45', '0', '2017-04-05 20:31:10', '1');
INSERT INTO `menu` VALUES ('5', '角色管理', '/admin/role', null, '0', '2', '3', '0', '2017-03-31 20:16:48', '0', null, '1');
INSERT INTO `menu` VALUES ('6', '角色权限', '/admin/role/menu', null, '2', '0', '3', '0', '2017-03-31 20:16:52', '0', null, '1');
INSERT INTO `menu` VALUES ('7', '用户管理', '/admin/user', null, '1', '2', '3', '0', '2017-03-31 20:16:54', '0', null, '1');
INSERT INTO `menu` VALUES ('8', '新增菜单', '/admin/menu/edit', null, '2', '0', '4', '0', '2017-03-31 20:17:01', '0', null, '1');
INSERT INTO `menu` VALUES ('9', '删除菜单', '/admin/menu/delete', null, '2', '0', '4', '0', '2017-03-31 20:17:04', '0', null, '1');
INSERT INTO `menu` VALUES ('10', '编辑角色', '/admin/role/edit', null, '2', '0', '5', '0', '2017-03-31 20:17:06', '0', null, '1');
INSERT INTO `menu` VALUES ('11', '删除角色', '/admin/role/delete', null, '2', '0', '5', '0', '2017-03-31 20:17:07', '0', null, '1');
INSERT INTO `menu` VALUES ('12', '角色资源管理', '/admin/role/menu', null, '2', '0', '5', '0', '2017-03-31 20:17:08', '0', null, '1');
INSERT INTO `menu` VALUES ('13', '编辑用户', '/admin/user/edit', null, '2', '0', '7', '0', '2017-03-31 20:17:09', '0', null, '1');
INSERT INTO `menu` VALUES ('14', '删除用户', '/admin/user/delete', null, '2', '0', '7', '0', '2017-03-31 20:17:10', '0', null, '1');
INSERT INTO `menu` VALUES ('15', '用户角色管理', '/admin/user/role', null, '2', '0', '7', '0', '2017-03-31 20:17:12', '0', null, '1');
INSERT INTO `menu` VALUES ('16', '菜单配置', '', null, '2', '0', '7', '20', '2017-04-02 11:38:28', '0', null, '1');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色表主键',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` int(11) DEFAULT '0' COMMENT '用户id，0为角色，有关联时则为用户的单独权限',
  `description` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `update_user` int(11) DEFAULT NULL COMMENT '更新者id',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('-1', '默认权限', '2017-03-18 17:35:42', '0', '用户默认拥有的权限，无需授权给用户', '-1', '2017-04-05 21:32:16');

-- ----------------------------
-- Table structure for `role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `roleid` int(11) NOT NULL COMMENT '角色id',
  `menuid` int(11) NOT NULL COMMENT '菜单id',
  `flag` int(1) NOT NULL DEFAULT '1' COMMENT '1为有权限，0为没有权限（防止以后会出现角色有权限但是个人没有权限的情况）',
  `creator` int(11) NOT NULL COMMENT '创建人，0为初始化',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`menuid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('-1', '1', '1', '0', '2017-04-06 23:18:24');
INSERT INTO `role_menu` VALUES ('-1', '2', '1', '0', '2017-04-06 23:18:24');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `userid` int(11) NOT NULL COMMENT '用户id',
  `roleid` int(11) NOT NULL COMMENT '角色id',
  `creator` int(11) NOT NULL COMMENT '创建人，0为初始化',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`userid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------

-- ----------------------------
-- Procedure structure for `delete_menu`
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_menu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_menu`(IN `menuid` int)
BEGIN

	DECLARE rowNUM INT DEFAULT 0;
	create temporary table if not exists menu_del_temp -- 不存在则创建临时表
  (
     id INT
  );
	create temporary table if not exists menu_del_temp2 -- 不存在则创建临时表
  (
     id INT
  );
create temporary table if not exists menu_del_temp3 -- 不存在则创建临时表
  (
     id INT
  );
	TRUNCATE TABLE menu_del_temp2;
	TRUNCATE TABLE menu_del_temp; -- 清空临时表
		INSERT INTO menu_del_temp SELECT id FROM  menu where parent_id=menuid;
	-- DELETE FROM category WHERE ID IN (SELECT id FROM category_del_temp);
	INSERT INTO menu_del_temp2 SELECT id FROM  menu where parent_id IN (SELECT id FROM menu_del_temp);
	SELECT COUNT(id) INTO rowNUM FROM menu_del_temp2;
	WHILE rowNUM > 0 DO
		INSERT INTO menu_del_temp SELECT id FROM menu_del_temp2;
		TRUNCATE TABLE menu_del_temp3;
		INSERT INTO menu_del_temp3 SELECT id FROM menu_del_temp2;
		TRUNCATE TABLE menu_del_temp2;
		INSERT INTO menu_del_temp2 SELECT id FROM  menu where parent_id IN (SELECT id FROM menu_del_temp3);
		SELECT COUNT(id) INTO rowNUM FROM menu_del_temp2;
	END WHILE;
	INSERT INTO menu_del_temp(id) values(menuid);
	DELETE FROM menu WHERE id IN (SELECT id FROM menu_del_temp);
	DELETE FROM role_menu WHERE menuid IN (SELECT id FROM menu_del_temp);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `role_menu_update`
-- ----------------------------
DROP PROCEDURE IF EXISTS `role_menu_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `role_menu_update`(IN menuids varchar(3000),IN i_roleid INT,IN userid INT)
BEGIN

-- 拆分结果

DECLARE cnt INT DEFAULT 0;

DECLARE i INT DEFAULT 0;

SET cnt = func_split_TotalLength(menuids,',');
DELETE FROM role_menu WHERE roleid = i_roleid;

WHILE i < cnt

DO

    SET i = i + 1;

    INSERT INTO role_menu(roleid,menuid,creator) VALUES (i_roleid,func_split(menuids,',',i),userid);

END WHILE;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `user_role_update`
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_role_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_role_update`(IN roleids varchar(3000),IN i_userid INT,IN i_creator INT)
BEGIN

-- 拆分结果

DECLARE cnt INT DEFAULT 0;

DECLARE i INT DEFAULT 0;

SET cnt = func_split_TotalLength(roleids,',');
DELETE FROM user_role WHERE userid = i_userid;

WHILE i < cnt

DO

    SET i = i + 1;

    INSERT INTO user_role(userid,roleid,creator) VALUES (i_userid,func_split(roleids,',',i),i_creator);

END WHILE;

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `func_split`
-- ----------------------------
DROP FUNCTION IF EXISTS `func_split`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_split`(f_string varchar(1000),f_delimiter varchar(5),f_order int) RETURNS varchar(255) CHARSET utf8
BEGIN
        declare result varchar(255) default '';

        set result = reverse(substring_index(reverse(substring_index(f_string,f_delimiter,f_order)),f_delimiter,1));

        return result;

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `func_split_TotalLength`
-- ----------------------------
DROP FUNCTION IF EXISTS `func_split_TotalLength`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_split_TotalLength`(f_string varchar(1000),f_delimiter varchar(5)) RETURNS int(11)
BEGIN

    return 1+(length(f_string) - length(replace(f_string,f_delimiter,'')));

END
;;
DELIMITER ;
