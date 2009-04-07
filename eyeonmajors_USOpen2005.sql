-- phpMyAdmin SQL Dump
-- version 2.6.0-pl3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jun 15, 2005 at 02:34 PM
-- Server version: 3.23.58
-- PHP Version: 4.3.10
-- 
-- Database: `eyeonmajors`
-- 

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
) TYPE=MyISAM AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `currentcutline`
-- 

INSERT INTO `currentcutline` VALUES (1, 10, '2005 Masters', '2005-06-15 14:07:46', '2005-06-16 02:00:00');
INSERT INTO `currentcutline` VALUES (2, 10, '2005 US Open', '2005-06-16 16:40:37', '2005-06-16 02:00:00');

-- --------------------------------------------------------

-- 
-- Table structure for table `eomhandicaps`
-- 

CREATE TABLE `eomhandicaps` (
  `HandicapID` bigint(20) NOT NULL default '0',
  `GroupID` bigint(20) default NULL,
  `GolferID` bigint(20) default NULL,
  `HandicapStrokes` tinyint(3) unsigned default NULL,
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
) TYPE=MyISAM AUTO_INCREMENT=184 ;

-- 
-- Dumping data for table `golfer`
-- 

INSERT INTO `golfer` VALUES (1, 'Tommy', 'Aaron', 0, 999, NULL, 2, 999, 999, 999, 'Aaron_Tommy', 0);
INSERT INTO `golfer` VALUES (2, 'Robert', 'Allenby', 0, 999, NULL, 2, NULL, NULL, NULL, 'Allenby_Robert', 1);
INSERT INTO `golfer` VALUES (3, 'Stephen', 'Ames', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Ames_Steven', 1);
INSERT INTO `golfer` VALUES (4, 'Stuart', 'Appleby', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Appleby_Stuart', 1);
INSERT INTO `golfer` VALUES (5, 'George', 'Archer', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Archer_George', 0);
INSERT INTO `golfer` VALUES (6, 'Severiano', 'Ballesteros', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Ballesteros_Severiano', 0);
INSERT INTO `golfer` VALUES (7, 'Rich', 'Beem', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Beem_Rich', 1);
INSERT INTO `golfer` VALUES (8, 'Thomas', 'Bjorn', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Bjorn_Thomas', 1);
INSERT INTO `golfer` VALUES (9, 'Gay', 'Brewer Jr.', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Brewer_GayJr', 0);
INSERT INTO `golfer` VALUES (10, 'Jack', 'Burke Jr.', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Burke_JackJr', 0);
INSERT INTO `golfer` VALUES (11, 'Angel', 'Cabrera', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Cabrera_Angel', 1);
INSERT INTO `golfer` VALUES (12, 'Chad', 'Campbell', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Campbell_Chad', 1);
INSERT INTO `golfer` VALUES (13, 'Paul', 'Casey', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Casey_Paul', 1);
INSERT INTO `golfer` VALUES (14, 'Billy', 'Casper', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Casper_Billy', 0);
INSERT INTO `golfer` VALUES (15, 'K.J.', 'Choi', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Choi_KJ', 1);
INSERT INTO `golfer` VALUES (16, 'Stewart', 'Cink', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Cink_Stewart', 1);
INSERT INTO `golfer` VALUES (17, 'Darren', 'Clarke', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Clarke_Darren', 0);
INSERT INTO `golfer` VALUES (18, 'Charles', 'Coody', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Coody_Charles', 0);
INSERT INTO `golfer` VALUES (19, 'Fred', 'Couples', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Couples_Fred', 1);
INSERT INTO `golfer` VALUES (20, 'Ben', 'Crenshaw', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Crenshaw_Ben', 0);
INSERT INTO `golfer` VALUES (21, 'Ben', 'Curtis', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Curtis_Ben', 1);
INSERT INTO `golfer` VALUES (22, 'John', 'Daly', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Daly_John', 1);
INSERT INTO `golfer` VALUES (23, 'Chris', 'DiMarco', 0, NULL, NULL, 2, NULL, NULL, NULL, 'DiMarco_Chris', 1);
INSERT INTO `golfer` VALUES (24, 'Luke', 'Donald', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Donald_Luke', 1);
INSERT INTO `golfer` VALUES (25, 'David', 'Duval', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Duval_David', 1);
INSERT INTO `golfer` VALUES (26, 'Austin', 'Eaton III', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Eaton_AustinIII', 1);
INSERT INTO `golfer` VALUES (27, 'Ernie', 'Els', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Els_Ernie', 1);
INSERT INTO `golfer` VALUES (28, 'Nick', 'Faldo', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Faldo_Nick', 0);
INSERT INTO `golfer` VALUES (29, 'Steve', 'Flesch', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Flesch_Steve', 1);
INSERT INTO `golfer` VALUES (30, 'Raymond', 'Floyd', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Floyd_Raymond', 0);
INSERT INTO `golfer` VALUES (31, 'Doug', 'Ford', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Ford_Doug', 0);
INSERT INTO `golfer` VALUES (32, 'Carlos', 'Franco', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Franco_Carlos', 1);
INSERT INTO `golfer` VALUES (33, 'Fred', 'Funk', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Funk_Fred', 1);
INSERT INTO `golfer` VALUES (34, 'Jim', 'Furyk', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Furyk_Jim', 1);
INSERT INTO `golfer` VALUES (35, 'Sergio', 'Garcia', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Garcia_Sergio', 1);
INSERT INTO `golfer` VALUES (36, 'Bob', 'Goalby', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Goalby_Bob', 0);
INSERT INTO `golfer` VALUES (37, 'Retief', 'Goosen', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Goosen_Retief', 1);
INSERT INTO `golfer` VALUES (38, 'Jay', 'Haas', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Haas_Jay', 1);
INSERT INTO `golfer` VALUES (39, 'Zach', 'Johnson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Johnson_Zach', 1);
INSERT INTO `golfer` VALUES (40, 'Shingo', 'Katayama', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Katayama_Shingo', 1);
INSERT INTO `golfer` VALUES (41, 'Jonathan', 'Kaye', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Kaye_Jonathan', 0);
INSERT INTO `golfer` VALUES (42, 'Jerry', 'Kelly', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Kelly_Jerry', 1);
INSERT INTO `golfer` VALUES (43, 'Bernhard', 'Langer', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Langer_Bernhard', 1);
INSERT INTO `golfer` VALUES (44, 'Justin', 'Leonard', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Leonard_Justin', 1);
INSERT INTO `golfer` VALUES (45, 'Thomas', 'Levet', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Levet_Thomas', 1);
INSERT INTO `golfer` VALUES (46, 'Luke', 'List', 0, NULL, NULL, 2, NULL, NULL, NULL, 'List_Luke', 1);
INSERT INTO `golfer` VALUES (47, 'Peter', 'Lonard', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Lonard_Peter', 1);
INSERT INTO `golfer` VALUES (48, 'Davis', 'Love III', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Love_DavisIII', 1);
INSERT INTO `golfer` VALUES (49, 'Sandy', 'Lyle', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Lyle_Sandy', 0);
INSERT INTO `golfer` VALUES (50, 'Jeff', 'Maggert', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Maggert_Jeff', 1);
INSERT INTO `golfer` VALUES (51, 'Shigeki', 'Maruyama', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Maruyama_Shigeki', 1);
INSERT INTO `golfer` VALUES (52, 'Shaun', 'Micheel', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Micheel_Shaun', 1);
INSERT INTO `golfer` VALUES (53, 'Phil', 'Mickelson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Mickelson_Phil', 1);
INSERT INTO `golfer` VALUES (54, 'Larry', 'Mize', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Mize_Larry', 0);
INSERT INTO `golfer` VALUES (55, 'Ryan', 'Moore', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Moore_Ryan', 1);
INSERT INTO `golfer` VALUES (56, 'Byron', 'Nelson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Nelson_Byron', 0);
INSERT INTO `golfer` VALUES (57, 'Jack', 'Nicklaus', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Nicklaus_Jack', 0);
INSERT INTO `golfer` VALUES (58, 'Nick', 'O''Hearn', 0, NULL, NULL, 2, NULL, NULL, NULL, 'OHern_Nick', 1);
INSERT INTO `golfer` VALUES (59, 'Jose Maria', 'Olazabal', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Olazabal_JoseMaria', 1);
INSERT INTO `golfer` VALUES (60, 'Mark', 'O''Meara', 0, NULL, NULL, 2, NULL, NULL, NULL, 'OMeara_Mark', 0);
INSERT INTO `golfer` VALUES (61, 'Arnold', 'Palmer', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Palmer_Arnold', 0);
INSERT INTO `golfer` VALUES (62, 'Ryan', 'Palmer', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Palmer_Ryan', 0);
INSERT INTO `golfer` VALUES (63, 'Rod', 'Pampling', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Pampling_Rod', 1);
INSERT INTO `golfer` VALUES (64, 'Jesper', 'Parnevik', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Parnevik_Jesper', 0);
INSERT INTO `golfer` VALUES (65, 'Kenny', 'Perry', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Perry_Kenny', 1);
INSERT INTO `golfer` VALUES (66, 'Gary', 'Player', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Player_Gary', 0);
INSERT INTO `golfer` VALUES (67, 'Ian', 'Poulter', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Poulter_Ian', 1);
INSERT INTO `golfer` VALUES (68, 'Nick', 'Price', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Price_Nick', 1);
INSERT INTO `golfer` VALUES (69, 'Ted', 'Purdy', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Purdy_Ted', 1);
INSERT INTO `golfer` VALUES (70, 'Chris', 'Riley', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Riley_Chris', 0);
INSERT INTO `golfer` VALUES (71, 'Rory', 'Sabbatini', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Sabbatini_Rory', 1);
INSERT INTO `golfer` VALUES (72, 'Adam', 'Scott', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Scott_Adam', 1);
INSERT INTO `golfer` VALUES (73, 'Vijay', 'Singh', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Singh_Vijay', 1);
INSERT INTO `golfer` VALUES (74, 'Craig', 'Stadler', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Stadler_Craig', 0);
INSERT INTO `golfer` VALUES (75, 'David', 'Toms', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Toms_David', 1);
INSERT INTO `golfer` VALUES (76, 'Kirk', 'Triplett', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Triplett_Kirk', 0);
INSERT INTO `golfer` VALUES (77, 'Joakim', 'Haeggman', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Haeggman_Joakim', 0);
INSERT INTO `golfer` VALUES (78, 'Todd', 'Hamilton', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Hamilton_Todd', 1);
INSERT INTO `golfer` VALUES (79, 'Padraig', 'Harrington', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Harrington_Padraig', 1);
INSERT INTO `golfer` VALUES (80, 'Mark', 'Hensby', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Hensby_Mark', 1);
INSERT INTO `golfer` VALUES (81, 'Tim', 'Herron', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Herron_Tim', 1);
INSERT INTO `golfer` VALUES (82, 'Charles', 'Howell III', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Howell_CharlesIII', 1);
INSERT INTO `golfer` VALUES (83, 'David', 'Howell', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Howell_David', 1);
INSERT INTO `golfer` VALUES (84, 'Trevor', 'Immelman', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Immelman_Trevor', 0);
INSERT INTO `golfer` VALUES (85, 'Fredrik', 'Jacobson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Jacobson_Fredrik', 0);
INSERT INTO `golfer` VALUES (86, 'Miguel Angel', 'Jimenez', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Jimenez_MiguelAngel', 1);
INSERT INTO `golfer` VALUES (87, 'Bo', 'Van Pelt', 0, NULL, NULL, 2, NULL, NULL, NULL, 'VanPelt_Bo', 0);
INSERT INTO `golfer` VALUES (88, 'Scott', 'Verplank', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Verplank_Scott', 1);
INSERT INTO `golfer` VALUES (89, 'Tom', 'Watson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Watson_Tom', 0);
INSERT INTO `golfer` VALUES (90, 'Mike', 'Weir', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Weir_Mike', 1);
INSERT INTO `golfer` VALUES (91, 'Lee', 'Westwood', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Westwood_Lee', 1);
INSERT INTO `golfer` VALUES (92, 'Stuart', 'Wilson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Wilson_Stuart', 0);
INSERT INTO `golfer` VALUES (93, 'Casey', 'Wittenberg', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Wittenberg_Casey', 1);
INSERT INTO `golfer` VALUES (94, 'Tiger', 'Woods', 0, NULL, NULL, 1, NULL, NULL, NULL, 'Woods_Tiger', 1);
INSERT INTO `golfer` VALUES (95, 'Ian', 'Woosnam', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Woosnam_Ian', 0);
INSERT INTO `golfer` VALUES (96, 'Fuzzy', 'Zoeller', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Zoeller_Fuzzy', 0);
INSERT INTO `golfer` VALUES (98, 'Craig', 'Parry', 0, NULL, NULL, 2, NULL, NULL, NULL, 'parry_craig', 0);
INSERT INTO `golfer` VALUES (97, 'Graeme', 'McDowell', 0, NULL, NULL, 2, NULL, NULL, NULL, 'mcdowell_graeme', 1);
INSERT INTO `golfer` VALUES (99, 'Tom', 'Lehman', 0, NULL, NULL, 2, NULL, NULL, NULL, 'lehman_tom', 0);
INSERT INTO `golfer` VALUES (100, 'Joe', 'Ogilvie', 0, NULL, NULL, 2, NULL, NULL, NULL, 'ogilvie_joe', 1);
INSERT INTO `golfer` VALUES (123, 'Tommy', 'Armour III', 0, NULL, NULL, 2, NULL, NULL, NULL, 'armourIII_tommy', 1);
INSERT INTO `golfer` VALUES (120, 'Jerry', 'Smith', 0, NULL, NULL, 2, NULL, NULL, NULL, 'smith_jerry', 1);
INSERT INTO `golfer` VALUES (119, 'Pierre-Henri', '(a) Soero', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (116, 'Aaron', 'Barber', 0, NULL, NULL, 2, NULL, NULL, NULL, 'barber_aaron', 1);
INSERT INTO `golfer` VALUES (112, 'Jose-Filipe', 'Lima', 0, NULL, NULL, 2, NULL, NULL, NULL, 'filipelimajose', 1);
INSERT INTO `golfer` VALUES (110, 'Robert', 'Carlsson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (111, 'Nick', 'Dougherty', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (101, 'Steven', 'Conran', 0, 0, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (125, 'Olin', 'Browne', 0, NULL, NULL, 2, NULL, NULL, NULL, 'browne_olin', 1);
INSERT INTO `golfer` VALUES (113, 'Peter', 'Hedblom', 0, NULL, NULL, 2, NULL, NULL, NULL, 'hedblom_peter', 1);
INSERT INTO `golfer` VALUES (121, 'James', 'Benepe', 0, NULL, NULL, 2, NULL, NULL, NULL, 'benepe_james', 1);
INSERT INTO `golfer` VALUES (122, 'JP', 'Hayes', 0, NULL, NULL, 2, NULL, NULL, NULL, 'hayes_jp', 1);
INSERT INTO `golfer` VALUES (114, 'Derek', 'Brown', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (108, 'Soren', 'Kjeldsen', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (117, 'Scott', 'Parel', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (104, 'Wil', 'Collins', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (103, 'Keiichiro', 'Fukabori', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (105, 'Peter', 'Hanson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (106, 'Jonathan', 'Lomas', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (126, 'Craig', 'Barlow', 0, NULL, NULL, 2, NULL, NULL, NULL, 'barlow_craig', 1);
INSERT INTO `golfer` VALUES (115, 'Jason', 'Gore', 0, NULL, NULL, 2, NULL, NULL, NULL, 'gore_jason', 1);
INSERT INTO `golfer` VALUES (102, 'Yong', 'Eun Yang', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (118, 'Matthew', 'Kuchar', 0, NULL, NULL, 2, NULL, NULL, NULL, 'kuchar_matthew', 1);
INSERT INTO `golfer` VALUES (127, 'James', 'Driscoll', 0, NULL, NULL, 2, NULL, NULL, NULL, 'driscoll_james', 1);
INSERT INTO `golfer` VALUES (109, 'Michael', 'Campbell', 0, NULL, NULL, 2, NULL, NULL, NULL, 'campbell_michael', 1);
INSERT INTO `golfer` VALUES (107, 'Simon', 'Dyson', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (124, 'David', '(a) Denham', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (128, 'Clint', 'Jensen', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (129, 'Rocco', 'Mediate', 0, NULL, NULL, 2, NULL, NULL, NULL, 'mediate_rocco', 1);
INSERT INTO `golfer` VALUES (130, 'Rob', 'Rashell', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (131, 'Brandt', 'Snedeker', 0, NULL, NULL, 2, NULL, NULL, NULL, 'snedeker_brandt', 1);
INSERT INTO `golfer` VALUES (132, 'Omar', 'Uresti', 0, NULL, NULL, 2, NULL, NULL, NULL, 'uresti_omar', 1);
INSERT INTO `golfer` VALUES (133, 'DJ', 'Brigman', 0, NULL, NULL, 2, NULL, NULL, NULL, 'brigman_dj', 1);
INSERT INTO `golfer` VALUES (134, 'Steve', 'Elkington', 0, NULL, NULL, 2, NULL, NULL, NULL, 'elkington_steve', 1);
INSERT INTO `golfer` VALUES (135, 'Ryuji', 'Imada', 0, NULL, NULL, 2, NULL, NULL, NULL, 'imada_ryuji', 1);
INSERT INTO `golfer` VALUES (136, 'John', 'Mallinger', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (137, 'David', 'Oh', 0, NULL, NULL, 2, NULL, NULL, NULL, 'oh_david', 1);
INSERT INTO `golfer` VALUES (138, 'Lee', '(a) Williams', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (139, 'Michael', '(a) Putnam', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (140, 'Ian', 'Leggatt', 0, NULL, NULL, 2, NULL, NULL, NULL, 'leggatt_ian', 1);
INSERT INTO `golfer` VALUES (141, 'David', 'Hearn', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (142, 'Franklin', 'Langham', 0, NULL, NULL, 2, NULL, NULL, NULL, 'langham_franklin', 1);
INSERT INTO `golfer` VALUES (143, 'Matthew', '(a) Every', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (144, 'Paul', 'Claxton', 0, NULL, NULL, 2, NULL, NULL, NULL, 'claxton_paul', 1);
INSERT INTO `golfer` VALUES (145, 'Michael', 'Allen', 0, NULL, NULL, 2, NULL, NULL, NULL, 'allen_michael', 1);
INSERT INTO `golfer` VALUES (146, 'Chris', 'Nallen', 0, NULL, NULL, 2, NULL, NULL, NULL, 'nallen_chris', 1);
INSERT INTO `golfer` VALUES (147, 'JL', 'Lewis', 0, NULL, NULL, 2, NULL, NULL, NULL, 'lewis_jl', 1);
INSERT INTO `golfer` VALUES (148, 'Len', 'Mattiace', 0, NULL, NULL, 2, NULL, NULL, NULL, 'mattiace_len', 1);
INSERT INTO `golfer` VALUES (149, 'JJ', 'Henry', 0, NULL, NULL, 2, NULL, NULL, NULL, 'henry_jj', 1);
INSERT INTO `golfer` VALUES (150, 'Steve', 'Allan', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (151, 'Geoff', 'Ogilvy', 0, NULL, NULL, 2, NULL, NULL, NULL, 'ogilvy_geoff', 1);
INSERT INTO `golfer` VALUES (152, 'John', 'Rollins', 0, NULL, NULL, 2, NULL, NULL, NULL, 'rollins_john', 1);
INSERT INTO `golfer` VALUES (153, 'Scott', 'McCarron', 0, NULL, NULL, 2, NULL, NULL, NULL, 'mccarron_scott', 1);
INSERT INTO `golfer` VALUES (154, 'John', 'Cook', 0, NULL, NULL, 2, NULL, NULL, NULL, 'cook_john', 1);
INSERT INTO `golfer` VALUES (155, 'Aaron', 'Oberholser', 0, NULL, NULL, 2, NULL, NULL, NULL, 'oberholser_aaron', 1);
INSERT INTO `golfer` VALUES (156, 'Bill', 'Glasson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'glasson_bill', 1);
INSERT INTO `golfer` VALUES (157, 'Bob', 'Tway', 0, NULL, NULL, 2, NULL, NULL, NULL, 'tway_bob', 1);
INSERT INTO `golfer` VALUES (158, 'Carl', 'Pettersson', 0, NULL, NULL, 2, NULL, NULL, NULL, 'pettersson_carl', 1);
INSERT INTO `golfer` VALUES (159, 'Euan', 'Walters', 0, NULL, NULL, 2, NULL, NULL, NULL, 'walters_euan', 1);
INSERT INTO `golfer` VALUES (160, 'Joe', 'Ogilvie', 0, NULL, NULL, 2, NULL, NULL, NULL, 'ogilvie_joe', 1);
INSERT INTO `golfer` VALUES (161, 'John', 'Merrick', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (162, 'Robert', 'Gamez', 0, NULL, NULL, 2, NULL, NULL, NULL, 'gamez_robert', 1);
INSERT INTO `golfer` VALUES (164, 'Bob', 'Estes', 0, NULL, NULL, 2, NULL, NULL, NULL, 'estes_bob', 1);
INSERT INTO `golfer` VALUES (165, 'Brandt', 'Jobe', 0, NULL, NULL, 2, NULL, NULL, NULL, 'jobe_brandt', 1);
INSERT INTO `golfer` VALUES (166, 'Eric', 'Axley', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (167, 'Frank', 'Lickliter II', 0, NULL, NULL, 2, NULL, NULL, NULL, 'lickliterII_frank', 1);
INSERT INTO `golfer` VALUES (168, 'Sal', 'Spallone', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (169, 'Steve', 'Lowery', 0, NULL, NULL, 2, NULL, NULL, NULL, 'lowery_steve', 1);
INSERT INTO `golfer` VALUES (170, 'Patrick', 'Damron', 0, NULL, NULL, 2, NULL, NULL, NULL, 'damron_patrick', 1);
INSERT INTO `golfer` VALUES (171, 'Trip', '(a) Kuehne', 0, NULL, NULL, 2, NULL, NULL, NULL, 'kuehne_trip', 1);
INSERT INTO `golfer` VALUES (172, 'Kyle', 'Willman', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (173, 'Troy', 'Kelly', 0, NULL, NULL, -2, NULL, NULL, NULL, 'qualifier', 1);
INSERT INTO `golfer` VALUES (174, 'Corey', 'Pavin', 0, NULL, NULL, 2, NULL, NULL, NULL, 'pavin_corey', 1);
INSERT INTO `golfer` VALUES (175, 'Lee', 'Janzen', 0, NULL, NULL, 2, NULL, NULL, NULL, 'janzen_lee', 1);
INSERT INTO `golfer` VALUES (176, 'Steve', 'Jones', 0, NULL, NULL, 2, NULL, NULL, NULL, 'jones_steve', 1);
INSERT INTO `golfer` VALUES (177, 'Peter', 'Jacobsen', 0, NULL, NULL, 2, NULL, NULL, NULL, 'jacobsen_peter', 1);
INSERT INTO `golfer` VALUES (178, 'Spencer', 'Levin', 0, NULL, NULL, 2, NULL, NULL, NULL, 'levin_spencer', 1);
INSERT INTO `golfer` VALUES (179, 'Stephen', 'Gallacher', 0, NULL, NULL, 2, NULL, NULL, NULL, 'gallacher_stephen', 1);
INSERT INTO `golfer` VALUES (180, 'Paul', 'McGinley', 0, NULL, NULL, 2, NULL, NULL, NULL, 'mcginley_paul', 1);
INSERT INTO `golfer` VALUES (181, 'Toru', 'Taniguchi ', 0, NULL, NULL, 2, NULL, NULL, NULL, 'taniguchi_toru', 1);
INSERT INTO `golfer` VALUES (182, 'Colin', 'Montgomerie', 0, NULL, NULL, 2, NULL, NULL, NULL, 'montgomerie_colin', 1);
INSERT INTO `golfer` VALUES (183, 'Conrad', 'Ray', 0, NULL, NULL, 2, NULL, NULL, NULL, 'qualifier', 1);

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
) TYPE=MyISAM AUTO_INCREMENT=20 ;

-- 
-- Dumping data for table `messageboard`
-- 

INSERT INTO `messageboard` VALUES (6, 1, 'This is a great article about the history of the USGA setups on the course... I remember that round in 1998 when Kirk Triplett stuck his putter out on the last hole to stop the ball from coming back at him.  I''m anxious to see how they set the course up this year, and what holes become ''interesting''.  http://sport.scotsman.com/golf.cfm?id=645432005', 1, '2005-06-14 01:44:16');
INSERT INTO `messageboard` VALUES (5, 1, 'Welcome to the 2005 edition of the EyeOnMajors.com US Open!  Hope you all enjoy.   --use this message board to banter and enjoy yourselves', 1, '2005-06-14 00:25:09');
INSERT INTO `messageboard` VALUES (7, 23, 'what will el tigre''s margin of victory be???', 1, '2005-06-14 12:21:05');
INSERT INTO `messageboard` VALUES (8, 1, 'I would agree... I think Tiger is out for redemption this year, amid the naysayers!  I say he wins by 2, over Phil!', 1, '2005-06-14 14:20:33');
INSERT INTO `messageboard` VALUES (9, 1, '...in horse racing terms, and I could be wrong (as I often am about the ponies!)... I think DiMarco might unfortunately ''bounce'' coming off two T-1sts in majors.  I speculate one has to go LONG off the tee at Pinehurst this week!', 1, '2005-06-14 19:10:35');
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
) TYPE=MyISAM AUTO_INCREMENT=68 ;

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
) TYPE=MyISAM AUTO_INCREMENT=263 ;

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
INSERT INTO `poolperson` VALUES (56, 'basic', 'Adamonis', 'Dave', 'radamonis@cox.net', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 21:41:45', 1);
INSERT INTO `poolperson` VALUES (57, 'basic', 'Adamonis', 'Trifecta', 'radamonis2@cox.net', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 21:43:23', 1);
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
INSERT INTO `poolperson` VALUES (120, 'basic', 'Weston', 'Mark', 'mshaprow@cfl.rr.com', 1, NULL, '', 'bondo', NULL, NULL, NULL, NULL, NULL, '2005-06-13 06:08:13', 20);
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
  PRIMARY KEY  (`SelectedTeamID`)
) TYPE=MyISAM AUTO_INCREMENT=256 ;

-- 
-- Dumping data for table `selectedteams`
-- 

INSERT INTO `selectedteams` VALUES (1, 1, 1, 94, 35, 53, 75, 86, 73, 'team1', 'this is a sample team headline', NULL, 10, 1, -3);
INSERT INTO `selectedteams` VALUES (2, 1, 2, 0, 0, 0, 0, 0, 0, 'team2', NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (23, 1, 23, 15, 27, 53, 94, 72, 23, NULL, NULL, NULL, 9, 1, -5);
INSERT INTO `selectedteams` VALUES (24, 1, 24, 65, 58, 53, 33, 24, 19, NULL, NULL, NULL, 2, 1, -10);
INSERT INTO `selectedteams` VALUES (25, 1, 25, 27, 24, 37, 53, 72, 91, NULL, NULL, NULL, 6, 1, 0);
INSERT INTO `selectedteams` VALUES (26, 1, 26, 24, 23, 35, 79, 44, 75, NULL, NULL, NULL, 0, 1, 278);
INSERT INTO `selectedteams` VALUES (27, 1, 27, 23, 81, 72, 53, 27, 67, NULL, NULL, NULL, 4, 1, -9);
INSERT INTO `selectedteams` VALUES (28, 1, 28, 24, 16, 88, 4, 45, 2, NULL, NULL, NULL, 0, 1, 266);
INSERT INTO `selectedteams` VALUES (29, 1, 29, 24, 34, 38, 83, 53, 75, NULL, NULL, NULL, 2, 1, -6);
INSERT INTO `selectedteams` VALUES (30, 1, 30, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (31, 1, 31, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (32, 1, 32, 73, 44, 48, 34, 50, 38, NULL, NULL, NULL, 3, 1, -6);
INSERT INTO `selectedteams` VALUES (33, 1, 33, 53, 75, 24, 79, 27, 12, NULL, NULL, NULL, 4, 1, 0);
INSERT INTO `selectedteams` VALUES (34, 1, 34, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (35, 1, 35, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (36, 1, 36, 23, 34, 48, 16, 29, 35, NULL, NULL, NULL, 0, 1, -6);
INSERT INTO `selectedteams` VALUES (37, 1, 37, 16, 23, 24, 34, 48, 94, NULL, NULL, NULL, 5, 1, -2);
INSERT INTO `selectedteams` VALUES (38, 1, 38, 27, 94, 53, 23, 35, 73, NULL, NULL, NULL, 12, 1, 0);
INSERT INTO `selectedteams` VALUES (39, 1, 39, 16, 34, 48, 53, 35, 75, NULL, NULL, NULL, 2, 1, -5);
INSERT INTO `selectedteams` VALUES (40, 1, 40, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (41, 1, 41, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (42, 1, 42, 24, 23, 34, 35, 51, 72, NULL, NULL, NULL, 0, 1, -6);
INSERT INTO `selectedteams` VALUES (43, 1, 43, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (44, 1, 44, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (45, 1, 45, 27, 94, 75, 53, 73, 23, NULL, NULL, NULL, 12, 1, -8);
INSERT INTO `selectedteams` VALUES (46, 1, 46, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (47, 1, 47, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (48, 1, 48, 12, 16, 24, 34, 79, 94, NULL, NULL, NULL, 5, 1, -5);
INSERT INTO `selectedteams` VALUES (49, 1, 49, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (50, 1, 50, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (51, 1, 51, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (52, 1, 52, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (53, 1, 53, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (54, 1, 54, 12, 23, 58, 53, 90, 39, NULL, NULL, NULL, 2, 1, -2);
INSERT INTO `selectedteams` VALUES (55, 1, 55, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (56, 1, 56, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (57, 1, 57, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (58, 1, 58, 35, 53, 37, 4, 90, 23, NULL, NULL, NULL, 4, 1, -7);
INSERT INTO `selectedteams` VALUES (59, 1, 59, 53, 73, 27, 94, 23, 48, NULL, NULL, NULL, 12, 1, -2);
INSERT INTO `selectedteams` VALUES (60, 1, 60, 4, 24, 53, 27, 34, 79, NULL, NULL, NULL, 4, 1, -3);
INSERT INTO `selectedteams` VALUES (61, 1, 61, 3, 15, 24, 48, 72, 75, NULL, NULL, NULL, 0, 1, -4);
INSERT INTO `selectedteams` VALUES (62, 1, 62, 27, 24, 37, 53, 75, 82, NULL, NULL, NULL, 6, 1, 274);
INSERT INTO `selectedteams` VALUES (63, 1, 63, 27, 34, 37, 82, 71, 35, NULL, NULL, NULL, 4, 1, -11);
INSERT INTO `selectedteams` VALUES (64, 1, 64, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (65, 1, 65, 94, 35, 24, 44, 90, 53, NULL, NULL, NULL, 7, 1, -7);
INSERT INTO `selectedteams` VALUES (81, 1, 88, 88, 37, 35, 27, 79, 53, NULL, NULL, NULL, 6, 1, -8);
INSERT INTO `selectedteams` VALUES (67, 1, 74, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (83, 1, 90, 8, 35, 67, 86, 15, 37, NULL, NULL, NULL, 2, 1, -7);
INSERT INTO `selectedteams` VALUES (82, 19, 89, 94, 27, 37, 24, 23, 90, NULL, NULL, NULL, 9, 1, 0);
INSERT INTO `selectedteams` VALUES (84, 1, 91, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (85, 1, 92, 22, 27, 35, 48, 53, 73, NULL, NULL, NULL, 7, 1, -18);
INSERT INTO `selectedteams` VALUES (86, 1, 93, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (87, 1, 94, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (88, 1, 95, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (89, 1, 96, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (90, 1, 97, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (91, 1, 98, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (92, 1, 99, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (93, 1, 100, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (94, 20, 101, 94, 44, 11, 75, 38, 24, NULL, NULL, NULL, 5, 1, -3);
INSERT INTO `selectedteams` VALUES (95, 1, 102, 4, 24, 27, 35, 53, 94, NULL, NULL, NULL, 9, 1, -11);
INSERT INTO `selectedteams` VALUES (96, 20, 103, 94, 44, 72, 35, 90, 75, NULL, NULL, NULL, 5, 1, -5);
INSERT INTO `selectedteams` VALUES (97, 1, 104, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (98, 21, 105, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (99, 1, 106, 94, 35, 44, 73, 53, 72, NULL, NULL, NULL, 10, 1, -7);
INSERT INTO `selectedteams` VALUES (100, 0, 107, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (101, 20, 108, 94, 23, 34, 16, 33, 90, NULL, NULL, NULL, 5, 1, -5);
INSERT INTO `selectedteams` VALUES (102, 1, 109, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (103, 20, 110, 94, 50, 34, 2, 79, 3, NULL, NULL, NULL, 5, 1, -5);
INSERT INTO `selectedteams` VALUES (104, 0, 111, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (105, 0, 112, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (106, 0, 113, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (107, 22, 114, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (108, 20, 115, 37, 34, 23, 88, 24, 44, NULL, NULL, NULL, 2, 1, -2);
INSERT INTO `selectedteams` VALUES (109, 23, 116, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (110, 24, 117, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (111, 0, 118, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (112, 20, 119, 53, 75, 35, 79, 50, 34, NULL, NULL, NULL, 2, 1, -3);
INSERT INTO `selectedteams` VALUES (113, 20, 120, 94, 75, 44, 48, 35, 34, NULL, NULL, NULL, 5, 1, -5);
INSERT INTO `selectedteams` VALUES (114, 25, 121, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (115, 20, 122, 53, 79, 24, 90, 75, 44, NULL, NULL, NULL, 2, 1, -10);
INSERT INTO `selectedteams` VALUES (116, 26, 123, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (117, 20, 124, 94, 34, 35, 48, 75, 79, NULL, NULL, NULL, 5, 1, -9);
INSERT INTO `selectedteams` VALUES (118, 27, 125, 7, 23, 2, 94, 27, 37, NULL, NULL, NULL, 9, 1, -8);
INSERT INTO `selectedteams` VALUES (119, 28, 126, 2, 124, 143, 116, 133, 139, NULL, NULL, NULL, 0, 1, 4);
INSERT INTO `selectedteams` VALUES (120, 20, 127, 53, 72, 75, 65, 175, 23, NULL, NULL, NULL, 2, 1, -5);
INSERT INTO `selectedteams` VALUES (121, 29, 128, 16, 23, 24, 27, 53, 88, NULL, NULL, NULL, 4, 1, -6);
INSERT INTO `selectedteams` VALUES (122, 1, 129, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (123, 20, 130, 75, 44, 35, 53, 23, 72, NULL, NULL, NULL, 2, 1, -3);
INSERT INTO `selectedteams` VALUES (124, 30, 131, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (125, 0, 132, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (126, 20, 133, 35, 34, 94, 24, 16, 23, NULL, NULL, NULL, 5, 1, -10);
INSERT INTO `selectedteams` VALUES (127, 20, 134, 53, 72, 65, 33, 67, 75, NULL, NULL, NULL, 2, 1, -11);
INSERT INTO `selectedteams` VALUES (128, 29, 135, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (129, 29, 136, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (130, 31, 137, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (131, 32, 138, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (132, 29, 139, 53, 75, 48, 72, 34, 16, NULL, NULL, NULL, 2, 1, -3);
INSERT INTO `selectedteams` VALUES (133, 33, 140, 35, 75, 19, 38, 97, 65, NULL, NULL, NULL, 0, 1, -3);
INSERT INTO `selectedteams` VALUES (134, 33, 141, 34, 23, 72, 58, 35, 75, NULL, NULL, NULL, 0, 1, -3);
INSERT INTO `selectedteams` VALUES (135, 29, 142, 34, 72, 53, 29, 90, 94, NULL, NULL, NULL, 7, 1, -3);
INSERT INTO `selectedteams` VALUES (136, 34, 143, 94, 23, 53, 35, 24, 88, NULL, NULL, NULL, 7, 1, -1);
INSERT INTO `selectedteams` VALUES (137, 34, 144, 94, 53, 73, 23, 37, 33, NULL, NULL, NULL, 12, 1, -6);
INSERT INTO `selectedteams` VALUES (138, 33, 145, 23, 27, 53, 59, 75, 93, NULL, NULL, NULL, 4, 1, 0);
INSERT INTO `selectedteams` VALUES (139, 33, 146, 19, 25, 27, 94, 73, 35, NULL, NULL, NULL, 10, 1, -8);
INSERT INTO `selectedteams` VALUES (140, 1, 147, 19, 27, 73, 94, 75, 53, NULL, NULL, NULL, 12, 1, -5);
INSERT INTO `selectedteams` VALUES (141, 35, 148, 94, 23, 35, 75, 19, 65, NULL, NULL, NULL, 5, 1, -7);
INSERT INTO `selectedteams` VALUES (142, 36, 149, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (143, 37, 150, 35, 53, 48, 27, 72, 79, NULL, NULL, NULL, 4, 1, -9);
INSERT INTO `selectedteams` VALUES (144, 1, 151, 27, 33, 48, 53, 68, 90, NULL, NULL, NULL, 4, 1, -6);
INSERT INTO `selectedteams` VALUES (145, 0, 152, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (146, 38, 153, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (147, 39, 154, 24, 53, 75, 27, 48, 34, NULL, NULL, NULL, 4, 1, -9);
INSERT INTO `selectedteams` VALUES (148, 0, 155, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (149, 33, 156, 53, 24, 51, 94, 75, 23, NULL, NULL, NULL, 7, 1, -4);
INSERT INTO `selectedteams` VALUES (150, 39, 157, 12, 27, 51, 73, 48, 82, NULL, NULL, NULL, 5, 1, -6);
INSERT INTO `selectedteams` VALUES (151, 40, 158, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (152, 40, 159, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (153, 40, 160, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (154, 40, 161, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (155, 40, 162, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (156, 1, 163, 134, 27, 34, 35, 48, 53, NULL, NULL, NULL, 4, 1, -2);
INSERT INTO `selectedteams` VALUES (157, 29, 164, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (158, 29, 165, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (159, 41, 166, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (160, 42, 167, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (161, 29, 168, 27, 53, 23, 75, 24, 34, NULL, NULL, NULL, 9, 1, -4);
INSERT INTO `selectedteams` VALUES (162, 29, 169, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (163, 43, 170, 171, 145, 3, 8, 126, 11, NULL, NULL, NULL, 0, 1, -5);
INSERT INTO `selectedteams` VALUES (164, 44, 171, 94, 27, 75, 73, 34, 35, NULL, NULL, NULL, 10, 1, -4);
INSERT INTO `selectedteams` VALUES (165, 33, 172, 23, 37, 48, 72, 75, 33, NULL, NULL, NULL, 2, 1, -11);
INSERT INTO `selectedteams` VALUES (166, 34, 173, 94, 73, 27, 37, 35, 53, NULL, NULL, NULL, 14, 1, 0);
INSERT INTO `selectedteams` VALUES (167, 45, 174, 94, 53, 27, 73, 39, 23, NULL, NULL, NULL, 12, 1, 0);
INSERT INTO `selectedteams` VALUES (168, 45, 175, 35, 94, 73, 53, 23, 72, NULL, NULL, NULL, 10, 1, 0);
INSERT INTO `selectedteams` VALUES (169, 39, 176, 4, 19, 33, 65, 75, 72, NULL, NULL, NULL, 0, 1, -8);
INSERT INTO `selectedteams` VALUES (170, 39, 177, 88, 122, 53, 35, 34, 79, NULL, NULL, NULL, 2, 1, -12);
INSERT INTO `selectedteams` VALUES (171, 45, 178, 94, 73, 72, 23, 90, 44, NULL, NULL, NULL, 8, 1, -6);
INSERT INTO `selectedteams` VALUES (172, 0, 179, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (173, 1, 180, 72, 23, 24, 75, 79, 53, NULL, NULL, NULL, 2, 1, -5);
INSERT INTO `selectedteams` VALUES (174, 46, 181, 23, 27, 37, 94, 53, 73, NULL, NULL, NULL, 14, 1, -12);
INSERT INTO `selectedteams` VALUES (175, 46, 182, 16, 24, 23, 34, 53, 37, NULL, NULL, NULL, 4, 1, -14);
INSERT INTO `selectedteams` VALUES (176, 45, 183, 23, 94, 37, 53, 73, 44, NULL, NULL, NULL, 12, 1, 0);
INSERT INTO `selectedteams` VALUES (177, 1, 184, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (178, 33, 185, 34, 75, 23, 16, 27, 35, NULL, NULL, NULL, 2, 1, -5);
INSERT INTO `selectedteams` VALUES (179, 45, 186, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (180, 29, 187, 35, 27, 24, 34, 53, 86, NULL, NULL, NULL, 4, 1, -2);
INSERT INTO `selectedteams` VALUES (181, 47, 188, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (182, 0, 189, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (183, 34, 190, 94, 34, 79, 53, 37, 73, NULL, NULL, NULL, 12, 1, -6);
INSERT INTO `selectedteams` VALUES (184, 29, 191, 35, 79, 86, 53, 75, 94, NULL, NULL, NULL, 7, 1, -5);
INSERT INTO `selectedteams` VALUES (185, 65, 192, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (186, 29, 193, 23, 34, 53, 75, 72, 90, NULL, NULL, NULL, 2, 1, -3);
INSERT INTO `selectedteams` VALUES (187, 0, 194, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (188, 45, 195, 34, 94, 73, 53, 23, 72, NULL, NULL, NULL, 10, 1, 0);
INSERT INTO `selectedteams` VALUES (189, 34, 196, 35, 53, 94, 37, 73, 34, NULL, NULL, NULL, 12, 1, -4);
INSERT INTO `selectedteams` VALUES (190, 45, 197, 44, 34, 73, 53, 94, 23, NULL, NULL, NULL, 10, 1, -5);
INSERT INTO `selectedteams` VALUES (191, 45, 198, 15, 23, 19, 88, 53, 43, NULL, NULL, NULL, 2, 1, 4);
INSERT INTO `selectedteams` VALUES (192, 45, 199, 94, 53, 27, 73, 37, 34, NULL, NULL, NULL, 14, 1, 0);
INSERT INTO `selectedteams` VALUES (193, 48, 200, 23, 24, 53, 94, 27, 73, NULL, NULL, NULL, 12, 1, -3);
INSERT INTO `selectedteams` VALUES (194, 20, 201, 53, 34, 23, 72, 48, 35, NULL, NULL, NULL, 2, 1, -3);
INSERT INTO `selectedteams` VALUES (195, 20, 202, 53, 75, 24, 23, 88, 35, NULL, NULL, NULL, 2, 1, -3);
INSERT INTO `selectedteams` VALUES (196, 20, 203, 75, 37, 12, 38, 65, 16, NULL, NULL, NULL, 2, 1, -6);
INSERT INTO `selectedteams` VALUES (197, 39, 204, 65, 75, 24, 94, 34, 73, NULL, NULL, NULL, 8, 1, -11);
INSERT INTO `selectedteams` VALUES (198, 20, 205, 94, 86, 75, 34, 91, 72, NULL, NULL, NULL, 5, 1, -3);
INSERT INTO `selectedteams` VALUES (199, 20, 206, 53, 90, 35, 23, 16, 67, NULL, NULL, NULL, 2, 1, -7);
INSERT INTO `selectedteams` VALUES (200, 20, 207, 53, 35, 24, 34, 16, 48, NULL, NULL, NULL, 2, 1, -3);
INSERT INTO `selectedteams` VALUES (201, 48, 208, 94, 27, 73, 35, 53, 75, NULL, NULL, NULL, 12, 1, -7);
INSERT INTO `selectedteams` VALUES (202, 46, 209, 94, 53, 35, 23, 34, 90, NULL, NULL, NULL, 7, 1, -11);
INSERT INTO `selectedteams` VALUES (203, 39, 210, 53, 37, 73, 35, 34, 79, NULL, NULL, NULL, 7, 1, -11);
INSERT INTO `selectedteams` VALUES (204, 49, 211, 23, 24, 34, 53, 72, 94, NULL, NULL, NULL, 7, 1, -5);
INSERT INTO `selectedteams` VALUES (205, 0, 212, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (206, 46, 213, 94, 75, 23, 35, 53, 34, NULL, NULL, NULL, 7, 1, -6);
INSERT INTO `selectedteams` VALUES (207, 50, 214, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (208, 20, 215, 94, 23, 72, 50, 34, 24, NULL, NULL, NULL, 5, 1, -3);
INSERT INTO `selectedteams` VALUES (209, 1, 216, 39, 24, 48, 34, 53, 79, NULL, NULL, NULL, 2, 1, -6);
INSERT INTO `selectedteams` VALUES (210, 51, 217, 53, 72, 65, 24, 75, 34, NULL, NULL, NULL, 2, 1, -9);
INSERT INTO `selectedteams` VALUES (211, 52, 218, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (212, 53, 219, 23, 27, 34, 94, 53, 72, NULL, NULL, NULL, 9, 1, 14);
INSERT INTO `selectedteams` VALUES (213, 54, 220, 3, 27, 82, 53, 48, 94, NULL, NULL, NULL, 9, 1, -3);
INSERT INTO `selectedteams` VALUES (214, 45, 221, 94, 73, 24, 53, 65, 34, NULL, NULL, NULL, 10, 1, -3);
INSERT INTO `selectedteams` VALUES (215, 51, 222, 53, 75, 34, 37, 16, 50, NULL, NULL, NULL, 4, 1, 6);
INSERT INTO `selectedteams` VALUES (216, 55, 223, 2, 23, 27, 48, 53, 72, NULL, NULL, NULL, 4, 1, -5);
INSERT INTO `selectedteams` VALUES (217, 39, 224, 73, 27, 35, 16, 23, 15, NULL, NULL, NULL, 5, 1, -14);
INSERT INTO `selectedteams` VALUES (218, 56, 225, 2, 4, 16, 34, 53, 94, NULL, NULL, NULL, 7, 1, -9);
INSERT INTO `selectedteams` VALUES (219, 29, 226, 27, 37, 53, 75, 79, 16, NULL, NULL, NULL, 6, 1, -5);
INSERT INTO `selectedteams` VALUES (220, 57, 227, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (221, 56, 228, 23, 27, 37, 86, 53, 94, NULL, NULL, NULL, 11, 1, -7);
INSERT INTO `selectedteams` VALUES (222, 29, 229, 35, 23, 53, 73, 48, 94, NULL, NULL, NULL, 10, 1, -8);
INSERT INTO `selectedteams` VALUES (223, 58, 230, 23, 27, 48, 37, 72, 94, NULL, NULL, NULL, 9, 1, 0);
INSERT INTO `selectedteams` VALUES (224, 58, 231, 34, 79, 73, 90, 75, 94, NULL, NULL, NULL, 8, 1, -3);
INSERT INTO `selectedteams` VALUES (225, 58, 232, 16, 94, 34, 53, 24, 27, NULL, NULL, NULL, 9, 1, -4);
INSERT INTO `selectedteams` VALUES (226, 59, 233, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (227, 39, 234, 79, 73, 37, 23, 27, 90, NULL, NULL, NULL, 7, 1, -2);
INSERT INTO `selectedteams` VALUES (228, 29, 235, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (229, 60, 236, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (230, 61, 237, 94, 16, 72, 73, 27, 48, NULL, NULL, NULL, 10, 1, 0);
INSERT INTO `selectedteams` VALUES (231, 39, 238, 94, 53, 23, 82, 38, 75, NULL, NULL, NULL, 7, 1, -9);
INSERT INTO `selectedteams` VALUES (232, 29, 239, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (233, 62, 240, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (234, 63, 241, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (235, 1, 242, 16, 24, 23, 34, 44, 75, NULL, NULL, NULL, 0, 1, 0);
INSERT INTO `selectedteams` VALUES (236, 64, 243, 27, 94, 37, 53, 15, 72, NULL, NULL, NULL, 11, 1, 1);
INSERT INTO `selectedteams` VALUES (237, 39, 244, 53, 24, 27, 35, 94, 23, NULL, NULL, NULL, 9, 1, -3);
INSERT INTO `selectedteams` VALUES (238, 64, 245, 94, 27, 37, 53, 75, 72, NULL, NULL, NULL, 11, 1, 0);
INSERT INTO `selectedteams` VALUES (239, 64, 246, 90, 94, 34, 65, 73, 53, NULL, NULL, NULL, 10, 1, 0);
INSERT INTO `selectedteams` VALUES (240, 64, 247, 94, 27, 53, 37, 73, 23, NULL, NULL, NULL, 14, 1, 0);
INSERT INTO `selectedteams` VALUES (241, 34, 248, 11, 27, 53, 37, 72, 94, NULL, NULL, NULL, 11, 1, -4);
INSERT INTO `selectedteams` VALUES (242, 64, 249, 37, 35, 94, 53, 27, 72, NULL, NULL, NULL, 11, 1, 0);
INSERT INTO `selectedteams` VALUES (243, 64, 250, 35, 94, 73, 90, 23, 27, NULL, NULL, NULL, 10, 1, 0);
INSERT INTO `selectedteams` VALUES (245, 29, 252, 23, 34, 48, 35, 75, 4, NULL, NULL, NULL, 0, 1, -6);
INSERT INTO `selectedteams` VALUES (244, 64, 251, 35, 44, 94, 73, 53, 27, NULL, NULL, NULL, 12, 1, -7);
INSERT INTO `selectedteams` VALUES (246, 66, 253, 94, 8, 12, 37, 27, 34, NULL, NULL, NULL, 9, 1, -6);
INSERT INTO `selectedteams` VALUES (247, 64, 254, 94, 72, 75, 79, 27, 24, NULL, NULL, NULL, 7, 1, -9);
INSERT INTO `selectedteams` VALUES (248, 1, 255, 24, 37, 53, 65, 72, 75, NULL, NULL, NULL, 4, 1, -1);
INSERT INTO `selectedteams` VALUES (249, 58, 256, 34, 65, 37, 53, 73, 72, NULL, NULL, NULL, 7, 1, -2);
INSERT INTO `selectedteams` VALUES (250, 1, 257, 24, 27, 35, 53, 72, 75, NULL, NULL, NULL, 4, 1, -2);
INSERT INTO `selectedteams` VALUES (251, 39, 258, 24, 44, 75, 53, 82, 23, NULL, NULL, NULL, 2, 1, -18);
INSERT INTO `selectedteams` VALUES (252, 0, 259, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1000, 0, 0);
INSERT INTO `selectedteams` VALUES (253, 39, 260, 94, 73, 53, 27, 75, 65, NULL, NULL, NULL, 1000, 1, -7);
INSERT INTO `selectedteams` VALUES (254, 67, 261, 94, 53, 73, 24, 79, 34, NULL, NULL, NULL, NULL, 1, -7);
INSERT INTO `selectedteams` VALUES (255, 29, 262, 72, 53, 73, 19, 37, 23, NULL, NULL, NULL, NULL, 1, 0);
