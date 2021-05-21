DROP DATABASE IF EXISTS `anji`;
CREATE DATABASE `anji`;
use `anji`;

set global innodb_large_prefix=on;

set global innodb_file_per_table=on;

set global innodb_file_format=BARRACUDA;

DROP DATABASE IF EXISTS `nx_system_file_info`;
CREATE TABLE `nx_system_file_info` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
`originName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原始文件名',
`fileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '存储文件名',
PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='文件信息表';

DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
`name` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '姓名',
`password` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '密码',
`nickName` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '昵称',
`sex` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '性别',
`age` int(10) COMMENT '年龄',
`birthday` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '生日',
`phone` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '手机号',
`address` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '地址',
`code` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '编号',
`email` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '邮箱',
`cardId` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '身份证',
`account` double(10,2) DEFAULT NULL COMMENT '余额',
`level` int(10) NOT NULL DEFAULT '1' COMMENT '权限等级',
UNIQUE KEY `uk_name` (`name`) USING BTREE,
PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='管理员信息表';


DROP TABLE IF EXISTS `saller_info`;
CREATE TABLE `saller_info` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
`name` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '姓名',
`password` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '密码',
`nickName` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '昵称',
`sex` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '性别',
`age` int(10) COMMENT '年龄',
`birthday` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '生日',
`phone` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '手机号',
`address` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '地址',
`email` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '邮箱',
`cardId` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '身份证',
`account` double(10,2) DEFAULT NULL COMMENT '余额',
`level` int(10) NOT NULL DEFAULT '2' COMMENT '权限等级',
UNIQUE KEY `uk_name` (`name`) USING BTREE,
PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商家信息表';


DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
`name` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '姓名',
`password` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '密码',
`nickName` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '昵称',
`sex` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '性别',
`age` int(10) COMMENT '年龄',
`birthday` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '生日',
`phone` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '手机号',
`address` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '地址',
`email` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '邮箱',
`cardId` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '身份证',
`account` double(10,2) DEFAULT NULL COMMENT '余额',
`level` int(10) NOT NULL DEFAULT '3' COMMENT '权限等级',
UNIQUE KEY `uk_name` (`name`) USING BTREE,
PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';


