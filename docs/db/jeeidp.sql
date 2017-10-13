/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : jeeidp

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2017-04-05 20:25:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cg_column_config
-- ----------------------------
DROP TABLE IF EXISTS `cg_column_config`;
CREATE TABLE `cg_column_config` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键ID',
  `table_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '表ID',
  `column_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列名',
  `column_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列类型',
  `column_length` int(11) DEFAULT NULL COMMENT '列长度',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '字段名',
  `field_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '字段类型',
  `nullable` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relation_table` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联表名',
  `relation_column_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联表关联ID',
  `relation_column_text` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联表显示字段',
  `sort` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '排序',
  `is_key` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否主键',
  `show_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '页面显示类型',
  `is_query` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否查询',
  `query_model` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '查询模式',
  `query_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '查询类型',
  `is_show_list` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列表是否显示',
  `is_show_form` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表单是否显示',
  `form_valid_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表单验证类型',
  `order_num` int(11) DEFAULT NULL COMMENT '字段顺序',
  `create_user` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人员',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人员',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cg_column_config
-- ----------------------------
INSERT INTO `cg_column_config` VALUES ('0ffbd23e2cbc48559f3bb6a33b269a4f', '4bf195d2c4bf4c12b5da69280380e2b9', 'age', 'int', '10', '年龄', 'age', 'Integer', 'Y', null, null, null, 'N', 'N', 'text', 'Y', 'group', 'between', 'Y', 'Y', '', '3', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('2c5fd09ed6f1428dad47e1ab65a3d546', '4bf195d2c4bf4c12b5da69280380e2b9', 'demo_id', 'varchar', '32', '主键', 'demoId', 'String', 'N', null, null, null, 'N', 'Y', 'text', 'N', 'single', '=', 'N', 'N', '', '1', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('95d38c041bb343739775221f98885b28', '4bf195d2c4bf4c12b5da69280380e2b9', 'birthday', 'datetime', null, '生日', 'birthday', 'Date', 'Y', null, null, null, 'N', 'N', 'date', 'Y', 'group', '=', 'Y', 'Y', '', '4', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('9656572d798c4b5da863320de7f1c89f', '4bf195d2c4bf4c12b5da69280380e2b9', 'sex', 'char', '1', '性别', 'sex', 'String', 'Y', null, null, null, 'N', 'N', 'radio', 'N', 'single', '=', 'Y', 'Y', '', '6', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('b1fbcfae06c74ef38b47fb129cb0c856', '4bf195d2c4bf4c12b5da69280380e2b9', 'hobby', 'varchar', '100', '爱好', 'hobby', 'String', 'Y', null, null, null, 'N', 'N', 'checkbox', 'N', 'single', '=', 'N', 'Y', '', '7', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('cdc7856f19e94cc5b8c643cb66d70c30', '4bf195d2c4bf4c12b5da69280380e2b9', 'dept_id', 'varchar', '32', '部门', 'deptId', 'String', 'Y', null, null, null, 'N', 'N', 'select', 'Y', 'single', '=', 'Y', 'Y', '', '5', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('e4418eb7f92046688281b6c40afc966f', '4bf195d2c4bf4c12b5da69280380e2b9', 'remark', 'text', '65535', '备注', 'remark', 'String', 'Y', null, null, null, 'N', 'N', 'textarea', 'N', 'single', '=', 'N', 'Y', '', '8', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('f35ae33b1d9a4c84b23de1d6b394f84c', '4bf195d2c4bf4c12b5da69280380e2b9', 'name', 'varchar', '100', '姓名', 'name', 'String', 'Y', null, null, null, 'N', 'N', 'text', 'Y', 'single', 'like', 'Y', 'Y', 'required', '2', null, null, null, null);

-- ----------------------------
-- Table structure for cg_data_source
-- ----------------------------
DROP TABLE IF EXISTS `cg_data_source`;
CREATE TABLE `cg_data_source` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `database_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '数据库类型',
  `database_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '数据库名称',
  `server` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务器IP',
  `port` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '端口号',
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `create_user` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人员',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人员',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cg_data_source
-- ----------------------------
INSERT INTO `cg_data_source` VALUES ('37039a75098c4e7eb4020f5b29e46d9a', '当前数据库', 'mysql', 'jeeidp', 'localhost', '3306', 'root', '123456', null, null, null, null);

-- ----------------------------
-- Table structure for cg_table_config
-- ----------------------------
DROP TABLE IF EXISTS `cg_table_config`;
CREATE TABLE `cg_table_config` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键ID',
  `table_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表名',
  `class_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `is_checkbox` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否多选框',
  `is_page` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否分页',
  `is_tree` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否树',
  `create_user` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人员',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人员',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cg_table_config
-- ----------------------------
INSERT INTO `cg_table_config` VALUES ('4bf195d2c4bf4c12b5da69280380e2b9', 'demo_test', 'DemoTest', '测试功能', 'N', 'Y', null, '1', '2017-01-19 23:14:33', '1', '2017-01-19 23:22:22');

-- ----------------------------
-- Table structure for demo_test
-- ----------------------------
DROP TABLE IF EXISTS `demo_test`;
CREATE TABLE `demo_test` (
  `demo_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `dept_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hobby` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`demo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of demo_test
-- ----------------------------
INSERT INTO `demo_test` VALUES ('9de57040b5604d06af5b24b5cf931324', '22', '22', '2017-01-19 00:00:00', '1', '1', '1,2', '22');

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '编码',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `group_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分组id',
  `sort` int(2) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('40', '1', '男', '9', '1');
