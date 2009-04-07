-- phpMyAdmin SQL Dump
-- version 2.6.0-pl3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jul 28, 2005 at 01:13 PM
-- Server version: 3.23.58
-- PHP Version: 4.3.10
-- 
-- Database: `eyeonmajorsb05final`
-- 
CREATE DATABASE `eyeonmajorsb05final`;
USE `eyeonmajorsb05final';

-- --------------------------------------------------------

-- 
-- Table structure for table `activeinviteeroster`
-- 

CREATE TABLE `activeinviteeroster` (
  `ActivePlayerID` smallint(6) default NULL,
  `GolferID` bigint(20) default NULL,
  `ExemptionID` smallint(6) default NULL
) TYPE=MyISAM;

-- 
-- Dumping data for table `activeinviteeroster`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `admineom`
-- 

CREATE TABLE `admineom` (
  `adminID` smallint(6) NOT NULL default '0',
  `adminUserName` tinytext,
  `adminPassword` tinytext,
  `adminFirstName` tinytext,
  `adminLastName` tinytext,
  PRIMARY KEY  (`adminID`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `admineom`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `currentcutline`
-- 

CREATE TABLE `currentcutline` (
  `CurrentCutLineID` bigint(20) NOT NULL auto_increment,
  `Cutline` int(11) NOT NULL default '0',
  `TourneyDescrip` text NOT NULL,
  `LastUpdatedTime` datetime default NULL,
  `EntryCutoffTime` datetime default '0000-00-00 00:00:00',
  PRIMARY KEY  (`CurrentCutLineID`)
) TYPE=MyISAM AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `currentcutline`
-- 

INSERT INTO `currentcutline` VALUES (1, -4, '2005 Masters', '2005-07-17 10:09:34', '2005-06-16 02:00:00');
INSERT INTO `currentcutline` VALUES (2, 10, '2005 US Open', '2005-06-16 16:40:37', '2005-06-16 02:00:00');
INSERT INTO `currentcutline` VALUES (3, 99, '2005 British Open', '2005-07-05 03:57:17', '2005-07-13 22:00:00');

-- --------------------------------------------------------

-- 
-- Table structure for table `eomhandicaps`
-- 

CREATE TABLE `eomhandicaps` (
  `HandicapID` bigint(20) NOT NULL default '0',
  `GroupID` bigint(20) default NULL,
  `GolferID` bigint(20) default NULL,
  `HandicapStrokes` tinyint(3) default NULL,
  PRIMARY KEY  (`HandicapID`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `eomhandicaps`
-- 

INSERT INTO `eomhandicaps` VALUES (1, 1, 94, 5);
INSERT INTO `eomhandicaps` VALUES (2, 1, 27, 2);
INSERT INTO `eomhandicaps` VALUES (3, 1, 73, 3);
INSERT INTO `eomhandicaps` VALUES (4, 1, 53, 2);
INSERT INTO `eomhandicaps` VALUES (5, 1, 37, 2);
INSERT INTO `eomhandicaps` VALUES (6, 1, 78, -1);
INSERT INTO `eomhandicaps` VALUES (7, 1, 57, -2);

-- --------------------------------------------------------

-- 
-- Table structure for table `golfer`
-- 

CREATE TABLE `golfer` (
  `GolferID` bigint(20) NOT NULL auto_increment,
  `GolferFirstName` tinytext NOT NULL,
  `GolferLastName` tinytext NOT NULL,
  `CurrentScoreRelPar` mediumint(9) default NULL,
  `LastMastersFinish` smallint(6) default NULL,
  `GolferMemo` text,
  `DegsofWallyVal` tinyint(4) default NULL,
  `LastUSOpenFinish` smallint(6) default NULL,
  `LastBritishFinish` smallint(6) default NULL,
  `LastPGAFinish` smallint(6) default NULL,
  `GolferImage` text,
  `active` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`GolferID`)
) TYPE=MyISAM AUTO_INCREMENT=245 ;

-- 
-- Dumping data for table `golfer`
-- 

INSERT INTO `golfer` VALUES (1, 'Tommy', 'Aaron', 0, 999, NULL, 2, 999, 999, 999, 'Aaron_Tommy', 0);
INSERT INTO `golfer` VALUES (2, 'Robert', 'Allenby', 1, 999, NULL, 2, NULL, NULL, NULL, 'Allenby_Robert', 1);
INSERT INTO `golfer` VALUES (3, 'Stephen', 'Ames', 6, NULL, NULL, 2, NULL, NULL, NULL, 'Ames_Steven', 1);
INSERT INTO `golfer` VALUES (4, 'Stuart', 'Appleby', -1, NULL, NULL, 2, NULL, NULL, NULL, 'Appleby_Stuart', 1);
INSERT INTO `golfer` VALUES (5, 'George', 'Archer', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Archer_George', 0);
INSERT INTO `golfer` VALUES (6, 'Severiano', 'Ballesteros', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Ballesteros_Severiano', 0);
INSERT INTO `golfer` VALUES (7, 'Rich', 'Beem', 9, NULL, NULL, 2, NULL, NULL, NULL, 'Beem_Rich', 1);
INSERT INTO `golfer` VALUES (8, 'Thomas', 'Bjorn', 2, NULL, NULL, 2, NULL, NULL, NULL, 'Bjorn_Thomas', 1);
INSERT INTO `golfer` VALUES (9, 'Gay', 'Brewer Jr.', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Brewer_GayJr', 0);
INSERT INTO `golfer` VALUES (10, 'Jack', 'Burke Jr.', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Burke_JackJr', 0);
INSERT INTO `golfer` VALUES (11, 'Angel', 'Cabrera', 5, NULL, NULL, 2, NULL, NULL, NULL, 'Cabrera_Angel', 1);
INSERT INTO `golfer` VALUES (12, 'Chad', 'Campbell', 7, NULL, NULL, 2, NULL, NULL, NULL, 'Campbell_Chad', 1);
INSERT INTO `golfer` VALUES (13, 'Paul', 'Casey', 6, NULL, NULL, 2, NULL, NULL, NULL, 'Casey_Paul', 1);
INSERT INTO `golfer` VALUES (14, 'Billy', 'Casper', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Casper_Billy', 0);
INSERT INTO `golfer` VALUES (15, 'K.J.', 'Choi', -1, NULL, NULL, 2, NULL, NULL, NULL, 'Choi_KJ', 1);
INSERT INTO `golfer` VALUES (16, 'Stewart', 'Cink', 5, NULL, NULL, 2, NULL, NULL, NULL, 'Cink_Stewart', 1);
INSERT INTO `golfer` VALUES (17, 'Darren', 'Clarke', -5, NULL, NULL, 2, NULL, NULL, NULL, 'Clarke_Darren', 1);
INSERT INTO `golfer` VALUES (18, 'Charles', 'Coody', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Coody_Charles', 0);
INSERT INTO `golfer` VALUES (19, 'Fred', 'Couples', -8, NULL, NULL, 2, NULL, NULL, NULL, 'Couples_Fred', 1);
INSERT INTO `golfer` VALUES (20, 'Ben', 'Crenshaw', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Crenshaw_Ben', 0);
INSERT INTO `golfer` VALUES (21, 'Ben', 'Curtis', 4, NULL, NULL, 2, NULL, NULL, NULL, 'Curtis_Ben', 1);
INSERT INTO `golfer` VALUES (22, 'John', 'Daly', -5, NULL, NULL, 2, NULL, NULL, NULL, 'Daly_John', 1);
INSERT INTO `golfer` VALUES (23, 'Chris', 'DiMarco', -1, NULL, NULL, 2, NULL, NULL, NULL, 'DiMarco_Chris', 1);
INSERT INTO `golfer` VALUES (24, 'Luke', 'Donald', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Donald_Luke', 1);
INSERT INTO `golfer` VALUES (25, 'David', 'Duval', 13, NULL, NULL, 2, NULL, NULL, NULL, 'Duval_David', 1);
INSERT INTO `golfer` VALUES (26, 'Austin', 'Eaton III', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Eaton_AustinIII', 0);
INSERT INTO `golfer` VALUES (27, 'Ernie', 'Els', -2, NULL, NULL, 2, NULL, NULL, NULL, 'Els_Ernie', 1);
INSERT INTO `golfer` VALUES (28, 'Nick', 'Faldo', -6, NULL, NULL, 2, NULL, NULL, NULL, 'Faldo_Nick', 1);
INSERT INTO `golfer` VALUES (29, 'Steve', 'Flesch', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Flesch_Steve', 1);
INSERT INTO `golfer` VALUES (30, 'Raymond', 'Floyd', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Floyd_Raymond', 0);
INSERT INTO `golfer` VALUES (31, 'Doug', 'Ford', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Ford_Doug', 0);
INSERT INTO `golfer` VALUES (32, 'Carlos', 'Franco', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Franco_Carlos', 1);
INSERT INTO `golfer` VALUES (33, 'Fred', 'Funk', 4, NULL, NULL, 2, NULL, NULL, NULL, 'Funk_Fred', 1);
INSERT INTO `golfer` VALUES (34, 'Jim', 'Furyk', 4, NULL, NULL, 2, NULL, NULL, NULL, 'Furyk_Jim', 1);
INSERT INTO `golfer` VALUES (35, 'Sergio', 'Garcia', -7, NULL, NULL, 2, NULL, NULL, NULL, 'Garcia_Sergio', 1);
INSERT INTO `golfer` VALUES (36, 'Bob', 'Goalby', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Goalby_Bob', 0);
INSERT INTO `golfer` VALUES (37, 'Retief', 'Goosen', -7, NULL, NULL, 2, NULL, NULL, NULL, 'Goosen_Retief', 1);
INSERT INTO `golfer` VALUES (38, 'Jay', 'Haas', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Haas_Jay', 1);
INSERT INTO `golfer` VALUES (39, 'Zach', 'Johnson', 3, NULL, NULL, 2, NULL, NULL, NULL, 'Johnson_Zach', 1);
INSERT INTO `golfer` VALUES (40, 'Shingo', 'Katayama', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Katayama_Shingo', 1);
INSERT INTO `golfer` VALUES (41, 'Jonathan', 'Kaye', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Kaye_Jonathan', 0);
INSERT INTO `golfer` VALUES (42, 'Jerry', 'Kelly', 3, NULL, NULL, 2, NULL, NULL, NULL, 'Kelly_Jerry', 1);
INSERT INTO `golfer` VALUES (43, 'Bernhard', 'Langer', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Langer_Bernhard', 0);
INSERT INTO `golfer` VALUES (44, 'Justin', 'Leonard', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Leonard_Justin', 1);
INSERT INTO `golfer` VALUES (45, 'Thomas', 'Levet', -1, NULL, NULL, 2, NULL, NULL, NULL, 'Levet_Thomas', 1);
INSERT INTO `golfer` VALUES (46, 'Luke', 'List', 0, NULL, NULL, 2, NULL, NULL, NULL, 'List_Luke', 0);
INSERT INTO `golfer` VALUES (47, 'Peter', 'Lonard', 2, NULL, NULL, 2, NULL, NULL, NULL, 'Lonard_Peter', 1);
INSERT INTO `golfer` VALUES (48, 'Davis', 'Love III', 5, NULL, NULL, 2, NULL, NULL, NULL, 'Love_DavisIII', 1);
INSERT INTO `golfer` VALUES (49, 'Sandy', 'Lyle', -6, NULL, NULL, 2, NULL, NULL, NULL, 'Lyle_Sandy', 1);
INSERT INTO `golfer` VALUES (50, 'Jeff', 'Maggert', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Maggert_Jeff', 0);
INSERT INTO `golfer` VALUES (51, 'Shigeki', 'Maruyama', 5, NULL, NULL, 2, NULL, NULL, NULL, 'Maruyama_Shigeki', 1);
INSERT INTO `golfer` VALUES (52, 'Shaun', 'Micheel', 4, NULL, NULL, 2, NULL, NULL, NULL, 'Micheel_Shaun', 1);
INSERT INTO `golfer` VALUES (53, 'Phil', 'Mickelson', 1, NULL, NULL, 2, NULL, NULL, NULL, 'Mickelson_Phil', 1);
INSERT INTO `golfer` VALUES (54, 'Larry', 'Mize', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Mize_Larry', 0);
INSERT INTO `golfer` VALUES (55, 'Ryan', 'Moore', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Moore_Ryan', 0);
INSERT INTO `golfer` VALUES (56, 'Byron', 'Nelson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Nelson_Byron', 0);
INSERT INTO `golfer` VALUES (57, 'Jack', 'Nicklaus', 3, NULL, NULL, 2, NULL, NULL, NULL, 'Nicklaus_Jack', 1);
INSERT INTO `golfer` VALUES (58, 'Nick', 'O''Hern', -3, NULL, NULL, 2, NULL, NULL, NULL, 'OHern_Nick', 1);
INSERT INTO `golfer` VALUES (59, 'Jose Maria', 'Olazabal', -8, NULL, NULL, 2, NULL, NULL, NULL, 'Olazabal_JoseMaria', 1);
INSERT INTO `golfer` VALUES (60, 'Mark', 'O''Meara', 2, NULL, NULL, 2, NULL, NULL, NULL, 'OMeara_Mark', 1);
INSERT INTO `golfer` VALUES (61, 'Arnold', 'Palmer', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Palmer_Arnold', 0);
INSERT INTO `golfer` VALUES (62, 'Ryan', 'Palmer', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Palmer_Ryan', 0);
INSERT INTO `golfer` VALUES (63, 'Rod', 'Pampling', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Pampling_Rod', 1);
INSERT INTO `golfer` VALUES (64, 'Jesper', 'Parnevik', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Parnevik_Jesper', 0);
INSERT INTO `golfer` VALUES (65, 'Kenny', 'Perry', -6, NULL, NULL, 2, NULL, NULL, NULL, 'Perry_Kenny', 1);
INSERT INTO `golfer` VALUES (66, 'Gary', 'Player', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Player_Gary', 0);
INSERT INTO `golfer` VALUES (67, 'Ian', 'Poulter', -6, NULL, NULL, 2, NULL, NULL, NULL, 'Poulter_Ian', 1);
INSERT INTO `golfer` VALUES (68, 'Nick', 'Price', 4, NULL, NULL, 2, NULL, NULL, NULL, 'Price_Nick', 1);
INSERT INTO `golfer` VALUES (69, 'Ted', 'Purdy', 5, NULL, NULL, 2, NULL, NULL, NULL, 'Purdy_Ted', 1);
INSERT INTO `golfer` VALUES (70, 'Chris', 'Riley', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Riley_Chris', 1);
INSERT INTO `golfer` VALUES (71, 'Rory', 'Sabbatini', 7, NULL, NULL, 2, NULL, NULL, NULL, 'Sabbatini_Rory', 1);
INSERT INTO `golfer` VALUES (72, 'Adam', 'Scott', -2, NULL, NULL, 2, NULL, NULL, NULL, 'Scott_Adam', 1);
INSERT INTO `golfer` VALUES (73, 'Vijay', 'Singh', -7, NULL, NULL, 2, NULL, NULL, NULL, 'Singh_Vijay', 1);
INSERT INTO `golfer` VALUES (74, 'Craig', 'Stadler', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Stadler_Craig', 0);
INSERT INTO `golfer` VALUES (75, 'David', 'Toms', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Toms_David', 1);
INSERT INTO `golfer` VALUES (76, 'Kirk', 'Triplett', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Triplett_Kirk', 0);
INSERT INTO `golfer` VALUES (77, 'Joakim', 'Haeggman', 4, NULL, NULL, 2, NULL, NULL, NULL, 'Haeggman_Joakim', 1);
INSERT INTO `golfer` VALUES (78, 'Todd', 'Hamilton', 4, NULL, NULL, 2, NULL, NULL, NULL, 'Hamilton_Todd', 1);
INSERT INTO `golfer` VALUES (79, 'Padraig', 'Harrington', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Harrington_Padraig', 0);
INSERT INTO `golfer` VALUES (80, 'Mark', 'Hensby', -5, NULL, NULL, 2, NULL, NULL, NULL, 'Hensby_Mark', 1);
INSERT INTO `golfer` VALUES (81, 'Tim', 'Herron', -3, NULL, NULL, 2, NULL, NULL, NULL, 'Herron_Tim', 1);
INSERT INTO `golfer` VALUES (82, 'Charles', 'Howell III', 2, NULL, NULL, 2, NULL, NULL, NULL, 'Howell_CharlesIII', 1);
INSERT INTO `golfer` VALUES (83, 'David', 'Howell', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Howell_David', 1);
INSERT INTO `golfer` VALUES (84, 'Trevor', 'Immelman', -6, NULL, NULL, 2, NULL, NULL, NULL, 'Immelman_Trevor', 1);
INSERT INTO `golfer` VALUES (85, 'Fredrik', 'Jacobson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Jacobson_Fredrik', 0);
INSERT INTO `golfer` VALUES (86, 'Miguel Angel', 'Jimenez', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Jimenez_MiguelAngel', 1);
INSERT INTO `golfer` VALUES (87, 'Bo', 'Van Pelt', -4, NULL, NULL, 2, NULL, NULL, NULL, 'VanPelt_Bo', 1);
INSERT INTO `golfer` VALUES (88, 'Scott', 'Verplank', -5, NULL, NULL, 2, NULL, NULL, NULL, 'Verplank_Scott', 1);
INSERT INTO `golfer` VALUES (89, 'Tom', 'Watson', -1, NULL, NULL, 2, NULL, NULL, NULL, 'Watson_Tom', 1);
INSERT INTO `golfer` VALUES (90, 'Mike', 'Weir', 7, NULL, NULL, 2, NULL, NULL, NULL, 'Weir_Mike', 1);
INSERT INTO `golfer` VALUES (91, 'Lee', 'Westwood', 2, NULL, NULL, 2, NULL, NULL, NULL, 'Westwood_Lee', 1);
INSERT INTO `golfer` VALUES (92, 'Stuart', 'Wilson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Wilson_Stuart', 0);
INSERT INTO `golfer` VALUES (93, 'Casey', 'Wittenberg', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Wittenberg_Casey', 0);
INSERT INTO `golfer` VALUES (94, 'Tiger', 'Woods', -14, NULL, NULL, 1, NULL, NULL, NULL, 'Woods_Tiger', 1);
INSERT INTO `golfer` VALUES (95, 'Ian', 'Woosnam', 4, NULL, NULL, 2, NULL, NULL, NULL, 'Woosnam_Ian', 1);
INSERT INTO `golfer` VALUES (96, 'Fuzzy', 'Zoeller', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Zoeller_Fuzzy', 0);
INSERT INTO `golfer` VALUES (98, 'Craig', 'Parry', 8, NULL, NULL, 2, NULL, NULL, NULL, 'parry_craig', 1);
INSERT INTO `golfer` VALUES (97, 'Graeme', 'McDowell', -6, NULL, NULL, 2, NULL, NULL, NULL, 'mcdowell_graeme', 1);
INSERT INTO `golfer` VALUES (99, 'Tom', 'Lehman', -2, NULL, NULL, 2, NULL, NULL, NULL, 'lehman_tom', 1);
INSERT INTO `golfer` VALUES (100, 'Joe', 'Ogilvie', 1, NULL, NULL, 2, NULL, NULL, NULL, 'ogilvie_joe', 1);
INSERT INTO `golfer` VALUES (123, 'Tommy', 'Armour III', 0, NULL, NULL, 2, NULL, NULL, NULL, 'armourIII_tommy', 0);
INSERT INTO `golfer` VALUES (120, 'Jerry', 'Smith', 0, NULL, NULL, 2, NULL, NULL, NULL, 'smith_jerry', 0);
INSERT INTO `golfer` VALUES (119, 'Pierre-Henri', '(a) Soero', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (116, 'Aaron', 'Barber', 0, NULL, NULL, 2, NULL, NULL, NULL, 'barber_aaron', 0);
INSERT INTO `golfer` VALUES (112, 'Jose-Filipe', 'Lima', 0, NULL, NULL, 2, NULL, NULL, NULL, 'filipelimajose', 0);
INSERT INTO `golfer` VALUES (110, 'Robert', 'Carlsson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (111, 'Nick', 'Dougherty', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (101, 'Steven', 'Conran', 0, 0, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (125, 'Olin', 'Browne', 0, NULL, NULL, 2, NULL, NULL, NULL, 'browne_olin', 0);
INSERT INTO `golfer` VALUES (113, 'Peter', 'Hedblom', 0, NULL, NULL, 2, NULL, NULL, NULL, 'hedblom_peter', 0);
INSERT INTO `golfer` VALUES (121, 'James', 'Benepe', 0, NULL, NULL, 2, NULL, NULL, NULL, 'benepe_james', 0);
INSERT INTO `golfer` VALUES (122, 'JP', 'Hayes', 0, NULL, NULL, 2, NULL, NULL, NULL, 'hayes_jp', 0);
INSERT INTO `golfer` VALUES (114, 'Derek', 'Brown', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (108, 'Soren', 'Kjeldsen', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (117, 'Scott', 'Parel', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (104, 'Wil', 'Collins', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (103, 'Keiichiro', 'Fukabori', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (105, 'Peter', 'Hansson', -1, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (106, 'Jonathan', 'Lomas', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (126, 'Craig', 'Barlow', 0, NULL, NULL, 2, NULL, NULL, NULL, 'barlow_craig', 0);
INSERT INTO `golfer` VALUES (115, 'Jason', 'Gore', 0, NULL, NULL, 2, NULL, NULL, NULL, 'gore_jason', 0);
INSERT INTO `golfer` VALUES (102, 'Yong', 'Eun Yang', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (118, 'Matthew', 'Kuchar', 0, NULL, NULL, 2, NULL, NULL, NULL, 'kuchar_matthew', 0);
INSERT INTO `golfer` VALUES (127, 'James', 'Driscoll', 0, NULL, NULL, 2, NULL, NULL, NULL, 'driscoll_james', 0);
INSERT INTO `golfer` VALUES (109, 'Michael', 'Campbell', -7, NULL, NULL, 2, NULL, NULL, NULL, 'campbell_michael', 1);
INSERT INTO `golfer` VALUES (107, 'Simon', 'Dyson', -3, NULL, NULL, NULL, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (124, 'David', '(a) Denham', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (128, 'Clint', 'Jensen', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (129, 'Rocco', 'Mediate', 0, NULL, NULL, 2, NULL, NULL, NULL, 'mediate_rocco', 0);
INSERT INTO `golfer` VALUES (130, 'Rob', 'Rashell', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (131, 'Brandt', 'Snedeker', 0, NULL, NULL, 2, NULL, NULL, NULL, 'snedeker_brandt', 0);
INSERT INTO `golfer` VALUES (132, 'Omar', 'Uresti', 0, NULL, NULL, 2, NULL, NULL, NULL, 'uresti_omar', 0);
INSERT INTO `golfer` VALUES (133, 'DJ', 'Brigman', 0, NULL, NULL, 2, NULL, NULL, NULL, 'brigman_dj', 0);
INSERT INTO `golfer` VALUES (134, 'Steve', 'Elkington', 0, NULL, NULL, 2, NULL, NULL, NULL, 'elkington_steve', 0);
INSERT INTO `golfer` VALUES (135, 'Ryuji', 'Imada', 0, NULL, NULL, 2, NULL, NULL, NULL, 'imada_ryuji', 0);
INSERT INTO `golfer` VALUES (136, 'John', 'Mallinger', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (137, 'David', 'Oh', 0, NULL, NULL, 2, NULL, NULL, NULL, 'oh_david', 0);
INSERT INTO `golfer` VALUES (138, 'Lee', '(a) Williams', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (139, 'Michael', '(a) Putnam', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (140, 'Ian', 'Leggatt', 0, NULL, NULL, 2, NULL, NULL, NULL, 'leggatt_ian', 0);
INSERT INTO `golfer` VALUES (141, 'David', 'Hearn', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (142, 'Franklin', 'Langham', 0, NULL, NULL, 2, NULL, NULL, NULL, 'langham_franklin', 0);
INSERT INTO `golfer` VALUES (143, 'Matthew', '(a) Every', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (144, 'Paul', 'Claxton', 0, NULL, NULL, 2, NULL, NULL, NULL, 'claxton_paul', 0);
INSERT INTO `golfer` VALUES (145, 'Michael', 'Allen', 0, NULL, NULL, 2, NULL, NULL, NULL, 'allen_michael', 0);
INSERT INTO `golfer` VALUES (146, 'Chris', 'Nallen', 0, NULL, NULL, 2, NULL, NULL, NULL, 'nallen_chris', 0);
INSERT INTO `golfer` VALUES (147, 'JL', 'Lewis', 0, NULL, NULL, 2, NULL, NULL, NULL, 'lewis_jl', 0);
INSERT INTO `golfer` VALUES (148, 'Len', 'Mattiace', 0, NULL, NULL, 2, NULL, NULL, NULL, 'mattiace_len', 0);
INSERT INTO `golfer` VALUES (149, 'JJ', 'Henry', 0, NULL, NULL, 2, NULL, NULL, NULL, 'henry_jj', 0);
INSERT INTO `golfer` VALUES (150, 'Steve', 'Allan', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (151, 'Geoff', 'Ogilvy', -5, NULL, NULL, 2, NULL, NULL, NULL, 'ogilvy_geoff', 1);
INSERT INTO `golfer` VALUES (152, 'John', 'Rollins', 0, NULL, NULL, 2, NULL, NULL, NULL, 'rollins_john', 0);
INSERT INTO `golfer` VALUES (153, 'Scott', 'McCarron', 0, NULL, NULL, 2, NULL, NULL, NULL, 'mccarron_scott', 0);
INSERT INTO `golfer` VALUES (154, 'John', 'Cook', 0, NULL, NULL, 2, NULL, NULL, NULL, 'cook_john', 0);
INSERT INTO `golfer` VALUES (155, 'Aaron', 'Oberholser', 0, NULL, NULL, 2, NULL, NULL, NULL, 'oberholser_aaron', 0);
INSERT INTO `golfer` VALUES (156, 'Bill', 'Glasson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'glasson_bill', 0);
INSERT INTO `golfer` VALUES (157, 'Bob', 'Tway', 0, NULL, NULL, 2, NULL, NULL, NULL, 'tway_bob', 0);
INSERT INTO `golfer` VALUES (158, 'Carl', 'Pettersson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'pettersson_carl', 0);
INSERT INTO `golfer` VALUES (159, 'Euan', 'Walters', 2, NULL, NULL, 2, NULL, NULL, NULL, 'walters_euan', 1);
INSERT INTO `golfer` VALUES (160, 'Joe', 'Ogilvie', 0, NULL, NULL, 2, NULL, NULL, NULL, 'ogilvie_joe', 0);
INSERT INTO `golfer` VALUES (161, 'John', 'Merrick', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (162, 'Robert', 'Gamez', 0, NULL, NULL, 2, NULL, NULL, NULL, 'gamez_robert', 0);
INSERT INTO `golfer` VALUES (164, 'Bob', 'Estes', 0, NULL, NULL, 2, NULL, NULL, NULL, 'estes_bob', 0);
INSERT INTO `golfer` VALUES (165, 'Brandt', 'Jobe', 0, NULL, NULL, 2, NULL, NULL, NULL, 'jobe_brandt', 0);
INSERT INTO `golfer` VALUES (166, 'Eric', 'Axley', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (167, 'Frank', 'Lickliter II', 0, NULL, NULL, 2, NULL, NULL, NULL, 'lickliterII_frank', 0);
INSERT INTO `golfer` VALUES (168, 'Sal', 'Spallone', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (169, 'Steve', 'Lowery', 0, NULL, NULL, 2, NULL, NULL, NULL, 'lowery_steve', 0);
INSERT INTO `golfer` VALUES (170, 'Patrick', 'Damron', 0, NULL, NULL, 2, NULL, NULL, NULL, 'damron_patrick', 0);
INSERT INTO `golfer` VALUES (171, 'Trip', '(a) Kuehne', 0, NULL, NULL, 2, NULL, NULL, NULL, 'kuehne_trip', 0);
INSERT INTO `golfer` VALUES (172, 'Kyle', 'Willman', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (173, 'Troy', 'Kelly', 0, NULL, NULL, -2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (174, 'Corey', 'Pavin', 0, NULL, NULL, 2, NULL, NULL, NULL, 'pavin_corey', 0);
INSERT INTO `golfer` VALUES (175, 'Lee', 'Janzen', 0, NULL, NULL, 2, NULL, NULL, NULL, 'janzen_lee', 0);
INSERT INTO `golfer` VALUES (176, 'Steve', 'Jones', 0, NULL, NULL, 2, NULL, NULL, NULL, 'jones_steve', 0);
INSERT INTO `golfer` VALUES (177, 'Peter', 'Jacobsen', 0, NULL, NULL, 2, NULL, NULL, NULL, 'jacobsen_peter', 0);
INSERT INTO `golfer` VALUES (178, 'Spencer', 'Levin', 0, NULL, NULL, 2, NULL, NULL, NULL, 'levin_spencer', 0);
INSERT INTO `golfer` VALUES (179, 'Stephen', 'Gallacher', 9, NULL, NULL, 2, NULL, NULL, NULL, 'gallacher_stephen', 1);
INSERT INTO `golfer` VALUES (180, 'Paul', 'McGinley', 2, NULL, NULL, 2, NULL, NULL, NULL, 'mcginley_paul', 1);
INSERT INTO `golfer` VALUES (181, 'Toru', 'Taniguchi ', 9, NULL, NULL, 2, NULL, NULL, NULL, 'taniguchi_toru', 1);
INSERT INTO `golfer` VALUES (182, 'Colin', 'Montgomerie', -9, NULL, NULL, 2, NULL, NULL, NULL, 'montgomerie_colin', 1);
INSERT INTO `golfer` VALUES (183, 'Conrad', 'Ray', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 0);
INSERT INTO `golfer` VALUES (185, 'Peter', 'Baker', 2, NULL, NULL, 2, NULL, NULL, NULL, 'baker_peter', 1);
INSERT INTO `golfer` VALUES (184, 'James', 'Allred', 4, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (228, 'Chris', 'Campbell', 11, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (186, 'Daniel', 'Barcelo', 7, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (229, 'Marcus', 'Fraser', 9, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (195, 'Stephen', 'Dodd', 2, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (200, 'Alastair', 'Forsyth', 3, NULL, NULL, 2, NULL, NULL, NULL, 'forsyth_alastair', 1);
INSERT INTO `golfer` VALUES (194, 'David', 'Diaz', 5, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (203, 'Hiroyuki', 'Fujita', -2, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (206, 'Scott', 'Hend', 5, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (208, 'Tony', 'Jacklin', 11, NULL, NULL, 2, NULL, NULL, NULL, 'jacklin_tony', 1);
INSERT INTO `golfer` VALUES (199, 'Nick', 'Flanagan', -3, NULL, NULL, 2, NULL, NULL, NULL, 'flanagan_nick', 1);
INSERT INTO `golfer` VALUES (204, 'Ignacio', 'Garrido', 4, NULL, NULL, 2, NULL, NULL, NULL, 'garrido_ignacio', 1);
INSERT INTO `golfer` VALUES (209, 'Thongchai', 'Jaidee', 0, NULL, NULL, 2, NULL, NULL, NULL, 'jaidee_thongchai', 1);
INSERT INTO `golfer` VALUES (189, 'Alexander', 'Cejka', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'cejka_alexander', 1);
INSERT INTO `golfer` VALUES (190, 'Chee Wing', 'Chia', 2, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (198, 'Kenneth', 'Ferrie', 5, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (197, 'Scott', 'Drummond', -2, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (207, 'S K', 'Ho', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (202, 'David', 'Frost', -2, NULL, NULL, 2, NULL, NULL, NULL, 'frost_david', 1);
INSERT INTO `golfer` VALUES (191, 'Daniel', 'Chopra', 2, NULL, NULL, 2, NULL, NULL, NULL, 'chopra_daniel', 1);
INSERT INTO `golfer` VALUES (201, 'Peter', 'Fowler', 2, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (188, 'Mark', 'Calcavecchia', 0, NULL, NULL, 2, NULL, NULL, NULL, 'calcavecchia_mark', 1);
INSERT INTO `golfer` VALUES (192, 'Tim', 'Clark', -4, NULL, NULL, 2, NULL, NULL, NULL, 'clark_tim', 1);
INSERT INTO `golfer` VALUES (187, 'John', 'Bickerton', -1, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (196, 'Martin', 'Doyle', 5, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (193, 'Robert', 'Coles', 6, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (205, 'Richard', 'Green', -4, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (210, 'Simon', 'Kahn', 1, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (211, 'Paul', 'Lawrie', 2, NULL, NULL, 2, NULL, NULL, NULL, 'lawrie_paul', 1);
INSERT INTO `golfer` VALUES (212, 'Peter', 'Lawrie', 8, NULL, NULL, 2, NULL, NULL, NULL, 'lawrie_peter', 1);
INSERT INTO `golfer` VALUES (213, 'Mardan', 'Mamat', 3, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (214, 'Brian', 'McElhinney', 9, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (215, 'Doug', 'McGuigan', 6, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (216, 'Richard', 'Moir', 14, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (217, 'Greg', 'Norman', 1, NULL, NULL, 2, NULL, NULL, NULL, 'norman_greg', 1);
INSERT INTO `golfer` VALUES (218, 'Pete', 'Oakley', 15, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (219, 'Tom', 'Pernice', 13, NULL, NULL, 2, NULL, NULL, NULL, 'pernice_tom', 1);
INSERT INTO `golfer` VALUES (220, 'Tim', 'Petrovic', 8, NULL, NULL, 2, NULL, NULL, NULL, 'petrovic_tim', 1);
INSERT INTO `golfer` VALUES (221, 'Robert', 'Rock', 3, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (222, 'Patrik', 'Sjoland', 5, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (223, 'David', 'Smail', -2, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (224, 'Thammanoon', 'Srirot', 17, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (225, 'Jean', 'van de Velde', 6, NULL, NULL, 2, NULL, NULL, NULL, 'vandevelde_jean', 1);
INSERT INTO `golfer` VALUES (226, 'Duffy', 'Waldorf', 7, NULL, NULL, 2, NULL, NULL, NULL, 'waldorf_duffy', 1);
INSERT INTO `golfer` VALUES (227, 'Steve', 'Webster', -2, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (230, 'Soren', 'Hansen', -6, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (231, 'Andrew', 'Oldcorn', 4, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (232, 'Pat', 'Perez', -2, NULL, NULL, 2, NULL, NULL, NULL, 'perez_pat', 1);
INSERT INTO `golfer` VALUES (233, 'Jean-Francois', 'Remesy', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (234, 'Matthew', 'Richardson', 5, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (235, 'Willhelm', 'Schauman', 8, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (236, 'Charl', 'Schwartzel', 4, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (237, 'Graeme', 'Storm', 9, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (238, 'Tadahiro', 'Takayama', -2, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (239, 'Joe', 'Durant', 2, NULL, NULL, 2, NULL, NULL, NULL, 'durant_joe', 1);
INSERT INTO `golfer` VALUES (240, 'Andre', 'Bossert', 7, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (241, 'Bart', 'Bryant', -5, NULL, NULL, 2, NULL, NULL, NULL, 'bryant_bart', 1);
INSERT INTO `golfer` VALUES (242, 'Andrew', 'Butterfield', 9, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (243, 'Tom', 'Byrum', 4, NULL, NULL, 2, NULL, NULL, NULL, 'byrum_tom', 1);
INSERT INTO `golfer` VALUES (244, 'Henrik', 'Stenson', -2, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `majorimages`
-- 

CREATE TABLE `majorimages` (
  `image_id` bigint(20) NOT NULL auto_increment,
  `image_name` tinytext NOT NULL,
  `image_caption` text,
  `major_name_year` text,
  PRIMARY KEY  (`image_id`)
) TYPE=MyISAM AUTO_INCREMENT=50 ;

-- 
-- Dumping data for table `majorimages`
-- 

INSERT INTO `majorimages` VALUES (1, 'appleby_funk', 'Stuart Appleby and Fred Funk', 'Masters2005');
INSERT INTO `majorimages` VALUES (2, 'ButlerCabin800', 'Augusta - Butler Cabin', 'Masters2005');
INSERT INTO `majorimages` VALUES (3, 'DarrenClarke', 'Darren Clarke on the putting green', 'Masters2005');
INSERT INTO `majorimages` VALUES (4, 'DarrenClarke2', 'Darren Clarke having a laugh', 'Masters2005');
INSERT INTO `majorimages` VALUES (5, 'David_Toms', 'David Toms', 'Masters2005');
INSERT INTO `majorimages` VALUES (6, 'dimarco_haas', 'Chris DiMarco and Jay Haas', 'Masters2005');
INSERT INTO `majorimages` VALUES (7, 'dimarco_hitting', 'Chris DiMarco teeing off', 'Masters2005');
INSERT INTO `majorimages` VALUES (8, 'dimarco_putting1', 'Chris DiMarco putting', 'Masters2005');
INSERT INTO `majorimages` VALUES (9, 'dimarco_putting2', 'Chris DiMarco practicing', 'Masters2005');
INSERT INTO `majorimages` VALUES (10, 'Fred_Couples', 'Fred Couples and caddie Joe LaCava', 'Masters2005');
INSERT INTO `majorimages` VALUES (11, 'fred_funk', 'Fred Funk', 'Masters2005');
INSERT INTO `majorimages` VALUES (12, 'fred_funk2JPG', 'Fred Funk', 'Masters2005');
INSERT INTO `majorimages` VALUES (13, 'gary_player_and_shaun_micheel', 'South African legend Gary Player chatting with Shaun Micheel', 'Masters2005');
INSERT INTO `majorimages` VALUES (14, 'Ian_Poulter1', 'Ian Poulter', 'Masters2005');
INSERT INTO `majorimages` VALUES (15, 'Ian_Poulter3', 'Ian Poulter tees off at Augusta', 'Masters2005');
INSERT INTO `majorimages` VALUES (16, 'Ian_Poulter4', 'Ian Poulter makes a fashion statement at the Par 3 contest', 'Masters2005');
INSERT INTO `majorimages` VALUES (17, 'Ian_Poulter5', 'Ian Poulter', 'Masters2005');
INSERT INTO `majorimages` VALUES (18, 'jay_haas', 'Jay Haas', 'Masters2005');
INSERT INTO `majorimages` VALUES (19, 'Jay_Haas2', 'Jay Haas', 'Masters2005');
INSERT INTO `majorimages` VALUES (20, 'kirk_triplett', 'Kirk Triplett', 'Masters2005');
INSERT INTO `majorimages` VALUES (21, 'lee_westwood', 'Lee Westwood', 'Masters2005');
INSERT INTO `majorimages` VALUES (22, 'lee_westwood2', 'Lee Westwood', 'Masters2005');
INSERT INTO `majorimages` VALUES (23, 'luke_donald', 'Luke Donald', 'Masters2005');
INSERT INTO `majorimages` VALUES (24, 'luke_donald2', 'Northwestern graduate Luke Donald', 'Masters2005');
INSERT INTO `majorimages` VALUES (25, 'nick_faldo_bad_back', 'Nick Faldo with a bad back', 'Masters2005');
INSERT INTO `majorimages` VALUES (26, 'Par3_Contest_Mickelson1', 'Phil Mickelson and Tom Lehman at the Par 3 Contest', 'Masters2005');
INSERT INTO `majorimages` VALUES (27, 'Par3_Contest_Mickelson2', 'Phil Mickelson with daughter as caddy at Par 3 Contest', 'Masters2005');
INSERT INTO `majorimages` VALUES (28, 'Par3_Contest_Mickelson3', 'Phil Mickelson and daughter watch Chris DiMarco tee off in the Par 3 contest', 'Masters2005');
INSERT INTO `majorimages` VALUES (29, 'Phil_with_Pelz', 'Dave Pelz wishes Phil good luck at the 2005 Masters', 'Masters2005');
INSERT INTO `majorimages` VALUES (30, 'Phil_with_Pelz_and_RSmith_bones', 'Phil practicing the 3 foot putting clock with teachers Dave Pelz - Rick Smith - and caddy "Bones"', 'Masters2005');
INSERT INTO `majorimages` VALUES (31, 'rayfloyd', 'Former Masters Champion Raymond Floyd', 'Masters2005');
INSERT INTO `majorimages` VALUES (32, 'Scott_and_Couples1', 'Former Masters Champion Fred Couples with Adam Scott', 'Masters2005');
INSERT INTO `majorimages` VALUES (33, 'Scott_and_Couples2', 'Fred Couples and Adam Scott', 'Masters2005');
INSERT INTO `majorimages` VALUES (34, 'Scott_Freddie_VanPelt', 'Bo Van Pelt and Adam Scott get some course advice from former Masters Champion Fred Couples', 'Masters2005');
INSERT INTO `majorimages` VALUES (35, 'scott_verplank', 'Scott Verplank', 'Masters2005');
INSERT INTO `majorimages` VALUES (36, 'sergio_chillin', 'Sergio Garcia relaxing', 'Masters2005');
INSERT INTO `majorimages` VALUES (37, 'sergo_garcia', 'Sergio Garcia tees off', 'Masters2005');
INSERT INTO `majorimages` VALUES (38, 'shingo_katayama', 'Shingo Katayama ', 'Masters2005');
INSERT INTO `majorimages` VALUES (39, 'singh_gives_lesson_to_shigeki', 'Former Masters Champion Vijay Singh gives a lesson to Shigeki Maruyama', 'Masters2005');
INSERT INTO `majorimages` VALUES (40, 'stuart_appleby', 'Stuart Appleby', 'Masters2005');
INSERT INTO `majorimages` VALUES (41, 'stuart_appleby2', 'Stuart Appleby', 'Masters2005');
INSERT INTO `majorimages` VALUES (42, 'Tiger_Woods1', '3 time Masters Champion Tiger Woods', 'Masters2005');
INSERT INTO `majorimages` VALUES (43, 'Tiger_Woods2', 'Tiger Woods at Doral in a prior week', 'Masters2005');
INSERT INTO `majorimages` VALUES (44, 'Tiger_Woods_and_Frank', 'Tiger and Frank share quality time', 'Masters2005');
INSERT INTO `majorimages` VALUES (45, 'Tiger_Woods_and_Frank2', 'Tiger Woods prior to 2005 Masters', 'Masters2005');
INSERT INTO `majorimages` VALUES (46, 'todd_hamilton', 'Todd Hamilton', 'Masters2005');
INSERT INTO `majorimages` VALUES (47, 'vijay_singh_and_shigeki_maruyama', 'Vijay Singh and Shigeki Maruyama', 'Masters2005');
INSERT INTO `majorimages` VALUES (48, 'Weir_chipping', 'Mike Weir chipping', 'Masters2005');
INSERT INTO `majorimages` VALUES (49, 'WeirandCaddy', 'Former Masters Champion Mike Weir', 'Masters2005');

-- --------------------------------------------------------

-- 
-- Table structure for table `messageboard`
-- 

CREATE TABLE `messageboard` (
  `messageID` bigint(20) NOT NULL auto_increment,
  `posterID` bigint(20) default NULL,
  `message` mediumtext,
  `GroupID` bigint(20) default NULL,
  `timeofmessage` datetime default NULL,
  PRIMARY KEY  (`messageID`)
) TYPE=MyISAM AUTO_INCREMENT=69 ;

-- 
-- Dumping data for table `messageboard`
-- 

INSERT INTO `messageboard` VALUES (6, 1, 'This is a great article about the history of the USGA setups on the course... I remember that round in 1998 when Kirk Triplett stuck his putter out on the last hole to stop the ball from coming back at him.  I''m anxious to see how they set the course up this year, and what holes become ''interesting''.  http://sport.scotsman.com/golf.cfm?id=645432005', 1, '2005-06-14 01:44:16');
INSERT INTO `messageboard` VALUES (5, 1, 'Welcome to the 2005 edition of the EyeOnMajors.com US Open!  Hope you all enjoy.   --use this message board to banter and enjoy yourselves', 1, '2005-06-14 00:25:09');
INSERT INTO `messageboard` VALUES (7, 23, 'what will el tigre''s margin of victory be???', 1, '2005-06-14 12:21:05');
INSERT INTO `messageboard` VALUES (8, 1, 'I agree... I say he wins by 2, over Phil!', 1, '2005-06-14 14:20:33');
INSERT INTO `messageboard` VALUES (20, 156, 'Is my interpretation correct that if all your guys don''t make the cut, you can', 33, '2005-06-15 20:39:53');
INSERT INTO `messageboard` VALUES (9, 1, '...in horse racing terms, and I could be wrong (as I often am about the ponies)... I think DiMarco might unfortunately ''bounce'' coming off two T-1sts in majors.  I think you''ve got to take it LONG off the tee at Pinehurst this week', 1, '2005-06-14 19:10:35');
INSERT INTO `messageboard` VALUES (10, 140, 'Well, it looks like the field is set.  Good luck to everyone.  I want to go on record saying that it it Wedesday night and this system would not let me make changes to my team.  I was ready to drop Sergio like a bad habit.', 33, '2005-06-14 21:23:31');
INSERT INTO `messageboard` VALUES (11, 101, 'Thanks to everyone who entered.  If you have not already done so, PLEASE send your money in as soon', 20, '2005-06-15 06:01:47');
INSERT INTO `messageboard` VALUES (12, 191, 'Tom Shallow likes boys', 29, '2005-06-15 12:15:12');
INSERT INTO `messageboard` VALUES (13, 245, 'Gents, you have no shot at winning this pool.', 64, '2005-06-15 12:15:40');
INSERT INTO `messageboard` VALUES (14, 245, 'Give me all your money now.  Its about as likely that I don''t win this pool as it is that Newton doesn''t putt from the rough.  "I spit Fire."', 64, '2005-06-15 12:16:35');
INSERT INTO `messageboard` VALUES (15, 245, 'Kaye''s mom loves to wear tennis skirts!', 64, '2005-06-15 12:34:05');
INSERT INTO `messageboard` VALUES (16, 231, 'hello?   anybody there?', 58, '2005-06-15 13:29:49');
INSERT INTO `messageboard` VALUES (17, 231, 'I assume we are NOT using their littl e handicapping system!', 58, '2005-06-15 13:37:02');
INSERT INTO `messageboard` VALUES (18, 232, 'I am in.....', 58, '2005-06-15 13:37:50');
INSERT INTO `messageboard` VALUES (19, 231, 'there you are.', 58, '2005-06-15 13:39:15');
INSERT INTO `messageboard` VALUES (21, 156, 'you can''t win?', 33, '2005-06-15 20:40:03');
INSERT INTO `messageboard` VALUES (22, 156, 'if so, you guys and your sleepers will be sorry.', 33, '2005-06-15 20:40:24');
INSERT INTO `messageboard` VALUES (23, 128, '16 entries, we''re playing for the following:                1st Place	 $168 ;  2nd Place$ 48; 3rd Place $24    Good Luck!                                                                                           ', 29, '2005-06-16 06:51:50');
INSERT INTO `messageboard` VALUES (24, 1, 'yep, +3 thru 9... dimarco is bouncing like ''Bellamy Road''...', 1, '2005-06-16 07:06:05');
INSERT INTO `messageboard` VALUES (25, 61, 'El Tigre''s a chump dude!  KJ, KJ!!!!  (I''ve clearly just jinxed him, he''s probably about to go into a tailspin.)  ', 1, '2005-06-16 08:45:12');
INSERT INTO `messageboard` VALUES (26, 1, 'your squad is looking solid, Schnack ...don''t listen to me, looks like I''m missing ANOTHER cut!  ...currently ranked 132 in the world.... that is not going to hack it', 1, '2005-06-16 14:41:20');
INSERT INTO `messageboard` VALUES (32, 1, 'keep those $10 entry fee checks rolling in folks!', 1, '2005-06-18 01:33:07');
INSERT INTO `messageboard` VALUES (31, 1, 'message board is working again...post away', 1, '2005-06-18 01:29:23');
INSERT INTO `messageboard` VALUES (33, 61, '18 patrons making the cut, that has to be a record for an eyeonmajors pool!  I don''t think I have a chance in hell of holding off the others though.  ', 1, '2005-06-18 10:00:17');
INSERT INTO `messageboard` VALUES (34, 141, 'man, our whole league sucked on this one.  that arsehole DiMarco.', 33, '2005-06-18 10:53:59');
INSERT INTO `messageboard` VALUES (35, 1, '...you need Ames to post a solid number in the a.m. on Sunday, "brah"!', 1, '2005-06-18 13:08:12');
INSERT INTO `messageboard` VALUES (36, 62, 'If memory serves Andy, the only person you beat in the Master''s Pool was ME! Great Comeback!!!', 1, '2005-06-18 15:43:35');
INSERT INTO `messageboard` VALUES (37, 23, 'isn''t dale tallon a professional golfer? maybe that inside information helps him select the right players.', 1, '2005-06-18 16:33:43');
INSERT INTO `messageboard` VALUES (38, 1, 'impressive pool debut for Mr. Dale Tallon... will he earn Champion''s locker room status in his first event??   ...makes me wonder if he could handle OLPH alumnus Pat Foley when the British rolls around...', 1, '2005-06-18 17:44:32');
INSERT INTO `messageboard` VALUES (39, 1, 'the man on the scene, Mike Inguagiato, has taken a one shot lead!  ...all of the inside the ropes picture taking must lend a unique insight!', 1, '2005-06-19 14:06:27');
INSERT INTO `messageboard` VALUES (40, 1, '...michael campbell shouldn''t be allowed to win wearing a shirt like that...', 1, '2005-06-19 14:10:00');
INSERT INTO `messageboard` VALUES (41, 1, 'while Goosen might be out of the championship, his score might figure prominently in the last holes of our championship!', 1, '2005-06-19 15:03:26');
INSERT INTO `messageboard` VALUES (42, 1, 'I can''t believe Tiger bogeyed 16 and 17... shock of the tournament.  I would have bet more than our $10 that wouldn''t have happened.  Campbell''s got it now', 1, '2005-06-19 15:16:38');
INSERT INTO `messageboard` VALUES (43, 1, 'Roger Maltbie :: "Gore made Goosen laugh out loud on the 16th tee when he asked him if he wanted to play the hole for $10 to make it interesting"  ha!!!  what a sense of humor.  Great stuff', 1, '2005-06-19 15:47:05');
INSERT INTO `messageboard` VALUES (44, 285, '***SIGN UP NOW!***  $10 Entry***      75% of Entries to 1st place -  20% to 2nd - 5% to Loser!!!', 76, '2005-07-06 10:11:36');
INSERT INTO `messageboard` VALUES (45, 65, 'who hit a shot off of the bridge on #18 on his one and only visit to the old course?  not a tour event, trick question beware!', 1, '2005-07-10 20:52:02');
INSERT INTO `messageboard` VALUES (46, 1, 'this is a tough one...  I have thought about it, and Googled... I only uncovered the name of the bridge : "Swilken Burn Bridge"... I''ll guess Roy McAvoy with a 7-iron', 1, '2005-07-13 02:54:17');
INSERT INTO `messageboard` VALUES (53, 1, '...Westwood fires 76 in the a.m..... "and boom goes the dynamite" as the saying goes... what a pig', 1, '2005-07-14 05:24:07');
INSERT INTO `messageboard` VALUES (48, 380, 'Joseph, your team is shit!!', 117, '2005-07-13 07:07:54');
INSERT INTO `messageboard` VALUES (49, 23, 'sam chapman, from wichita ks, former asst pro at nscc, now head pro at a cc in kansas.', 1, '2005-07-13 11:18:25');
INSERT INTO `messageboard` VALUES (50, 405, 'Hello faggots!', 128, '2005-07-13 12:26:45');
INSERT INTO `messageboard` VALUES (51, 407, 'My picks have no LOFT', 128, '2005-07-13 12:56:46');
INSERT INTO `messageboard` VALUES (52, 1, 'nice... "Sammy Chap", as you guys call him... ', 1, '2005-07-13 15:08:12');
INSERT INTO `messageboard` VALUES (54, 407, 'Absoulte Domination', 128, '2005-07-14 05:44:00');
INSERT INTO `messageboard` VALUES (55, 379, 'Westwood at +4?? Nice pick 911. I''d like to report an emergency - Andrew Smith''s team sucks send an amubulance to the civic number +4', 117, '2005-07-14 07:28:02');
INSERT INTO `messageboard` VALUES (56, 60, 'Hey, I decided to go with Westwood over Donald...what was I thinking?????!!!!!', 1, '2005-07-14 16:53:10');
INSERT INTO `messageboard` VALUES (57, 1, 'I made a similar mistake, buddy.... Westwood better go low tomorrow, or else our squads are FUBAR!', 1, '2005-07-14 22:35:42');
INSERT INTO `messageboard` VALUES (58, 23, 'does anyone not think this tournament is already over??? ', 1, '2005-07-15 07:22:49');
INSERT INTO `messageboard` VALUES (59, 1, 'Tiger is going to run and hide....OVER.......  but the eyeonmajors tourney lives on... not for those of us who chose Westwood who triple bogeyed the Road Hole ', 1, '2005-07-15 09:40:22');
INSERT INTO `messageboard` VALUES (60, 1, '(have you ever seen that up and down Greg Norman made on The Road Hole? --- up against the wall, he banked it off the bricks and onto the green, made a 15 footer for a ho-hum par ', 1, '2005-07-15 10:29:14');
INSERT INTO `messageboard` VALUES (61, 379, 'Sick eh 911? Friday....British Open....your about as good at faking sick as your team is at golf', 117, '2005-07-15 11:35:09');
INSERT INTO `messageboard` VALUES (62, 1, 'oh wow..... Thomas Bjorn is staking his claim as one of the biggest chokers in the game... last week he made a 10 at the Smurfit Open... today he finished bogey-doublebogey to miss the cut by 1!', 1, '2005-07-15 15:50:11');
INSERT INTO `messageboard` VALUES (63, 1, 'Classic... hopefully they show this on sportscenter... Jose Maria holes out from the valley of sin on 18 and does a Constantina Rocca impersonation', 1, '2005-07-15 18:44:52');
INSERT INTO `messageboard` VALUES (64, 58, 'Who goes 3 over on the last 2 frickin holes to miss the cut by 1 in a major championship!!!!  AWWWW', 1, '2005-07-15 20:03:07');
INSERT INTO `messageboard` VALUES (65, 1, 'your squad member, Bjorn........ I am rooting for Mrs. Doubtfire to contend on Sunday...', 1, '2005-07-16 10:44:33');
INSERT INTO `messageboard` VALUES (66, 1, 'uh oh, Monty Doubtfire just hit it into the dreaded Road Hole Bunker.... this is going to be interesting', 1, '2005-07-16 11:03:11');
INSERT INTO `messageboard` VALUES (67, 1, 'nice putt on the last hole, Monty!!!  Beautiful', 1, '2005-07-16 11:22:43');
INSERT INTO `messageboard` VALUES (68, 1, '...that impersonation of Rocca by Olazabal on #18 on Friday goes down in my book as one of the great reactions in majors championship history.   Very funny', 1, '2005-07-17 10:18:22');

-- --------------------------------------------------------

-- 
-- Table structure for table `poolgroup`
-- 

CREATE TABLE `poolgroup` (
  `PoolGroupID` bigint(20) NOT NULL auto_increment,
  `PoolGroupName` tinytext NOT NULL,
  `PoolGroupPassword` tinytext,
  `PoolGroupCommishID` bigint(20) NOT NULL default '0',
  `Player1HandicapID` bigint(20) default NULL,
  `Player2HandicapID` bigint(20) default NULL,
  `Player3HandicapID` bigint(20) default NULL,
  `Player4HandicapID` bigint(20) default NULL,
  `Player5HandicapID` bigint(20) default NULL,
  `Player6HandicapID` bigint(20) default NULL,
  `Player7HandicapID` bigint(20) default NULL,
  `Player8HandicapID` bigint(20) default NULL,
  `Player9HandicapID` bigint(20) default NULL,
  `Player10HandicapID` bigint(20) default NULL,
  `Player1Strokes` tinyint(4) default NULL,
  `Player2Strokes` tinyint(4) default NULL,
  `Player3Strokes` tinyint(4) default NULL,
  `Player4Strokes` tinyint(4) default NULL,
  `Player5Strokes` tinyint(4) default NULL,
  `Player6Strokes` tinyint(4) default NULL,
  `Player7Strokes` tinyint(4) default NULL,
  `Player8Strokes` tinyint(4) default NULL,
  `Player9Strokes` tinyint(4) default NULL,
  `Player10Strokes` tinyint(4) default NULL,
  PRIMARY KEY  (`PoolGroupID`)
) TYPE=MyISAM AUTO_INCREMENT=132 ;

-- 
-- Dumping data for table `poolgroup`
-- 

INSERT INTO `poolgroup` VALUES (1, 'magical', 'major', 2, 94, 27, 73, 53, NULL, NULL, NULL, NULL, NULL, NULL, 5, 2, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (31, 'ChileDip', 'queso1', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (30, 'Patrick', 'Roberts', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (29, 'hackers', 'uniqema', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (28, 'Blu', '12345', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (27, 'Divosta US Open', 'divosta', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (26, 'Kodiak', 'keady', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (25, 'Golf Magazine', 'Lefty', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (24, 'Lowcountry Loopers', 'mayriver', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (23, 'breton', 'breton', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (22, 'Woodcrest Pool', 'pebbles', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (21, 'Surrey Major Pool', 'golf', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (20, 'easystreet', 'cruisecontrol', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (19, 'GroupOfRyan', 'GoR', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (32, 'Wach2005', 'Wach2005', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (33, 'Spurs Golf ', 'manu', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (34, 'Gamblers', 'texasholdem', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (35, 'open05', 'duffer', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (36, 'Majors', 'pick', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (37, '05openus', 'duffers', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (38, 'sruble05', 'sruble', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (39, 'Aussie', 'oz4you', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (40, 'MLBUSA', 'merrill1', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (41, 'FERGUSON', 'FERGIE', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (42, 'Torrent Golf', 'rmunch', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (43, 'US Open Golf Pool', 'golf', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (44, 'queens head', '112233', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (45, 'Trike Golf Pool', 'password', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (46, 'Radley Runners', 'fore', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (47, 'RBCLA', 'rbcla', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (48, 'Palmetto US Open', 'open2005', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (49, 'WIGOLF', 'WIGOGO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (50, 'CONROY POOL', 'LOOP YORNOC', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (51, 'Harvey Street Open', 'poutine', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (52, 'LC', 'bumbash', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (53, 'kenrules1', 'nascar', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (54, 'LVC', 'putter', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (55, 'haywood mtg', 'trent', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (56, 'Broncos', 'WMU', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (57, 'Finance', 'A9pple.9', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (58, 'Archbrook', 'golf', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (59, 'ShopWorks', 'jam217', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (60, 'pooman', 'pooman', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (61, 'Arbys', 'buzz', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (62, 'Vista Research', 'vista', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (63, 'Scotia', 'ellis', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (64, 'Duffers', 'duffers', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (65, 'Pinehurst05', 'kitsilano', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (66, 'group777', 'jehow2', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (67, 'Genco Olive Oil', 'luca', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (68, 'Canuck Hackers', 'usopen', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (69, 'grusome twosome', 'dirty', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (72, 'SoftMart Fantasy Golf', 'pogue', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (73, 'Parcmen', 'golfers', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (74, 'Romie''s Open Pool', '1234', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (75, 'Pgapro', 'golf', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (76, 'Cal Cas Bogeys', 'aplus', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (77, 'Holly', 'lucy', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (78, 'Winners', '6037453742', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (79, 'fawcetts', 'soloman', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (80, 'cowboy', 'dallas', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (81, 'the shankers', 'jeffjay2005', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (82, 'GreeneRiders', 'daniele', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (83, 'hotgolf', 'fore', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (84, 'Kennedale Rocks', 'parks', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (85, 'miramichiers', 'darwin', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (86, 'Greene', 'babylon', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (87, 'Ledgeview', '35483', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (88, 'digimen', 'mavman1', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (89, 'sanpaulo', 'ben', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (90, 'AK', 'tiger', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (91, 'grand golf', 'foresum', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (92, 'Mr. MulliganMan', 'raven', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (93, 'Irish', 'notredame', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (94, 'Barton Creek Resort', 'barton', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (95, 'bigbru24', 'beer', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (96, 'Aquilans', 'EDSGolfers', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (97, 'Berts Boys', 'bertie', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (98, 'rexxe', 'saluitte', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (99, 'lucky', 'chunky', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (100, 'stafford', 'garrett', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (101, 'Ipsos', 'Ipsos', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (102, 'Wedafukowie', 'patty1954', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (103, 'Office535', 'quentin', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (104, 'Hillbilly Golfbums', 'oneputtplease', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (105, 'mizuno', 'mizuno', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (106, 'Bay Valley', 'surf', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (107, 'Badger', 'killie', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (108, 'gji', 'pawnee', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (109, 'verizon', 'baltimore', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (110, 'Hopmeadow', 'Mulligan', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (111, 'Glenbrook South', 'Titans', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (112, 'woldert', 'woldert', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (113, 'Sans Shaler', 'Shaler', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (114, 'sea dogs', '808080', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (115, 'publicgroup', 'eyeonmajors', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (116, 'windjammers', 'alison40', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (117, 'MEH', 'MEH', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (118, 'paragon01', 'paragon01', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (119, 'HURLEY POOL', 'golf', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (120, 'nepc', 'nepc', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (121, 'dogma', 'katayama', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (122, 'bogeys', 'bogeys', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (123, 'Conners Mulligan Hole', 'conner', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (124, 'SteelCats', 'relic', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (125, 'Wilmington Golf', 'wgolf', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (126, 'hackersfore', 'hackers', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (127, 'Sandbaggers', 'duffer', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (128, 'HighVoices', 'Freddy', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (129, 'BMW Canada', 'e90', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (130, 'Arnie''s Army', 'birdiemaster', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (131, 'The Ring Crew', 'shaggy', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `poolperson`
-- 

CREATE TABLE `poolperson` (
  `EntrantID` bigint(20) NOT NULL auto_increment,
  `EntrantRole` tinytext,
  `EntrantLastName` tinytext NOT NULL,
  `EntrantFirstName` tinytext NOT NULL,
  `EmailAddy` text NOT NULL,
  `AviaryDeals` tinyint(4) default NULL,
  `PartnerDeals` tinyint(4) default NULL,
  `EntrantUserName` tinytext NOT NULL,
  `EntrantPassword` tinytext NOT NULL,
  `SelectedTeam1ID` bigint(20) default NULL,
  `SelectedTeam2ID` bigint(20) default NULL,
  `SelectedTeam3ID` bigint(20) default NULL,
  `SelectedTeam4ID` bigint(20) default NULL,
  `SelectedTeam5ID` bigint(20) default NULL,
  `signupdate` datetime default NULL,
  `GroupID` bigint(20) default NULL,
  PRIMARY KEY  (`EntrantID`)
) TYPE=MyISAM AUTO_INCREMENT=439 ;

-- 
-- Dumping data for table `poolperson`
-- 

INSERT INTO `poolperson` VALUES (30, 'basic', 'Murphy', 'Brian', 'brian_murph@yahoo.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:04:02', 1);
INSERT INTO `poolperson` VALUES (1, 'admin', 'Holton', 'Mark', 'holtonma@gmail.com', 1, NULL, '', 'scramjet', NULL, NULL, NULL, NULL, NULL, '2005-04-06 17:53:58', 1);
INSERT INTO `poolperson` VALUES (23, 'basic', 'Eye', 'Jerry', 'mreye1@ameritech.net', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 18:19:00', 1);
INSERT INTO `poolperson` VALUES (24, 'basic', 'McDon', 'Brian', 'DMcdon6452@aol.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 19:02:17', 1);
INSERT INTO `poolperson` VALUES (25, 'basic', 'Lamoree', 'Jim', 'Jlamoree65@cs.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 19:17:59', 1);
INSERT INTO `poolperson` VALUES (26, 'basic', 'Lamoree', 'Jan', 'Janlamoree65@cs.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 19:18:29', 1);
INSERT INTO `poolperson` VALUES (27, 'basic', 'Judson', 'Oswald', 'oswaldja@hotmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 19:43:45', 1);
INSERT INTO `poolperson` VALUES (28, 'basic', 'Henry', 'HK', 'HKHENRY@aol.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 19:55:45', 1);
INSERT INTO `poolperson` VALUES (29, 'basic', 'Goering', 'JD', 'goerinjd@hotmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:01:50', 1);
INSERT INTO `poolperson` VALUES (38, 'basic', 'Eliason', 'Garth', 'gweliason@gmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:26:00', 1);
INSERT INTO `poolperson` VALUES (37, 'basic', 'Shimp', 'Jon', 'jon.shimp@gmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:24:11', 1);
INSERT INTO `poolperson` VALUES (36, 'basic', 'Shulman', 'Joe', 'j.j.shulman@att.net', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:21:25', 1);
INSERT INTO `poolperson` VALUES (35, 'basic', 'Swami', 'The', 'jerry.ing@cbre.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:19:34', 1);
INSERT INTO `poolperson` VALUES (34, 'basic', 'Pellati', 'R', 'rpellati@aol.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:16:34', 1);
INSERT INTO `poolperson` VALUES (33, 'basic', 'Phales', 'Bob', 'rpdelta7@sbcglobal.net', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:13:52', 1);
INSERT INTO `poolperson` VALUES (32, 'basic', 'Bultinck', 'Chris', 'chrisbultinck@hotmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:10:06', 1);
INSERT INTO `poolperson` VALUES (31, 'basic', 'Nethercott', 'Candice', 'candicen@pro-shop.co.za', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:06:39', 1);
INSERT INTO `poolperson` VALUES (39, 'basic', 'Carroll', 'Andrew', 'andrewdcarroll@gmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:28:44', 1);
INSERT INTO `poolperson` VALUES (40, 'basic', 'Inguagiato', 'Dennis', 'golfing_dennis225@yahoo.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:30:24', 1);
INSERT INTO `poolperson` VALUES (41, 'basic', 'TGlass', 'Brad', 'brad@tglass.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:32:58', 1);
INSERT INTO `poolperson` VALUES (42, 'basic', 'Watson', 'Tee', 'teewatson@sbcglobal.net', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:35:00', 1);
INSERT INTO `poolperson` VALUES (43, 'basic', 'Watson2', 'Tee', 'teewatson2@sbcglobal.net', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:37:25', 1);
INSERT INTO `poolperson` VALUES (44, 'basic', 'Watson3', 'Tee', 'teewatson3@sbcglobal.net', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:45:26', 1);
INSERT INTO `poolperson` VALUES (45, 'basic', 'Clark', 'Chris', 'cclark@farmersagent.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:47:26', 1);
INSERT INTO `poolperson` VALUES (46, 'basic', 'Pulford', 'Ros', 'rosp331@aol.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:48:46', 1);
INSERT INTO `poolperson` VALUES (47, 'basic', 'Pulford', 'Bob', 'rosp3312@aol.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:49:06', 1);
INSERT INTO `poolperson` VALUES (48, 'basic', 'Goering', 'Stephen', 'stephengoering@yahoo.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:52:41', 1);
INSERT INTO `poolperson` VALUES (49, 'basic', 'Hall', 'Amy', 'amy_hall@microvision.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:56:56', 1);
INSERT INTO `poolperson` VALUES (50, 'basic', 'Salmans', 'Van', 'van@salmans.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 21:30:14', 1);
INSERT INTO `poolperson` VALUES (51, 'basic', 'Salmans', 'CK 1', 'van2@salmans.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 21:32:05', 1);
INSERT INTO `poolperson` VALUES (52, 'basic', 'Salmans', 'Vanman', 'van3@salmans.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 21:34:47', 1);
INSERT INTO `poolperson` VALUES (53, 'basic', 'Jacobson', 'Bob', 'bob@jacobson.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 21:36:44', 1);
INSERT INTO `poolperson` VALUES (54, 'basic', 'Stavriotis', 'Eric', 'ericstavriotis@hotmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 21:38:34', 1);
INSERT INTO `poolperson` VALUES (55, 'basic', 'Giato', 'Mike', 'mikegiato@aol.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 21:39:55', 1);
INSERT INTO `poolperson` VALUES (277, 'basic', 'Endo', 'Sandy', 'sandyendo@hotmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-07-05 14:37:52', 1);
INSERT INTO `poolperson` VALUES (276, 'basic', 'british', 'testing', 'testingbritish', 1, NULL, '', 'testingbritish', NULL, NULL, NULL, NULL, NULL, '2005-07-05 14:21:49', 71);
INSERT INTO `poolperson` VALUES (58, 'basic', 'Bryn', 'Bob', 'bob.bryn@gmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 21:48:56', 1);
INSERT INTO `poolperson` VALUES (59, 'basic', 'Schock', 'Brad', 'bschock@kpmg.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 21:50:52', 1);
INSERT INTO `poolperson` VALUES (60, 'basic', 'Parker', 'Tim', 'tim_parker@verizon.net', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 21:52:41', 1);
INSERT INTO `poolperson` VALUES (61, 'basic', 'Schnack', 'Andy', 'aschnack@hotmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 21:54:53', 1);
INSERT INTO `poolperson` VALUES (62, 'basic', 'Holton', 'Wally', 'bigwallh@hotmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 21:58:32', 1);
INSERT INTO `poolperson` VALUES (63, 'basic', 'Dedekind', 'Brendon', 'dedekind@hotmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 22:03:13', 1);
INSERT INTO `poolperson` VALUES (64, 'basic', 'VonderHaar', 'Dan-O', 'dandvh@gmail.com', 1, 1, '', 'major', 64, 0, 0, 0, 0, '2005-04-07 07:03:45', 1);
INSERT INTO `poolperson` VALUES (65, 'basic', 'Inguagiato', 'Brad', 'brad_inguagiato@yahoo.com', 1, 1, '', 'major', 65, NULL, NULL, NULL, NULL, '2005-04-07 02:20:53', 1);
INSERT INTO `poolperson` VALUES (91, 'basic', 'swatzell', 'jp', 'jpswat@aol.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-08 08:36:10', 1);
INSERT INTO `poolperson` VALUES (90, 'basic', 'Spencer', 'Paul', 'spencepd@gmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-06 19:43:44', 1);
INSERT INTO `poolperson` VALUES (89, 'basic', 'McElroy', 'Ryan', 'ryanmce@gmail.com', 1, NULL, '', 'myrror', NULL, NULL, NULL, NULL, NULL, '2005-06-06 15:08:39', 19);
INSERT INTO `poolperson` VALUES (88, 'basic', 'Straka', 'Scott', 'scott.straka@gmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-06 14:37:03', 1);
INSERT INTO `poolperson` VALUES (74, 'basic', 'Wallace', 'Courtney', 'courtneywallace@hotmail.com', 1, NULL, '', 'ashokan', NULL, NULL, NULL, NULL, NULL, '2005-06-04 22:29:48', 1);
INSERT INTO `poolperson` VALUES (101, 'basic', 'Weston', 'Mark', 'mweston@patra.net', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-08 16:46:00', 20);
INSERT INTO `poolperson` VALUES (100, 'basic', 'Siegel', 'Dan', 'dsiegel@ameritech.net', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-08 09:02:42', 1);
INSERT INTO `poolperson` VALUES (99, 'basic', 'Martinko', 'David', 'davidma@otsuka.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-08 09:01:18', 1);
INSERT INTO `poolperson` VALUES (98, 'basic', 'Tilghman', 'Rich', 'rtilghman@pepperconstruction.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-08 08:53:05', 1);
INSERT INTO `poolperson` VALUES (97, 'basic', 'Brizz', 'Joe', 'joe.brizz@mcd.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-08 08:49:39', 1);
INSERT INTO `poolperson` VALUES (96, 'basic', 'Jacobson', 'Bob', 'thejakester1@mindspring.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-08 08:47:42', 1);
INSERT INTO `poolperson` VALUES (95, 'basic', 'Munger', 'Mark', 'mark.munger@mortgage.wellsfargo.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-08 08:44:37', 1);
INSERT INTO `poolperson` VALUES (94, 'basic', 'Manning', 'Jeff', 'jeffmannin@gmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-08 08:43:21', 1);
INSERT INTO `poolperson` VALUES (93, 'basic', 'Cutler', 'Bear', 'bearcutler@aol.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-08 08:41:14', 1);
INSERT INTO `poolperson` VALUES (92, 'basic', 'Tapas', 'Nick', 'ntps34@sbcglobal.net', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-08 08:39:46', 1);
INSERT INTO `poolperson` VALUES (102, 'basic', 'Mennel', 'Mike ', 'mjmennel@aol.com', 1, NULL, '', 'melon', NULL, NULL, NULL, NULL, NULL, '2005-06-08 17:08:42', 1);
INSERT INTO `poolperson` VALUES (103, 'basic', 'Grossi', 'Rob', 'crystalfinancial@yahoo.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-08 17:42:22', 20);
INSERT INTO `poolperson` VALUES (104, 'basic', 'Inguagiato', 'Barbara', 'bjeye@aol.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-08 20:05:07', 1);
INSERT INTO `poolperson` VALUES (105, 'basic', 'Burnie', 'Fred', 'fredburnie@canada.com', 1, NULL, '', 'yellowsnow', NULL, NULL, NULL, NULL, NULL, '2005-06-08 21:13:54', 21);
INSERT INTO `poolperson` VALUES (106, 'basic', 'Mochan', 'Melissa', 'anglbabe11@yahoo.com', 1, NULL, '', 'cosmo', NULL, NULL, NULL, NULL, NULL, '2005-06-08 23:51:21', 1);
INSERT INTO `poolperson` VALUES (107, 'basic', 'Boyce', 'Michael ', 'mboyce@jobplex.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-09 15:09:33', 1);
INSERT INTO `poolperson` VALUES (108, 'basic', 'Stone', 'Jim', 'jstone4@cfl.rr.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-09 17:53:32', 20);
INSERT INTO `poolperson` VALUES (109, 'basic', 'Reilly', 'Gary', 'Gary_Reilly@microvision.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-10 00:42:55', 1);
INSERT INTO `poolperson` VALUES (110, 'basic', 'DeAngelo', 'Marty', 'golfshop@Isleworth.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-10 10:26:47', 20);
INSERT INTO `poolperson` VALUES (111, 'basic', 'johnston', 'todd', 'budfox@carolina.rr.com', 1, NULL, '', 'budfox', NULL, NULL, NULL, NULL, NULL, '2005-06-10 12:19:09', 0);
INSERT INTO `poolperson` VALUES (112, 'basic', 'Davis', 'Philip', 'wimbledon8@aol.com', 1, NULL, '', 'tennis', NULL, NULL, NULL, NULL, NULL, '2005-06-11 20:17:43', 0);
INSERT INTO `poolperson` VALUES (145, 'basic', 'palmer', 'john', 'jpalmer2103@hotmail.com', 1, NULL, '', 'manu', NULL, NULL, NULL, NULL, NULL, '2005-06-13 19:19:41', 33);
INSERT INTO `poolperson` VALUES (114, 'basic', 'goldstein', 'lon', 'groltd@msn.com', 1, NULL, '', 'pebbles', NULL, NULL, NULL, NULL, NULL, '2005-06-12 10:40:38', 22);
INSERT INTO `poolperson` VALUES (115, 'basic', 'Pool', 'Chris ', 'cpool57172@aol.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-12 19:23:59', 20);
INSERT INTO `poolperson` VALUES (116, 'basic', 'MacDonald', 'Mark', 'mark@lloydmac.ns.ca', 1, NULL, '', 'ronnoc', NULL, NULL, NULL, NULL, NULL, '2005-06-13 05:05:12', 23);
INSERT INTO `poolperson` VALUES (117, 'basic', 'Copeland', 'Roger', 'ritzcaddie@yahoo.com', 1, NULL, '', 'looper13', NULL, NULL, NULL, NULL, NULL, '2005-06-13 05:21:38', 24);
INSERT INTO `poolperson` VALUES (118, 'basic', 'morris', 'jason', 'jmorris568@hotmail.com', 1, NULL, '', '062478', NULL, NULL, NULL, NULL, NULL, '2005-06-13 05:25:41', 0);
INSERT INTO `poolperson` VALUES (119, 'basic', 'Jones', 'Greg', 'greg@firstballantyne.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-13 05:35:36', 20);
INSERT INTO `poolperson` VALUES (120, 'basic', 'Shaprow', 'Mark', 'mshaprow@cfl.rr.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-13 06:08:13', 20);
INSERT INTO `poolperson` VALUES (121, 'basic', 'Vance', 'Russ', 'vances@optonline.net', 1, NULL, '', 'trinity7', NULL, NULL, NULL, NULL, NULL, '2005-06-13 07:12:36', 25);
INSERT INTO `poolperson` VALUES (122, 'basic', 'Pool', 'Jason', 'jppool2@aol.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-13 07:15:18', 20);
INSERT INTO `poolperson` VALUES (123, 'basic', 'Kren', 'Jeff', 'jkren@sbcglobal.net', 1, NULL, '', 'kodiak24', NULL, NULL, NULL, NULL, NULL, '2005-06-13 07:23:13', 26);
INSERT INTO `poolperson` VALUES (124, 'basic', 'Kepley', 'Keith', 'keith.kepley@wachoviasec.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-13 08:13:30', 20);
INSERT INTO `poolperson` VALUES (125, 'basic', 'MacNaughton', 'Chris', 'chrismacnaughton@yahoo.com', 1, NULL, '', 'panther', NULL, NULL, NULL, NULL, NULL, '2005-06-13 08:53:22', 27);
INSERT INTO `poolperson` VALUES (126, 'basic', 'skdf', 'Jd', 'dfs@dfs.com', 1, NULL, '', '12345', NULL, NULL, NULL, NULL, NULL, '2005-06-13 09:39:52', 28);
INSERT INTO `poolperson` VALUES (127, 'basic', 'Knox', 'Fred', 'trading@mercerco.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-13 10:03:39', 20);
INSERT INTO `poolperson` VALUES (128, 'basic', 'Shallow', 'Jim', 'shalzinde@comcast.net', 1, NULL, '', 'Kelsey1k', NULL, NULL, NULL, NULL, NULL, '2005-06-13 10:20:10', 29);
INSERT INTO `poolperson` VALUES (129, 'basic', 'Burke', 'Timothy', 'tburke@lehman.com', 1, NULL, '', 'rookie', NULL, NULL, NULL, NULL, NULL, '2005-06-13 10:52:55', 1);
INSERT INTO `poolperson` VALUES (130, 'basic', 'Durica', 'Marc', 'mdurica@portfoliocapital.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-13 10:53:17', 20);
INSERT INTO `poolperson` VALUES (131, 'basic', 'Roberts', 'Patrick', 'pr5594@hotmail.com', 1, NULL, '', 'nicole', NULL, NULL, NULL, NULL, NULL, '2005-06-13 11:29:44', 30);
INSERT INTO `poolperson` VALUES (132, 'basic', 'dunn', 'tommy ', 'hoselshank@hotmail.com', 1, NULL, '', 'lethbridge', NULL, NULL, NULL, NULL, NULL, '2005-06-13 12:22:05', 0);
INSERT INTO `poolperson` VALUES (133, 'basic', 'White 1', 'Bryan ', 'bryanwhit@bloomberg.net', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-13 12:54:43', 20);
INSERT INTO `poolperson` VALUES (134, 'basic', 'White 2', 'Bryan', 'bwhite@evergreeninvestments.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-13 12:57:21', 20);
INSERT INTO `poolperson` VALUES (135, 'basic', 'Goodwin', 'Don', 'don.goodwin@uniqema.com', 1, NULL, '', 'Gracie05', NULL, NULL, NULL, NULL, NULL, '2005-06-13 13:27:13', 29);
INSERT INTO `poolperson` VALUES (136, 'basic', 'Vicario', 'Michael', 'MVicario@aol.com', 1, NULL, '', 'Scruffy1', NULL, NULL, NULL, NULL, NULL, '2005-06-13 13:28:51', 29);
INSERT INTO `poolperson` VALUES (137, 'basic', 'Walker', 'Mike', 'mswalk98@yahoo.com', 1, NULL, '', 'cassius', NULL, NULL, NULL, NULL, NULL, '2005-06-13 13:30:48', 31);
INSERT INTO `poolperson` VALUES (138, 'basic', 'Troppmann', 'Tyler', 'tyler.troppmann@wachovia.com', 1, NULL, '', 'bodhisattva', NULL, NULL, NULL, NULL, NULL, '2005-06-13 13:44:05', 32);
INSERT INTO `poolperson` VALUES (139, 'basic', 'Carroll', 'Tim', 'terp201@yahoo.com', 1, NULL, '', 'terp201', NULL, NULL, NULL, NULL, NULL, '2005-06-13 13:51:49', 29);
INSERT INTO `poolperson` VALUES (140, 'basic', 'Haug', 'Ryan', 'ryanhaug@swbell.net', 1, NULL, '', 'soleman', NULL, NULL, NULL, NULL, NULL, '2005-06-13 14:27:01', 33);
INSERT INTO `poolperson` VALUES (141, 'basic', 'Tuan', 'Willie', 'willietuan@yahoo.com', 1, NULL, '', 'bubba73', NULL, NULL, NULL, NULL, NULL, '2005-06-13 15:00:58', 33);
INSERT INTO `poolperson` VALUES (142, 'basic', 'Shallow', 'John ', 'jfshallow@yahoo.com', 1, NULL, '', '92vnova', NULL, NULL, NULL, NULL, NULL, '2005-06-13 15:37:21', 29);
INSERT INTO `poolperson` VALUES (143, 'basic', 'Helmers', 'Tom ', 'thelmers@cuila.com', 1, NULL, '', 'sthelmersfire', NULL, NULL, NULL, NULL, NULL, '2005-06-13 16:21:58', 34);
INSERT INTO `poolperson` VALUES (144, 'basic', 'Plachko', 'Carrie', 'cplachko@cuila.com', 1, NULL, '', 'maverick', NULL, NULL, NULL, NULL, NULL, '2005-06-13 16:53:31', 34);
INSERT INTO `poolperson` VALUES (146, 'basic', 'Detwiler', 'Alec', 'alecdet@mac.com', 1, NULL, '', 'suhijito', NULL, NULL, NULL, NULL, NULL, '2005-06-13 19:40:10', 33);
INSERT INTO `poolperson` VALUES (147, 'basic', 'Davis', 'Kelvin', 'bandlit@hotmail.com', 1, NULL, '', 'darian', NULL, NULL, NULL, NULL, NULL, '2005-06-13 21:02:26', 1);
INSERT INTO `poolperson` VALUES (148, 'basic', 'van Beek', 'Oliver', 'ovb1@mac.com', 1, NULL, '', 'joanna', NULL, NULL, NULL, NULL, NULL, '2005-06-13 21:27:39', 35);
INSERT INTO `poolperson` VALUES (149, 'basic', 'Meisels', 'Russ', 'rmeisels@hotmail.com', 1, NULL, '', 'finboss', NULL, NULL, NULL, NULL, NULL, '2005-06-13 21:45:10', 36);
INSERT INTO `poolperson` VALUES (150, 'basic', 'Walter', 'Kevin ', 'kvnwalter@mac.com', 1, NULL, '', 'J0di24', NULL, NULL, NULL, NULL, NULL, '2005-06-13 22:01:59', 37);
INSERT INTO `poolperson` VALUES (151, 'basic', 'Brower', 'C. Ray', 'crbgolf@sbcglobal.net', 1, NULL, '', '3554', NULL, NULL, NULL, NULL, NULL, '2005-06-13 22:40:50', 1);
INSERT INTO `poolperson` VALUES (153, 'basic', 'Ruble', 'Scott', 'sruble@fuse.net', 1, NULL, '', 'a77icu567', NULL, NULL, NULL, NULL, NULL, '2005-06-14 05:36:45', 38);
INSERT INTO `poolperson` VALUES (154, 'basic', 'morosin', 'paul', 'paul_morosin@hotmail.com', 1, NULL, '', 'ulikeit', NULL, NULL, NULL, NULL, NULL, '2005-06-14 05:50:18', 39);
INSERT INTO `poolperson` VALUES (155, 'basic', 'Thompson', 'Barry', 'uknowulikeit@hotmail.com', 1, NULL, '', 'ulikeit', NULL, NULL, NULL, NULL, NULL, '2005-06-14 06:04:55', 0);
INSERT INTO `poolperson` VALUES (156, 'basic', 'Farmer', 'Brian', 'brian_k_farmer@yahoo.com', 1, NULL, '', 'brian824', NULL, NULL, NULL, NULL, NULL, '2005-06-14 06:05:51', 33);
INSERT INTO `poolperson` VALUES (157, 'basic', 'Pat', 'Dave', 'davidapatterson@hotmail.com', 1, NULL, '', '111111', NULL, NULL, NULL, NULL, NULL, '2005-06-14 06:16:36', 39);
INSERT INTO `poolperson` VALUES (158, 'basic', 'Casino', 'Andrew', 'andrew_casino@ml.com', 1, NULL, '', 'DCPton17', NULL, NULL, NULL, NULL, NULL, '2005-06-14 06:52:55', 40);
INSERT INTO `poolperson` VALUES (159, 'basic', 'Brennan', 'Ryan', 'Ryan_Brennan@ml.com', 1, NULL, '', 'sorduc2', NULL, NULL, NULL, NULL, NULL, '2005-06-14 07:05:53', 40);
INSERT INTO `poolperson` VALUES (160, 'basic', 'Noskiewicz', 'Robert', 'rnosk@yahoo.com', 1, NULL, '', 'mlbank', NULL, NULL, NULL, NULL, NULL, '2005-06-14 07:05:57', 40);
INSERT INTO `poolperson` VALUES (161, 'basic', 'smith', 'sean', 'sean_k_smith@ml.com', 1, NULL, '', 'kindys', NULL, NULL, NULL, NULL, NULL, '2005-06-14 07:06:33', 40);
INSERT INTO `poolperson` VALUES (162, 'basic', 'hada', 'hada', 'dgarcia@na2.us.ml.com', 1, NULL, '', 'hada', NULL, NULL, NULL, NULL, NULL, '2005-06-14 07:11:21', 40);
INSERT INTO `poolperson` VALUES (163, 'basic', 'couillard', 'tim', 'tjcouillard@rent411.com', 1, NULL, '', 'cooh34', NULL, NULL, NULL, NULL, NULL, '2005-06-14 07:15:41', 1);
INSERT INTO `poolperson` VALUES (164, 'basic', 'Haefele', 'James', 'james.haefele@hfco.com', 1, NULL, '', 'cowboys', NULL, NULL, NULL, NULL, NULL, '2005-06-14 07:22:40', 29);
INSERT INTO `poolperson` VALUES (165, 'basic', 'STILES', 'GARY', 'gary.stiles@penske.com', 1, NULL, '', 'cowboys', NULL, NULL, NULL, NULL, NULL, '2005-06-14 07:24:07', 29);
INSERT INTO `poolperson` VALUES (166, 'basic', 'FINK', 'MIKE', 'MIKE.FINK@FERGUSON.COM', 1, NULL, '', 'HOLLY1', NULL, NULL, NULL, NULL, NULL, '2005-06-14 07:29:57', 41);
INSERT INTO `poolperson` VALUES (167, 'basic', 'bereza', 'mark', 'markbereza@aol.com', 1, NULL, '', 'edspike', NULL, NULL, NULL, NULL, NULL, '2005-06-14 07:51:51', 42);
INSERT INTO `poolperson` VALUES (168, 'basic', 'Shallow', 'Tom ', 'tshallow@atx.com', 1, NULL, '', 'maggie1', NULL, NULL, NULL, NULL, NULL, '2005-06-14 07:54:51', 29);
INSERT INTO `poolperson` VALUES (169, 'basic', 'Smith', 'Steve', 'steve@advancedbenefitservices.com', 1, NULL, '', 'daddyll', NULL, NULL, NULL, NULL, NULL, '2005-06-14 08:11:39', 29);
INSERT INTO `poolperson` VALUES (170, 'basic', 'yun', 'joseph', 'josephyun@rogers.com', 1, NULL, '', 'eyeonmajors', NULL, NULL, NULL, NULL, NULL, '2005-06-14 08:45:58', 43);
INSERT INTO `poolperson` VALUES (171, 'basic', 'cranny', 'hugh', 'hcranny@ca-intl.com', 1, NULL, '', '112233', NULL, NULL, NULL, NULL, NULL, '2005-06-14 09:00:53', 44);
INSERT INTO `poolperson` VALUES (172, 'basic', 'esquivel', 'anthony', 'alajan06@yahoo.com', 1, NULL, '', 'lettyjo', NULL, NULL, NULL, NULL, NULL, '2005-06-14 09:10:21', 33);
INSERT INTO `poolperson` VALUES (173, 'basic', 'Lopez', 'Rene', 'renlo4@msn.com', 1, NULL, '', 'ryanrene', NULL, NULL, NULL, NULL, NULL, '2005-06-14 09:16:40', 34);
INSERT INTO `poolperson` VALUES (174, 'basic', 'Smith', 'Ty', 'tsmith@3-wheeler.com', 1, NULL, '', 'password', NULL, NULL, NULL, NULL, NULL, '2005-06-14 09:17:45', 45);
INSERT INTO `poolperson` VALUES (175, 'basic', 'Bradeen', 'Rob', 'rbradeen@3-wheeler.com', 1, NULL, '', 'mapleleafs', NULL, NULL, NULL, NULL, NULL, '2005-06-14 09:21:41', 45);
INSERT INTO `poolperson` VALUES (176, 'basic', 'Bodnar', 'Daimin', 'daimin.bodnar@fnf.com', 1, NULL, '', 'montreal', NULL, NULL, NULL, NULL, NULL, '2005-06-14 09:37:13', 39);
INSERT INTO `poolperson` VALUES (177, 'basic', 'Kellogg', 'Bob', 'bob.kellogg@cibc.ca', 1, NULL, '', 'babylon5', NULL, NULL, NULL, NULL, NULL, '2005-06-14 09:55:03', 39);
INSERT INTO `poolperson` VALUES (178, 'basic', 'Mauchan', 'Ian', 'imauchan@3-wheeler.com', 1, NULL, '', 'welcome', NULL, NULL, NULL, NULL, NULL, '2005-06-14 09:58:26', 45);
INSERT INTO `poolperson` VALUES (179, 'basic', 'bushman', 'derrick', 'domer87@msn.com', 1, NULL, '', 'domer87', NULL, NULL, NULL, NULL, NULL, '2005-06-14 10:24:17', 0);
INSERT INTO `poolperson` VALUES (180, 'basic', 'Swatzell', 'Jeff', 'jpswatzell@hotmail.com', 1, NULL, '', '08105789', NULL, NULL, NULL, NULL, NULL, '2005-06-14 11:04:49', 1);
INSERT INTO `poolperson` VALUES (181, 'basic', 'Hanna', 'Colin', 'ColinHanna@comcast.net', 1, NULL, '', 'colin7335', NULL, NULL, NULL, NULL, NULL, '2005-06-14 11:15:16', 46);
INSERT INTO `poolperson` VALUES (182, 'basic', 'Hanna', 'Jeannie', 'jhanna@mkbattorneys.com', 1, NULL, '', 'PiBetaPhi', NULL, NULL, NULL, NULL, NULL, '2005-06-14 11:25:08', 46);
INSERT INTO `poolperson` VALUES (183, 'basic', 'Lavoie', 'Brian', '3-wheeler.com', 1, NULL, '', 'password', NULL, NULL, NULL, NULL, NULL, '2005-06-14 11:26:17', 45);
INSERT INTO `poolperson` VALUES (184, 'basic', 'Swatzell', 'Jeff', 'jswatzell@kentlaw.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-14 11:33:31', 1);
INSERT INTO `poolperson` VALUES (185, 'basic', 'Ramsey', 'Jon', 'RamseyJ@swbell.net', 1, NULL, '', 'gizzmo', NULL, NULL, NULL, NULL, NULL, '2005-06-14 11:38:16', 33);
INSERT INTO `poolperson` VALUES (186, 'basic', 'Lavoie', 'Brian', 'blavoie@3-wheeler.com', 1, NULL, '', 'password', NULL, NULL, NULL, NULL, NULL, '2005-06-14 11:46:48', 45);
INSERT INTO `poolperson` VALUES (187, 'basic', 'Lopez', 'Miguel', 'miguel.a.lopez@ubs.com', 1, NULL, '', 'ml5599', NULL, NULL, NULL, NULL, NULL, '2005-06-14 11:50:31', 29);
INSERT INTO `poolperson` VALUES (188, 'basic', 'stevenson', 'daryll', 'daryll.stevenson@rbc.com', 1, NULL, '', '000135', NULL, NULL, NULL, NULL, NULL, '2005-06-14 11:56:35', 47);
INSERT INTO `poolperson` VALUES (189, 'basic', 'Walker', 'Robin ', 'rwalker@cuila.com', 1, NULL, '', 'Golfbabwe', NULL, NULL, NULL, NULL, NULL, '2005-06-14 12:18:24', 0);
INSERT INTO `poolperson` VALUES (190, 'basic', 'Walker', 'Robin', 'rgwalker10@aol.com', 1, NULL, '', 'Golfbabe10', NULL, NULL, NULL, NULL, NULL, '2005-06-14 12:25:25', 34);
INSERT INTO `poolperson` VALUES (191, 'basic', 'Merkin', 'Sid', 'kknodt@aol.com', 1, NULL, '', 'lily74', NULL, NULL, NULL, NULL, NULL, '2005-06-14 12:29:53', 29);
INSERT INTO `poolperson` VALUES (192, 'basic', 'Casagrande', 'Tom ', 'tcasagrande@gmail.com', 1, NULL, '', 'bighouse', NULL, NULL, NULL, NULL, NULL, '2005-06-14 12:31:48', 65);
INSERT INTO `poolperson` VALUES (193, 'basic', 'carroll', 'martin ', 'grumpa5@aol.com', 1, NULL, '', 'franky5', NULL, NULL, NULL, NULL, NULL, '2005-06-14 12:53:22', 29);
INSERT INTO `poolperson` VALUES (194, 'basic', 'Yealy', 'David', 'dpyeal@aol.com', 1, NULL, '', 'pay123', NULL, NULL, NULL, NULL, NULL, '2005-06-14 13:05:19', 0);
INSERT INTO `poolperson` VALUES (195, 'basic', 'Wolfe', 'Courtenay', 'cwolfe@3-wheeler.com', 1, NULL, '', '27112711', NULL, NULL, NULL, NULL, NULL, '2005-06-14 13:29:45', 45);
INSERT INTO `poolperson` VALUES (196, 'basic', 'Shane', 'Chad', 'chadmshane@yahoo.com', 1, NULL, '', 'tennis', NULL, NULL, NULL, NULL, NULL, '2005-06-14 13:33:14', 34);
INSERT INTO `poolperson` VALUES (197, 'basic', 'reddy', 'sunita', 'sreddy@3-wheeler.com', 1, NULL, '', 'SUNITA', NULL, NULL, NULL, NULL, NULL, '2005-06-14 13:35:02', 45);
INSERT INTO `poolperson` VALUES (198, 'basic', 'duncan', 'william', 'wduncan@3-wheeler.com', 1, NULL, '', 'argooos', NULL, NULL, NULL, NULL, NULL, '2005-06-14 13:37:02', 45);
INSERT INTO `poolperson` VALUES (199, 'basic', 'gaal', 'bob', 'rgaal@3-wheeler.com', 1, NULL, '', 'muskoka7', NULL, NULL, NULL, NULL, NULL, '2005-06-14 13:40:38', 45);
INSERT INTO `poolperson` VALUES (200, 'basic', 'Plowden', 'Chuck', 'CNP3@sc.rr.com', 1, NULL, '', 'grantz12', NULL, NULL, NULL, NULL, NULL, '2005-06-14 13:53:07', 48);
INSERT INTO `poolperson` VALUES (201, 'basic', 'Knox', 'Judd', 'jknoxi718@aol.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-14 15:32:23', 20);
INSERT INTO `poolperson` VALUES (202, 'basic', 'Alexander', 'Fred', 'fred@firstballantyne.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-14 15:34:51', 20);
INSERT INTO `poolperson` VALUES (203, 'basic', 'Edwards', 'Chris', 'chris_eddie@yahoo.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-14 15:37:14', 20);
INSERT INTO `poolperson` VALUES (204, 'basic', 'Lewandowski', 'Terry', 'terryrl@sympatico.ca', 1, NULL, '', 'betongolf', NULL, NULL, NULL, NULL, NULL, '2005-06-14 15:38:50', 39);
INSERT INTO `poolperson` VALUES (205, 'basic', 'Yealy', 'David ', 'david.yealy@inginvestment.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-14 15:39:51', 20);
INSERT INTO `poolperson` VALUES (206, 'basic', 'Claire', 'Jim', 'jclaire@evergreeninvestments.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-14 15:42:24', 20);
INSERT INTO `poolperson` VALUES (207, 'basic', 'Brownlow', 'Rob', 'robert.brownlow@morganstanley.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-14 15:45:26', 20);
INSERT INTO `poolperson` VALUES (208, 'basic', 'wolfe', 'dana', 'danawolfe@aol.com', 1, NULL, '', 'taylor', NULL, NULL, NULL, NULL, NULL, '2005-06-14 15:55:14', 48);
INSERT INTO `poolperson` VALUES (209, 'basic', 'Hanna', 'Pricie', 'priciehanna@comcast.net', 1, NULL, '', 'seek1st', NULL, NULL, NULL, NULL, NULL, '2005-06-14 18:29:17', 46);
INSERT INTO `poolperson` VALUES (210, 'basic', 'GIRL', 'MONKEE', 'sogol.lohi@cibc.ca', 1, NULL, '', '082104', NULL, NULL, NULL, NULL, NULL, '2005-06-14 19:35:44', 39);
INSERT INTO `poolperson` VALUES (211, 'basic', 'Gnall', 'Ted', 'tgnall@wi.rr.com', 1, NULL, '', 'tggolf', NULL, NULL, NULL, NULL, NULL, '2005-06-14 19:56:53', 49);
INSERT INTO `poolperson` VALUES (212, 'basic', 'checkryn', 'leon', 'justus5@telusplanet.net', 1, NULL, '', 'ennazus', NULL, NULL, NULL, NULL, NULL, '2005-06-14 21:16:59', 0);
INSERT INTO `poolperson` VALUES (213, 'basic', 'Hanna', 'Colin', 'channa@kanerealtycorp.com', 1, NULL, '', 'jocelyn02', NULL, NULL, NULL, NULL, NULL, '2005-06-15 04:19:38', 46);
INSERT INTO `poolperson` VALUES (214, 'basic', 'Conroy', 'M', 'mATTHEW.CONROY@US.MIZUHO-SC.COM', 1, NULL, '', 'SHANNONT', NULL, NULL, NULL, NULL, NULL, '2005-06-15 05:42:27', 50);
INSERT INTO `poolperson` VALUES (215, 'basic', 'Seligman', 'Bruce', 'bruce.seligman@morganstanley.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-15 05:43:51', 20);
INSERT INTO `poolperson` VALUES (216, 'basic', 'toland', 'bob', 'bob_toland@gmaccm.com', 1, NULL, '', 'spencer', NULL, NULL, NULL, NULL, NULL, '2005-06-15 06:21:08', 1);
INSERT INTO `poolperson` VALUES (217, 'basic', 'Brown', 'Phil', 'philbrown4@gmail.com', 1, NULL, '', 'escort44', NULL, NULL, NULL, NULL, NULL, '2005-06-15 06:29:43', 51);
INSERT INTO `poolperson` VALUES (218, 'basic', 'Peppy', 'Chip', 'chemist@labchem.net', 1, NULL, '', 'bumbash', NULL, NULL, NULL, NULL, NULL, '2005-06-15 06:34:08', 52);
INSERT INTO `poolperson` VALUES (219, 'basic', 'anderson', 'ken', 'kenrulesdetroit@hotmail.com', 1, NULL, '', 'nascar', NULL, NULL, NULL, NULL, NULL, '2005-06-15 06:37:29', 53);
INSERT INTO `poolperson` VALUES (220, 'basic', 'Sieving', 'Sherri', 'sherri@longuevueclub.net', 1, NULL, '', 'lvc123', NULL, NULL, NULL, NULL, NULL, '2005-06-15 07:07:04', 54);
INSERT INTO `poolperson` VALUES (221, 'basic', 'Yoo', 'Davis', 'dyoo@3-wheeler.com', 1, NULL, '', '894ttv', NULL, NULL, NULL, NULL, NULL, '2005-06-15 07:13:58', 45);
INSERT INTO `poolperson` VALUES (222, 'basic', 'scharf', 'rand', 'rscharf@dal.ca', 1, NULL, '', 'j1e2n3', NULL, NULL, NULL, NULL, NULL, '2005-06-15 07:31:00', 51);
INSERT INTO `poolperson` VALUES (223, 'basic', 'haywood', 'charles', 'chaywoodr@haywoodmtg.com', 1, NULL, '', '3510rose', NULL, NULL, NULL, NULL, NULL, '2005-06-15 07:46:23', 55);
INSERT INTO `poolperson` VALUES (224, 'basic', 'Persaud', 'Anthony', 'jenks_ap@yahoo.com', 1, NULL, '', 'orlando', NULL, NULL, NULL, NULL, NULL, '2005-06-15 07:46:24', 39);
INSERT INTO `poolperson` VALUES (225, 'basic', 'glover', 'bruce', 'bdglover25@hotmail.com', 1, NULL, '', 'David25', NULL, NULL, NULL, NULL, NULL, '2005-06-15 08:18:54', 56);
INSERT INTO `poolperson` VALUES (226, 'basic', 'Haley', 'Brendan', 'bhaley@dca.net', 1, NULL, '', 'hoops', NULL, NULL, NULL, NULL, NULL, '2005-06-15 08:26:11', 29);
INSERT INTO `poolperson` VALUES (227, 'basic', 'Dunn', 'Christian', 'christian_dunn@otpp.com', 1, NULL, '', 'eebxm296', NULL, NULL, NULL, NULL, NULL, '2005-06-15 08:26:17', 57);
INSERT INTO `poolperson` VALUES (228, 'basic', 'glover', 'Audrey ', 'brgl@webtv.net', 1, NULL, '', 'Jane', NULL, NULL, NULL, NULL, NULL, '2005-06-15 08:29:33', 56);
INSERT INTO `poolperson` VALUES (229, 'basic', 'Lattmann', 'Chris', 'CLattmann@adelphia.net', 1, NULL, '', 'merion99', NULL, NULL, NULL, NULL, NULL, '2005-06-15 08:30:52', 29);
INSERT INTO `poolperson` VALUES (230, 'basic', 'apple', 'david', 'dapple@nyc.rr.com', 1, NULL, '', 'gofl', NULL, NULL, NULL, NULL, NULL, '2005-06-15 08:35:41', 58);
INSERT INTO `poolperson` VALUES (231, 'basic', 'McGlinn', 'John', 'jmcglinn@comcast.net', 1, NULL, '', 'john4967', NULL, NULL, NULL, NULL, NULL, '2005-06-15 08:43:02', 58);
INSERT INTO `poolperson` VALUES (232, 'basic', 'OConnell', 'Tim', 'tim.oconnell@archbrook.com', 1, NULL, '', 'tntcaj6', NULL, NULL, NULL, NULL, NULL, '2005-06-15 08:44:13', 58);
INSERT INTO `poolperson` VALUES (233, 'basic', 'Malanga', 'Jay', 'jay@shopworx.com', 1, NULL, '', 'jam217', NULL, NULL, NULL, NULL, NULL, '2005-06-15 08:47:22', 59);
INSERT INTO `poolperson` VALUES (234, 'basic', 'Lutes', 'Kerry', 'kerry.lutes@fnf.com', 1, NULL, '', 'pinehurst', NULL, NULL, NULL, NULL, NULL, '2005-06-15 09:05:05', 39);
INSERT INTO `poolperson` VALUES (235, 'basic', 'maheady', 'jim ', 'james@jlamb.com', 1, NULL, '', 'slim4041', NULL, NULL, NULL, NULL, NULL, '2005-06-15 09:21:40', 29);
INSERT INTO `poolperson` VALUES (236, 'basic', 'fleck', 'gregf', 'gfleck81@hotmail.com', 1, NULL, '', '99999999', NULL, NULL, NULL, NULL, NULL, '2005-06-15 09:22:02', 60);
INSERT INTO `poolperson` VALUES (237, 'basic', 'Fergie', 'Len', 'fergieblak@shaw.ca', 1, NULL, '', 'buzz', NULL, NULL, NULL, NULL, NULL, '2005-06-15 10:08:48', 61);
INSERT INTO `poolperson` VALUES (238, 'basic', 'Bechervaise', 'Trevor', 'trevor.bechervaise@fnf.com', 1, NULL, '', 'bechervt615', NULL, NULL, NULL, NULL, NULL, '2005-06-15 10:19:41', 39);
INSERT INTO `poolperson` VALUES (239, 'basic', 'Fahoury', 'Raymond', 'raymofah@clientlogic.com', 1, NULL, '', 'upandatthem', NULL, NULL, NULL, NULL, NULL, '2005-06-15 10:30:25', 29);
INSERT INTO `poolperson` VALUES (240, 'basic', 'Slauson', 'Henry ', 'henry_slauson@vistaresearch.com', 1, NULL, '', 'timegame', NULL, NULL, NULL, NULL, NULL, '2005-06-15 10:32:00', 62);
INSERT INTO `poolperson` VALUES (241, 'basic', 'Beddis', 'Jamie', 'j_beddis@hotmail.com', 1, NULL, '', 'masters', NULL, NULL, NULL, NULL, NULL, '2005-06-15 11:00:17', 63);
INSERT INTO `poolperson` VALUES (242, 'basic', 'pulford', 'bob', 'rosp@sbcglobal.net', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-15 11:09:33', 1);
INSERT INTO `poolperson` VALUES (243, 'basic', 'Deeks', 'Colin', 'cdeeks@hotmail.com', 1, NULL, '', 'windsong', NULL, NULL, NULL, NULL, NULL, '2005-06-15 11:20:19', 64);
INSERT INTO `poolperson` VALUES (244, 'basic', 'Christou', 'James', 'jamesintransit@hotmail.com', 1, NULL, '', 'lorena', NULL, NULL, NULL, NULL, NULL, '2005-06-15 11:32:15', 39);
INSERT INTO `poolperson` VALUES (245, 'basic', 'Hull', 'James', 'jamie.hull@rbccm.com', 1, NULL, '', 'varsityfootball', NULL, NULL, NULL, NULL, NULL, '2005-06-15 11:39:14', 64);
INSERT INTO `poolperson` VALUES (246, 'basic', 'Newton', 'Zack', 'zjn2@cornell.edu', 1, NULL, '', 'notwen1', NULL, NULL, NULL, NULL, NULL, '2005-06-15 11:40:46', 64);
INSERT INTO `poolperson` VALUES (247, 'basic', 'hemmingsen', 'anders', 'ahemmingsen@gmail.com', 1, NULL, '', 'piersh1', NULL, NULL, NULL, NULL, NULL, '2005-06-15 11:43:26', 64);
INSERT INTO `poolperson` VALUES (248, 'basic', 'Ware', 'Kim', 'kware@isccorp.net', 1, NULL, '', 'agent99', NULL, NULL, NULL, NULL, NULL, '2005-06-15 11:56:40', 34);
INSERT INTO `poolperson` VALUES (249, 'basic', 'Kaye', 'Mike', 'michael_el_kaye@hotmail.com', 1, NULL, '', 'hudson', NULL, NULL, NULL, NULL, NULL, '2005-06-15 11:58:25', 64);
INSERT INTO `poolperson` VALUES (250, 'basic', 'c', 'g', 'gavchips@hotmail.com', 1, NULL, '', 'lpcdme3g', NULL, NULL, NULL, NULL, NULL, '2005-06-15 12:06:17', 64);
INSERT INTO `poolperson` VALUES (251, 'basic', 'morassutti', 'jordan ', 'j.l.morassutti@lse.ac.uk', 1, NULL, '', '1cheese', NULL, NULL, NULL, NULL, NULL, '2005-06-15 13:05:19', 64);
INSERT INTO `poolperson` VALUES (252, 'basic', 'McDonald', 'Matthew', 'mdm0515@aol.com', 1, NULL, '', 'madman', NULL, NULL, NULL, NULL, NULL, '2005-06-15 13:10:08', 29);
INSERT INTO `poolperson` VALUES (253, 'basic', 'Howell', 'Jerome', 'jhow4@bellsouth.net', 1, NULL, '', 'jehow1', NULL, NULL, NULL, NULL, NULL, '2005-06-15 13:14:10', 66);
INSERT INTO `poolperson` VALUES (254, 'basic', 'Choptiany', 'Mike', 'mike_choptiany@hotmail.com', 1, NULL, '', 'hiphop', NULL, NULL, NULL, NULL, NULL, '2005-06-15 13:17:51', 64);
INSERT INTO `poolperson` VALUES (255, 'basic', 'tallon', 'dale', 'daletallon@chicagoblackhawks.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-15 13:20:53', 1);
INSERT INTO `poolperson` VALUES (256, 'basic', 'apple', 'david', 'david.apple@archbrook.com', 1, NULL, '', 'tiger', NULL, NULL, NULL, NULL, NULL, '2005-06-15 13:24:45', 58);
INSERT INTO `poolperson` VALUES (257, 'basic', 'bowman', 'stan', 'stanbowman@chicagoblackhawks.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-15 13:25:51', 1);
INSERT INTO `poolperson` VALUES (258, 'basic', 'Perera', 'Dexter', 'dperera@bdo.ca', 1, NULL, '', 'ruby', NULL, NULL, NULL, NULL, NULL, '2005-06-15 13:40:30', 39);
INSERT INTO `poolperson` VALUES (259, 'basic', 'pat', 'sat', 'satish.patel@cibc.ca', 1, NULL, '', '213456', NULL, NULL, NULL, NULL, NULL, '2005-06-15 13:55:33', 0);
INSERT INTO `poolperson` VALUES (260, 'basic', 'pat', 'sat', 'SAT_EMAIL@yahoo.ca', 1, NULL, '', '123456', NULL, NULL, NULL, NULL, NULL, '2005-06-15 14:05:51', 39);
INSERT INTO `poolperson` VALUES (261, 'basic', 'Monso', 'Joseph', 'j_monso@hotmail.com', 1, NULL, '', 'tammy', NULL, NULL, NULL, NULL, NULL, '2005-06-15 14:12:37', 67);
INSERT INTO `poolperson` VALUES (262, 'basic', 'Ragan', 'Matthw', 'matthew.Ragan@atx.com', 1, NULL, '', 'walker06', NULL, NULL, NULL, NULL, NULL, '2005-06-15 14:26:52', 29);
INSERT INTO `poolperson` VALUES (263, 'basic', 'Hafer', 'Gregg', 'gregghaf@comcast.net', 1, NULL, '', 'haf1961', NULL, NULL, NULL, NULL, NULL, '2005-06-15 15:31:11', 29);
INSERT INTO `poolperson` VALUES (264, 'basic', 'Collins', 'Craig', 'craig_collins@microvision.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-06-15 16:14:45', 1);
INSERT INTO `poolperson` VALUES (265, 'basic', 'Man', 'V', 'sales@salmans.com', 1, NULL, '', 'cheese', NULL, NULL, NULL, NULL, NULL, '2005-06-15 17:02:45', 1);
INSERT INTO `poolperson` VALUES (266, 'basic', 'Man', 'V', 'maria@salmans.com', 1, NULL, '', 'cheese1', NULL, NULL, NULL, NULL, NULL, '2005-06-15 17:06:16', 1);
INSERT INTO `poolperson` VALUES (267, 'basic', 'Stephens', 'Matt', 'matty0940@hotmail.com', 1, NULL, '', 'nadir1', NULL, NULL, NULL, NULL, NULL, '2005-06-15 17:20:09', 68);
INSERT INTO `poolperson` VALUES (268, 'basic', 'Brown', 'Matt', 'sillyfingers@yahoo.com', 1, NULL, '', '292020', NULL, NULL, NULL, NULL, NULL, '2005-06-15 17:30:41', 51);
INSERT INTO `poolperson` VALUES (269, 'basic', 'Banks', 'Crobar', 'dssmango@yahoo.ca', 1, NULL, '', 'gogogo', NULL, NULL, NULL, NULL, NULL, '2005-06-15 18:01:28', 39);
INSERT INTO `poolperson` VALUES (270, 'basic', 'myles', 'brendan', 'mikimyles@hotmail.com', 1, NULL, '', 'jennyow', NULL, NULL, NULL, NULL, NULL, '2005-06-15 18:46:03', 69);
INSERT INTO `poolperson` VALUES (271, 'basic', 'jablowme', 'roy', 'gr8yachts@hotmail.com', 1, NULL, '', 'kitty1', NULL, NULL, NULL, NULL, NULL, '2005-06-15 20:39:26', 0);
INSERT INTO `poolperson` VALUES (272, 'basic', 'Lykken', 'Dan', 'dan_lykken@lumera.com', 1, NULL, '', 'blessed1', NULL, NULL, NULL, NULL, NULL, '2005-06-15 21:43:01', 1);
INSERT INTO `poolperson` VALUES (273, 'basic', 'Adamonis', 'Dave', 'dadamonis@comcast.net', 1, NULL, '', 'morgan', NULL, NULL, NULL, NULL, NULL, '2005-06-15 22:32:46', 1);
INSERT INTO `poolperson` VALUES (274, 'basic', 'cllark', 'jeff', 'jclark1023@aol.com', 1, NULL, '', 'copper', NULL, NULL, NULL, NULL, NULL, '2005-06-15 23:29:44', 33);
INSERT INTO `poolperson` VALUES (278, 'basic', 'Pogue', 'Rick', 'rickpogue@hotmail.com', 1, NULL, '', 'million', NULL, NULL, NULL, NULL, NULL, '2005-07-05 17:49:55', 72);
INSERT INTO `poolperson` VALUES (279, 'basic', 'Peoples', 'Jim', 'jspeop@cox-internet.com', 1, NULL, '', 'baxter', NULL, NULL, NULL, NULL, NULL, '2005-07-06 03:33:44', 73);
INSERT INTO `poolperson` VALUES (280, 'basic', 'rueschlin', 'john', 'giants24@cox.net', 1, NULL, '', 'willie', NULL, NULL, NULL, NULL, NULL, '2005-07-06 04:15:53', 0);
INSERT INTO `poolperson` VALUES (281, 'basic', 'Sykes', 'Gary', 'nertf2005@verizon.net', 1, NULL, '', 'baseball', NULL, NULL, NULL, NULL, NULL, '2005-07-06 05:54:10', 0);
INSERT INTO `poolperson` VALUES (282, 'basic', 'Martin', 'Ryan', 'palomino044@hotmail.com', 1, NULL, '', 'bradshaw12', NULL, NULL, NULL, NULL, NULL, '2005-07-06 07:18:06', 74);
INSERT INTO `poolperson` VALUES (283, 'basic', 'Rutrough', 'Marc', 'mrutrough@yahoo.com', 1, NULL, '', 'golfer', NULL, NULL, NULL, NULL, NULL, '2005-07-06 07:38:54', 75);
INSERT INTO `poolperson` VALUES (284, 'basic', 'Lynch', 'Scott', 'slynch1042@hotmail.com', 1, NULL, '', 'inches', NULL, NULL, NULL, NULL, NULL, '2005-07-06 10:03:40', 0);
INSERT INTO `poolperson` VALUES (285, 'basic', 'Bush', 'laurie', 'lbush@calcas.com', 1, NULL, '', 'gopack24', NULL, NULL, NULL, NULL, NULL, '2005-07-06 10:06:19', 76);
INSERT INTO `poolperson` VALUES (286, 'basic', 'Houck', 'Russ', 'rhouck@16500.com', 1, NULL, '', 'bunted1', NULL, NULL, NULL, NULL, NULL, '2005-07-06 10:20:21', 76);
INSERT INTO `poolperson` VALUES (287, 'basic', 'Beauchesne', 'Alfred', 'al_bo@yahoo.com', 1, NULL, '', 'zzarla', NULL, NULL, NULL, NULL, NULL, '2005-07-06 12:35:27', 77);
INSERT INTO `poolperson` VALUES (288, 'basic', 'Hutson', 'David', 'dhutson@ufpi.com', 1, NULL, '', '32963296', NULL, NULL, NULL, NULL, NULL, '2005-07-06 12:41:10', 74);
INSERT INTO `poolperson` VALUES (289, 'basic', 'Richardson', 'Jim', 'jfrichard@charter.net', 1, NULL, '', '6037453742', NULL, NULL, NULL, NULL, NULL, '2005-07-06 13:29:31', 78);
INSERT INTO `poolperson` VALUES (290, 'basic', 'Beatty', 'Richard', 'dbeatty25@cox.net', 1, NULL, '', 'o1budcat', NULL, NULL, NULL, NULL, NULL, '2005-07-06 14:39:33', 0);
INSERT INTO `poolperson` VALUES (291, 'basic', 'blanchard', 'jason', 'farmerblanchard@hotmail.com', 1, NULL, '', 'soloman', NULL, NULL, NULL, NULL, NULL, '2005-07-06 18:32:05', 79);
INSERT INTO `poolperson` VALUES (292, 'basic', 'jones', 'mike', 'mjones@welcolumber.com', 1, NULL, '', 'golfing', NULL, NULL, NULL, NULL, NULL, '2005-07-06 21:25:47', 74);
INSERT INTO `poolperson` VALUES (305, 'basic', 'Bauer', 'Mark', 'mark_g_bauer@hotmail.com', 1, NULL, '', 'Fantasy05', NULL, NULL, NULL, NULL, NULL, '2005-07-07 13:51:53', 74);
INSERT INTO `poolperson` VALUES (304, 'basic', 'Br', 'Lee', 'lbsk49@hotmail.com', 1, NULL, '', 'daniele', NULL, NULL, NULL, NULL, NULL, '2005-07-07 13:17:08', 82);
INSERT INTO `poolperson` VALUES (303, 'basic', 'bergeron', 'jason', 'jabnoreg@yahoo.com', 1, NULL, '', 'berger', NULL, NULL, NULL, NULL, NULL, '2005-07-07 08:54:03', 81);
INSERT INTO `poolperson` VALUES (302, 'basic', 'JONES', 'MICKEY', 'yankee1@innernet.net', 1, NULL, '', 'BLACKhawk3', NULL, NULL, NULL, NULL, NULL, '2005-07-07 06:43:29', 0);
INSERT INTO `poolperson` VALUES (301, 'basic', 'Wall', 'Graeme', 'gwall1@cogeco.ca', 1, NULL, '', 'relic7', NULL, NULL, NULL, NULL, NULL, '2005-07-07 06:25:07', 124);
INSERT INTO `poolperson` VALUES (300, 'basic', 'Gervin', 'David', 'david.gervin@cta-otc.gc.ca', 1, NULL, '', 'gervingolf', NULL, NULL, NULL, NULL, NULL, '2005-07-07 06:20:29', 0);
INSERT INTO `poolperson` VALUES (299, 'basic', 'peters', 'shawn', 'peterssl3@hotmail', 1, NULL, '', 'dallas', NULL, NULL, NULL, NULL, NULL, '2005-07-07 03:21:25', 80);
INSERT INTO `poolperson` VALUES (306, 'basic', 'Brown', 'Peter', 'petbrown@magma.ca', 1, NULL, '', 'mrwilson', NULL, NULL, NULL, NULL, NULL, '2005-07-07 15:11:21', 83);
INSERT INTO `poolperson` VALUES (307, 'basic', 'graham', 'archie', 'archeh@sympatico.ca', 1, NULL, '', 'bogeys', NULL, NULL, NULL, NULL, NULL, '2005-07-07 18:46:09', 0);
INSERT INTO `poolperson` VALUES (308, 'basic', 'cabral', 'joe', 'joe cabral 53@ hotmail.com', 1, NULL, '', 'rubber7', NULL, NULL, NULL, NULL, NULL, '2005-07-07 19:26:26', 0);
INSERT INTO `poolperson` VALUES (309, 'basic', 'zanzarella', 'steve', 'gosevego@juno.com', 1, NULL, '', 'sunny', NULL, NULL, NULL, NULL, NULL, '2005-07-07 20:10:12', 0);
INSERT INTO `poolperson` VALUES (310, 'basic', 'LaCross', 'Jodie', 'jlacross@calcas.com', 1, NULL, '', 'meow132', NULL, NULL, NULL, NULL, NULL, '2005-07-07 21:42:38', 76);
INSERT INTO `poolperson` VALUES (311, 'basic', 'simpson', 'paul', 'pam@isys.ca', 1, NULL, '', 'borr04', NULL, NULL, NULL, NULL, NULL, '2005-07-08 02:55:21', 115);
INSERT INTO `poolperson` VALUES (312, 'basic', 'barthel', 'dennis', 'dennis.barthel@edmonton.ca', 1, NULL, '', 'rommel', NULL, NULL, NULL, NULL, NULL, '2005-07-08 04:43:48', 84);
INSERT INTO `poolperson` VALUES (313, 'basic', 'fiss-barthel', 'sharon', 'fissbart@telus.net', 1, NULL, '', 'dennis', NULL, NULL, NULL, NULL, NULL, '2005-07-08 04:51:09', 84);
INSERT INTO `poolperson` VALUES (314, 'basic', 'mcallister', 'darwin', 'DARWINM@NB.SYMPATICO.CA', 1, NULL, '', 'keekon', NULL, NULL, NULL, NULL, NULL, '2005-07-08 05:33:06', 85);
INSERT INTO `poolperson` VALUES (315, 'basic', 'Clark', 'Bob', 'golfprobc@hotmail.com', 1, NULL, '', 'asshole', NULL, NULL, NULL, NULL, NULL, '2005-07-08 06:11:27', 0);
INSERT INTO `poolperson` VALUES (316, 'basic', 'Hughes', 'Patrick', 'patrickfhughes@yahoo.com', 1, NULL, '', 'hawkeyes123', NULL, NULL, NULL, NULL, NULL, '2005-07-08 07:01:06', 1);
INSERT INTO `poolperson` VALUES (317, 'basic', 'Drummond', 'L', 'louis.d@telus.net', 1, NULL, '', 'newman', NULL, NULL, NULL, NULL, NULL, '2005-07-08 09:19:34', 0);
INSERT INTO `poolperson` VALUES (318, 'basic', 'Brodland', 'Lee', 'brod23@sasktel.net', 1, NULL, '', 'babylon', NULL, NULL, NULL, NULL, NULL, '2005-07-08 12:31:13', 86);
INSERT INTO `poolperson` VALUES (321, 'basic', 'Holton', 'Scott', 'skietzman@nitline.net', 1, NULL, '', 'devil1', NULL, NULL, NULL, NULL, NULL, '2005-07-08 20:34:25', 1);
INSERT INTO `poolperson` VALUES (320, 'basic', 'Boparai', 'Steve', 'sboparai1@shaw.ca', 1, NULL, '', 'mm1055', NULL, NULL, NULL, NULL, NULL, '2005-07-08 13:21:20', 87);
INSERT INTO `poolperson` VALUES (322, 'basic', 'Dore', 'Chris', 'cdore76@shaw.ca', 1, NULL, '', 'rascals', NULL, NULL, NULL, NULL, NULL, '2005-07-08 21:52:13', 0);
INSERT INTO `poolperson` VALUES (323, 'basic', 'tan', 'mikey', 'miketan63@hotmail.com', 1, NULL, '', 'ethan1', NULL, NULL, NULL, NULL, NULL, '2005-07-09 07:09:06', 0);
INSERT INTO `poolperson` VALUES (324, 'basic', 'Hathorne', 'Dick', 'rhathorne@nycap.rr.com', 1, NULL, '', 'data26', NULL, NULL, NULL, NULL, NULL, '2005-07-09 07:47:24', 0);
INSERT INTO `poolperson` VALUES (325, 'basic', 'gregoric', 'len', 'len&annette@telus.net', 1, NULL, '', 'hubbic', NULL, NULL, NULL, NULL, NULL, '2005-07-09 08:34:29', 0);
INSERT INTO `poolperson` VALUES (326, 'basic', 'gregoric', 'len', 'olympicbeerdrinker2010', 1, NULL, '', 'bugbegone', NULL, NULL, NULL, NULL, NULL, '2005-07-09 08:36:19', 0);
INSERT INTO `poolperson` VALUES (327, 'basic', 'Gahagan', 'David', 'kiltie1@hotmail.com', 1, NULL, '', 'mavman1', NULL, NULL, NULL, NULL, NULL, '2005-07-09 09:14:28', 88);
INSERT INTO `poolperson` VALUES (328, 'basic', 'nichols', 'paul', 'noinbetweenman@msn.com', 1, NULL, '', 'newfys', NULL, NULL, NULL, NULL, NULL, '2005-07-09 09:46:03', 89);
INSERT INTO `poolperson` VALUES (329, 'basic', 'Ray', 'Mike', 'mray@calcas.com', 1, NULL, '', 'notredame', NULL, NULL, NULL, NULL, NULL, '2005-07-09 13:30:09', 76);
INSERT INTO `poolperson` VALUES (330, 'basic', 'K', 'Alex', 'akk161@hotmail.com', 1, NULL, '', 'kyungil1', NULL, NULL, NULL, NULL, NULL, '2005-07-09 14:01:23', 90);
INSERT INTO `poolperson` VALUES (331, 'basic', 'howe', 'winston', 'howewin@yahoo.com', 1, NULL, '', 'golf', NULL, NULL, NULL, NULL, NULL, '2005-07-09 16:15:23', 91);
INSERT INTO `poolperson` VALUES (332, 'basic', 'Norton', 'Bruce', 'brucegnorton@hotmail.com', 1, NULL, '', 'raven', NULL, NULL, NULL, NULL, NULL, '2005-07-09 17:11:51', 92);
INSERT INTO `poolperson` VALUES (333, 'basic', 'Ellis', 'John', 'Johnellis364@aol.com', 1, NULL, '', 'dinamo', NULL, NULL, NULL, NULL, NULL, '2005-07-10 06:42:08', 0);
INSERT INTO `poolperson` VALUES (334, 'basic', 'Carter', 'Jerry', 'jerry4543@yahoo.com', 1, NULL, '', 'sparky', NULL, NULL, NULL, NULL, NULL, '2005-07-10 07:57:48', 93);
INSERT INTO `poolperson` VALUES (335, 'basic', 'Almond', 'Peter', 'pcalmond@yahoo.com', 1, NULL, '', 'Pedrito1', NULL, NULL, NULL, NULL, NULL, '2005-07-10 10:11:12', 0);
INSERT INTO `poolperson` VALUES (336, 'basic', 'Sanguras', 'Todd', 'tsanguras@pga.com', 1, NULL, '', 'anika123', NULL, NULL, NULL, NULL, NULL, '2005-07-10 13:08:48', 0);
INSERT INTO `poolperson` VALUES (337, 'basic', 'Kelly', 'Chase', 'chase@chasekelly.com', 1, NULL, '', '2emtipl', NULL, NULL, NULL, NULL, NULL, '2005-07-10 13:11:51', 94);
INSERT INTO `poolperson` VALUES (338, 'basic', 'Smith', 'Bill', 'bill@smith.com', 1, NULL, '', 'bill', NULL, NULL, NULL, NULL, NULL, '2005-07-10 13:22:49', 94);
INSERT INTO `poolperson` VALUES (339, 'basic', 'beer', 'kerry', 'ks.beer@sympatico.ca', 1, NULL, '', 'bigbru', NULL, NULL, NULL, NULL, NULL, '2005-07-10 13:44:43', 95);
INSERT INTO `poolperson` VALUES (340, 'basic', 'Kelly', 'Brooks', 'brookskelly25@yahoo.com', 1, NULL, '', 'golfsucks', NULL, NULL, NULL, NULL, NULL, '2005-07-10 13:56:03', 94);
INSERT INTO `poolperson` VALUES (341, 'basic', 'McCalden', 'Gary', 'gary.mccalden@eds.com', 1, NULL, '', 'treakle3', NULL, NULL, NULL, NULL, NULL, '2005-07-10 16:20:43', 96);
INSERT INTO `poolperson` VALUES (342, 'basic', 'brunton', 'greg', 'gregbrunton2000@yahoo.com', 1, NULL, '', 'bertie', NULL, NULL, NULL, NULL, NULL, '2005-07-10 16:45:41', 97);
INSERT INTO `poolperson` VALUES (343, 'basic', 'heiss', 'ron', 'heiss124@aol.com', 1, NULL, '', 'sherwood', NULL, NULL, NULL, NULL, NULL, '2005-07-10 17:00:22', 0);
INSERT INTO `poolperson` VALUES (344, 'basic', 'Destefano', 'Wayne', 'wdestefano@cox.net', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-07-11 00:39:14', 1);
INSERT INTO `poolperson` VALUES (345, 'basic', 'Geall', 'Bucky', 'Buckyg@hfx.eastlink.ca', 1, NULL, '', 'doorlock', NULL, NULL, NULL, NULL, NULL, '2005-07-11 03:35:14', 115);
INSERT INTO `poolperson` VALUES (346, 'basic', 'Saccomanno', 'Mike', 'mike.saccomanno@bartoncreek.com', 1, NULL, '', 'mustang', NULL, NULL, NULL, NULL, NULL, '2005-07-11 04:39:56', 94);
INSERT INTO `poolperson` VALUES (347, 'basic', 'vezina', 'andre', 'vezinafj@hotmail.com', 1, NULL, '', 'saluitte', NULL, NULL, NULL, NULL, NULL, '2005-07-11 04:40:53', 98);
INSERT INTO `poolperson` VALUES (348, 'basic', 'gallagher', 'ian', 'iangallagher70@hotmail.com', 1, NULL, '', 'chunky', NULL, NULL, NULL, NULL, NULL, '2005-07-11 06:18:20', 99);
INSERT INTO `poolperson` VALUES (349, 'basic', 'Stafford', 'Thomas', 'clogger219@yahoo.com', 1, NULL, '', '0123123', NULL, NULL, NULL, NULL, NULL, '2005-07-11 07:33:59', 100);
INSERT INTO `poolperson` VALUES (350, 'basic', 'Henderson', 'Shane', 'shane.henderson@ipsos-na.com', 1, NULL, '', 'chloe', NULL, NULL, NULL, NULL, NULL, '2005-07-11 08:25:07', 101);
INSERT INTO `poolperson` VALUES (351, 'basic', 'Mcclane', 'Jim', 'jmcclane@wavecable.com', 1, NULL, '', 'jimboliki', NULL, NULL, NULL, NULL, NULL, '2005-07-11 08:28:43', 102);
INSERT INTO `poolperson` VALUES (352, 'basic', 'Stevens ', 'Bill ', 'qmcmillan@hotmail.com', 1, NULL, '', 'quentin', NULL, NULL, NULL, NULL, NULL, '2005-07-11 09:00:50', 103);
INSERT INTO `poolperson` VALUES (353, 'basic', 'Baumgardner', 'Keith', 'pbrainbum@yahoo.com', 1, NULL, '', 'golfbum3713', NULL, NULL, NULL, NULL, NULL, '2005-07-11 09:21:12', 104);
INSERT INTO `poolperson` VALUES (354, 'basic', 'Smolinski', 'Mike', 'msmolinski@hydro-thermal.com', 1, NULL, '', 'mizuno', NULL, NULL, NULL, NULL, NULL, '2005-07-11 10:35:52', 105);
INSERT INTO `poolperson` VALUES (355, 'basic', 'Tungseth', 'Nathan', 'Nathan.Tungseth@siemens.com', 1, NULL, '', 'sigmachi11', NULL, NULL, NULL, NULL, NULL, '2005-07-11 18:37:55', 0);
INSERT INTO `poolperson` VALUES (356, 'basic', 'Anderson', 'Kent', 'kbaxxx@yahoo.com', 1, NULL, '', 'dpxclk', NULL, NULL, NULL, NULL, NULL, '2005-07-12 04:36:23', 115);
INSERT INTO `poolperson` VALUES (357, 'basic', 'Prast', 'Norm', 'nprast@yahoo.com', 1, NULL, '', 'surf', NULL, NULL, NULL, NULL, NULL, '2005-07-12 05:40:57', 106);
INSERT INTO `poolperson` VALUES (358, 'basic', 'Tait', 'Ian', 'iantait@sympatico.ca', 1, NULL, '', 'killie', NULL, NULL, NULL, NULL, NULL, '2005-07-12 06:03:04', 107);
INSERT INTO `poolperson` VALUES (359, 'basic', 'Gasper', 'Dave', 'gasperd@vankampen.com', 1, NULL, '', 'detroit', NULL, NULL, NULL, NULL, NULL, '2005-07-12 06:51:41', 1);
INSERT INTO `poolperson` VALUES (360, 'basic', 'donohue', 'robert', 'rdonohue@jginfo.com', 1, NULL, '', 'pawnee', NULL, NULL, NULL, NULL, NULL, '2005-07-12 07:07:58', 108);
INSERT INTO `poolperson` VALUES (361, 'basic', 'Lynch', 'Bill', 'william.t.lynch@verizonwireless.com', 1, NULL, '', 'lynchwi', NULL, NULL, NULL, NULL, NULL, '2005-07-12 07:12:16', 109);
INSERT INTO `poolperson` VALUES (362, 'basic', 'Brown', 'Peggy', 'jp1329@aol.com', 1, NULL, '', 'squeaky', NULL, NULL, NULL, NULL, NULL, '2005-07-12 07:57:31', 110);
INSERT INTO `poolperson` VALUES (363, 'basic', 'Gust', 'Bernard', 'bgust@calcas.com', 1, NULL, '', '552211', NULL, NULL, NULL, NULL, NULL, '2005-07-12 09:38:42', 76);
INSERT INTO `poolperson` VALUES (364, 'basic', 'Gust', 'Bernard', 'gustb@aol.com', 1, NULL, '', '552211', NULL, NULL, NULL, NULL, NULL, '2005-07-12 09:42:04', 0);
INSERT INTO `poolperson` VALUES (365, 'basic', 'Young', 'Ed', 'Eyoung2019@aol.com', 1, NULL, '', 'ehy14910', NULL, NULL, NULL, NULL, NULL, '2005-07-12 10:37:44', 111);
INSERT INTO `poolperson` VALUES (366, 'basic', 'Ezer', 'Jason', 'ezer1242@yahoo.com', 1, NULL, '', 'ezer6330', NULL, NULL, NULL, NULL, NULL, '2005-07-12 10:51:35', 112);
INSERT INTO `poolperson` VALUES (367, 'basic', 'Amos', 'Hunter ', 'hamos78@aol.com', 1, NULL, '', 'georgia', NULL, NULL, NULL, NULL, NULL, '2005-07-12 11:42:40', 113);
INSERT INTO `poolperson` VALUES (368, 'basic', 'sullivan', 'barry', 'barcar@nbnet.nb.ca', 1, NULL, '', '808080', NULL, NULL, NULL, NULL, NULL, '2005-07-12 13:20:47', 114);
INSERT INTO `poolperson` VALUES (369, 'basic', 'Wohling', 'Steve', 'stephen.wohling@eds.com', 1, NULL, '', 'EDSGolfers', NULL, NULL, NULL, NULL, NULL, '2005-07-12 16:51:32', 96);
INSERT INTO `poolperson` VALUES (370, 'basic', 'Fehr', 'Cam', 'camburgler@hotmail.com', 1, NULL, '', 'cambo', NULL, NULL, NULL, NULL, NULL, '2005-07-12 18:42:48', 0);
INSERT INTO `poolperson` VALUES (371, 'basic', 'Krantz', 'Chad', 'krantzchad@netscape.net', 1, NULL, '', 'chad18', NULL, NULL, NULL, NULL, NULL, '2005-07-12 19:14:09', 0);
INSERT INTO `poolperson` VALUES (372, 'basic', 'Rudachyk', 'Bill', 'bildona@sasktel.net', 1, NULL, '', 'Poohdog', NULL, NULL, NULL, NULL, NULL, '2005-07-12 21:43:20', 115);
INSERT INTO `poolperson` VALUES (373, 'basic', 'elmore', 'bob', 'elmorebob@hotmail.com', 1, NULL, '', 'quinnjet', NULL, NULL, NULL, NULL, NULL, '2005-07-12 22:05:03', 0);
INSERT INTO `poolperson` VALUES (374, 'basic', 'Lathwell', 'Dean', 'dlathwell16@hotmail.com', 1, NULL, '', '161616', NULL, NULL, NULL, NULL, NULL, '2005-07-13 00:29:39', 0);
INSERT INTO `poolperson` VALUES (375, 'basic', 'Lee', 'Shaun', 'shaun.lee@eds.com', 1, NULL, '', 'madmax!4u2c', NULL, NULL, NULL, NULL, NULL, '2005-07-13 00:31:05', 96);
INSERT INTO `poolperson` VALUES (376, 'basic', 'Holts', 'Eye', 'eyeholts@atross.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-07-13 03:13:22', 115);
INSERT INTO `poolperson` VALUES (377, 'basic', 'Edes', 'Pete', 'pedes@satx.rr.com', 1, NULL, '', 'pcehce108', NULL, NULL, NULL, NULL, NULL, '2005-07-13 04:29:03', 0);
INSERT INTO `poolperson` VALUES (378, 'basic', 'smith', 'james', 'alijim@hotmail.co.uk', 1, NULL, '', 'celtic', NULL, NULL, NULL, NULL, NULL, '2005-07-13 04:38:34', 116);
INSERT INTO `poolperson` VALUES (379, 'basic', 'Driscoll', 'J.', 'jndriscoll@hotmail.com', 1, NULL, '', 'crowbush', NULL, NULL, NULL, NULL, NULL, '2005-07-13 05:02:33', 117);
INSERT INTO `poolperson` VALUES (380, 'basic', 'Smith', 'Andrew', 'adsmith8@hotmail.com', 1, NULL, '', '12345', NULL, NULL, NULL, NULL, NULL, '2005-07-13 05:14:33', 117);
INSERT INTO `poolperson` VALUES (381, 'basic', 'hiner', 'ross', 'rosshiner@earthlink.net', 1, NULL, '', 'paragon', NULL, NULL, NULL, NULL, NULL, '2005-07-13 05:47:58', 118);
INSERT INTO `poolperson` VALUES (382, 'basic', 'moody', 'howard', 'moodyeye@aol.com', 1, NULL, '', 'mel', NULL, NULL, NULL, NULL, NULL, '2005-07-13 05:56:03', 0);
INSERT INTO `poolperson` VALUES (383, 'basic', 'Hurley', 'Matthew', 'matthew.hurley@hudsonunitedbank.com', 1, NULL, '', 'matty', NULL, NULL, NULL, NULL, NULL, '2005-07-13 06:18:48', 119);
INSERT INTO `poolperson` VALUES (384, 'basic', 'tepper', 'matt', 'tepp4417@yahoo.com', 1, NULL, '', 'golf17', NULL, NULL, NULL, NULL, NULL, '2005-07-13 07:12:23', 120);
INSERT INTO `poolperson` VALUES (385, 'basic', 'Moroney', 'SEan', 'swm17@aol.com', 1, NULL, '', 'katayama', NULL, NULL, NULL, NULL, NULL, '2005-07-13 07:26:44', 121);
INSERT INTO `poolperson` VALUES (386, 'basic', 'Hurley', 'Michael', 'hurl03@hurley8.com', 1, NULL, '', 'duncan3940182', NULL, NULL, NULL, NULL, NULL, '2005-07-13 07:27:28', 119);
INSERT INTO `poolperson` VALUES (387, 'basic', 'Borkowski', 'David', 'david.borkowski@csfb.com', 1, NULL, '', 'dayton', NULL, NULL, NULL, NULL, NULL, '2005-07-13 07:32:18', 119);
INSERT INTO `poolperson` VALUES (388, 'basic', 'Edson', 'Larry', 'larry.edson@csfb.com', 1, NULL, '', 'golfball', NULL, NULL, NULL, NULL, NULL, '2005-07-13 07:32:27', 119);
INSERT INTO `poolperson` VALUES (389, 'basic', 'Ahlers', 'Jeff', 'jeff_ahlers@hotmail.com', 1, NULL, '', 'ia4212', NULL, NULL, NULL, NULL, NULL, '2005-07-13 07:46:41', 122);
INSERT INTO `poolperson` VALUES (390, 'basic', 'Richguay', 'Conner', 'conner.richguay@gmail.com', 1, NULL, '', 'qqqqqq', NULL, NULL, NULL, NULL, NULL, '2005-07-13 07:56:15', 123);
INSERT INTO `poolperson` VALUES (391, 'basic', 'Minella', 'Alex', 'doboy4@aol.com', 1, NULL, '', 'tunafish', NULL, NULL, NULL, NULL, NULL, '2005-07-13 08:07:25', 119);
INSERT INTO `poolperson` VALUES (392, 'basic', 'myslinski', 'jeff', 'jmmyslinski@hotmail.com', 1, NULL, '', 'jmm64199', NULL, NULL, NULL, NULL, NULL, '2005-07-13 08:08:36', 125);
INSERT INTO `poolperson` VALUES (393, 'basic', 'Barile', 'Jordan', 'jbarile@descpa.com', 1, NULL, '', 'jordan', NULL, NULL, NULL, NULL, NULL, '2005-07-13 08:12:56', 119);
INSERT INTO `poolperson` VALUES (394, 'basic', 'Barile', 'Jordan', 'jbarile@descap.com', 1, NULL, '', 'jordan', NULL, NULL, NULL, NULL, NULL, '2005-07-13 08:13:15', 119);
INSERT INTO `poolperson` VALUES (395, 'basic', 'cash', 'josh', 'jcash@pga.com', 1, NULL, '', 'turbo', NULL, NULL, NULL, NULL, NULL, '2005-07-13 08:14:07', 94);
INSERT INTO `poolperson` VALUES (396, 'basic', 'Tesoro', 'Michael', 'michael.tesoro@csfb.com', 1, NULL, '', 'liliana', NULL, NULL, NULL, NULL, NULL, '2005-07-13 08:14:39', 119);
INSERT INTO `poolperson` VALUES (397, 'basic', 'pomrink', 'tom', 'tpomrink@hotmail.com', 1, NULL, '', 'tpomrink', NULL, NULL, NULL, NULL, NULL, '2005-07-13 08:33:44', 119);
INSERT INTO `poolperson` VALUES (398, 'basic', 'GERIGK', 'GEORGE', 'george.gerigk@csfb.com', 1, NULL, '', 'HOTROD', NULL, NULL, NULL, NULL, NULL, '2005-07-13 08:50:50', 119);
INSERT INTO `poolperson` VALUES (399, 'basic', 'Walsh', 'Michael', 'michael22w@yahoo.com', 1, NULL, '', 'larry33bird', NULL, NULL, NULL, NULL, NULL, '2005-07-13 08:55:19', 125);
INSERT INTO `poolperson` VALUES (400, 'basic', 'Johnson', 'Marty', 'johnsonmp@foxinternet.com', 1, NULL, '', 'pachasej', NULL, NULL, NULL, NULL, NULL, '2005-07-13 09:10:10', 0);
INSERT INTO `poolperson` VALUES (401, 'basic', 'Comly', 'Stephen', 'stephen_comly@yahoo.com', 1, NULL, '', 'phillies', NULL, NULL, NULL, NULL, NULL, '2005-07-13 09:20:59', 119);
INSERT INTO `poolperson` VALUES (402, 'basic', 'myslinski', 'bob', 'fbtb@ec.rr.com', 1, NULL, '', 'bmyslinski', NULL, NULL, NULL, NULL, NULL, '2005-07-13 09:24:16', 125);
INSERT INTO `poolperson` VALUES (403, 'basic', 'murphy', 'robert', 'murphdog_07076@yahoo.com', 1, NULL, '', '49ers', NULL, NULL, NULL, NULL, NULL, '2005-07-13 09:27:11', 126);
INSERT INTO `poolperson` VALUES (404, 'basic', 'sniffen', 'rich', 'richsniff@hotmail.com', 1, NULL, '', 'alex1212', NULL, NULL, NULL, NULL, NULL, '2005-07-13 09:38:58', 125);
INSERT INTO `poolperson` VALUES (405, 'basic', 'Longley', 'Brian', 'Brian_Longley@ml.com', 1, NULL, '', 'Kimberly', NULL, NULL, NULL, NULL, NULL, '2005-07-13 09:43:23', 128);
INSERT INTO `poolperson` VALUES (406, 'basic', 'Braathen', 'Tony', 'tonybraathen@optonline.net', 1, NULL, '', 'wendy715', NULL, NULL, NULL, NULL, NULL, '2005-07-13 09:44:28', 0);
INSERT INTO `poolperson` VALUES (407, 'basic', 'Voza', 'Fred', 'frederick_Voza@ml.com', 1, NULL, '', 'nasus04', NULL, NULL, NULL, NULL, NULL, '2005-07-13 09:47:57', 128);
INSERT INTO `poolperson` VALUES (408, 'basic', 'Lutz', 'Chris', 'chrislutz71@hotmail.com', 1, NULL, '', 'holyfuck', NULL, NULL, NULL, NULL, NULL, '2005-07-13 09:52:30', 117);
INSERT INTO `poolperson` VALUES (409, 'basic', 'Kraig', 'Christopher', 'clkraig@hotmail.com', 1, NULL, '', 'sixers', NULL, NULL, NULL, NULL, NULL, '2005-07-13 10:21:54', 76);
INSERT INTO `poolperson` VALUES (410, 'basic', 'Cameron', 'Jay', 'jayhalifax@yahoo.com', 1, NULL, '', 'leeny', NULL, NULL, NULL, NULL, NULL, '2005-07-13 10:29:05', 117);
INSERT INTO `poolperson` VALUES (411, 'basic', 'ange', 'kevin', 'angew1@aol.com', 1, NULL, '', 'kwa75', NULL, NULL, NULL, NULL, NULL, '2005-07-13 10:34:52', 125);
INSERT INTO `poolperson` VALUES (412, 'basic', 'Baker', 'Jim ', 'josh.cash@bartoncreek.com', 1, NULL, '', 'baker', NULL, NULL, NULL, NULL, NULL, '2005-07-13 11:00:22', 94);
INSERT INTO `poolperson` VALUES (413, 'basic', 'enfield', 'brian', 'benfield@easthants.ca', 1, NULL, '', 'brian', NULL, NULL, NULL, NULL, NULL, '2005-07-13 11:34:44', 117);
INSERT INTO `poolperson` VALUES (414, 'basic', 'Axelrod', 'Jon', 'jonathan_Axelrod@yahoo.com', 1, NULL, '', 'axeman', NULL, NULL, NULL, NULL, NULL, '2005-07-13 11:55:39', 0);
INSERT INTO `poolperson` VALUES (415, 'basic', 'Reese', 'Dick', 'rareese@bellsouth.net', 1, NULL, '', 'miami7', NULL, NULL, NULL, NULL, NULL, '2005-07-13 11:55:58', 127);
INSERT INTO `poolperson` VALUES (416, 'basic', 'murphy', 'robert', 'r_murphy@ml.com', 1, NULL, '', 'flocco', NULL, NULL, NULL, NULL, NULL, '2005-07-13 12:49:00', 128);
INSERT INTO `poolperson` VALUES (417, 'basic', 'Wall', 'Andrew', 'andrew.wall@bbh.com', 1, NULL, '', 'andrew', NULL, NULL, NULL, NULL, NULL, '2005-07-13 12:54:24', 119);
INSERT INTO `poolperson` VALUES (418, 'basic', 'Kim', 'Mike', 'michael.y.kim@csfb.com', 1, NULL, '', 'hyungju', NULL, NULL, NULL, NULL, NULL, '2005-07-13 13:00:35', 119);
INSERT INTO `poolperson` VALUES (419, 'basic', 'Koi', 'Nathan', 'nkoi@aquawsc.com', 1, NULL, '', 'avery', NULL, NULL, NULL, NULL, NULL, '2005-07-13 13:25:09', 0);
INSERT INTO `poolperson` VALUES (420, 'basic', 'Harkins', 'William', 'wpharkins@excite.com', 1, NULL, '', '2653540', NULL, NULL, NULL, NULL, NULL, '2005-07-13 13:35:40', 0);
INSERT INTO `poolperson` VALUES (421, 'basic', 'Monks', 'Frank', 'fmonks@ncen.com', 1, NULL, '', 'wings', NULL, NULL, NULL, NULL, NULL, '2005-07-13 13:42:49', 119);
INSERT INTO `poolperson` VALUES (422, 'basic', 'O''Brien', 'Brendan', 'bobrien@bear.com', 1, NULL, '', 'bo21875b', NULL, NULL, NULL, NULL, NULL, '2005-07-13 13:48:47', 119);
INSERT INTO `poolperson` VALUES (423, 'basic', 'Diana', 'Dino', 'dino.diana@ubs.com', 1, NULL, '', 'Rocker1', NULL, NULL, NULL, NULL, NULL, '2005-07-13 14:26:03', 119);
INSERT INTO `poolperson` VALUES (424, 'basic', 'Kraig', 'Bruce', 'BAKraig@aol.com', 1, NULL, '', 'Jerry44', NULL, NULL, NULL, NULL, NULL, '2005-07-13 14:44:26', 76);
INSERT INTO `poolperson` VALUES (425, 'basic', 'Kraig', 'Tamara', 'tlkraig@aol.com', 1, NULL, '', 'BirdieK', NULL, NULL, NULL, NULL, NULL, '2005-07-13 15:15:46', 76);
INSERT INTO `poolperson` VALUES (426, 'basic', 'Marcotte', 'Kevin', 'kevin.marcotte@bmwgroup.ca', 1, NULL, '', 'taylor', NULL, NULL, NULL, NULL, NULL, '2005-07-13 15:17:18', 129);
INSERT INTO `poolperson` VALUES (427, 'basic', 'KUMM', 'DAN', 'ggerigk@optonline.net', 1, NULL, '', 'HOTROD', NULL, NULL, NULL, NULL, NULL, '2005-07-13 15:52:38', 119);
INSERT INTO `poolperson` VALUES (428, 'basic', 'Hurls', 'Dad', 'dadhurls@aol.com', 1, NULL, '', 'dadhurls', NULL, NULL, NULL, NULL, NULL, '2005-07-13 16:07:38', 119);
INSERT INTO `poolperson` VALUES (429, 'basic', 'Gibbons', 'Tommy', 'Hotshot190@aol.com', 1, NULL, '', 'speakers', NULL, NULL, NULL, NULL, NULL, '2005-07-13 16:12:48', 0);
INSERT INTO `poolperson` VALUES (430, 'basic', 'Hurley', 'Timothy', 'tjhurls28@hotmail.com', 1, NULL, '', 'rangers28', NULL, NULL, NULL, NULL, NULL, '2005-07-13 16:20:21', 119);
INSERT INTO `poolperson` VALUES (431, 'basic', 'checksfield', 'jim', 'jims.checksfield@comcast.net', 1, NULL, '', 'catfish1', NULL, NULL, NULL, NULL, NULL, '2005-07-13 16:39:41', 0);
INSERT INTO `poolperson` VALUES (432, 'basic', 'McElroy', 'Ryan', 'ryanmcelroy@mail.com', 1, NULL, '', 'myrror', NULL, NULL, NULL, NULL, NULL, '2005-07-13 16:51:04', 115);
INSERT INTO `poolperson` VALUES (433, 'basic', 'kelly', 'kevin', 'kevin.x.kelly@csfb.com', 1, NULL, '', 'avak1209', NULL, NULL, NULL, NULL, NULL, '2005-07-13 17:17:15', 119);
INSERT INTO `poolperson` VALUES (434, 'basic', 'Pastor', 'Greg', 'gpastor44@comcast.net', 1, NULL, '', 'concrete', NULL, NULL, NULL, NULL, NULL, '2005-07-13 18:49:20', 119);
INSERT INTO `poolperson` VALUES (435, 'basic', 'Mixon', 'Terry', 'tdmixon@alltel.net', 1, NULL, '', 'gators', NULL, NULL, NULL, NULL, NULL, '2005-07-13 19:21:26', 130);
INSERT INTO `poolperson` VALUES (436, 'basic', 'Rng', 'Steven', 'steven.ring@sbcglobal.net', 1, NULL, '', 'sar1757', NULL, NULL, NULL, NULL, NULL, '2005-07-13 19:36:50', 131);
INSERT INTO `poolperson` VALUES (437, 'basic', 'L', 'corey', 'kevtarava@hotmail.com', 1, NULL, '', 'avak1209', NULL, NULL, NULL, NULL, NULL, '2005-07-13 19:58:21', 119);
INSERT INTO `poolperson` VALUES (438, 'basic', 'Hurley', 'Christopher', 'cphurley@alumni.princeton.edu', 1, NULL, '', 'bubs0626', NULL, NULL, NULL, NULL, NULL, '2005-07-13 21:29:14', 119);

-- --------------------------------------------------------

-- 
-- Table structure for table `selectedteams`
-- 

CREATE TABLE `selectedteams` (
  `SelectedTeamID` bigint(20) NOT NULL auto_increment,
  `PoolGroupID` bigint(20) NOT NULL default '0',
  `poolpersonID` bigint(20) NOT NULL default '0',
  `Golfer1ID` bigint(20) NOT NULL default '0',
  `Golfer2ID` bigint(20) NOT NULL default '0',
  `Golfer3ID` bigint(20) NOT NULL default '0',
  `Golfer4ID` bigint(20) NOT NULL default '0',
  `Golfer5ID` bigint(20) NOT NULL default '0',
  `Golfer6ID` bigint(20) NOT NULL default '0',
  `TeamName` tinytext,
  `TeamHeadline` text,
  `TeamImage` tinytext,
  `latest_teamnetscore` int(11) default NULL,
  `fullsquad` smallint(6) default '0',
  `tiebreaker` smallint(6) default '0',
  `madecut` smallint(6) default NULL,
  PRIMARY KEY  (`SelectedTeamID`)
) TYPE=MyISAM AUTO_INCREMENT=432 ;

-- 
-- Dumping data for table `selectedteams`
-- 

INSERT INTO `selectedteams` VALUES (1, 1, 1, 91, 35, 86, 67, 27, 17, 'team1', 'this is a sample team headline', NULL, -10, 1, -11, 0);
INSERT INTO `selectedteams` VALUES (2, 1, 2, 0, 0, 0, 0, 0, 0, 'team2', NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (23, 1, 23, 22, 34, 94, 72, 27, 35, NULL, NULL, NULL, -15, 1, -12, 0);
INSERT INTO `selectedteams` VALUES (24, 1, 24, 94, 27, 24, 15, 65, 72, NULL, NULL, NULL, -18, 1, -19, 1);
INSERT INTO `selectedteams` VALUES (25, 1, 25, 8, 27, 37, 17, 91, 48, NULL, NULL, NULL, 6, 1, 280, 0);
INSERT INTO `selectedteams` VALUES (26, 1, 26, 13, 16, 11, 35, 72, 44, NULL, NULL, NULL, 8, 1, 0, 0);
INSERT INTO `selectedteams` VALUES (346, 104, 353, 192, 17, 24, 27, 35, 94, NULL, NULL, NULL, -25, 1, -17, 1);
INSERT INTO `selectedteams` VALUES (27, 1, 27, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (28, 1, 28, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (29, 1, 29, 17, 34, 48, 75, 27, 181, NULL, NULL, NULL, 115, 1, -14, 0);
INSERT INTO `selectedteams` VALUES (30, 1, 30, 94, 27, 24, 17, 91, 34, NULL, NULL, NULL, -5, 1, -12, 0);
INSERT INTO `selectedteams` VALUES (31, 1, 31, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (32, 1, 32, 67, 78, 27, 192, 17, 11, NULL, NULL, NULL, 0, 1, -11, 0);
INSERT INTO `selectedteams` VALUES (33, 1, 33, 17, 24, 27, 53, 94, 35, NULL, NULL, NULL, -18, 1, -12, 1);
INSERT INTO `selectedteams` VALUES (34, 1, 34, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (35, 1, 35, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (36, 1, 36, 8, 17, 19, 34, 24, 35, NULL, NULL, NULL, -8, 1, -8, 0);
INSERT INTO `selectedteams` VALUES (344, 102, 351, 94, 27, 44, 35, 73, 72, NULL, NULL, NULL, -22, 1, -13, 1);
INSERT INTO `selectedteams` VALUES (37, 1, 37, 17, 192, 27, 75, 35, 34, NULL, NULL, NULL, 92, 1, -10, 0);
INSERT INTO `selectedteams` VALUES (343, 101, 350, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (38, 1, 38, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (342, 100, 349, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (39, 1, 39, 27, 37, 48, 17, 94, 53, NULL, NULL, NULL, -5, 1, -9, 0);
INSERT INTO `selectedteams` VALUES (40, 1, 40, 94, 189, 27, 53, 24, 44, NULL, NULL, NULL, -9, 1, 275, 0);
INSERT INTO `selectedteams` VALUES (41, 1, 41, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (42, 1, 42, 17, 24, 11, 47, 91, 22, NULL, NULL, NULL, -7, 1, -12, 0);
INSERT INTO `selectedteams` VALUES (341, 99, 348, 8, 13, 192, 35, 27, 94, NULL, NULL, NULL, -8, 1, -7, 0);
INSERT INTO `selectedteams` VALUES (43, 1, 43, 35, 17, 72, 94, 23, 34, NULL, NULL, NULL, -11, 1, -14, 0);
INSERT INTO `selectedteams` VALUES (44, 1, 44, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (45, 1, 45, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (46, 1, 46, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (47, 1, 47, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (48, 1, 48, 4, 8, 12, 109, 24, 75, NULL, NULL, NULL, 98, 1, 0, 0);
INSERT INTO `selectedteams` VALUES (49, 1, 49, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (50, 1, 50, 94, 27, 34, 35, 17, 37, NULL, NULL, NULL, -10, 1, -12, 0);
INSERT INTO `selectedteams` VALUES (340, 98, 347, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (51, 1, 51, 65, 35, 34, 17, 11, 109, NULL, NULL, NULL, -2, 1, -12, 0);
INSERT INTO `selectedteams` VALUES (339, 94, 346, 94, 35, 73, 53, 48, 75, NULL, NULL, NULL, 89, 1, -11, 0);
INSERT INTO `selectedteams` VALUES (52, 1, 52, 94, 27, 35, 34, 91, 109, NULL, NULL, NULL, -9, 1, -12, 0);
INSERT INTO `selectedteams` VALUES (338, 115, 345, 94, 17, 192, 27, 34, 35, NULL, NULL, NULL, -13, 1, -8, 0);
INSERT INTO `selectedteams` VALUES (53, 1, 53, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (54, 1, 54, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (337, 1, 344, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (55, 1, 55, 17, 24, 34, 35, 72, 91, NULL, NULL, NULL, -6, 1, -8, 0);
INSERT INTO `selectedteams` VALUES (56, 1, 56, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (57, 1, 57, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (58, 1, 58, 8, 24, 94, 35, 109, 44, NULL, NULL, NULL, -15, 1, -7, 0);
INSERT INTO `selectedteams` VALUES (59, 1, 59, 27, 45, 94, 24, 34, 75, NULL, NULL, NULL, 89, 1, -13, 0);
INSERT INTO `selectedteams` VALUES (60, 1, 60, 8, 189, 22, 27, 86, 91, NULL, NULL, NULL, -2, 1, -8, 0);
INSERT INTO `selectedteams` VALUES (61, 1, 61, 8, 35, 34, 189, 44, 45, NULL, NULL, NULL, -1, 1, -7, 0);
INSERT INTO `selectedteams` VALUES (62, 1, 62, 8, 24, 27, 37, 180, 51, NULL, NULL, NULL, 3, 1, 276, 0);
INSERT INTO `selectedteams` VALUES (63, 1, 63, 4, 73, 48, 35, 37, 27, NULL, NULL, NULL, -9, 1, 1, 0);
INSERT INTO `selectedteams` VALUES (64, 1, 64, 4, 16, 44, 75, 72, 24, NULL, NULL, NULL, 94, 1, -5, 0);
INSERT INTO `selectedteams` VALUES (65, 1, 65, 8, 24, 27, 17, 91, 35, NULL, NULL, NULL, -6, 1, -9, 0);
INSERT INTO `selectedteams` VALUES (81, 1, 88, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (67, 1, 74, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (83, 1, 90, 86, 24, 72, 37, 15, 17, NULL, NULL, NULL, -13, 1, -6, 1);
INSERT INTO `selectedteams` VALUES (336, 0, 343, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (82, 19, 89, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (84, 1, 91, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (85, 1, 92, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (86, 1, 93, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (87, 1, 94, 45, 24, 44, 75, 17, 35, NULL, NULL, NULL, 86, 1, -9, 0);
INSERT INTO `selectedteams` VALUES (88, 1, 95, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (89, 1, 96, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (90, 1, 97, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (91, 1, 98, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (92, 1, 99, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (93, 1, 100, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (94, 20, 101, 11, 24, 35, 73, 94, 27, NULL, NULL, NULL, -13, 1, -8, 0);
INSERT INTO `selectedteams` VALUES (335, 97, 342, 27, 94, 75, 73, 37, 17, NULL, NULL, NULL, 87, 1, -12, 0);
INSERT INTO `selectedteams` VALUES (95, 1, 102, 23, 35, 75, 27, 94, 34, NULL, NULL, NULL, 91, 1, -4, 0);
INSERT INTO `selectedteams` VALUES (96, 20, 103, 94, 73, 37, 53, 27, 44, NULL, NULL, NULL, -15, 1, -12, 1);
INSERT INTO `selectedteams` VALUES (97, 1, 104, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (98, 21, 105, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (99, 1, 106, 94, 35, 90, 73, 23, 27, NULL, NULL, NULL, -8, 1, -5, 0);
INSERT INTO `selectedteams` VALUES (100, 0, 107, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (101, 20, 108, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (334, 96, 341, 109, 37, 94, 17, 34, 182, NULL, NULL, NULL, -14, 1, -6, 0);
INSERT INTO `selectedteams` VALUES (102, 1, 109, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (103, 20, 110, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (104, 0, 111, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (105, 0, 112, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (106, 0, 113, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (107, 22, 114, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (108, 20, 115, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (109, 23, 116, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (110, 24, 117, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (111, 0, 118, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (112, 20, 119, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (333, 94, 340, 23, 34, 37, 84, 94, 244, NULL, NULL, NULL, -12, 1, -14, 0);
INSERT INTO `selectedteams` VALUES (113, 20, 120, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (114, 25, 121, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (115, 20, 122, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (116, 26, 123, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (117, 20, 124, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (332, 95, 339, 3, 109, 22, 23, 51, 75, NULL, NULL, NULL, 103, 1, -6, 0);
INSERT INTO `selectedteams` VALUES (118, 27, 125, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (331, 94, 338, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (119, 28, 126, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (120, 20, 127, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (121, 29, 128, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (330, 94, 337, 94, 27, 192, 17, 73, 109, NULL, NULL, NULL, -29, 1, -9, 1);
INSERT INTO `selectedteams` VALUES (122, 1, 129, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (123, 20, 130, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (329, 0, 336, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (124, 30, 131, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (125, 0, 132, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (126, 20, 133, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (127, 20, 134, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (328, 0, 335, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (128, 29, 135, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (129, 29, 136, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (130, 31, 137, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (131, 32, 138, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (132, 29, 139, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (327, 93, 334, 19, 27, 37, 53, 73, 75, NULL, NULL, NULL, 88, 1, -5, 0);
INSERT INTO `selectedteams` VALUES (133, 33, 140, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (326, 0, 333, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (134, 33, 141, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (362, 96, 369, 37, 94, 47, 27, 72, 73, NULL, NULL, NULL, -18, 1, -4, 1);
INSERT INTO `selectedteams` VALUES (135, 29, 142, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (136, 34, 143, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (137, 34, 144, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (325, 92, 332, 2, 4, 90, 37, 7, 244, NULL, NULL, NULL, 2, 1, -3, 0);
INSERT INTO `selectedteams` VALUES (138, 33, 145, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (139, 33, 146, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (140, 1, 147, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (324, 91, 331, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (141, 35, 148, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (142, 36, 149, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (143, 37, 150, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (144, 1, 151, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (323, 90, 330, 94, 23, 44, 53, 37, 73, NULL, NULL, NULL, -16, 1, -5, 1);
INSERT INTO `selectedteams` VALUES (145, 0, 152, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (146, 38, 153, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (147, 39, 154, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (148, 0, 155, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (149, 33, 156, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (150, 39, 157, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (322, 76, 329, 17, 27, 34, 53, 182, 44, NULL, NULL, NULL, -6, 1, 0, 0);
INSERT INTO `selectedteams` VALUES (151, 40, 158, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (152, 40, 159, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (153, 40, 160, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (154, 40, 161, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (155, 40, 162, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (156, 1, 163, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (157, 29, 164, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (158, 29, 165, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (159, 41, 166, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (160, 42, 167, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (161, 29, 168, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (162, 29, 169, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (163, 43, 170, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (321, 89, 328, 91, 35, 182, 86, 59, 244, NULL, NULL, NULL, -22, 1, -13, 0);
INSERT INTO `selectedteams` VALUES (164, 44, 171, 192, 17, 195, 244, 94, 75, NULL, NULL, NULL, 87, 1, -4, 0);
INSERT INTO `selectedteams` VALUES (320, 88, 327, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (165, 33, 172, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (166, 34, 173, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (167, 45, 174, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (168, 45, 175, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (319, 0, 326, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (169, 39, 176, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (318, 0, 325, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (170, 39, 177, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (317, 0, 324, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (171, 45, 178, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (316, 0, 323, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (172, 0, 179, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (173, 1, 180, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (174, 46, 181, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (175, 46, 182, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (176, 45, 183, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (315, 0, 322, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (177, 1, 184, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (178, 33, 185, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (314, 1, 321, 27, 22, 73, 17, 34, 8, NULL, NULL, NULL, -3, 1, -3, 0);
INSERT INTO `selectedteams` VALUES (179, 45, 186, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (180, 29, 187, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (181, 47, 188, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (182, 0, 189, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (183, 34, 190, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (184, 29, 191, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (313, 87, 320, 17, 27, 37, 244, 73, 94, NULL, NULL, NULL, -25, 1, -2, 1);
INSERT INTO `selectedteams` VALUES (185, 65, 192, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (186, 29, 193, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (187, 0, 194, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (188, 45, 195, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (189, 34, 196, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (312, 0, 319, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (190, 45, 197, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (311, 86, 318, 3, 12, 17, 94, 90, 78, NULL, NULL, NULL, 16, 1, -4, 0);
INSERT INTO `selectedteams` VALUES (191, 45, 198, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (310, 0, 317, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (192, 45, 199, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (193, 48, 200, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (194, 20, 201, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (195, 20, 202, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (196, 20, 203, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (197, 39, 204, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (198, 20, 205, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (309, 1, 316, 17, 24, 27, 94, 34, 44, NULL, NULL, NULL, -7, 1, -4, 0);
INSERT INTO `selectedteams` VALUES (199, 20, 206, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (308, 0, 315, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (200, 20, 207, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (201, 48, 208, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (202, 46, 209, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (307, 85, 314, 27, 37, 53, 73, 94, 24, NULL, NULL, NULL, -15, 1, -4, 1);
INSERT INTO `selectedteams` VALUES (203, 39, 210, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (204, 49, 211, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (205, 0, 212, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (206, 46, 213, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (306, 84, 313, 11, 24, 37, 82, 48, 60, NULL, NULL, NULL, 10, 1, -1, 0);
INSERT INTO `selectedteams` VALUES (207, 50, 214, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (208, 20, 215, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (209, 1, 216, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (210, 51, 217, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (305, 84, 312, 188, 19, 23, 34, 73, 53, NULL, NULL, NULL, -6, 1, 3, 0);
INSERT INTO `selectedteams` VALUES (211, 52, 218, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (212, 53, 219, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (298, 74, 305, 94, 53, 35, 27, 34, 109, NULL, NULL, NULL, -12, 1, -10, 0);
INSERT INTO `selectedteams` VALUES (213, 54, 220, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (304, 115, 311, 94, 27, 34, 73, 192, 44, NULL, NULL, NULL, -10, 1, -3, 0);
INSERT INTO `selectedteams` VALUES (214, 45, 221, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (215, 51, 222, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (216, 55, 223, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (303, 76, 310, 34, 2, 72, 75, 17, 27, NULL, NULL, NULL, 92, 1, -15, 0);
INSERT INTO `selectedteams` VALUES (217, 39, 224, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (302, 0, 309, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (218, 56, 225, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (301, 0, 308, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (219, 29, 226, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (300, 0, 307, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (220, 57, 227, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (221, 56, 228, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (299, 83, 306, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (222, 29, 229, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (223, 58, 230, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (224, 58, 231, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (225, 58, 232, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (226, 59, 233, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (227, 39, 234, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (228, 29, 235, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (292, 80, 299, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (229, 60, 236, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (230, 61, 237, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (291, 0, 298, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (231, 39, 238, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (289, 1, 296, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (232, 29, 239, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (288, 0, 295, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (233, 62, 240, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (234, 63, 241, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (235, 1, 242, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (287, 0, 294, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (236, 64, 243, 8, 27, 35, 94, 72, 53, NULL, NULL, NULL, -14, 1, 0, 0);
INSERT INTO `selectedteams` VALUES (286, 0, 293, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (237, 39, 244, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (238, 64, 245, 27, 94, 53, 35, 73, 37, NULL, NULL, NULL, -22, 1, -8, 1);
INSERT INTO `selectedteams` VALUES (239, 64, 246, 94, 53, 37, 34, 45, 44, NULL, NULL, NULL, -8, 1, -3, 0);
INSERT INTO `selectedteams` VALUES (285, 74, 292, 16, 35, 37, 72, 73, 94, NULL, NULL, NULL, -13, 1, -13, 0);
INSERT INTO `selectedteams` VALUES (240, 64, 247, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (283, 0, 290, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (241, 34, 248, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (282, 78, 289, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (242, 64, 249, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (281, 74, 288, 16, 23, 27, 34, 37, 53, NULL, NULL, NULL, 6, 1, -4, 0);
INSERT INTO `selectedteams` VALUES (243, 64, 250, 94, 35, 73, 72, 27, 48, NULL, NULL, NULL, -13, 1, 5, 0);
INSERT INTO `selectedteams` VALUES (245, 29, 252, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (279, 76, 286, 27, 37, 53, 73, 94, 82, NULL, NULL, NULL, -10, 1, 10, 0);
INSERT INTO `selectedteams` VALUES (244, 64, 251, 27, 35, 73, 91, 94, 17, NULL, NULL, NULL, -14, 1, 0, 0);
INSERT INTO `selectedteams` VALUES (345, 103, 352, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (246, 66, 253, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (247, 64, 254, 94, 27, 17, 24, 44, 53, NULL, NULL, NULL, -11, 1, -9, 1);
INSERT INTO `selectedteams` VALUES (278, 76, 285, 27, 37, 73, 94, 35, 25, NULL, NULL, NULL, -3, 1, -12, 0);
INSERT INTO `selectedteams` VALUES (248, 1, 255, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (277, 0, 284, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (249, 58, 256, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (250, 1, 257, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (251, 39, 258, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (276, 75, 283, 94, 34, 37, 48, 65, 192, NULL, NULL, NULL, -4, 1, 0, 0);
INSERT INTO `selectedteams` VALUES (252, 0, 259, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (253, 39, 260, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (254, 67, 261, 27, 35, 19, 17, 75, 34, NULL, NULL, NULL, 91, 1, -12, 0);
INSERT INTO `selectedteams` VALUES (255, 29, 262, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (275, 74, 282, 73, 34, 37, 244, 53, 80, NULL, NULL, NULL, -4, 1, -3, 0);
INSERT INTO `selectedteams` VALUES (256, 29, 263, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (274, 0, 281, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (257, 1, 264, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (273, 0, 280, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (258, 0, 265, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (259, 0, 266, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (260, 68, 267, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (261, 51, 268, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (270, 1, 277, 4, 27, 80, 44, 53, 72, NULL, NULL, NULL, -5, 1, 276, 1);
INSERT INTO `selectedteams` VALUES (262, 39, 269, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (271, 72, 278, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (263, 69, 270, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (272, 73, 279, 94, 12, 109, 22, 21, 34, NULL, NULL, NULL, 2, 1, -6, 0);
INSERT INTO `selectedteams` VALUES (264, 0, 271, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (265, 1, 272, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (266, 1, 273, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (268, 70, 275, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (267, 33, 274, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, 1);
INSERT INTO `selectedteams` VALUES (293, 0, 300, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (294, 124, 301, 94, 90, 17, 22, 35, 100, NULL, NULL, NULL, -9, 1, -9, 0);
INSERT INTO `selectedteams` VALUES (295, 0, 302, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (296, 81, 303, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (297, 82, 304, 23, 27, 94, 90, 73, 182, NULL, NULL, NULL, -10, 1, -2, 0);
INSERT INTO `selectedteams` VALUES (284, 79, 291, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (280, 77, 287, 94, 19, 27, 35, 73, 217, NULL, NULL, NULL, -27, 1, -6, 1);
INSERT INTO `selectedteams` VALUES (347, 105, 354, 11, 24, 27, 94, 72, 37, NULL, NULL, NULL, -9, 1, 0, 0);
INSERT INTO `selectedteams` VALUES (348, 0, 355, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (349, 115, 356, 13, 24, 27, 34, 73, 94, NULL, NULL, NULL, -3, 1, -11, 0);
INSERT INTO `selectedteams` VALUES (350, 106, 357, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (351, 107, 358, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (352, 1, 359, 34, 17, 35, 24, 37, 94, NULL, NULL, NULL, -12, 1, -9, 0);
INSERT INTO `selectedteams` VALUES (353, 108, 360, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (354, 109, 361, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (355, 110, 362, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (356, 76, 363, 23, 35, 17, 73, 34, 72, NULL, NULL, NULL, -8, 1, -7, 0);
INSERT INTO `selectedteams` VALUES (357, 0, 364, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (358, 111, 365, 4, 16, 23, 94, 44, 73, NULL, NULL, NULL, -8, 1, -6, 0);
INSERT INTO `selectedteams` VALUES (359, 112, 366, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (360, 113, 367, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (361, 114, 368, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (363, 0, 370, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (364, 0, 371, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (365, 115, 372, 3, 22, 90, 94, 27, 35, NULL, NULL, NULL, -3, 1, -9, 0);
INSERT INTO `selectedteams` VALUES (366, 0, 373, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (367, 0, 374, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (368, 96, 375, 27, 94, 37, 73, 95, 72, NULL, NULL, NULL, -10, 1, -8, 0);
INSERT INTO `selectedteams` VALUES (369, 115, 376, 91, 35, 27, 94, 209, 53, NULL, NULL, NULL, -14, 1, -9, 0);
INSERT INTO `selectedteams` VALUES (370, 0, 377, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (371, 116, 378, 35, 24, 48, 86, 94, 53, NULL, NULL, NULL, -13, 1, -6, 0);
INSERT INTO `selectedteams` VALUES (372, 117, 379, 19, 24, 27, 37, 44, 72, NULL, NULL, NULL, -15, 1, -4, 1);
INSERT INTO `selectedteams` VALUES (373, 117, 380, 13, 24, 34, 80, 91, 67, NULL, NULL, NULL, 7, 1, 2, 0);
INSERT INTO `selectedteams` VALUES (374, 118, 381, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (375, 0, 382, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (376, 119, 383, 53, 75, 17, 8, 27, 48, NULL, NULL, NULL, 103, 1, -10, 0);
INSERT INTO `selectedteams` VALUES (377, 120, 384, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (378, 121, 385, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (379, 119, 386, 73, 37, 94, 88, 90, 35, NULL, NULL, NULL, -14, 1, -8, 0);
INSERT INTO `selectedteams` VALUES (380, 119, 387, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (381, 119, 388, 35, 17, 48, 94, 27, 8, NULL, NULL, NULL, -6, 1, -11, 0);
INSERT INTO `selectedteams` VALUES (382, 122, 389, 94, 72, 73, 17, 23, 27, NULL, NULL, NULL, -21, 1, -7, 1);
INSERT INTO `selectedteams` VALUES (383, 123, 390, 94, 90, 27, 37, 53, 182, NULL, NULL, NULL, -9, 1, 0, 0);
INSERT INTO `selectedteams` VALUES (384, 119, 391, 94, 53, 75, 91, 65, 192, NULL, NULL, NULL, 88, 1, -7, 0);
INSERT INTO `selectedteams` VALUES (385, 125, 392, 94, 53, 17, 35, 72, 22, NULL, NULL, NULL, -25, 1, 2, 1);
INSERT INTO `selectedteams` VALUES (386, 119, 393, 8, 13, 17, 35, 91, 72, NULL, NULL, NULL, 1, 1, 0, 0);
INSERT INTO `selectedteams` VALUES (387, 119, 394, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (388, 94, 395, 94, 73, 53, 27, 72, 75, NULL, NULL, NULL, 85, 1, -3, 0);
INSERT INTO `selectedteams` VALUES (389, 119, 396, 24, 3, 23, 35, 13, 189, NULL, NULL, NULL, 6, 1, -4, 0);
INSERT INTO `selectedteams` VALUES (390, 119, 397, 189, 67, 24, 34, 13, 72, NULL, NULL, NULL, 4, 1, 0, 0);
INSERT INTO `selectedteams` VALUES (391, 119, 398, 51, 27, 37, 17, 72, 35, NULL, NULL, NULL, -6, 1, -7, 0);
INSERT INTO `selectedteams` VALUES (392, 125, 399, 34, 53, 94, 73, 27, 35, NULL, NULL, NULL, -12, 1, -14, 0);
INSERT INTO `selectedteams` VALUES (393, 0, 400, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (394, 119, 401, 35, 34, 15, 17, 24, 75, NULL, NULL, NULL, 93, 1, -2, 0);
INSERT INTO `selectedteams` VALUES (395, 125, 402, 15, 86, 47, 65, 72, 225, NULL, NULL, NULL, -9, 1, -14, 0);
INSERT INTO `selectedteams` VALUES (396, 126, 403, 94, 75, 44, 17, 35, 24, NULL, NULL, NULL, 84, 1, 0, 0);
INSERT INTO `selectedteams` VALUES (397, 125, 404, 27, 94, 73, 37, 35, 53, NULL, NULL, NULL, -22, 1, -6, 1);
INSERT INTO `selectedteams` VALUES (398, 128, 405, 72, 8, 24, 35, 82, 39, NULL, NULL, NULL, -4, 1, -8, 0);
INSERT INTO `selectedteams` VALUES (399, 0, 406, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (400, 128, 407, 24, 44, 45, 17, 35, 94, NULL, NULL, NULL, -22, 1, -5, 1);
INSERT INTO `selectedteams` VALUES (401, 117, 408, 94, 27, 8, 44, 17, 192, NULL, NULL, NULL, -10, 1, 0, 0);
INSERT INTO `selectedteams` VALUES (402, 76, 409, 94, 27, 44, 34, 17, 35, NULL, NULL, NULL, -9, 1, -10, 0);
INSERT INTO `selectedteams` VALUES (403, 117, 410, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (404, 125, 411, 94, 37, 53, 35, 24, 91, NULL, NULL, NULL, -14, 1, 0, 0);
INSERT INTO `selectedteams` VALUES (405, 94, 412, 94, 34, 44, 24, 75, 35, NULL, NULL, NULL, 89, 1, -12, 0);
INSERT INTO `selectedteams` VALUES (406, 117, 413, 3, 188, 192, 33, 44, 73, NULL, NULL, NULL, 2, 1, -1, 0);
INSERT INTO `selectedteams` VALUES (407, 0, 414, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (408, 127, 415, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (409, 128, 416, 75, 44, 17, 35, 24, 48, NULL, NULL, NULL, 95, 1, -7, 0);
INSERT INTO `selectedteams` VALUES (410, 119, 417, 24, 53, 72, 17, 22, 35, NULL, NULL, NULL, -16, 1, -3, 1);
INSERT INTO `selectedteams` VALUES (411, 119, 418, 182, 17, 35, 44, 47, 34, NULL, NULL, NULL, -15, 1, -5, 0);
INSERT INTO `selectedteams` VALUES (412, 0, 419, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (413, 0, 420, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (414, 119, 421, 24, 72, 34, 35, 109, 17, NULL, NULL, NULL, -11, 1, 0, 0);
INSERT INTO `selectedteams` VALUES (415, 119, 422, 45, 35, 17, 94, 53, 48, NULL, NULL, NULL, -12, 1, -3, 0);
INSERT INTO `selectedteams` VALUES (416, 119, 423, 37, 17, 24, 34, 53, 23, NULL, NULL, NULL, -2, 1, -6, 0);
INSERT INTO `selectedteams` VALUES (417, 76, 424, 34, 17, 75, 44, 65, 81, NULL, NULL, NULL, 101, 1, -6, 0);
INSERT INTO `selectedteams` VALUES (418, 76, 425, 34, 37, 23, 53, 73, 94, NULL, NULL, NULL, -7, 1, -7, 0);
INSERT INTO `selectedteams` VALUES (419, 129, 426, 3, 94, 192, 17, 78, 188, NULL, NULL, NULL, -3, 1, -10, 0);
INSERT INTO `selectedteams` VALUES (420, 119, 427, 27, 35, 72, 24, 34, 78, NULL, NULL, NULL, -5, 1, -6, 0);
INSERT INTO `selectedteams` VALUES (421, 119, 428, 94, 27, 53, 48, 90, 75, NULL, NULL, NULL, 103, 1, -2, 0);
INSERT INTO `selectedteams` VALUES (422, 0, 429, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (423, 119, 430, 53, 15, 22, 27, 35, 40, NULL, NULL, NULL, 89, 1, -9, 1);
INSERT INTO `selectedteams` VALUES (424, 0, 431, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (425, 115, 432, 90, 73, 94, 27, 37, 53, NULL, NULL, NULL, -5, 1, -6, 0);
INSERT INTO `selectedteams` VALUES (426, 119, 433, 4, 17, 27, 35, 94, 73, NULL, NULL, NULL, -26, 1, -10, 1);
INSERT INTO `selectedteams` VALUES (427, 119, 434, 27, 37, 35, 73, 34, 65, NULL, NULL, NULL, -8, 1, -1, 0);
INSERT INTO `selectedteams` VALUES (428, 130, 435, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0, NULL);
INSERT INTO `selectedteams` VALUES (429, 131, 436, 192, 27, 44, 24, 4, 22, NULL, NULL, NULL, -10, 1, -14, 1);
INSERT INTO `selectedteams` VALUES (430, 119, 437, 27, 34, 37, 73, 94, 91, NULL, NULL, NULL, -5, 1, -7, 0);
INSERT INTO `selectedteams` VALUES (431, 119, 438, 17, 78, 45, 180, 182, 211, NULL, NULL, NULL, -9, 1, -3, 0);