DROP TABLE IF EXISTS `advertiser_info`;
CREATE TABLE `advertiser_info` (
`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
`name` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '公告名称',
`content` longtext COMMENT '公告内容',
`time` varchar(255) COLLATE utf8mb4_unicode_ci COMMENT '公告时间',
PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='公告信息表';



DROP TABLE IF EXISTS `cart_info`;
CREATE TABLE `cart_info`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `count` int(10) NOT NULL DEFAULT 0 COMMENT '数量',
  `goodsId` bigint(10) NOT NULL DEFAULT 0 COMMENT '所属商品',
  `userId` bigint(10) NOT NULL DEFAULT 0 COMMENT '所属用户',
  `level` int(10) DEFAULT NULL COMMENT '用户等级',
  `createTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建时间',
PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='购物车信息表';


DROP TABLE IF EXISTS `comment_info`;
CREATE TABLE `comment_info`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '评价内容',
  `goodsId` bigint(10) NOT NULL DEFAULT 0 COMMENT '所属商品',
  `userId` bigint(10) NOT NULL DEFAULT 0 COMMENT '评价人id',
  `level` int(10) DEFAULT NULL COMMENT '用户等级',
  `createTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建时间',
PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品评价表';


DROP TABLE IF EXISTS `type_info`;
CREATE TABLE `type_info`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '类型描述',
PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品类别表';


DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '商品描述',
  `price` double(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `discount` double(10, 2) NULL DEFAULT 1.00 COMMENT '商品折扣',
  `sales` int(10) NOT NULL DEFAULT 0 COMMENT '商品销量',
  `hot` int(10) NOT NULL DEFAULT 0 COMMENT '商品点赞数',
  `recommend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '否' COMMENT '是否是推荐',
  `count` int(10) NOT NULL DEFAULT 0 COMMENT '商品库存',
  `typeId` bigint(20) NOT NULL DEFAULT 0 COMMENT '所属类别',
  `fileIds` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品图片id，用英文逗号隔开',
  `userId` bigint(10) NOT NULL DEFAULT 0 COMMENT '评价人id',
  `level` int(10) DEFAULT NULL COMMENT '用户等级',
PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品详情表';


DROP TABLE IF EXISTS `order_goods_rel`;
CREATE TABLE `order_goods_rel`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `orderId` bigint(20) NULL DEFAULT NULL COMMENT '订单ID',
  `goodsId` bigint(10) NOT NULL DEFAULT 0 COMMENT '所属商品',
  `count` int(11) NULL DEFAULT NULL COMMENT '商品数量',
PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='订单商品关系映射表';


DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `orderId` bigint(20) NULL DEFAULT NULL COMMENT '订单ID',
  `totalPrice` double(10, 2) NOT NULL DEFAULT 0.00 COMMENT '总价格',
  `userId` bigint(10) NOT NULL DEFAULT 0 COMMENT '所属用户',
  `level` int(10) DEFAULT NULL COMMENT '用户等级',
  `linkAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系地址',
  `linkPhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `linkMan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系人',
  `createTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '未发货' COMMENT '订单状态',
PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品订单信息表';


INSERT INTO `admin_info` (id, name, password, nickName, sex, age, birthday, phone, address, code, email, cardId, level, account) VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '男', 22, '2021-03-24 10:40:47', '18843232356', '上海市', '111', 'aa@163.com', '342425199001116372', 1, 0);
INSERT INTO `admin_info` (id, name, password, nickName, sex, age, birthday, phone, address, code, email, cardId, level, account) VALUES (2, 'admin2', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '男', 23, '2021-03-24 10:40:47', '18843232356', '北京市', '222', 'bb@163.com', '342425199001116376', 1, 0);
INSERT INTO `admin_info` (id, name, password, nickName, sex, age, birthday, phone, address, code, email, cardId, level, account) VALUES (3, 'admin3', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '女', 32, '2021-03-24 10:40:47', '18843232356', '合肥市', '333', 'cc@163.com', '342425199001116323', 1, 0);
INSERT INTO `admin_info` (id, name, password, nickName, sex, age, birthday, phone, address, code, email, cardId, level, account) VALUES (4, 'admin4', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '女', 24, '2021-03-24 10:40:47', '18843232356', '北京市', '444', 'hahaha@126.com', '342425199001116837', 1, 0);
INSERT INTO `admin_info` (id, name, password, nickName, sex, age, birthday, phone, address, code, email, cardId, level, account) VALUES (5, 'admin5', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '男', 25, '2021-03-24 10:40:47', '18843232356', '合肥市', '555', 'hello@126.com', '342425199001116309', 1, 0);
INSERT INTO `admin_info` (id, name, password, nickName, sex, age, birthday, phone, address, code, email, cardId, level, account) VALUES (6, 'admin6', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '男', 26, '2021-03-24 10:40:47', '18843232356', '北京市', '666', '1212@qq.com', '342425199001116984', 1, 0);
INSERT INTO `admin_info` (id, name, password, nickName, sex, age, birthday, phone, address, code, email, cardId, level, account) VALUES (7, 'admin7', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '男', 21, '2021-03-24 10:40:47', '18843232356', '合肥市', '777', '8765@qq.com', '342425199001116303', 1, 0);
INSERT INTO `admin_info` (id, name, password, nickName, sex, age, birthday, phone, address, code, email, cardId, level, account) VALUES (8, 'admin8', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '男', 31, '2021-03-24 10:40:47', '18843232356', '北京市', '888', '9080@qq.com', '342425199001116910', 1, 0);
INSERT INTO `admin_info` (id, name, password, nickName, sex, age, birthday, phone, address, code, email, cardId, level, account) VALUES (9, 'admin9', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '男', 34, '2021-03-24 10:40:47', '18843232356', '合肥市', '999', 'shjs@126.com', '342425199001116345', 1, 0);
INSERT INTO `admin_info` (id, name, password, nickName, sex, age, birthday, phone, address, code, email, cardId, level, account) VALUES (10, 'admin10', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '女', 33, '2021-03-24 10:40:47', '18843232356', '深圳市', '000', '666@qq.com', '342425199001116234', 1, 0);


