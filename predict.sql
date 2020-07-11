/*
Navicat MySQL Data Transfer

Source Server         : first
Source Server Version : 80020
Source Host           : localhost:3306
Source Database       : predict

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2020-07-11 22:04:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for beijing
-- ----------------------------
DROP TABLE IF EXISTS `beijing`;
CREATE TABLE `beijing` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of beijing
-- ----------------------------
INSERT INTO `beijing` VALUES ('2020-06-29', '26.32#32.92#21.87');
INSERT INTO `beijing` VALUES ('2020-06-30', '26.3#32.89#21.35');
INSERT INTO `beijing` VALUES ('2020-07-01', '26.24#32.71#20.95');
INSERT INTO `beijing` VALUES ('2020-07-02', '26.03#32.94#21.11');
INSERT INTO `beijing` VALUES ('2020-07-03', '26.12#32.95#21.16');
INSERT INTO `beijing` VALUES ('2020-07-04', '26.34#33.3#21.07');
INSERT INTO `beijing` VALUES ('2020-07-05', '26.14#33.08#21.07');
INSERT INTO `beijing` VALUES ('2020-07-06', '26.36#31.88#21.31');
INSERT INTO `beijing` VALUES ('2020-07-07', '26.54#32.53#21.2');
INSERT INTO `beijing` VALUES ('2020-07-08', '26.67#33.08#21.14');
INSERT INTO `beijing` VALUES ('2020-07-09', '26.53#33.3#21.32');
INSERT INTO `beijing` VALUES ('2020-07-10', '26.69#33.58#21.23');
INSERT INTO `beijing` VALUES ('2020-07-11', '26.67#33.83#21.36');
INSERT INTO `beijing` VALUES ('2020-07-12', '26.62#33.81#21.31');
INSERT INTO `beijing` VALUES ('2020-07-13', '26.16#27.89#21.58');
INSERT INTO `beijing` VALUES ('2020-07-14', '26.54#28.75#21.48');
INSERT INTO `beijing` VALUES ('2020-07-15', '26.82#29.18#21.45');
INSERT INTO `beijing` VALUES ('2020-07-16', '26.81#29.42#21.63');
INSERT INTO `beijing` VALUES ('2020-07-17', '27.02#29.92#21.55');
INSERT INTO `beijing` VALUES ('2020-07-18', '26.96#30.07#21.65');
INSERT INTO `beijing` VALUES ('2020-07-19', '26.99#29.9#21.62');

-- ----------------------------
-- Table structure for changchun
-- ----------------------------
DROP TABLE IF EXISTS `changchun`;
CREATE TABLE `changchun` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of changchun
-- ----------------------------
INSERT INTO `changchun` VALUES ('2020-06-29', '24.81#28.89#14.97');
INSERT INTO `changchun` VALUES ('2020-06-30', '23.95#29.07#15.15');
INSERT INTO `changchun` VALUES ('2020-07-01', '23.45#29.48#15.07');
INSERT INTO `changchun` VALUES ('2020-07-02', '23.35#29.24#15.29');
INSERT INTO `changchun` VALUES ('2020-07-03', '23.28#29.55#15.42');
INSERT INTO `changchun` VALUES ('2020-07-04', '23.49#29.52#15.52');
INSERT INTO `changchun` VALUES ('2020-07-05', '23.38#29.76#15.75');
INSERT INTO `changchun` VALUES ('2020-07-06', '19.32#26.59#17.6');
INSERT INTO `changchun` VALUES ('2020-07-07', '21.21#27.86#17.06');
INSERT INTO `changchun` VALUES ('2020-07-08', '21.91#28.77#16.62');
INSERT INTO `changchun` VALUES ('2020-07-09', '22.28#28.7#16.79');
INSERT INTO `changchun` VALUES ('2020-07-10', '22.48#29.2#16.71');
INSERT INTO `changchun` VALUES ('2020-07-11', '22.62#29.21#16.84');
INSERT INTO `changchun` VALUES ('2020-07-12', '22.48#29.39#17.07');
INSERT INTO `changchun` VALUES ('2020-07-13', '21.55#30.64#18.25');
INSERT INTO `changchun` VALUES ('2020-07-14', '22.43#30.16#17.81');
INSERT INTO `changchun` VALUES ('2020-07-15', '22.54#30.29#17.47');
INSERT INTO `changchun` VALUES ('2020-07-16', '22.74#29.91#17.6');
INSERT INTO `changchun` VALUES ('2020-07-17', '22.89#30.15#17.5');
INSERT INTO `changchun` VALUES ('2020-07-18', '23.05#30.18#17.61');
INSERT INTO `changchun` VALUES ('2020-07-19', '22.89#30.37#17.79');

-- ----------------------------
-- Table structure for changsha
-- ----------------------------
DROP TABLE IF EXISTS `changsha`;
CREATE TABLE `changsha` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of changsha
-- ----------------------------
INSERT INTO `changsha` VALUES ('2020-06-29', '27.99#32.35#25.27');
INSERT INTO `changsha` VALUES ('2020-06-30', '26.96#31.74#24.48');
INSERT INTO `changsha` VALUES ('2020-07-01', '26.19#31.75#24.48');
INSERT INTO `changsha` VALUES ('2020-07-02', '26.02#31.42#23.98');
INSERT INTO `changsha` VALUES ('2020-07-03', '26.1#31.51#23.76');
INSERT INTO `changsha` VALUES ('2020-07-04', '25.96#31.67#23.6');
INSERT INTO `changsha` VALUES ('2020-07-05', '26.08#31.71#23.66');
INSERT INTO `changsha` VALUES ('2020-07-06', '27.85#33.39#25.82');
INSERT INTO `changsha` VALUES ('2020-07-07', '27.52#32.59#25.0');
INSERT INTO `changsha` VALUES ('2020-07-08', '27.14#32.43#24.87');
INSERT INTO `changsha` VALUES ('2020-07-09', '27.16#32.11#24.41');
INSERT INTO `changsha` VALUES ('2020-07-10', '27.21#32.21#24.35');
INSERT INTO `changsha` VALUES ('2020-07-11', '26.95#32.29#24.24');
INSERT INTO `changsha` VALUES ('2020-07-12', '27.11#32.34#24.27');
INSERT INTO `changsha` VALUES ('2020-07-13', '27.06#33.62#25.13');
INSERT INTO `changsha` VALUES ('2020-07-14', '27.25#33.02#25.0');
INSERT INTO `changsha` VALUES ('2020-07-15', '27.2#32.89#25.12');
INSERT INTO `changsha` VALUES ('2020-07-16', '27.33#32.53#24.99');
INSERT INTO `changsha` VALUES ('2020-07-17', '27.44#32.52#24.99');
INSERT INTO `changsha` VALUES ('2020-07-18', '27.22#32.65#25.01');
INSERT INTO `changsha` VALUES ('2020-07-19', '27.29#32.63#24.98');
INSERT INTO `changsha` VALUES ('2020-06-29', '27.01#28.35#22.26');
INSERT INTO `changsha` VALUES ('2020-06-30', '27.08#28.15#21.84');
INSERT INTO `changsha` VALUES ('2020-07-01', '27.21#27.69#21.54');
INSERT INTO `changsha` VALUES ('2020-07-02', '27.19#27.5#21.52');
INSERT INTO `changsha` VALUES ('2020-07-03', '27.29#27.25#21.38');
INSERT INTO `changsha` VALUES ('2020-07-04', '27.23#27.05#21.47');
INSERT INTO `changsha` VALUES ('2020-07-05', '27.36#26.98#21.47');
INSERT INTO `changsha` VALUES ('2020-07-06', '27.58#29.68#22.13');
INSERT INTO `changsha` VALUES ('2020-07-07', '27.52#29.85#22.25');
INSERT INTO `changsha` VALUES ('2020-07-08', '27.59#29.35#22.25');
INSERT INTO `changsha` VALUES ('2020-07-09', '27.49#28.79#22.3');
INSERT INTO `changsha` VALUES ('2020-07-10', '27.54#28.82#22.39');
INSERT INTO `changsha` VALUES ('2020-07-11', '27.53#28.63#22.38');
INSERT INTO `changsha` VALUES ('2020-07-12', '27.63#28.7#22.44');
INSERT INTO `changsha` VALUES ('2020-07-13', '25.87#31.56#22.74');
INSERT INTO `changsha` VALUES ('2020-07-14', '26.28#31.33#22.77');
INSERT INTO `changsha` VALUES ('2020-07-15', '26.66#30.96#22.68');
INSERT INTO `changsha` VALUES ('2020-07-16', '26.76#30.64#22.69');
INSERT INTO `changsha` VALUES ('2020-07-17', '26.89#30.38#22.79');
INSERT INTO `changsha` VALUES ('2020-07-18', '26.94#30.36#22.78');
INSERT INTO `changsha` VALUES ('2020-07-19', '27.1#30.34#22.77');
INSERT INTO `changsha` VALUES ('2020-06-29', '27.01#28.35#22.26');
INSERT INTO `changsha` VALUES ('2020-06-30', '27.08#28.15#21.84');
INSERT INTO `changsha` VALUES ('2020-07-01', '27.21#27.69#21.54');
INSERT INTO `changsha` VALUES ('2020-07-02', '27.19#27.5#21.52');
INSERT INTO `changsha` VALUES ('2020-07-03', '27.29#27.25#21.38');
INSERT INTO `changsha` VALUES ('2020-07-04', '27.23#27.05#21.47');
INSERT INTO `changsha` VALUES ('2020-07-05', '27.36#26.98#21.47');
INSERT INTO `changsha` VALUES ('2020-07-06', '27.58#29.68#22.13');
INSERT INTO `changsha` VALUES ('2020-07-07', '27.52#29.85#22.25');
INSERT INTO `changsha` VALUES ('2020-07-08', '27.59#29.35#22.25');
INSERT INTO `changsha` VALUES ('2020-07-09', '27.49#28.79#22.3');
INSERT INTO `changsha` VALUES ('2020-07-10', '27.54#28.82#22.39');
INSERT INTO `changsha` VALUES ('2020-07-11', '27.53#28.63#22.38');
INSERT INTO `changsha` VALUES ('2020-07-12', '27.63#28.7#22.44');
INSERT INTO `changsha` VALUES ('2020-07-13', '25.87#31.56#22.74');
INSERT INTO `changsha` VALUES ('2020-07-14', '26.28#31.33#22.77');
INSERT INTO `changsha` VALUES ('2020-07-15', '26.66#30.96#22.68');
INSERT INTO `changsha` VALUES ('2020-07-16', '26.76#30.64#22.69');
INSERT INTO `changsha` VALUES ('2020-07-17', '26.89#30.38#22.79');
INSERT INTO `changsha` VALUES ('2020-07-18', '26.94#30.36#22.78');
INSERT INTO `changsha` VALUES ('2020-07-19', '27.1#30.34#22.77');
INSERT INTO `changsha` VALUES ('2020-06-29', '25.68#27.84#21.81');
INSERT INTO `changsha` VALUES ('2020-06-30', '26.2#29.62#21.78');
INSERT INTO `changsha` VALUES ('2020-07-01', '26.5#30.93#21.79');
INSERT INTO `changsha` VALUES ('2020-07-02', '26.57#31.67#21.79');
INSERT INTO `changsha` VALUES ('2020-07-03', '26.71#31.62#21.92');
INSERT INTO `changsha` VALUES ('2020-07-04', '26.72#31.94#22.1');
INSERT INTO `changsha` VALUES ('2020-07-05', '26.9#32.12#21.97');
INSERT INTO `changsha` VALUES ('2020-07-06', '27.39#30.41#24.04');
INSERT INTO `changsha` VALUES ('2020-07-07', '27.15#31.08#23.61');
INSERT INTO `changsha` VALUES ('2020-07-08', '27.08#31.15#23.38');
INSERT INTO `changsha` VALUES ('2020-07-09', '26.97#30.93#23.25');
INSERT INTO `changsha` VALUES ('2020-07-10', '26.89#30.81#23.29');
INSERT INTO `changsha` VALUES ('2020-07-11', '27.05#30.49#23.14');
INSERT INTO `changsha` VALUES ('2020-07-12', '27.23#30.77#23.13');
INSERT INTO `changsha` VALUES ('2020-07-13', '27.6#29.79#24.26');
INSERT INTO `changsha` VALUES ('2020-07-14', '27.31#29.96#23.95');
INSERT INTO `changsha` VALUES ('2020-07-15', '27.25#29.48#23.7');
INSERT INTO `changsha` VALUES ('2020-07-16', '27.16#29.76#23.79');
INSERT INTO `changsha` VALUES ('2020-07-17', '27.03#29.6#23.76');
INSERT INTO `changsha` VALUES ('2020-07-18', '27.28#29.68#23.49');
INSERT INTO `changsha` VALUES ('2020-07-19', '27.48#29.66#23.56');

-- ----------------------------
-- Table structure for chengdu
-- ----------------------------
DROP TABLE IF EXISTS `chengdu`;
CREATE TABLE `chengdu` (
  `date,value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of chengdu
-- ----------------------------
INSERT INTO `chengdu` VALUES ('2020-06-29,27.01#28.35#22.26');
INSERT INTO `chengdu` VALUES ('2020-06-30,27.08#28.15#21.84');
INSERT INTO `chengdu` VALUES ('2020-07-01,27.21#27.69#21.54');
INSERT INTO `chengdu` VALUES ('2020-07-02,27.19#27.5#21.52');
INSERT INTO `chengdu` VALUES ('2020-07-03,27.29#27.25#21.38');
INSERT INTO `chengdu` VALUES ('2020-07-04,27.23#27.05#21.47');
INSERT INTO `chengdu` VALUES ('2020-07-05,27.36#26.98#21.47');
INSERT INTO `chengdu` VALUES ('2020-07-06,27.58#29.68#22.13');
INSERT INTO `chengdu` VALUES ('2020-07-07,27.52#29.85#22.25');
INSERT INTO `chengdu` VALUES ('2020-07-08,27.59#29.35#22.25');
INSERT INTO `chengdu` VALUES ('2020-07-09,27.49#28.79#22.3');
INSERT INTO `chengdu` VALUES ('2020-07-10,27.54#28.82#22.39');
INSERT INTO `chengdu` VALUES ('2020-07-11,27.53#28.63#22.38');
INSERT INTO `chengdu` VALUES ('2020-07-12,27.63#28.7#22.44');
INSERT INTO `chengdu` VALUES ('2020-07-13,25.87#31.56#22.74');
INSERT INTO `chengdu` VALUES ('2020-07-14,26.28#31.33#22.77');
INSERT INTO `chengdu` VALUES ('2020-07-15,26.66#30.96#22.68');
INSERT INTO `chengdu` VALUES ('2020-07-16,26.76#30.64#22.69');
INSERT INTO `chengdu` VALUES ('2020-07-17,26.89#30.38#22.79');
INSERT INTO `chengdu` VALUES ('2020-07-18,26.94#30.36#22.78');
INSERT INTO `chengdu` VALUES ('2020-07-19,27.1#30.34#22.77');

-- ----------------------------
-- Table structure for chongqing
-- ----------------------------
DROP TABLE IF EXISTS `chongqing`;
CREATE TABLE `chongqing` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of chongqing
-- ----------------------------
INSERT INTO `chongqing` VALUES ('2020-06-29', '25.68#27.84#21.81');
INSERT INTO `chongqing` VALUES ('2020-06-30', '26.2#29.62#21.78');
INSERT INTO `chongqing` VALUES ('2020-07-01', '26.5#30.93#21.79');
INSERT INTO `chongqing` VALUES ('2020-07-02', '26.57#31.67#21.79');
INSERT INTO `chongqing` VALUES ('2020-07-03', '26.71#31.62#21.92');
INSERT INTO `chongqing` VALUES ('2020-07-04', '26.72#31.94#22.1');
INSERT INTO `chongqing` VALUES ('2020-07-05', '26.9#32.12#21.97');
INSERT INTO `chongqing` VALUES ('2020-07-06', '27.39#30.41#24.04');
INSERT INTO `chongqing` VALUES ('2020-07-07', '27.15#31.08#23.61');
INSERT INTO `chongqing` VALUES ('2020-07-08', '27.08#31.15#23.38');
INSERT INTO `chongqing` VALUES ('2020-07-09', '26.97#30.93#23.25');
INSERT INTO `chongqing` VALUES ('2020-07-10', '26.89#30.81#23.29');
INSERT INTO `chongqing` VALUES ('2020-07-11', '27.05#30.49#23.14');
INSERT INTO `chongqing` VALUES ('2020-07-12', '27.23#30.77#23.13');
INSERT INTO `chongqing` VALUES ('2020-07-13', '27.6#29.79#24.26');
INSERT INTO `chongqing` VALUES ('2020-07-14', '27.31#29.96#23.95');
INSERT INTO `chongqing` VALUES ('2020-07-15', '27.25#29.48#23.7');
INSERT INTO `chongqing` VALUES ('2020-07-16', '27.16#29.76#23.79');
INSERT INTO `chongqing` VALUES ('2020-07-17', '27.03#29.6#23.76');
INSERT INTO `chongqing` VALUES ('2020-07-18', '27.28#29.68#23.49');
INSERT INTO `chongqing` VALUES ('2020-07-19', '27.48#29.66#23.56');

-- ----------------------------
-- Table structure for fuzhou
-- ----------------------------
DROP TABLE IF EXISTS `fuzhou`;
CREATE TABLE `fuzhou` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fuzhou
-- ----------------------------
INSERT INTO `fuzhou` VALUES ('2020-06-29', '29.48#35.81#25.71');
INSERT INTO `fuzhou` VALUES ('2020-06-30', '29.19#35.53#25.16');
INSERT INTO `fuzhou` VALUES ('2020-07-01', '28.81#35.41#24.84');
INSERT INTO `fuzhou` VALUES ('2020-07-02', '28.53#35.17#24.68');
INSERT INTO `fuzhou` VALUES ('2020-07-03', '28.57#35.19#24.81');
INSERT INTO `fuzhou` VALUES ('2020-07-04', '28.42#34.98#24.69');
INSERT INTO `fuzhou` VALUES ('2020-07-05', '28.47#35.23#24.94');
INSERT INTO `fuzhou` VALUES ('2020-07-06', '29.07#35.84#26.53');
INSERT INTO `fuzhou` VALUES ('2020-07-07', '29.08#35.3#26.41');
INSERT INTO `fuzhou` VALUES ('2020-07-08', '28.88#35.16#26.28');
INSERT INTO `fuzhou` VALUES ('2020-07-09', '28.66#34.93#26.14');
INSERT INTO `fuzhou` VALUES ('2020-07-10', '28.8#34.84#26.25');
INSERT INTO `fuzhou` VALUES ('2020-07-11', '28.55#34.92#26.09');
INSERT INTO `fuzhou` VALUES ('2020-07-12', '28.47#35.03#26.28');
INSERT INTO `fuzhou` VALUES ('2020-07-13', '29.99#36.44#26.62');
INSERT INTO `fuzhou` VALUES ('2020-07-14', '29.35#35.3#26.66');
INSERT INTO `fuzhou` VALUES ('2020-07-15', '28.87#35.17#26.54');
INSERT INTO `fuzhou` VALUES ('2020-07-16', '28.62#34.75#26.49');
INSERT INTO `fuzhou` VALUES ('2020-07-17', '28.63#34.64#26.39');
INSERT INTO `fuzhou` VALUES ('2020-07-18', '28.62#34.86#26.25');
INSERT INTO `fuzhou` VALUES ('2020-07-19', '28.5#34.99#26.43');

-- ----------------------------
-- Table structure for guiyang
-- ----------------------------
DROP TABLE IF EXISTS `guiyang`;
CREATE TABLE `guiyang` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of guiyang
-- ----------------------------
INSERT INTO `guiyang` VALUES ('2020-06-29', '25.56#29.34#20.88');
INSERT INTO `guiyang` VALUES ('2020-06-30', '24.73#27.98#18.25');
INSERT INTO `guiyang` VALUES ('2020-07-01', '24.32#27.55#15.74');
INSERT INTO `guiyang` VALUES ('2020-07-02', '23.91#27.36#15.48');
INSERT INTO `guiyang` VALUES ('2020-07-03', '23.81#26.9#15.04');
INSERT INTO `guiyang` VALUES ('2020-07-04', '23.64#27.45#15.79');
INSERT INTO `guiyang` VALUES ('2020-07-05', '23.69#27.89#15.87');
INSERT INTO `guiyang` VALUES ('2020-07-06', '22.3#27.66#20.78');
INSERT INTO `guiyang` VALUES ('2020-07-07', '22.69#27.46#20.44');
INSERT INTO `guiyang` VALUES ('2020-07-08', '23.37#27.67#21.03');
INSERT INTO `guiyang` VALUES ('2020-07-09', '23.5#27.74#20.8');
INSERT INTO `guiyang` VALUES ('2020-07-10', '23.68#27.71#21.77');
INSERT INTO `guiyang` VALUES ('2020-07-11', '23.12#27.77#22.57');
INSERT INTO `guiyang` VALUES ('2020-07-12', '23.15#27.82#22.36');
INSERT INTO `guiyang` VALUES ('2020-07-13', '22.68#26.91#20.81');
INSERT INTO `guiyang` VALUES ('2020-07-14', '22.76#27.52#21.05');
INSERT INTO `guiyang` VALUES ('2020-07-15', '23.09#27.93#22.09');
INSERT INTO `guiyang` VALUES ('2020-07-16', '22.94#28.29#22.35');
INSERT INTO `guiyang` VALUES ('2020-07-17', '23.18#28.22#22.53');
INSERT INTO `guiyang` VALUES ('2020-07-18', '22.82#28.25#22.97');
INSERT INTO `guiyang` VALUES ('2020-07-19', '22.9#28.47#22.6');
INSERT INTO `guiyang` VALUES ('2020-06-29', '25.56#29.34#20.88');
INSERT INTO `guiyang` VALUES ('2020-06-30', '24.73#27.98#18.25');
INSERT INTO `guiyang` VALUES ('2020-07-01', '24.32#27.55#15.74');
INSERT INTO `guiyang` VALUES ('2020-07-02', '23.91#27.36#15.48');
INSERT INTO `guiyang` VALUES ('2020-07-03', '23.81#26.9#15.04');
INSERT INTO `guiyang` VALUES ('2020-07-04', '23.64#27.45#15.79');
INSERT INTO `guiyang` VALUES ('2020-07-05', '23.69#27.89#15.87');
INSERT INTO `guiyang` VALUES ('2020-07-06', '22.3#27.66#20.78');
INSERT INTO `guiyang` VALUES ('2020-07-07', '22.69#27.46#20.44');
INSERT INTO `guiyang` VALUES ('2020-07-08', '23.37#27.67#21.03');
INSERT INTO `guiyang` VALUES ('2020-07-09', '23.5#27.74#20.8');
INSERT INTO `guiyang` VALUES ('2020-07-10', '23.68#27.71#21.77');
INSERT INTO `guiyang` VALUES ('2020-07-11', '23.12#27.77#22.57');
INSERT INTO `guiyang` VALUES ('2020-07-12', '23.15#27.82#22.36');
INSERT INTO `guiyang` VALUES ('2020-07-13', '22.68#26.91#20.81');
INSERT INTO `guiyang` VALUES ('2020-07-14', '22.76#27.52#21.05');
INSERT INTO `guiyang` VALUES ('2020-07-15', '23.09#27.93#22.09');
INSERT INTO `guiyang` VALUES ('2020-07-16', '22.94#28.29#22.35');
INSERT INTO `guiyang` VALUES ('2020-07-17', '23.18#28.22#22.53');
INSERT INTO `guiyang` VALUES ('2020-07-18', '22.82#28.25#22.97');
INSERT INTO `guiyang` VALUES ('2020-07-19', '22.9#28.47#22.6');

-- ----------------------------
-- Table structure for hangzhou
-- ----------------------------
DROP TABLE IF EXISTS `hangzhou`;
CREATE TABLE `hangzhou` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of hangzhou
-- ----------------------------
INSERT INTO `hangzhou` VALUES ('2020-06-29', '28.6#34.27#24.03');
INSERT INTO `hangzhou` VALUES ('2020-06-30', '28.23#33.38#23.02');
INSERT INTO `hangzhou` VALUES ('2020-07-01', '28.08#32.78#22.59');
INSERT INTO `hangzhou` VALUES ('2020-07-02', '27.94#32.74#22.23');
INSERT INTO `hangzhou` VALUES ('2020-07-03', '27.68#32.49#22.25');
INSERT INTO `hangzhou` VALUES ('2020-07-04', '27.61#32.66#22.71');
INSERT INTO `hangzhou` VALUES ('2020-07-05', '27.78#32.4#22.66');
INSERT INTO `hangzhou` VALUES ('2020-07-06', '28.76#30.24#23.91');
INSERT INTO `hangzhou` VALUES ('2020-07-07', '28.58#30.78#24.1');
INSERT INTO `hangzhou` VALUES ('2020-07-08', '28.15#31.07#24.12');
INSERT INTO `hangzhou` VALUES ('2020-07-09', '28.17#31.35#23.97');
INSERT INTO `hangzhou` VALUES ('2020-07-10', '27.96#31.31#23.75');
INSERT INTO `hangzhou` VALUES ('2020-07-11', '28.09#31.61#24.0');
INSERT INTO `hangzhou` VALUES ('2020-07-12', '28.17#31.49#24.0');
INSERT INTO `hangzhou` VALUES ('2020-07-13', '28.64#32.72#24.63');
INSERT INTO `hangzhou` VALUES ('2020-07-14', '28.46#31.42#24.0');
INSERT INTO `hangzhou` VALUES ('2020-07-15', '28.13#30.92#23.81');
INSERT INTO `hangzhou` VALUES ('2020-07-16', '28.15#30.43#23.47');
INSERT INTO `hangzhou` VALUES ('2020-07-17', '28.16#30.45#23.46');
INSERT INTO `hangzhou` VALUES ('2020-07-18', '28.34#30.42#23.67');
INSERT INTO `hangzhou` VALUES ('2020-07-19', '28.5#30.13#23.81');

-- ----------------------------
-- Table structure for harbin
-- ----------------------------
DROP TABLE IF EXISTS `harbin`;
CREATE TABLE `harbin` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of harbin
-- ----------------------------
INSERT INTO `harbin` VALUES ('2020-06-29', '21.8#28.32#15.89');
INSERT INTO `harbin` VALUES ('2020-06-30', '21.84#28.14#15.29');
INSERT INTO `harbin` VALUES ('2020-07-01', '22.02#27.95#15.27');
INSERT INTO `harbin` VALUES ('2020-07-02', '21.84#28.01#15.43');
INSERT INTO `harbin` VALUES ('2020-07-03', '21.97#28.07#15.41');
INSERT INTO `harbin` VALUES ('2020-07-04', '22.14#28.35#15.84');
INSERT INTO `harbin` VALUES ('2020-07-05', '21.95#28.59#15.71');
INSERT INTO `harbin` VALUES ('2020-07-06', '19.6#26.07#17.96');
INSERT INTO `harbin` VALUES ('2020-07-07', '20.6#26.8#17.07');
INSERT INTO `harbin` VALUES ('2020-07-08', '21.27#27.1#16.97');
INSERT INTO `harbin` VALUES ('2020-07-09', '21.42#27.27#17.05');
INSERT INTO `harbin` VALUES ('2020-07-10', '21.48#27.29#17.01');
INSERT INTO `harbin` VALUES ('2020-07-11', '21.89#27.54#17.39');
INSERT INTO `harbin` VALUES ('2020-07-12', '21.68#27.63#17.19');
INSERT INTO `harbin` VALUES ('2020-07-13', '21.54#29.2#18.32');
INSERT INTO `harbin` VALUES ('2020-07-14', '21.76#29.02#17.7');
INSERT INTO `harbin` VALUES ('2020-07-15', '22.07#28.96#17.53');
INSERT INTO `harbin` VALUES ('2020-07-16', '22.0#29.15#17.64');
INSERT INTO `harbin` VALUES ('2020-07-17', '22.11#29.06#17.68');
INSERT INTO `harbin` VALUES ('2020-07-18', '22.41#29.1#17.93');
INSERT INTO `harbin` VALUES ('2020-07-19', '22.24#29.16#17.87');

-- ----------------------------
-- Table structure for hefei
-- ----------------------------
DROP TABLE IF EXISTS `hefei`;
CREATE TABLE `hefei` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of hefei
-- ----------------------------
INSERT INTO `hefei` VALUES ('2020-06-29', '25.63#30.09#20.83');
INSERT INTO `hefei` VALUES ('2020-06-30', '25.81#29.76#20.43');
INSERT INTO `hefei` VALUES ('2020-07-01', '25.94#29.67#19.82');
INSERT INTO `hefei` VALUES ('2020-07-02', '26.04#29.55#19.73');
INSERT INTO `hefei` VALUES ('2020-07-03', '26.14#29.49#19.64');
INSERT INTO `hefei` VALUES ('2020-07-04', '26.05#29.27#19.51');
INSERT INTO `hefei` VALUES ('2020-07-05', '26.23#29.22#19.76');
INSERT INTO `hefei` VALUES ('2020-07-06', '28.53#29.82#21.82');
INSERT INTO `hefei` VALUES ('2020-07-07', '28.06#29.15#21.54');
INSERT INTO `hefei` VALUES ('2020-07-08', '27.86#28.78#21.19');
INSERT INTO `hefei` VALUES ('2020-07-09', '27.73#28.6#21.05');
INSERT INTO `hefei` VALUES ('2020-07-10', '27.6#28.54#21.01');
INSERT INTO `hefei` VALUES ('2020-07-11', '27.63#28.52#21.08');
INSERT INTO `hefei` VALUES ('2020-07-12', '27.7#28.42#21.21');
INSERT INTO `hefei` VALUES ('2020-07-13', '25.54#29.92#21.12');
INSERT INTO `hefei` VALUES ('2020-07-14', '26.28#29.62#21.61');
INSERT INTO `hefei` VALUES ('2020-07-15', '26.8#29.54#21.78');
INSERT INTO `hefei` VALUES ('2020-07-16', '27.04#29.37#21.88');
INSERT INTO `hefei` VALUES ('2020-07-17', '27.16#29.23#22.05');
INSERT INTO `hefei` VALUES ('2020-07-18', '27.27#29.22#22.16');
INSERT INTO `hefei` VALUES ('2020-07-19', '27.33#29.18#22.22');

-- ----------------------------
-- Table structure for hohhot
-- ----------------------------
DROP TABLE IF EXISTS `hohhot`;
CREATE TABLE `hohhot` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of hohhot
-- ----------------------------
INSERT INTO `hohhot` VALUES ('2020-06-29', '17.61#30.42#13.09');
INSERT INTO `hohhot` VALUES ('2020-06-30', '19.31#30.41#13.0');
INSERT INTO `hohhot` VALUES ('2020-07-01', '20.07#30.1#12.97');
INSERT INTO `hohhot` VALUES ('2020-07-02', '21.24#30.11#13.32');
INSERT INTO `hohhot` VALUES ('2020-07-03', '21.61#30.23#13.43');
INSERT INTO `hohhot` VALUES ('2020-07-04', '21.52#30.17#13.58');
INSERT INTO `hohhot` VALUES ('2020-07-05', '22.03#30.37#13.38');
INSERT INTO `hohhot` VALUES ('2020-07-06', '22.42#29.13#14.47');
INSERT INTO `hohhot` VALUES ('2020-07-07', '22.64#29.86#14.14');
INSERT INTO `hohhot` VALUES ('2020-07-08', '22.68#29.82#13.94');
INSERT INTO `hohhot` VALUES ('2020-07-09', '23.02#29.87#14.24');
INSERT INTO `hohhot` VALUES ('2020-07-10', '23.29#30.12#14.26');
INSERT INTO `hohhot` VALUES ('2020-07-11', '23.27#30.22#14.37');
INSERT INTO `hohhot` VALUES ('2020-07-12', '23.37#30.32#14.21');
INSERT INTO `hohhot` VALUES ('2020-07-13', '21.15#24.29#14.01');
INSERT INTO `hohhot` VALUES ('2020-07-14', '22.07#26.84#14.2');
INSERT INTO `hohhot` VALUES ('2020-07-15', '22.54#27.65#14.21');
INSERT INTO `hohhot` VALUES ('2020-07-16', '22.98#28.38#14.63');
INSERT INTO `hohhot` VALUES ('2020-07-17', '23.31#28.67#14.66');
INSERT INTO `hohhot` VALUES ('2020-07-18', '23.42#28.69#14.78');
INSERT INTO `hohhot` VALUES ('2020-07-19', '23.51#29.04#14.62');

-- ----------------------------
-- Table structure for jinan
-- ----------------------------
DROP TABLE IF EXISTS `jinan`;
CREATE TABLE `jinan` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of jinan
-- ----------------------------
INSERT INTO `jinan` VALUES ('2020-06-29', '26.37#33.57#20.68');
INSERT INTO `jinan` VALUES ('2020-06-30', '27.25#33.03#20.78');
INSERT INTO `jinan` VALUES ('2020-07-01', '27.77#32.48#20.75');
INSERT INTO `jinan` VALUES ('2020-07-02', '27.58#32.39#20.77');
INSERT INTO `jinan` VALUES ('2020-07-03', '27.75#32.27#20.88');
INSERT INTO `jinan` VALUES ('2020-07-04', '27.94#32.12#20.98');
INSERT INTO `jinan` VALUES ('2020-07-05', '28.06#32.02#20.98');
INSERT INTO `jinan` VALUES ('2020-07-06', '27.02#31.45#22.18');
INSERT INTO `jinan` VALUES ('2020-07-07', '27.42#31.93#22.06');
INSERT INTO `jinan` VALUES ('2020-07-08', '27.68#32.17#21.84');
INSERT INTO `jinan` VALUES ('2020-07-09', '27.74#32.36#21.79');
INSERT INTO `jinan` VALUES ('2020-07-10', '27.8#32.55#21.82');
INSERT INTO `jinan` VALUES ('2020-07-11', '27.88#32.21#21.86');
INSERT INTO `jinan` VALUES ('2020-07-12', '27.92#32.38#21.82');
INSERT INTO `jinan` VALUES ('2020-07-13', '23.49#27.34#20.21');
INSERT INTO `jinan` VALUES ('2020-07-14', '25.26#28.41#21.04');
INSERT INTO `jinan` VALUES ('2020-07-15', '26.17#28.99#21.04');
INSERT INTO `jinan` VALUES ('2020-07-16', '26.54#29.15#21.07');
INSERT INTO `jinan` VALUES ('2020-07-17', '26.57#29.47#21.24');
INSERT INTO `jinan` VALUES ('2020-07-18', '27.02#29.59#21.39');
INSERT INTO `jinan` VALUES ('2020-07-19', '27.03#29.53#21.62');

-- ----------------------------
-- Table structure for jiuquan
-- ----------------------------
DROP TABLE IF EXISTS `jiuquan`;
CREATE TABLE `jiuquan` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of jiuquan
-- ----------------------------
INSERT INTO `jiuquan` VALUES ('2020-06-29', '22.55#28.5#12.58');
INSERT INTO `jiuquan` VALUES ('2020-06-30', '22.43#28.84#12.58');
INSERT INTO `jiuquan` VALUES ('2020-07-01', '22.51#29.08#12.73');
INSERT INTO `jiuquan` VALUES ('2020-07-02', '22.26#29.29#12.71');
INSERT INTO `jiuquan` VALUES ('2020-07-03', '21.98#29.21#12.89');
INSERT INTO `jiuquan` VALUES ('2020-07-04', '22.02#29.25#12.73');
INSERT INTO `jiuquan` VALUES ('2020-07-05', '22.05#29.36#13.05');
INSERT INTO `jiuquan` VALUES ('2020-07-06', '22.53#31.68#15.18');
INSERT INTO `jiuquan` VALUES ('2020-07-07', '22.14#30.98#14.87');
INSERT INTO `jiuquan` VALUES ('2020-07-08', '22.14#30.54#14.72');
INSERT INTO `jiuquan` VALUES ('2020-07-09', '22.1#30.55#14.74');
INSERT INTO `jiuquan` VALUES ('2020-07-10', '21.91#30.36#14.81');
INSERT INTO `jiuquan` VALUES ('2020-07-11', '21.83#30.35#14.73');
INSERT INTO `jiuquan` VALUES ('2020-07-12', '21.94#30.36#14.86');
INSERT INTO `jiuquan` VALUES ('2020-07-13', '22.85#30.53#17.58');
INSERT INTO `jiuquan` VALUES ('2020-07-14', '22.8#30.77#16.87');
INSERT INTO `jiuquan` VALUES ('2020-07-15', '22.96#30.71#16.38');
INSERT INTO `jiuquan` VALUES ('2020-07-16', '22.88#30.95#16.28');
INSERT INTO `jiuquan` VALUES ('2020-07-17', '22.75#30.79#16.19');
INSERT INTO `jiuquan` VALUES ('2020-07-18', '22.73#30.7#16.07');
INSERT INTO `jiuquan` VALUES ('2020-07-19', '22.86#30.73#16.24');

-- ----------------------------
-- Table structure for kunming
-- ----------------------------
DROP TABLE IF EXISTS `kunming`;
CREATE TABLE `kunming` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of kunming
-- ----------------------------
INSERT INTO `kunming` VALUES ('2020-06-29', '22.37#29.34#17.78');
INSERT INTO `kunming` VALUES ('2020-06-30', '22.1#29.12#17.67');
INSERT INTO `kunming` VALUES ('2020-07-01', '21.57#28.84#17.73');
INSERT INTO `kunming` VALUES ('2020-07-02', '21.44#28.64#17.41');
INSERT INTO `kunming` VALUES ('2020-07-03', '21.43#28.47#17.52');
INSERT INTO `kunming` VALUES ('2020-07-04', '21.14#28.42#17.42');
INSERT INTO `kunming` VALUES ('2020-07-05', '20.84#28.39#17.5');
INSERT INTO `kunming` VALUES ('2020-07-06', '21.38#26.28#17.84');
INSERT INTO `kunming` VALUES ('2020-07-07', '21.8#27.1#17.97');
INSERT INTO `kunming` VALUES ('2020-07-08', '21.86#27.34#18.15');
INSERT INTO `kunming` VALUES ('2020-07-09', '21.91#27.54#17.89');
INSERT INTO `kunming` VALUES ('2020-07-10', '22.02#27.58#17.98');
INSERT INTO `kunming` VALUES ('2020-07-11', '22.13#27.69#17.9');
INSERT INTO `kunming` VALUES ('2020-07-12', '22.19#27.79#18.0');
INSERT INTO `kunming` VALUES ('2020-07-13', '21.18#23.79#17.95');
INSERT INTO `kunming` VALUES ('2020-07-14', '21.84#25.36#18.15');
INSERT INTO `kunming` VALUES ('2020-07-15', '22.15#25.94#18.38');
INSERT INTO `kunming` VALUES ('2020-07-16', '22.25#26.33#18.15');
INSERT INTO `kunming` VALUES ('2020-07-17', '22.39#26.46#18.22');
INSERT INTO `kunming` VALUES ('2020-07-18', '22.48#26.72#18.15');
INSERT INTO `kunming` VALUES ('2020-07-19', '22.7#26.9#18.24');

-- ----------------------------
-- Table structure for lhasa
-- ----------------------------
DROP TABLE IF EXISTS `lhasa`;
CREATE TABLE `lhasa` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of lhasa
-- ----------------------------
INSERT INTO `lhasa` VALUES ('2020-06-29', '16.5#24.1#10.83');
INSERT INTO `lhasa` VALUES ('2020-06-30', '16.61#23.77#11.12');
INSERT INTO `lhasa` VALUES ('2020-07-01', '16.81#21.36#10.76');
INSERT INTO `lhasa` VALUES ('2020-07-02', '16.8#21.84#10.43');
INSERT INTO `lhasa` VALUES ('2020-07-03', '16.92#21.78#10.66');
INSERT INTO `lhasa` VALUES ('2020-07-04', '16.78#20.73#10.58');
INSERT INTO `lhasa` VALUES ('2020-07-05', '16.98#20.65#10.85');
INSERT INTO `lhasa` VALUES ('2020-07-06', '16.61#24.97#13.37');
INSERT INTO `lhasa` VALUES ('2020-07-07', '16.76#25.41#13.07');
INSERT INTO `lhasa` VALUES ('2020-07-08', '17.04#24.68#12.8');
INSERT INTO `lhasa` VALUES ('2020-07-09', '17.0#24.91#12.64');
INSERT INTO `lhasa` VALUES ('2020-07-10', '17.22#25.0#12.44');
INSERT INTO `lhasa` VALUES ('2020-07-11', '17.16#24.46#12.56');
INSERT INTO `lhasa` VALUES ('2020-07-12', '17.32#24.08#12.54');
INSERT INTO `lhasa` VALUES ('2020-07-13', '15.37#23.87#12.97');
INSERT INTO `lhasa` VALUES ('2020-07-14', '15.88#24.78#13.02');
INSERT INTO `lhasa` VALUES ('2020-07-15', '16.25#24.7#13.14');
INSERT INTO `lhasa` VALUES ('2020-07-16', '16.28#25.0#13.06');
INSERT INTO `lhasa` VALUES ('2020-07-17', '16.54#25.21#13.09');
INSERT INTO `lhasa` VALUES ('2020-07-18', '16.54#25.06#13.07');
INSERT INTO `lhasa` VALUES ('2020-07-19', '16.6#24.7#13.13');

-- ----------------------------
-- Table structure for nanchang
-- ----------------------------
DROP TABLE IF EXISTS `nanchang`;
CREATE TABLE `nanchang` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of nanchang
-- ----------------------------
INSERT INTO `nanchang` VALUES ('2020-06-29', '29.41#33.31#25.85');
INSERT INTO `nanchang` VALUES ('2020-06-30', '28.67#32.83#25.25');
INSERT INTO `nanchang` VALUES ('2020-07-01', '28.48#32.48#24.72');
INSERT INTO `nanchang` VALUES ('2020-07-02', '28.24#32.46#24.26');
INSERT INTO `nanchang` VALUES ('2020-07-03', '28.15#32.34#24.11');
INSERT INTO `nanchang` VALUES ('2020-07-04', '28.19#32.39#24.02');
INSERT INTO `nanchang` VALUES ('2020-07-05', '28.35#32.42#24.04');
INSERT INTO `nanchang` VALUES ('2020-07-06', '28.75#32.96#25.53');
INSERT INTO `nanchang` VALUES ('2020-07-07', '28.45#32.86#25.45');
INSERT INTO `nanchang` VALUES ('2020-07-08', '28.53#32.86#25.34');
INSERT INTO `nanchang` VALUES ('2020-07-09', '28.47#32.85#25.28');
INSERT INTO `nanchang` VALUES ('2020-07-10', '28.49#32.86#25.28');
INSERT INTO `nanchang` VALUES ('2020-07-11', '28.56#32.85#25.21');
INSERT INTO `nanchang` VALUES ('2020-07-12', '28.74#32.93#25.27');
INSERT INTO `nanchang` VALUES ('2020-07-13', '28.86#34.13#26.43');
INSERT INTO `nanchang` VALUES ('2020-07-14', '28.7#33.59#26.22');
INSERT INTO `nanchang` VALUES ('2020-07-15', '28.72#33.23#26.04');
INSERT INTO `nanchang` VALUES ('2020-07-16', '28.6#32.96#25.77');
INSERT INTO `nanchang` VALUES ('2020-07-17', '28.62#32.98#25.75');
INSERT INTO `nanchang` VALUES ('2020-07-18', '28.73#32.83#25.69');
INSERT INTO `nanchang` VALUES ('2020-07-19', '28.86#32.88#25.72');

-- ----------------------------
-- Table structure for nanjing
-- ----------------------------
DROP TABLE IF EXISTS `nanjing`;
CREATE TABLE `nanjing` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of nanjing
-- ----------------------------
INSERT INTO `nanjing` VALUES ('2020-06-29', '25.25#31.31#21.91');
INSERT INTO `nanjing` VALUES ('2020-06-30', '24.95#31.48#21.59');
INSERT INTO `nanjing` VALUES ('2020-07-01', '24.88#31.44#21.48');
INSERT INTO `nanjing` VALUES ('2020-07-02', '24.82#31.28#21.32');
INSERT INTO `nanjing` VALUES ('2020-07-03', '24.69#31.4#21.52');
INSERT INTO `nanjing` VALUES ('2020-07-04', '24.85#31.53#21.41');
INSERT INTO `nanjing` VALUES ('2020-07-05', '24.88#31.52#21.15');
INSERT INTO `nanjing` VALUES ('2020-07-06', '26.07#29.67#22.95');
INSERT INTO `nanjing` VALUES ('2020-07-07', '26.14#30.03#22.54');
INSERT INTO `nanjing` VALUES ('2020-07-08', '26.1#30.17#22.43');
INSERT INTO `nanjing` VALUES ('2020-07-09', '26.18#30.23#22.26');
INSERT INTO `nanjing` VALUES ('2020-07-10', '26.19#30.23#22.42');
INSERT INTO `nanjing` VALUES ('2020-07-11', '26.26#30.36#22.32');
INSERT INTO `nanjing` VALUES ('2020-07-12', '26.35#30.16#22.11');
INSERT INTO `nanjing` VALUES ('2020-07-13', '25.48#31.98#21.98');
INSERT INTO `nanjing` VALUES ('2020-07-14', '25.95#30.75#22.31');
INSERT INTO `nanjing` VALUES ('2020-07-15', '26.13#30.1#22.42');
INSERT INTO `nanjing` VALUES ('2020-07-16', '26.33#29.57#22.43');
INSERT INTO `nanjing` VALUES ('2020-07-17', '26.46#29.44#22.58');
INSERT INTO `nanjing` VALUES ('2020-07-18', '26.53#29.08#22.55');
INSERT INTO `nanjing` VALUES ('2020-07-19', '26.58#29.18#22.47');

-- ----------------------------
-- Table structure for nanning
-- ----------------------------
DROP TABLE IF EXISTS `nanning`;
CREATE TABLE `nanning` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of nanning
-- ----------------------------
INSERT INTO `nanning` VALUES ('2020-06-29', '29.81#34.61#25.65');
INSERT INTO `nanning` VALUES ('2020-06-30', '29.57#33.83#25.37');
INSERT INTO `nanning` VALUES ('2020-07-01', '29.4#33.26#25.2');
INSERT INTO `nanning` VALUES ('2020-07-02', '29.43#33.22#25.13');
INSERT INTO `nanning` VALUES ('2020-07-03', '29.36#33.17#25.18');
INSERT INTO `nanning` VALUES ('2020-07-04', '29.58#33.27#25.1');
INSERT INTO `nanning` VALUES ('2020-07-05', '29.47#33.15#25.11');
INSERT INTO `nanning` VALUES ('2020-07-06', '28.45#33.38#25.75');
INSERT INTO `nanning` VALUES ('2020-07-07', '29.14#33.31#25.63');
INSERT INTO `nanning` VALUES ('2020-07-08', '29.36#33.26#25.6');
INSERT INTO `nanning` VALUES ('2020-07-09', '29.7#33.34#25.53');
INSERT INTO `nanning` VALUES ('2020-07-10', '29.68#33.26#25.61');
INSERT INTO `nanning` VALUES ('2020-07-11', '29.96#33.35#25.6');
INSERT INTO `nanning` VALUES ('2020-07-12', '29.96#33.15#25.62');
INSERT INTO `nanning` VALUES ('2020-07-13', '28.9#34.07#26.71');
INSERT INTO `nanning` VALUES ('2020-07-14', '29.42#33.86#26.53');
INSERT INTO `nanning` VALUES ('2020-07-15', '29.7#33.75#26.46');
INSERT INTO `nanning` VALUES ('2020-07-16', '29.79#33.8#26.38');
INSERT INTO `nanning` VALUES ('2020-07-17', '29.7#33.72#26.51');
INSERT INTO `nanning` VALUES ('2020-07-18', '29.98#33.81#26.49');
INSERT INTO `nanning` VALUES ('2020-07-19', '29.91#33.67#26.52');

-- ----------------------------
-- Table structure for qionghai
-- ----------------------------
DROP TABLE IF EXISTS `qionghai`;
CREATE TABLE `qionghai` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of qionghai
-- ----------------------------
INSERT INTO `qionghai` VALUES ('2020-06-29', '29.9#34.51#26.93');
INSERT INTO `qionghai` VALUES ('2020-06-30', '30.02#34.56#26.9');
INSERT INTO `qionghai` VALUES ('2020-07-01', '30.08#34.57#26.87');
INSERT INTO `qionghai` VALUES ('2020-07-02', '30.14#34.53#26.77');
INSERT INTO `qionghai` VALUES ('2020-07-03', '30.19#34.63#26.92');
INSERT INTO `qionghai` VALUES ('2020-07-04', '30.2#34.74#26.6');
INSERT INTO `qionghai` VALUES ('2020-07-05', '30.2#34.81#26.66');
INSERT INTO `qionghai` VALUES ('2020-07-06', '30.69#34.02#26.23');
INSERT INTO `qionghai` VALUES ('2020-07-07', '30.51#34.05#26.31');
INSERT INTO `qionghai` VALUES ('2020-07-08', '30.43#34.11#26.38');
INSERT INTO `qionghai` VALUES ('2020-07-09', '30.38#34.15#26.41');
INSERT INTO `qionghai` VALUES ('2020-07-10', '30.42#34.16#26.48');
INSERT INTO `qionghai` VALUES ('2020-07-11', '30.4#34.14#26.5');
INSERT INTO `qionghai` VALUES ('2020-07-12', '30.38#34.16#26.55');
INSERT INTO `qionghai` VALUES ('2020-07-13', '28.98#34.84#26.0');
INSERT INTO `qionghai` VALUES ('2020-07-14', '29.47#34.49#26.21');
INSERT INTO `qionghai` VALUES ('2020-07-15', '29.74#34.17#26.35');
INSERT INTO `qionghai` VALUES ('2020-07-16', '29.95#34.02#26.45');
INSERT INTO `qionghai` VALUES ('2020-07-17', '30.05#33.93#26.59');
INSERT INTO `qionghai` VALUES ('2020-07-18', '30.08#33.9#26.54');
INSERT INTO `qionghai` VALUES ('2020-07-19', '30.12#33.97#26.57');
INSERT INTO `qionghai` VALUES ('2020-06-29', '24.17#31.65#16.93');
INSERT INTO `qionghai` VALUES ('2020-06-30', '23.95#31.66#17.25');
INSERT INTO `qionghai` VALUES ('2020-07-01', '23.54#31.84#17.32');
INSERT INTO `qionghai` VALUES ('2020-07-02', '23.98#31.68#17.31');
INSERT INTO `qionghai` VALUES ('2020-07-03', '23.79#31.71#17.56');
INSERT INTO `qionghai` VALUES ('2020-07-04', '23.59#31.88#17.49');
INSERT INTO `qionghai` VALUES ('2020-07-05', '23.87#32.0#17.88');
INSERT INTO `qionghai` VALUES ('2020-07-06', '24.95#32.87#19.28');
INSERT INTO `qionghai` VALUES ('2020-07-07', '24.78#32.73#19.2');
INSERT INTO `qionghai` VALUES ('2020-07-08', '24.56#32.67#19.16');
INSERT INTO `qionghai` VALUES ('2020-07-09', '24.83#32.5#19.04');
INSERT INTO `qionghai` VALUES ('2020-07-10', '24.79#32.46#19.09');
INSERT INTO `qionghai` VALUES ('2020-07-11', '24.68#32.59#19.11');
INSERT INTO `qionghai` VALUES ('2020-07-12', '24.88#32.63#19.44');
INSERT INTO `qionghai` VALUES ('2020-07-13', '24.62#30.12#18.24');
INSERT INTO `qionghai` VALUES ('2020-07-14', '24.72#31.3#18.88');
INSERT INTO `qionghai` VALUES ('2020-07-15', '24.69#31.96#19.22');
INSERT INTO `qionghai` VALUES ('2020-07-16', '24.91#32.26#19.31');
INSERT INTO `qionghai` VALUES ('2020-07-17', '24.89#32.43#19.43');
INSERT INTO `qionghai` VALUES ('2020-07-18', '24.78#32.59#19.51');
INSERT INTO `qionghai` VALUES ('2020-07-19', '24.91#32.65#19.8');
INSERT INTO `qionghai` VALUES ('2020-06-29', '26.28#33.08#23.98');
INSERT INTO `qionghai` VALUES ('2020-06-30', '27.13#33.1#23.18');
INSERT INTO `qionghai` VALUES ('2020-07-01', '26.97#33.35#22.76');
INSERT INTO `qionghai` VALUES ('2020-07-02', '27.58#33.41#22.69');
INSERT INTO `qionghai` VALUES ('2020-07-03', '27.71#33.46#22.45');
INSERT INTO `qionghai` VALUES ('2020-07-04', '27.5#33.57#22.57');
INSERT INTO `qionghai` VALUES ('2020-07-05', '27.31#33.49#22.46');
INSERT INTO `qionghai` VALUES ('2020-07-06', '29.92#33.4#23.19');
INSERT INTO `qionghai` VALUES ('2020-07-07', '29.24#32.55#22.96');
INSERT INTO `qionghai` VALUES ('2020-07-08', '28.71#32.18#22.86');
INSERT INTO `qionghai` VALUES ('2020-07-09', '28.55#31.95#22.74');
INSERT INTO `qionghai` VALUES ('2020-07-10', '28.28#32.04#22.71');
INSERT INTO `qionghai` VALUES ('2020-07-11', '28.08#31.96#22.81');
INSERT INTO `qionghai` VALUES ('2020-07-12', '27.83#31.91#22.75');
INSERT INTO `qionghai` VALUES ('2020-07-13', '23.67#29.58#21.65');
INSERT INTO `qionghai` VALUES ('2020-07-14', '25.07#30.06#22.03');
INSERT INTO `qionghai` VALUES ('2020-07-15', '25.76#30.36#21.72');
INSERT INTO `qionghai` VALUES ('2020-07-16', '26.16#30.62#22.01');
INSERT INTO `qionghai` VALUES ('2020-07-17', '26.38#30.63#22.04');
INSERT INTO `qionghai` VALUES ('2020-07-18', '26.24#30.59#22.09');
INSERT INTO `qionghai` VALUES ('2020-07-19', '26.13#30.51#21.98');

-- ----------------------------
-- Table structure for shanghai
-- ----------------------------
DROP TABLE IF EXISTS `shanghai`;
CREATE TABLE `shanghai` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of shanghai
-- ----------------------------
INSERT INTO `shanghai` VALUES ('2020-06-29', '26.31#33.73#24.86');
INSERT INTO `shanghai` VALUES ('2020-06-30', '26.13#32.2#24.34');
INSERT INTO `shanghai` VALUES ('2020-07-01', '26.04#31.55#24.09');
INSERT INTO `shanghai` VALUES ('2020-07-02', '26.1#31.2#23.96');
INSERT INTO `shanghai` VALUES ('2020-07-03', '26.07#30.98#24.24');
INSERT INTO `shanghai` VALUES ('2020-07-04', '26.16#31.42#24.33');
INSERT INTO `shanghai` VALUES ('2020-07-05', '26.13#31.13#24.32');
INSERT INTO `shanghai` VALUES ('2020-07-06', '26.48#28.51#23.66');
INSERT INTO `shanghai` VALUES ('2020-07-07', '26.71#29.5#23.74');
INSERT INTO `shanghai` VALUES ('2020-07-08', '26.98#30.09#24.14');
INSERT INTO `shanghai` VALUES ('2020-07-09', '27.16#30.2#24.21');
INSERT INTO `shanghai` VALUES ('2020-07-10', '27.15#29.9#24.02');
INSERT INTO `shanghai` VALUES ('2020-07-11', '27.22#30.0#23.81');
INSERT INTO `shanghai` VALUES ('2020-07-12', '27.21#30.19#23.71');
INSERT INTO `shanghai` VALUES ('2020-07-13', '28.18#31.46#26.13');
INSERT INTO `shanghai` VALUES ('2020-07-14', '27.82#30.77#25.03');
INSERT INTO `shanghai` VALUES ('2020-07-15', '27.72#30.15#25.11');
INSERT INTO `shanghai` VALUES ('2020-07-16', '27.71#30.18#24.73');
INSERT INTO `shanghai` VALUES ('2020-07-17', '27.68#29.98#24.42');
INSERT INTO `shanghai` VALUES ('2020-07-18', '27.75#29.91#24.32');
INSERT INTO `shanghai` VALUES ('2020-07-19', '27.76#30.03#24.43');

-- ----------------------------
-- Table structure for shenyang
-- ----------------------------
DROP TABLE IF EXISTS `shenyang`;
CREATE TABLE `shenyang` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of shenyang
-- ----------------------------
INSERT INTO `shenyang` VALUES ('2020-06-29', '23.72#30.98#16.39');
INSERT INTO `shenyang` VALUES ('2020-06-30', '23.24#30.12#17.11');
INSERT INTO `shenyang` VALUES ('2020-07-01', '23.51#30.19#17.36');
INSERT INTO `shenyang` VALUES ('2020-07-02', '23.68#30.12#16.69');
INSERT INTO `shenyang` VALUES ('2020-07-03', '23.63#29.84#17.18');
INSERT INTO `shenyang` VALUES ('2020-07-04', '23.2#30.33#16.84');
INSERT INTO `shenyang` VALUES ('2020-07-05', '23.88#30.51#17.42');
INSERT INTO `shenyang` VALUES ('2020-07-06', '24.37#27.93#18.95');
INSERT INTO `shenyang` VALUES ('2020-07-07', '24.59#28.9#19.03');
INSERT INTO `shenyang` VALUES ('2020-07-08', '24.84#29.22#18.96');
INSERT INTO `shenyang` VALUES ('2020-07-09', '24.93#29.76#18.5');
INSERT INTO `shenyang` VALUES ('2020-07-10', '25.03#29.75#18.87');
INSERT INTO `shenyang` VALUES ('2020-07-11', '24.97#29.97#18.46');
INSERT INTO `shenyang` VALUES ('2020-07-12', '24.93#30.3#18.96');
INSERT INTO `shenyang` VALUES ('2020-07-13', '24.2#30.68#19.85');
INSERT INTO `shenyang` VALUES ('2020-07-14', '24.6#30.65#19.68');
INSERT INTO `shenyang` VALUES ('2020-07-15', '24.92#30.65#19.44');
INSERT INTO `shenyang` VALUES ('2020-07-16', '25.07#30.84#19.26');
INSERT INTO `shenyang` VALUES ('2020-07-17', '25.2#30.67#19.47');
INSERT INTO `shenyang` VALUES ('2020-07-18', '25.1#30.68#19.22');
INSERT INTO `shenyang` VALUES ('2020-07-19', '25.11#30.86#19.47');

-- ----------------------------
-- Table structure for shijiazhuang
-- ----------------------------
DROP TABLE IF EXISTS `shijiazhuang`;
CREATE TABLE `shijiazhuang` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of shijiazhuang
-- ----------------------------
INSERT INTO `shijiazhuang` VALUES ('2020-06-29', '26.26#33.27#20.25');
INSERT INTO `shijiazhuang` VALUES ('2020-06-30', '26.97#33.16#20.06');
INSERT INTO `shijiazhuang` VALUES ('2020-07-01', '26.95#33.44#20.05');
INSERT INTO `shijiazhuang` VALUES ('2020-07-02', '26.81#33.63#19.85');
INSERT INTO `shijiazhuang` VALUES ('2020-07-03', '26.93#33.49#19.79');
INSERT INTO `shijiazhuang` VALUES ('2020-07-04', '26.48#33.32#19.77');
INSERT INTO `shijiazhuang` VALUES ('2020-07-05', '27.28#33.63#19.78');
INSERT INTO `shijiazhuang` VALUES ('2020-07-06', '27.76#31.98#21.27');
INSERT INTO `shijiazhuang` VALUES ('2020-07-07', '28.16#31.76#21.04');
INSERT INTO `shijiazhuang` VALUES ('2020-07-08', '28.05#32.1#21.03');
INSERT INTO `shijiazhuang` VALUES ('2020-07-09', '28.07#32.35#20.86');
INSERT INTO `shijiazhuang` VALUES ('2020-07-10', '28.18#31.96#20.77');
INSERT INTO `shijiazhuang` VALUES ('2020-07-11', '28.2#31.66#20.74');
INSERT INTO `shijiazhuang` VALUES ('2020-07-12', '28.31#32.0#20.78');
INSERT INTO `shijiazhuang` VALUES ('2020-07-13', '24.84#27.78#21.29');
INSERT INTO `shijiazhuang` VALUES ('2020-07-14', '26.19#28.96#21.33');
INSERT INTO `shijiazhuang` VALUES ('2020-07-15', '26.32#29.79#21.45');
INSERT INTO `shijiazhuang` VALUES ('2020-07-16', '26.68#30.22#21.4');
INSERT INTO `shijiazhuang` VALUES ('2020-07-17', '27.16#30.09#21.38');
INSERT INTO `shijiazhuang` VALUES ('2020-07-18', '27.06#29.84#21.41');
INSERT INTO `shijiazhuang` VALUES ('2020-07-19', '27.09#30.18#21.53');

-- ----------------------------
-- Table structure for taiyuan
-- ----------------------------
DROP TABLE IF EXISTS `taiyuan`;
CREATE TABLE `taiyuan` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of taiyuan
-- ----------------------------
INSERT INTO `taiyuan` VALUES ('2020-06-29', '21.54#32.88#16.11');
INSERT INTO `taiyuan` VALUES ('2020-06-30', '22.09#31.91#15.81');
INSERT INTO `taiyuan` VALUES ('2020-07-01', '22.78#31.53#15.42');
INSERT INTO `taiyuan` VALUES ('2020-07-02', '22.8#31.45#15.35');
INSERT INTO `taiyuan` VALUES ('2020-07-03', '23.17#31.58#15.74');
INSERT INTO `taiyuan` VALUES ('2020-07-04', '23.4#31.52#15.69');
INSERT INTO `taiyuan` VALUES ('2020-07-05', '23.32#31.56#15.62');
INSERT INTO `taiyuan` VALUES ('2020-07-06', '23.98#31.83#16.53');
INSERT INTO `taiyuan` VALUES ('2020-07-07', '24.02#31.4#16.28');
INSERT INTO `taiyuan` VALUES ('2020-07-08', '24.34#31.41#16.06');
INSERT INTO `taiyuan` VALUES ('2020-07-09', '24.31#31.35#15.99');
INSERT INTO `taiyuan` VALUES ('2020-07-10', '24.52#31.49#16.28');
INSERT INTO `taiyuan` VALUES ('2020-07-11', '24.68#31.64#16.24');
INSERT INTO `taiyuan` VALUES ('2020-07-12', '24.72#31.55#16.22');
INSERT INTO `taiyuan` VALUES ('2020-07-13', '21.34#26.69#16.7');
INSERT INTO `taiyuan` VALUES ('2020-07-14', '22.56#28.88#16.8');
INSERT INTO `taiyuan` VALUES ('2020-07-15', '23.46#29.81#16.69');
INSERT INTO `taiyuan` VALUES ('2020-07-16', '23.76#30.41#16.74');
INSERT INTO `taiyuan` VALUES ('2020-07-17', '24.06#30.78#17.07');
INSERT INTO `taiyuan` VALUES ('2020-07-18', '24.39#31.07#17.07');
INSERT INTO `taiyuan` VALUES ('2020-07-19', '24.47#30.55#17.04');

-- ----------------------------
-- Table structure for tianjin
-- ----------------------------
DROP TABLE IF EXISTS `tianjin`;
CREATE TABLE `tianjin` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tianjin
-- ----------------------------
INSERT INTO `tianjin` VALUES ('2020-06-29', '27.0#32.57#20.53');
INSERT INTO `tianjin` VALUES ('2020-06-30', '27.46#32.72#20.66');
INSERT INTO `tianjin` VALUES ('2020-07-01', '27.66#32.66#20.71');
INSERT INTO `tianjin` VALUES ('2020-07-02', '27.86#32.96#20.97');
INSERT INTO `tianjin` VALUES ('2020-07-03', '28.06#33.3#21.18');
INSERT INTO `tianjin` VALUES ('2020-07-04', '28.12#33.35#20.97');
INSERT INTO `tianjin` VALUES ('2020-07-05', '27.84#33.22#21.17');
INSERT INTO `tianjin` VALUES ('2020-07-06', '26.59#31.31#21.38');
INSERT INTO `tianjin` VALUES ('2020-07-07', '27.19#32.22#21.38');
INSERT INTO `tianjin` VALUES ('2020-07-08', '27.54#32.67#21.23');
INSERT INTO `tianjin` VALUES ('2020-07-09', '27.68#32.71#21.39');
INSERT INTO `tianjin` VALUES ('2020-07-10', '27.91#32.93#21.51');
INSERT INTO `tianjin` VALUES ('2020-07-11', '27.87#33.08#21.32');
INSERT INTO `tianjin` VALUES ('2020-07-12', '27.82#33.14#21.43');
INSERT INTO `tianjin` VALUES ('2020-07-13', '25.66#28.47#21.96');
INSERT INTO `tianjin` VALUES ('2020-07-14', '26.55#29.86#21.99');
INSERT INTO `tianjin` VALUES ('2020-07-15', '26.99#30.49#21.88');
INSERT INTO `tianjin` VALUES ('2020-07-16', '27.27#30.56#21.9');
INSERT INTO `tianjin` VALUES ('2020-07-17', '27.43#30.7#22.11');
INSERT INTO `tianjin` VALUES ('2020-07-18', '27.34#30.91#21.91');
INSERT INTO `tianjin` VALUES ('2020-07-19', '27.45#31.04#22.07');

-- ----------------------------
-- Table structure for wuhan
-- ----------------------------
DROP TABLE IF EXISTS `wuhan`;
CREATE TABLE `wuhan` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of wuhan
-- ----------------------------
INSERT INTO `wuhan` VALUES ('2020-06-29', '25.07#33.63#24.9');
INSERT INTO `wuhan` VALUES ('2020-06-30', '25.48#32.28#24.22');
INSERT INTO `wuhan` VALUES ('2020-07-01', '25.75#31.33#23.89');
INSERT INTO `wuhan` VALUES ('2020-07-02', '26.03#31.05#23.52');
INSERT INTO `wuhan` VALUES ('2020-07-03', '26.31#30.84#23.37');
INSERT INTO `wuhan` VALUES ('2020-07-04', '26.24#30.96#23.22');
INSERT INTO `wuhan` VALUES ('2020-07-05', '26.38#30.97#23.57');
INSERT INTO `wuhan` VALUES ('2020-07-06', '26.19#28.26#23.61');
INSERT INTO `wuhan` VALUES ('2020-07-07', '26.55#29.85#24.05');
INSERT INTO `wuhan` VALUES ('2020-07-08', '26.78#30.31#24.27');
INSERT INTO `wuhan` VALUES ('2020-07-09', '27.13#30.64#24.41');
INSERT INTO `wuhan` VALUES ('2020-07-10', '27.18#30.63#24.48');
INSERT INTO `wuhan` VALUES ('2020-07-11', '27.18#30.95#24.31');
INSERT INTO `wuhan` VALUES ('2020-07-12', '27.14#30.96#24.55');
INSERT INTO `wuhan` VALUES ('2020-07-13', '26.44#28.05#22.64');
INSERT INTO `wuhan` VALUES ('2020-07-14', '26.8#28.96#23.26');
INSERT INTO `wuhan` VALUES ('2020-07-15', '27.0#29.16#23.48');
INSERT INTO `wuhan` VALUES ('2020-07-16', '27.32#29.53#23.67');
INSERT INTO `wuhan` VALUES ('2020-07-17', '27.34#29.54#24.19');
INSERT INTO `wuhan` VALUES ('2020-07-18', '27.35#29.7#23.82');
INSERT INTO `wuhan` VALUES ('2020-07-19', '27.36#29.67#24.22');

-- ----------------------------
-- Table structure for wulumuqi
-- ----------------------------
DROP TABLE IF EXISTS `wulumuqi`;
CREATE TABLE `wulumuqi` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of wulumuqi
-- ----------------------------
INSERT INTO `wulumuqi` VALUES ('2020-06-29', '18.25#31.38#13.0');
INSERT INTO `wulumuqi` VALUES ('2020-06-30', '20.09#30.37#14.02');
INSERT INTO `wulumuqi` VALUES ('2020-07-01', '21.74#29.8#14.88');
INSERT INTO `wulumuqi` VALUES ('2020-07-02', '22.99#29.65#15.29');
INSERT INTO `wulumuqi` VALUES ('2020-07-03', '23.15#29.61#15.77');
INSERT INTO `wulumuqi` VALUES ('2020-07-04', '23.27#29.8#15.98');
INSERT INTO `wulumuqi` VALUES ('2020-07-05', '23.72#29.78#15.99');
INSERT INTO `wulumuqi` VALUES ('2020-07-06', '25.05#28.05#18.38');
INSERT INTO `wulumuqi` VALUES ('2020-07-07', '25.23#28.83#17.53');
INSERT INTO `wulumuqi` VALUES ('2020-07-08', '25.16#29.09#17.14');
INSERT INTO `wulumuqi` VALUES ('2020-07-09', '25.38#29.2#16.83');
INSERT INTO `wulumuqi` VALUES ('2020-07-10', '25.21#29.46#16.61');
INSERT INTO `wulumuqi` VALUES ('2020-07-11', '24.99#29.59#16.47');
INSERT INTO `wulumuqi` VALUES ('2020-07-12', '25.22#29.49#16.45');
INSERT INTO `wulumuqi` VALUES ('2020-07-13', '22.57#26.28#17.91');
INSERT INTO `wulumuqi` VALUES ('2020-07-14', '23.4#27.31#17.88');
INSERT INTO `wulumuqi` VALUES ('2020-07-15', '24.13#27.83#17.96');
INSERT INTO `wulumuqi` VALUES ('2020-07-16', '24.5#28.06#17.91');
INSERT INTO `wulumuqi` VALUES ('2020-07-17', '24.9#28.45#17.94');
INSERT INTO `wulumuqi` VALUES ('2020-07-18', '25.08#28.64#17.95');
INSERT INTO `wulumuqi` VALUES ('2020-07-19', '25.21#28.58#18.02');

-- ----------------------------
-- Table structure for xian
-- ----------------------------
DROP TABLE IF EXISTS `xian`;
CREATE TABLE `xian` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xian
-- ----------------------------
INSERT INTO `xian` VALUES ('2020-06-29', '22.73#36.75#25.15');
INSERT INTO `xian` VALUES ('2020-06-30', '23.6#35.56#24.21');
INSERT INTO `xian` VALUES ('2020-07-01', '24.07#34.8#23.54');
INSERT INTO `xian` VALUES ('2020-07-02', '24.26#34.77#22.88');
INSERT INTO `xian` VALUES ('2020-07-03', '24.49#34.78#23.19');
INSERT INTO `xian` VALUES ('2020-07-04', '24.49#34.53#22.73');
INSERT INTO `xian` VALUES ('2020-07-05', '24.71#34.22#22.65');
INSERT INTO `xian` VALUES ('2020-07-06', '28.97#32.83#21.08');
INSERT INTO `xian` VALUES ('2020-07-07', '27.65#33.26#21.58');
INSERT INTO `xian` VALUES ('2020-07-08', '27.18#33.56#21.58');
INSERT INTO `xian` VALUES ('2020-07-09', '26.84#33.92#21.58');
INSERT INTO `xian` VALUES ('2020-07-10', '26.6#33.96#21.54');
INSERT INTO `xian` VALUES ('2020-07-11', '26.74#33.92#21.2');
INSERT INTO `xian` VALUES ('2020-07-12', '26.69#33.79#21.33');
INSERT INTO `xian` VALUES ('2020-07-13', '24.81#29.55#20.47');
INSERT INTO `xian` VALUES ('2020-07-14', '25.82#31.68#21.07');
INSERT INTO `xian` VALUES ('2020-07-15', '26.67#33.08#21.44');
INSERT INTO `xian` VALUES ('2020-07-16', '27.01#33.75#21.58');
INSERT INTO `xian` VALUES ('2020-07-17', '27.14#33.83#21.3');
INSERT INTO `xian` VALUES ('2020-07-18', '27.35#34.01#21.08');
INSERT INTO `xian` VALUES ('2020-07-19', '27.35#33.6#21.34');

-- ----------------------------
-- Table structure for xining
-- ----------------------------
DROP TABLE IF EXISTS `xining`;
CREATE TABLE `xining` (
  `date` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xining
-- ----------------------------
INSERT INTO `xining` VALUES ('2020-06-29', '17.37#24.94#8.61');
INSERT INTO `xining` VALUES ('2020-06-30', '16.43#23.6#8.5');
INSERT INTO `xining` VALUES ('2020-07-01', '15.93#22.74#8.23');
INSERT INTO `xining` VALUES ('2020-07-02', '15.64#22.99#8.28');
INSERT INTO `xining` VALUES ('2020-07-03', '15.52#22.74#8.22');
INSERT INTO `xining` VALUES ('2020-07-04', '15.55#22.58#8.23');
INSERT INTO `xining` VALUES ('2020-07-05', '15.53#22.81#8.27');
INSERT INTO `xining` VALUES ('2020-07-06', '16.71#24.54#10.11');
INSERT INTO `xining` VALUES ('2020-07-07', '16.51#23.97#9.67');
INSERT INTO `xining` VALUES ('2020-07-08', '16.44#23.55#9.18');
INSERT INTO `xining` VALUES ('2020-07-09', '16.29#23.79#9.15');
INSERT INTO `xining` VALUES ('2020-07-10', '16.27#23.71#9.12');
INSERT INTO `xining` VALUES ('2020-07-11', '16.32#23.67#9.05');
INSERT INTO `xining` VALUES ('2020-07-12', '16.32#23.83#9.06');
INSERT INTO `xining` VALUES ('2020-07-13', '16.03#23.21#10.23');
INSERT INTO `xining` VALUES ('2020-07-14', '16.21#23.43#9.99');
INSERT INTO `xining` VALUES ('2020-07-15', '16.3#23.39#9.74');
INSERT INTO `xining` VALUES ('2020-07-16', '16.26#23.8#9.75');
INSERT INTO `xining` VALUES ('2020-07-17', '16.24#23.79#9.71');
INSERT INTO `xining` VALUES ('2020-07-18', '16.29#23.77#9.67');
INSERT INTO `xining` VALUES ('2020-07-19', '16.29#23.89#9.74');