INSERT INTO `sys_dictionary` VALUES ('41', '0', '女', '9', '2');
INSERT INTO `sys_dictionary` VALUES ('42', 'test', '测试', null, null);
INSERT INTO `sys_dictionary` VALUES ('43', '1', '测试1', '42', '1');
INSERT INTO `sys_dictionary` VALUES ('44', '2', '测试2', '42', '2');
INSERT INTO `sys_dictionary` VALUES ('45', '3', '测试3', '42', '3');
INSERT INTO `sys_dictionary` VALUES ('9', 'sex', '性别', null, null);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单名称',
  `menu_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单路径',
  `menu_icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单图标',
  `parent_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父级菜单ID',
  `sort` int(8) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('11', '系统管理', '', 'icon-settings', '0', '2');
INSERT INTO `sys_menu` VALUES ('12', '用户管理', '/user/init', 'icon-users', '11', '1');
INSERT INTO `sys_menu` VALUES ('13', '角色管理', '/sysRole/init', 'icon-user', '11', '2');
INSERT INTO `sys_menu` VALUES ('14', '菜单管理', '/menu/init', 'icon-notebook', '11', '3');
INSERT INTO `sys_menu` VALUES ('15', '代码生成器', '', 'icon-printer', '0', '3');
INSERT INTO `sys_menu` VALUES ('16', '数据库连接', '/dataSource/init', 'icon-link', '15', '1');
INSERT INTO `sys_menu` VALUES ('17', '表单配置', '/tableConfig/init', 'icon-film', '15', '2');
INSERT INTO `sys_menu` VALUES ('19', '组织管理', '/org/init', 'icon-vector', '11', '4');
INSERT INTO `sys_menu` VALUES ('20', '图标管理', '/index/icon', 'icon-support', '11', '6');
INSERT INTO `sys_menu` VALUES ('21', '数据字典', '/sysDictionary/init', 'icon-book-open', '11', '5');
INSERT INTO `sys_menu` VALUES ('22', '代码生成测试', '', 'icon-emoticon-smile', '0', '3');
INSERT INTO `sys_menu` VALUES ('23', '测试功能', '/demoTest/init', 'icon-emoticon-smile', '22', '1');

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ID',
  `org_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组织名称',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `parent_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父级菜单ID',
  `create_user` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('1', '001', '济南分公司', '济南', '0', null, null, null, null);
INSERT INTO `sys_org` VALUES ('2', '002', '北京分公司', '北京', '0', null, null, null, null);
INSERT INTO `sys_org` VALUES ('3', '003', '上海分公司', '上海', '0', null, null, null, null);
INSERT INTO `sys_org` VALUES ('4', '001001', '行政部', '行政', '1', null, null, null, null);
INSERT INTO `sys_org` VALUES ('5', '001002', '技术部', '技术', '1', null, null, null, null);
INSERT INTO `sys_org` VALUES ('6', '003002', '人事部', '人事', '3', null, null, null, null);
INSERT INTO `sys_org` VALUES ('7', '003001', '行政部', '行政', '3', null, null, null, null);
INSERT INTO `sys_org` VALUES ('8', '004', '杭州分公司', '杭州', '0', null, null, null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `role_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色编码',
  `role_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `create_user` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '001', '系统管理员', '所有权限', null, null, null, null);
INSERT INTO `sys_role` VALUES ('2', '002', '测试角色2', '002', null, null, null, null);
INSERT INTO `sys_role` VALUES ('3', '003', '测试角色3', '003', null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色ID',
  `menu_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('00767f4d7aa14287bf4576be9be51c53', '3', '16');
INSERT INTO `sys_role_menu` VALUES ('101', '6', '11');
INSERT INTO `sys_role_menu` VALUES ('102', '6', '12');
INSERT INTO `sys_role_menu` VALUES ('103', '5', '11');
INSERT INTO `sys_role_menu` VALUES ('104', '5', '13');
INSERT INTO `sys_role_menu` VALUES ('115', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('116', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('117', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('118', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('119', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('120', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('121', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('122', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('123', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('124', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('125', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('126', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('21b4c28f66b04db7b16bc621fbcb4a67', '3', '17');
INSERT INTO `sys_role_menu` VALUES ('513c81aed0584f19afdcd2ae82de6acf', '3', '15');
INSERT INTO `sys_role_menu` VALUES ('75', '2', '11');
INSERT INTO `sys_role_menu` VALUES ('76', '2', '12');
INSERT INTO `sys_role_menu` VALUES ('77', '2', '15');
INSERT INTO `sys_role_menu` VALUES ('78', '2', '16');
INSERT INTO `sys_role_menu` VALUES ('82', '4', '11');
INSERT INTO `sys_role_menu` VALUES ('83', '4', '12');
INSERT INTO `sys_role_menu` VALUES ('84', '4', '13');
INSERT INTO `sys_role_menu` VALUES ('85', '4', '14');
INSERT INTO `sys_role_menu` VALUES ('86', '4', '19');
INSERT INTO `sys_role_menu` VALUES ('87', '4', '20');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ID',
  `username` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `org_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组织',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `user_photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '删除标识',
  `create_user` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', '管理员', '5', '2016-08-07', '15912341234', 'test@test.com', '系统管理员', '20160807/20160807001237253e0729415245869bc90e7e4d239f7c.jpg', '0', null, null, null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户ID',
  `role_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('21a19c666e3849eb8a3f1e5ccfa53859', '1', '2');
INSERT INTO `sys_user_role` VALUES ('bbf1fe27e945402f8bdba893f42abac6', '1', '1');