INSERT INTO `saller_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (1, '张天志', 'e10adc3949ba59abbe56e057f20f883e', '老张', '男', 22, '2021-03-24 10:40:47', '18843232356', '上海市', 'aa@163.com', '342425199001116372', 2, 0);
INSERT INTO `saller_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (2, '赵千里', 'e10adc3949ba59abbe56e057f20f883e', '老赵', '男', 23, '2021-03-24 10:40:47', '18843232356', '北京市', 'bb@163.com', '342425199001116376', 2, 0);
INSERT INTO `saller_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (3, '钱优优', 'e10adc3949ba59abbe56e057f20f883e', '老钱', '女', 32, '2021-03-24 10:40:47', '18843232356', '合肥市', 'cc@163.com', '342425199001116323', 2, 0);
INSERT INTO `saller_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (4, '贾宏鑫', 'e10adc3949ba59abbe56e057f20f883e', '老贾', '女', 24, '2021-03-24 10:40:47', '18843232356', '北京市', 'hahaha@126.com', '342425199001116837', 2, 0);
INSERT INTO `saller_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (5, '夏其林', 'e10adc3949ba59abbe56e057f20f883e', '老夏', '男', 25, '2021-03-24 10:40:47', '18843232356', '合肥市', 'hello@126.com', '342425199001116309', 2, 0);
INSERT INTO `saller_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (6, '倪标生', 'e10adc3949ba59abbe56e057f20f883e', '老倪', '男', 26, '2021-03-24 10:40:47', '18843232356', '北京市', '1212@qq.com', '342425199001116984', 2, 0);
INSERT INTO `saller_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (7, '孙晓哈', 'e10adc3949ba59abbe56e057f20f883e', '老孙', '男', 21, '2021-03-24 10:40:47', '18843232356', '合肥市', '8765@qq.com', '342425199001116303', 2, 0);
INSERT INTO `saller_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (8, '李锐', 'e10adc3949ba59abbe56e057f20f883e', '老李', '男', 31, '2021-03-24 10:40:47', '18843232356', '北京市', '9080@qq.com', '342425199001116910', 2, 0);
INSERT INTO `saller_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (9, '吴腊苏', 'e10adc3949ba59abbe56e057f20f883e', '老吴', '男', 34, '2021-03-24 10:40:47', '18843232356', '合肥市', 'shjs@126.com', '342425199001116345', 2, 0);
INSERT INTO `saller_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (10, '潘晓章', 'e10adc3949ba59abbe56e057f20f883e', '老潘', '女', 33, '2021-03-24 10:40:47', '18843232356', '深圳市', '666@qq.com', '342425199001116234', 2, 0);


INSERT INTO `user_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (1, '张天志', 'e10adc3949ba59abbe56e057f20f883e', '老张', '男', 22, '2021-03-24 10:40:47', '18843232356', '上海市', 'aa@163.com', '342425199001116372', 3, 0);
INSERT INTO `user_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (2, '赵千里', 'e10adc3949ba59abbe56e057f20f883e', '老赵', '男', 23, '2021-03-24 10:40:47', '18843232356', '北京市', 'bb@163.com', '342425199001116376', 3, 0);
INSERT INTO `user_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (3, '钱优优', 'e10adc3949ba59abbe56e057f20f883e', '老钱', '女', 32, '2021-03-24 10:40:47', '18843232356', '合肥市', 'cc@163.com', '342425199001116323', 3, 0);
INSERT INTO `user_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (4, '贾宏鑫', 'e10adc3949ba59abbe56e057f20f883e', '老贾', '女', 24, '2021-03-24 10:40:47', '18843232356', '北京市', 'hahaha@126.com', '342425199001116837', 3, 0);
INSERT INTO `user_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (5, '夏其林', 'e10adc3949ba59abbe56e057f20f883e', '老夏', '男', 25, '2021-03-24 10:40:47', '18843232356', '合肥市', 'hello@126.com', '342425199001116309', 3, 0);
INSERT INTO `user_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (6, '倪标生', 'e10adc3949ba59abbe56e057f20f883e', '老倪', '男', 26, '2021-03-24 10:40:47', '18843232356', '北京市', '1212@qq.com', '342425199001116984', 3, 0);
INSERT INTO `user_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (7, '孙晓哈', 'e10adc3949ba59abbe56e057f20f883e', '老孙', '男', 21, '2021-03-24 10:40:47', '18843232356', '合肥市', '8765@qq.com', '342425199001116303', 3, 0);
INSERT INTO `user_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (8, '李锐', 'e10adc3949ba59abbe56e057f20f883e', '老李', '男', 31, '2021-03-24 10:40:47', '18843232356', '北京市', '9080@qq.com', '342425199001116910', 3, 0);
INSERT INTO `user_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (9, '吴腊苏', 'e10adc3949ba59abbe56e057f20f883e', '老吴', '男', 34, '2021-03-24 10:40:47', '18843232356', '合肥市', 'shjs@126.com', '342425199001116345', 3, 0);
INSERT INTO `user_info` (id, name, password, nickName, sex, age, birthday, phone, address, email, cardId, level, account) VALUES (10, '潘晓章', 'e10adc3949ba59abbe56e057f20f883e', '老潘', '女', 33, '2021-03-24 10:40:47', '18843232356', '深圳市', '666@qq.com', '342425199001116234', 3, 0);


INSERT INTO `advertiser_info` (id, name, content, time) VALUES (1, '系统公告', '这是系统公告，管理员可以在后台修改', '2021-03-24 10:40:47');
INSERT INTO `advertiser_info` (id, name, content, time) VALUES (2, '系统公告', '这是系统公告，管理员可以在后台修改', '2021-03-24 10:40:47');
INSERT INTO `advertiser_info` (id, name, content, time) VALUES (3, '系统公告', '这是系统公告，管理员可以在后台修改', '2021-03-24 10:40:47');
INSERT INTO `advertiser_info` (id, name, content, time) VALUES (4, '系统公告', '这是系统公告，管理员可以在后台修改', '2021-03-24 10:40:47');
INSERT INTO `advertiser_info` (id, name, content, time) VALUES (5, '系统公告', '这是系统公告，管理员可以在后台修改', '2021-03-24 10:40:47');
INSERT INTO `advertiser_info` (id, name, content, time) VALUES (6, '系统公告', '这是系统公告，管理员可以在后台修改', '2021-03-24 10:40:47');
INSERT INTO `advertiser_info` (id, name, content, time) VALUES (7, '系统公告', '这是系统公告，管理员可以在后台修改', '2021-03-24 10:40:47');
INSERT INTO `advertiser_info` (id, name, content, time) VALUES (8, '系统公告', '这是系统公告，管理员可以在后台修改', '2021-03-24 10:40:47');
INSERT INTO `advertiser_info` (id, name, content, time) VALUES (9, '系统公告', '这是系统公告，管理员可以在后台修改', '2021-03-24 10:40:47');
INSERT INTO `advertiser_info` (id, name, content, time) VALUES (10, '系统公告', '这是系统公告，管理员可以在后台修改', '2021-03-24 10:40:47');



INSERT INTO `type_info` (id, name, description) VALUES (1, '类别1', '这是类别1');
INSERT INTO `type_info` (id, name, description) VALUES (2, '类别2', '这是类别2');
INSERT INTO `type_info` (id, name, description) VALUES (3, '类别3', '这是类别3');

INSERT INTO `goods_info` (id, name, description, price, `count`, discount, sales, hot, recommend, typeId, fileIds, userId, level) VALUES (1, '商品1', '这是商品1', 20.00, 200, 0.8, 30, 1, '是', 1, '', 1, 1);
INSERT INTO `goods_info` (id, name, description, price, `count`, discount, sales, hot, recommend, typeId, fileIds, userId, level) VALUES (2, '商品2', '这是商品2', 20.00, 200, 0.8, 10, 1, '是', 2, '', 1, 1);
INSERT INTO `goods_info` (id, name, description, price, `count`, discount, sales, hot, recommend, typeId, fileIds, userId, level) VALUES (3, '商品3', '这是商品3', 20.00, 200, 0.8, 20, 1, '是', 3, '', 1, 1);

INSERT INTO `order_info` (id, orderId, totalPrice, userId, level, linkAddress, linkPhone, linkMan, createTime, status) VALUES (1, '111111', 480, 1, 1, '安徽省合肥市高新区', '18812337865', 'admin', '2021-03-24 10:40:47', '完成');
INSERT INTO `order_info` (id, orderId, totalPrice, userId, level, linkAddress, linkPhone, linkMan, createTime, status) VALUES (2, '222222', 160, 2, 2, '上海市浦东新区', '18812337865', '张三', '2021-03-24 10:40:47', '完成');
INSERT INTO `order_info` (id, orderId, totalPrice, userId, level, linkAddress, linkPhone, linkMan, createTime, status) VALUES (3, '333333', 320, 3, 3, '上海市长宁区', '18812337865', '李四', '2021-03-24 10:40:47', '完成');

INSERT INTO `order_goods_rel` (id, orderId, goodsId, `count`) VALUES (1, 1, 1, 30);
INSERT INTO `order_goods_rel` (id, orderId, goodsId, `count`) VALUES (2, 2, 2, 10);
INSERT INTO `order_goods_rel` (id, orderId, goodsId, `count`) VALUES (3, 3, 3, 20);
