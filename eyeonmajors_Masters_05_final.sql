-- phpMyAdmin SQL Dump
-- version 2.6.0-pl3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jun 06, 2005 at 03:51 AM
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
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `currentcutline`
-- 

INSERT INTO `currentcutline` VALUES (1, -2, '2005 Masters', '2005-04-10 16:40:37', '2005-06-16 02:00:00');

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
INSERT INTO `eomhandicaps` VALUES (3, 1, 73, 2);
INSERT INTO `eomhandicaps` VALUES (4, 1, 53, 3);

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
  PRIMARY KEY  (`GolferID`)
) TYPE=MyISAM AUTO_INCREMENT=101 ;

-- 
-- Dumping data for table `golfer`
-- 

INSERT INTO `golfer` VALUES (1, 'Tommy', 'Aaron', 99, 999, NULL, 2, 999, 999, 999, 'Aaron_Tommy');
INSERT INTO `golfer` VALUES (2, 'Robert', 'Allenby', 99, 999, NULL, 2, NULL, NULL, NULL, 'Allenby_Robert');
INSERT INTO `golfer` VALUES (3, 'Stephen', 'Ames', 9, NULL, NULL, 2, NULL, NULL, NULL, 'Ames_Steven');
INSERT INTO `golfer` VALUES (4, 'Stuart', 'Appleby', 8, NULL, NULL, 2, NULL, NULL, NULL, 'Appleby_Stuart');
INSERT INTO `golfer` VALUES (5, 'George', 'Archer', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Archer_George');
INSERT INTO `golfer` VALUES (6, 'Severiano', 'Ballesteros', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Ballesteros_Severiano');
INSERT INTO `golfer` VALUES (7, 'Rich', 'Beem', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Beem_Rich');
INSERT INTO `golfer` VALUES (8, 'Thomas', 'Bjorn', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Bjorn_Thomas');
INSERT INTO `golfer` VALUES (9, 'Gay', 'Brewer Jr.', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Brewer_GayJr');
INSERT INTO `golfer` VALUES (10, 'Jack', 'Burke Jr.', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Burke_JackJr');
INSERT INTO `golfer` VALUES (11, 'Angel', 'Cabrera', 8, NULL, NULL, 2, NULL, NULL, NULL, 'Cabrera_Angel');
INSERT INTO `golfer` VALUES (12, 'Chad', 'Campbell', 1, NULL, NULL, 2, NULL, NULL, NULL, 'Campbell_Chad');
INSERT INTO `golfer` VALUES (13, 'Paul', 'Casey', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Casey_Paul');
INSERT INTO `golfer` VALUES (14, 'Billy', 'Casper', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Casper_Billy');
INSERT INTO `golfer` VALUES (15, 'K.J.', 'Choi', 6, NULL, NULL, 2, NULL, NULL, NULL, 'Choi_KJ');
INSERT INTO `golfer` VALUES (16, 'Stewart', 'Cink', 1, NULL, NULL, 2, NULL, NULL, NULL, 'Cink_Stewart');
INSERT INTO `golfer` VALUES (17, 'Darren', 'Clarke', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Clarke_Darren');
INSERT INTO `golfer` VALUES (18, 'Charles', 'Coody', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Coody_Charles');
INSERT INTO `golfer` VALUES (19, 'Fred', 'Couples', 7, NULL, NULL, 2, NULL, NULL, NULL, 'Couples_Fred');
INSERT INTO `golfer` VALUES (20, 'Ben', 'Crenshaw', 5, NULL, NULL, 2, NULL, NULL, NULL, 'Crenshaw_Ben');
INSERT INTO `golfer` VALUES (21, 'Ben', 'Curtis', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Curtis_Ben');
INSERT INTO `golfer` VALUES (22, 'John', 'Daly', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Daly_John');
INSERT INTO `golfer` VALUES (23, 'Chris', 'DiMarco', -12, NULL, NULL, 2, NULL, NULL, NULL, 'DiMarco_Chris');
INSERT INTO `golfer` VALUES (24, 'Luke', 'Donald', -5, NULL, NULL, 2, NULL, NULL, NULL, 'Donald_Luke');
INSERT INTO `golfer` VALUES (25, 'David', 'Duval', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Duval_David');
INSERT INTO `golfer` VALUES (26, 'Austin', 'Eaton III', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Eaton_AustinIII');
INSERT INTO `golfer` VALUES (27, 'Ernie', 'Els', 10, NULL, NULL, 2, NULL, NULL, NULL, 'Els_Ernie');
INSERT INTO `golfer` VALUES (28, 'Nick', 'Faldo', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Faldo_Nick');
INSERT INTO `golfer` VALUES (29, 'Steve', 'Flesch', 4, NULL, NULL, 2, NULL, NULL, NULL, 'Flesch_Steve');
INSERT INTO `golfer` VALUES (30, 'Raymond', 'Floyd', 5, NULL, NULL, 2, NULL, NULL, NULL, 'Floyd_Raymond');
INSERT INTO `golfer` VALUES (31, 'Doug', 'Ford', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Ford_Doug');
INSERT INTO `golfer` VALUES (32, 'Carlos', 'Franco', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Franco_Carlos');
INSERT INTO `golfer` VALUES (33, 'Fred', 'Funk', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Funk_Fred');
INSERT INTO `golfer` VALUES (34, 'Jim', 'Furyk', 3, NULL, NULL, 2, NULL, NULL, NULL, 'Furyk_Jim');
INSERT INTO `golfer` VALUES (35, 'Sergio', 'Garcia', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Garcia_Sergio');
INSERT INTO `golfer` VALUES (36, 'Bob', 'Goalby', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Goalby_Bob');
INSERT INTO `golfer` VALUES (37, 'Retief', 'Goosen', -5, NULL, NULL, 2, NULL, NULL, NULL, 'Goosen_Retief');
INSERT INTO `golfer` VALUES (38, 'Jay', 'Haas', 13, NULL, NULL, 2, NULL, NULL, NULL, 'Haas_Jay');
INSERT INTO `golfer` VALUES (39, 'Zach', 'Johnson', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Johnson_Zach');
INSERT INTO `golfer` VALUES (40, 'Shingo', 'Katayama', 6, NULL, NULL, 2, NULL, NULL, NULL, 'Katayama_Shingo');
INSERT INTO `golfer` VALUES (41, 'Jonathan', 'Kaye', 8, NULL, NULL, 2, NULL, NULL, NULL, 'Kaye_Jonathan');
INSERT INTO `golfer` VALUES (42, 'Jerry', 'Kelly', 1, NULL, NULL, 2, NULL, NULL, NULL, 'Kelly_Jerry');
INSERT INTO `golfer` VALUES (43, 'Bernhard', 'Langer', 1, NULL, NULL, 2, NULL, NULL, NULL, 'Langer_Bernhard');
INSERT INTO `golfer` VALUES (44, 'Justin', 'Leonard', -1, NULL, NULL, 2, NULL, NULL, NULL, 'Leonard_Justin');
INSERT INTO `golfer` VALUES (45, 'Thomas', 'Levet', -2, NULL, NULL, 2, NULL, NULL, NULL, 'Levet_Thomas');
INSERT INTO `golfer` VALUES (46, 'Luke', 'List', 6, NULL, NULL, 2, NULL, NULL, NULL, 'List_Luke');
INSERT INTO `golfer` VALUES (47, 'Peter', 'Lonard', 3, NULL, NULL, 2, NULL, NULL, NULL, 'Lonard_Peter');
INSERT INTO `golfer` VALUES (48, 'Davis', 'Love III', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Love_DavisIII');
INSERT INTO `golfer` VALUES (49, 'Sandy', 'Lyle', 5, NULL, NULL, 2, NULL, NULL, NULL, 'Lyle_Sandy');
INSERT INTO `golfer` VALUES (50, 'Jeff', 'Maggert', 1, NULL, NULL, 2, NULL, NULL, NULL, 'Maggert_Jeff');
INSERT INTO `golfer` VALUES (51, 'Shigeki', 'Maruyama', 6, NULL, NULL, 2, NULL, NULL, NULL, 'Maruyama_Shigeki');
INSERT INTO `golfer` VALUES (52, 'Shaun', 'Micheel', 5, NULL, NULL, 2, NULL, NULL, NULL, 'Micheel_Shaun');
INSERT INTO `golfer` VALUES (53, 'Phil', 'Mickelson', -3, NULL, NULL, 2, NULL, NULL, NULL, 'Mickelson_Phil');
INSERT INTO `golfer` VALUES (54, 'Larry', 'Mize', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Mize_Larry');
INSERT INTO `golfer` VALUES (55, 'Ryan', 'Moore', -1, NULL, NULL, 2, NULL, NULL, NULL, 'Moore_Ryan');
INSERT INTO `golfer` VALUES (56, 'Byron', 'Nelson', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Nelson_Byron');
INSERT INTO `golfer` VALUES (57, 'Jack', 'Nicklaus', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Nicklaus_Jack');
INSERT INTO `golfer` VALUES (58, 'Nick', 'O''Hearn', 9, NULL, NULL, 2, NULL, NULL, NULL, 'OHern_Nick');
INSERT INTO `golfer` VALUES (59, 'Jose Maria', 'Olazabal', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Olazabal_JoseMaria');
INSERT INTO `golfer` VALUES (60, 'Mark', 'O''Meara', 5, NULL, NULL, 2, NULL, NULL, NULL, 'OMeara_Mark');
INSERT INTO `golfer` VALUES (61, 'Arnold', 'Palmer', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Palmer_Arnold');
INSERT INTO `golfer` VALUES (62, 'Ryan', 'Palmer', 7, NULL, NULL, 2, NULL, NULL, NULL, 'Palmer_Ryan');
INSERT INTO `golfer` VALUES (63, 'Rod', 'Pampling', -4, NULL, NULL, 2, NULL, NULL, NULL, 'Pampling_Rod');
INSERT INTO `golfer` VALUES (64, 'Jesper', 'Parnevik', 6, NULL, NULL, 2, NULL, NULL, NULL, 'Parnevik_Jesper');
INSERT INTO `golfer` VALUES (65, 'Kenny', 'Perry', 4, NULL, NULL, 2, NULL, NULL, NULL, 'Perry_Kenny');
INSERT INTO `golfer` VALUES (66, 'Gary', 'Player', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Player_Gary');
INSERT INTO `golfer` VALUES (67, 'Ian', 'Poulter', 6, NULL, NULL, 2, NULL, NULL, NULL, 'Poulter_Ian');
INSERT INTO `golfer` VALUES (68, 'Nick', 'Price', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Price_Nick');
INSERT INTO `golfer` VALUES (69, 'Ted', 'Purdy', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Purdy_Ted');
INSERT INTO `golfer` VALUES (70, 'Chris', 'Riley', 16, NULL, NULL, 2, NULL, NULL, NULL, 'Riley_Chris');
INSERT INTO `golfer` VALUES (71, 'Rory', 'Sabbatini', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Sabbatini_Rory');
INSERT INTO `golfer` VALUES (72, 'Adam', 'Scott', 6, NULL, NULL, 2, NULL, NULL, NULL, 'Scott_Adam');
INSERT INTO `golfer` VALUES (73, 'Vijay', 'Singh', -4, NULL, NULL, 2, NULL, NULL, NULL, 'Singh_Vijay');
INSERT INTO `golfer` VALUES (74, 'Craig', 'Stadler', 18, NULL, NULL, 2, NULL, NULL, NULL, 'Stadler_Craig');
INSERT INTO `golfer` VALUES (75, 'David', 'Toms', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Toms_David');
INSERT INTO `golfer` VALUES (76, 'Kirk', 'Triplett', 0, NULL, NULL, 2, NULL, NULL, NULL, 'Triplett_Kirk');
INSERT INTO `golfer` VALUES (77, 'Joakim', 'Haeggman', 7, NULL, NULL, 2, NULL, NULL, NULL, 'Haeggman_Joakim');
INSERT INTO `golfer` VALUES (78, 'Todd', 'Hamilton', 7, NULL, NULL, 2, NULL, NULL, NULL, 'Hamilton_Todd');
INSERT INTO `golfer` VALUES (79, 'Padraig', 'Harrington', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Harrington_Padraig');
INSERT INTO `golfer` VALUES (80, 'Mark', 'Hensby', -4, NULL, NULL, 2, NULL, NULL, NULL, 'Hensby_Mark');
INSERT INTO `golfer` VALUES (81, 'Tim', 'Herron', -2, NULL, NULL, 2, NULL, NULL, NULL, 'Herron_Tim');
INSERT INTO `golfer` VALUES (82, 'Charles', 'Howell III', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Howell_CharlesIII');
INSERT INTO `golfer` VALUES (83, 'David', 'Howell', -2, NULL, NULL, 2, NULL, NULL, NULL, 'Howell_David');
INSERT INTO `golfer` VALUES (84, 'Trevor', 'Immelman', -4, NULL, NULL, 2, NULL, NULL, NULL, 'Immelman_Trevor');
INSERT INTO `golfer` VALUES (85, 'Fredrik', 'Jacobson', 5, NULL, NULL, 2, NULL, NULL, NULL, 'Jacobson_Fredrik');
INSERT INTO `golfer` VALUES (86, 'Miguel Angel', 'Jimenez', 5, NULL, NULL, 2, NULL, NULL, NULL, 'Jimenez_MiguelAngel');
INSERT INTO `golfer` VALUES (87, 'Bo', 'Van Pelt', 99, NULL, NULL, 2, NULL, NULL, NULL, 'VanPelt_Bo');
INSERT INTO `golfer` VALUES (88, 'Scott', 'Verplank', 1, NULL, NULL, 2, NULL, NULL, NULL, 'Verplank_Scott');
INSERT INTO `golfer` VALUES (89, 'Tom', 'Watson', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Watson_Tom');
INSERT INTO `golfer` VALUES (90, 'Mike', 'Weir', -4, NULL, NULL, 2, NULL, NULL, NULL, 'Weir_Mike');
INSERT INTO `golfer` VALUES (91, 'Lee', 'Westwood', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Westwood_Lee');
INSERT INTO `golfer` VALUES (92, 'Stuart', 'Wilson', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Wilson_Stuart');
INSERT INTO `golfer` VALUES (93, 'Casey', 'Wittenberg', 6, NULL, NULL, 2, NULL, NULL, NULL, 'Wittenberg_Casey');
INSERT INTO `golfer` VALUES (94, 'Tiger', 'Woods', -12, NULL, NULL, 1, NULL, NULL, NULL, 'Woods_Tiger');
INSERT INTO `golfer` VALUES (95, 'Ian', 'Woosnam', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Woosnam_Ian');
INSERT INTO `golfer` VALUES (96, 'Fuzzy', 'Zoeller', 99, NULL, NULL, 2, NULL, NULL, NULL, 'Zoeller_Fuzzy');
INSERT INTO `golfer` VALUES (98, 'Craig', 'Parry', 2, NULL, NULL, 2, NULL, NULL, NULL, 'parry_craig');
INSERT INTO `golfer` VALUES (97, 'Graeme', 'McDowell', 7, NULL, NULL, 2, NULL, NULL, NULL, 'mcdowell_graeme');
INSERT INTO `golfer` VALUES (99, 'Tom', 'Lehman', -1, NULL, NULL, 2, NULL, NULL, NULL, 'lehman_tom');
INSERT INTO `golfer` VALUES (100, 'Joe', 'Ogilvie', 2, NULL, NULL, 2, NULL, NULL, NULL, 'ogilvie_joe');

-- --------------------------------------------------------

-- 
-- Table structure for table `majorimages`
-- 

CREATE TABLE `majorimages` (
  `image_id` bigint(20) NOT NULL auto_increment,
  `image_name` tinytext NOT NULL,
  `image_caption` text,
  PRIMARY KEY  (`image_id`)
) TYPE=MyISAM AUTO_INCREMENT=50 ;

-- 
-- Dumping data for table `majorimages`
-- 

INSERT INTO `majorimages` VALUES (1, 'appleby_funk', 'Stuart Appleby and Fred Funk');
INSERT INTO `majorimages` VALUES (2, 'ButlerCabin800', 'Augusta''s Butler Cabin');
INSERT INTO `majorimages` VALUES (3, 'DarrenClarke', 'Darren Clarke on the putting green');
INSERT INTO `majorimages` VALUES (4, 'DarrenClarke2', 'Darren Clarke having a laugh');
INSERT INTO `majorimages` VALUES (5, 'David_Toms', 'David Toms');
INSERT INTO `majorimages` VALUES (6, 'dimarco_haas', 'Chris DiMarco and Jay Haas');
INSERT INTO `majorimages` VALUES (7, 'dimarco_hitting', 'Chris DiMarco teeing off');
INSERT INTO `majorimages` VALUES (8, 'dimarco_putting1', 'Chris DiMarco putting');
INSERT INTO `majorimages` VALUES (9, 'dimarco_putting2', 'Chris DiMarco practicing');
INSERT INTO `majorimages` VALUES (10, 'Fred_Couples', 'Fred Couples and caddie Joe LaCava');
INSERT INTO `majorimages` VALUES (11, 'fred_funk', 'Fred Funk');
INSERT INTO `majorimages` VALUES (12, 'fred_funk2JPG', 'Fred Funk');
INSERT INTO `majorimages` VALUES (13, 'gary_player_and_shaun_micheel', 'South African legend, Gary Player, chatting with Shaun Micheel');
INSERT INTO `majorimages` VALUES (14, 'Ian_Poulter1', 'Ian Poulter');
INSERT INTO `majorimages` VALUES (15, 'Ian_Poulter3', 'Ian Poulter tees off at Augusta');
INSERT INTO `majorimages` VALUES (16, 'Ian_Poulter4', 'Ian Poulter makes a fashion statement at the Par 3 contest');
INSERT INTO `majorimages` VALUES (17, 'Ian_Poulter5', 'Ian Poulter');
INSERT INTO `majorimages` VALUES (18, 'jay_haas', 'Jay Haas');
INSERT INTO `majorimages` VALUES (19, 'Jay_Haas2', 'Jay Haas');
INSERT INTO `majorimages` VALUES (20, 'kirk_triplett', 'Kirk Triplett');
INSERT INTO `majorimages` VALUES (21, 'lee_westwood', 'Lee Westwood');
INSERT INTO `majorimages` VALUES (22, 'lee_westwood2', 'Lee Westwood');
INSERT INTO `majorimages` VALUES (23, 'luke_donald', 'Luke Donald');
INSERT INTO `majorimages` VALUES (24, 'luke_donald2', 'Northwestern grad, Luke Donald');
INSERT INTO `majorimages` VALUES (25, 'nick_faldo_bad_back', 'Nick Faldo with a bad back');
INSERT INTO `majorimages` VALUES (26, 'Par3_Contest_Mickelson1', 'Phil Mickelson and Tom Lehman at the Par 3 Contest');
INSERT INTO `majorimages` VALUES (27, 'Par3_Contest_Mickelson2', 'Phil Mickelson with daughter as caddy at Par 3 Contest');
INSERT INTO `majorimages` VALUES (28, 'Par3_Contest_Mickelson3', 'Phil Mickelson and daughter watch Chris DiMarco tee off in the Par 3 contest');
INSERT INTO `majorimages` VALUES (29, 'Phil_with_Pelz', 'Dave Pelz wishes Phil "good luck" at the 2005 Masters');
INSERT INTO `majorimages` VALUES (30, 'Phil_with_Pelz_and_RSmith_bones', 'Phil practicing the 3 foot putting clock with teachers Dave Pelz, Rick Smith, and caddy "Bones"');
INSERT INTO `majorimages` VALUES (31, 'rayfloyd', 'Former Masters Champion, Raymond Floyd');
INSERT INTO `majorimages` VALUES (32, 'Scott_and_Couples1', 'Former Masters Champion Fred Couples with Adam Scott');
INSERT INTO `majorimages` VALUES (33, 'Scott_and_Couples2', 'Fred Couples and Adam Scott');
INSERT INTO `majorimages` VALUES (34, 'Scott_Freddie_VanPelt', 'Bo Van Pelt and Adam Scott get some course advice from former Masters Champion, Fred Couples');
INSERT INTO `majorimages` VALUES (35, 'scott_verplank', 'Scott Verplank');
INSERT INTO `majorimages` VALUES (36, 'sergio_chillin', 'Sergio Garcia just ''chillin''');
INSERT INTO `majorimages` VALUES (37, 'sergo_garcia', 'Sergio Garcia tees off');
INSERT INTO `majorimages` VALUES (38, 'shingo_katayama', 'Nice hat, Shingo Katayama ');
INSERT INTO `majorimages` VALUES (39, 'singh_gives_lesson_to_shigeki', 'Former Masters Champion Vijay Singh gives a lesson to Shigeki Maruyama');
INSERT INTO `majorimages` VALUES (40, 'stuart_appleby', 'Stuart Appleby');
INSERT INTO `majorimages` VALUES (41, 'stuart_appleby2', 'Stuart Appleby');
INSERT INTO `majorimages` VALUES (42, 'Tiger_Woods1', '3 time Masters Champion, Tiger Woods');
INSERT INTO `majorimages` VALUES (43, 'Tiger_Woods2', 'Tiger Woods');
INSERT INTO `majorimages` VALUES (44, 'Tiger_Woods_and_Frank', 'Tiger and Frank share quality time');
INSERT INTO `majorimages` VALUES (45, 'Tiger_Woods_and_Frank2', 'Tiger Woods prior to 2005 Masters');
INSERT INTO `majorimages` VALUES (46, 'todd_hamilton', 'Todd Hamilton');
INSERT INTO `majorimages` VALUES (47, 'vijay_singh_and_shigeki_maruyama', 'Vijay Singh and Shigeki Maruyama');
INSERT INTO `majorimages` VALUES (48, 'Weir_chipping', 'Mike Weir chipping');
INSERT INTO `majorimages` VALUES (49, 'WeirandCaddy', 'Former Masters Champion, Mike Weir');

-- --------------------------------------------------------

-- 
-- Table structure for table `messageboard`
-- 

CREATE TABLE `messageboard` (
  `messageID` bigint(20) NOT NULL default '0',
  `posterID` bigint(20) default NULL,
  `message` mediumtext,
  PRIMARY KEY  (`messageID`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `messageboard`
-- 


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
) TYPE=MyISAM AUTO_INCREMENT=19 ;

-- 
-- Dumping data for table `poolgroup`
-- 

INSERT INTO `poolgroup` VALUES (1, 'magical', 'testing', 2, 94, 27, 73, 53, NULL, NULL, NULL, NULL, NULL, NULL, 5, 2, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (2, 'travellingjohnson', 'johnson', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (3, 'shoelessjoe', 'jackson', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (4, 'joeblow', 'joeblow', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (5, 'newgroup', 'newgroup', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (6, 'testnewgroup', 'testnewgroup', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (7, 'sethsgroup', 'godin', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (8, 'sethgodin', 'godin', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (9, 'jimmyv', 'jimmvy', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (10, 'vitale', 'vitale', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (11, 'redfez', 'redfrez', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (12, 'purplecow', 'purplecow', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (13, 'coldfusion', 'coldfusion', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (14, 'flashmx', 'flashmx', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (15, 'cfmx', 'cfmx', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (16, 'bluebottle', 'blueblottle', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (17, 'chicagocubs', 'baker', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `poolgroup` VALUES (18, 'Yankees', 'Yankees', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
) TYPE=MyISAM AUTO_INCREMENT=88 ;

-- 
-- Dumping data for table `poolperson`
-- 

INSERT INTO `poolperson` VALUES (30, 'basic', 'Murphy', 'Brian', 'brian_murph@yahoo.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:04:02', 1);
INSERT INTO `poolperson` VALUES (1, 'admin', 'Holton', 'Mark', 'holtonma@gmail.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 17:53:58', 1);
INSERT INTO `poolperson` VALUES (23, 'basic', 'Eye', 'Jerry', 'mreye1@ameritech.net', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 18:19:00', 1);
INSERT INTO `poolperson` VALUES (24, 'basic', 'McDon', 'Brain', 'DMcdon6452@aol.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 19:02:17', 1);
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
INSERT INTO `poolperson` VALUES (48, 'basic', 'Goering', 'Stevie', 'stephengoering@yahoo.com', 1, NULL, '', 'major', NULL, NULL, NULL, NULL, NULL, '2005-04-06 20:52:41', 1);
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
INSERT INTO `poolperson` VALUES (66, 'basic', 'testingonweb', 'mark', 'testingonweb@webtest.com', 1, NULL, '', 'scramjet', NULL, NULL, NULL, NULL, NULL, '2005-06-02 06:25:11', 1);
INSERT INTO `poolperson` VALUES (67, 'basic', 'Jackson', 'Joe', 'shoelessjoe@blah.com', 1, NULL, '', 'field', NULL, NULL, NULL, NULL, NULL, '2005-06-02 19:35:20', 1);
INSERT INTO `poolperson` VALUES (68, 'basic', 'Johnson', 'Mark', 'asdfasdf', 1, NULL, '', 'asdfasdfasdfasd', NULL, NULL, NULL, NULL, NULL, '2005-06-02 19:42:37', 1);
INSERT INTO `poolperson` VALUES (69, 'basic', 'user', 'new', 'newuser@newuser.com', 1, NULL, '', 'new', NULL, NULL, NULL, NULL, NULL, '2005-06-02 21:37:06', 1);
INSERT INTO `poolperson` VALUES (70, 'basic', 'joeyblow', 'joeblow', 'joeblow@jobo.com', 1, NULL, '', 'scramjet', NULL, NULL, NULL, NULL, NULL, '2005-06-02 21:44:59', 1);
INSERT INTO `poolperson` VALUES (74, 'basic', 'Wallace', 'Courtney', 'courtneywallace@hotmail.com', 1, NULL, '', 'ashokan', NULL, NULL, NULL, NULL, NULL, '2005-06-04 22:29:48', 1);
INSERT INTO `poolperson` VALUES (73, 'basic', 'Strange', 'Curtis', 'curtis@usopen.com', 1, NULL, '', 'usoopen', NULL, NULL, NULL, NULL, NULL, '2005-06-04 19:07:14', 1);
INSERT INTO `poolperson` VALUES (75, 'basic', 'newname', 'newname', 'newname@newname.com', 1, NULL, '', 'newname', NULL, NULL, NULL, NULL, NULL, '2005-06-05 19:42:18', 1);
INSERT INTO `poolperson` VALUES (76, 'basic', 'newgroup', 'newgroup', 'newgroup@newgroup.com', 1, NULL, '', 'newgroup', NULL, NULL, NULL, NULL, NULL, '2005-06-05 19:49:55', 5);
INSERT INTO `poolperson` VALUES (77, 'basic', 'tng', 'tng', 'tng@tng.com', 1, NULL, '', 'tng', NULL, NULL, NULL, NULL, NULL, '2005-06-05 20:23:43', 6);
INSERT INTO `poolperson` VALUES (78, 'basic', 'roberts', 'juila', 'julia@julia.com', 1, NULL, '', 'julia', NULL, NULL, NULL, NULL, NULL, '2005-06-05 20:26:36', 0);
INSERT INTO `poolperson` VALUES (79, 'basic', 'McL', 'Sarah', 'sarah@mcl.com', 1, NULL, '', 'sarah', NULL, NULL, NULL, NULL, NULL, '2005-06-05 20:43:02', 0);
INSERT INTO `poolperson` VALUES (80, 'basic', 'McL', 'Sarah', 'sara@mcl.com', 1, NULL, '', 'sara', NULL, NULL, NULL, NULL, NULL, '2005-06-05 20:49:29', 0);
INSERT INTO `poolperson` VALUES (81, 'basic', 'Clooney', 'George', 'gc@clooney.com', 1, NULL, '', 'clooney', NULL, NULL, NULL, NULL, NULL, '2005-06-05 20:57:23', 5);
INSERT INTO `poolperson` VALUES (82, 'basic', 'Trump', 'Donald', 'donald@trump.com', 1, NULL, '', 'trump', NULL, NULL, NULL, NULL, NULL, '2005-06-05 21:19:56', 5);
INSERT INTO `poolperson` VALUES (83, 'basic', 'Godin', 'Seth', 'seth@godin.com', 1, NULL, '', 'godin', NULL, NULL, NULL, NULL, NULL, '2005-06-05 21:21:20', 16);
INSERT INTO `poolperson` VALUES (84, 'basic', 'Baker', 'Dusty', 'dusty@baker.com', 1, NULL, '', 'dusty', NULL, NULL, NULL, NULL, NULL, '2005-06-05 21:59:01', 17);
INSERT INTO `poolperson` VALUES (85, 'basic', 'Maddux', 'Greg', 'maddux@cubs.com', 1, NULL, '', 'maddog', NULL, NULL, NULL, NULL, NULL, '2005-06-05 21:59:57', 17);
INSERT INTO `poolperson` VALUES (86, 'basic', 'Wood', 'Kerry', 'kerrywood@cubs.com', 1, NULL, '', 'woddy', NULL, NULL, NULL, NULL, NULL, '2005-06-05 22:02:02', 17);
INSERT INTO `poolperson` VALUES (87, 'basic', 'Steinbrenner', 'George', 'bigstein@yankees.com', 1, NULL, '', 'yankee', NULL, NULL, NULL, NULL, NULL, '2005-06-05 22:04:03', 18);

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
  PRIMARY KEY  (`SelectedTeamID`)
) TYPE=MyISAM AUTO_INCREMENT=81 ;

-- 
-- Dumping data for table `selectedteams`
-- 

INSERT INTO `selectedteams` VALUES (1, 1, 1, 86, 8, 19, 4, 15, 94, 'team1', 'this is a sample team headline', NULL, 109);
INSERT INTO `selectedteams` VALUES (2, 1, 2, 94, 73, 27, 16, 82, 37, 'team2', NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (23, 1, 23, 94, 16, 27, 37, 82, 73, NULL, NULL, NULL, 98);
INSERT INTO `selectedteams` VALUES (24, 1, 24, 27, 73, 24, 37, 79, 97, NULL, NULL, NULL, 106);
INSERT INTO `selectedteams` VALUES (25, 1, 25, 73, 53, 37, 94, 27, 72, NULL, NULL, NULL, 4);
INSERT INTO `selectedteams` VALUES (26, 1, 26, 23, 59, 16, 98, 79, 38, NULL, NULL, NULL, 202);
INSERT INTO `selectedteams` VALUES (27, 1, 27, 27, 73, 37, 24, 33, 15, NULL, NULL, NULL, 105);
INSERT INTO `selectedteams` VALUES (28, 1, 28, 37, 75, 72, 82, 35, 99, NULL, NULL, NULL, 297);
INSERT INTO `selectedteams` VALUES (29, 1, 29, 53, 73, 27, 37, 79, 35, NULL, NULL, NULL, 203);
INSERT INTO `selectedteams` VALUES (30, 1, 30, 19, 37, 35, 72, 53, 27, NULL, NULL, NULL, 119);
INSERT INTO `selectedteams` VALUES (31, 1, 31, 27, 37, 35, 44, 19, 79, NULL, NULL, NULL, 211);
INSERT INTO `selectedteams` VALUES (32, 1, 32, 37, 53, 79, 15, 91, 88, NULL, NULL, NULL, 200);
INSERT INTO `selectedteams` VALUES (33, 1, 33, 75, 16, 53, 73, 17, 91, NULL, NULL, NULL, 197);
INSERT INTO `selectedteams` VALUES (34, 1, 34, 94, 53, 27, 73, 23, 75, NULL, NULL, NULL, 90);
INSERT INTO `selectedteams` VALUES (35, 1, 35, 37, 53, 73, 81, 22, 93, NULL, NULL, NULL, 96);
INSERT INTO `selectedteams` VALUES (36, 1, 36, 53, 27, 35, 19, 37, 59, NULL, NULL, NULL, 212);
INSERT INTO `selectedteams` VALUES (37, 1, 37, 53, 27, 37, 72, 75, 48, NULL, NULL, NULL, 211);
INSERT INTO `selectedteams` VALUES (38, 1, 38, 27, 53, 37, 59, 75, 72, NULL, NULL, NULL, 211);
INSERT INTO `selectedteams` VALUES (39, 1, 39, 27, 73, 34, 37, 90, 15, NULL, NULL, NULL, 10);
INSERT INTO `selectedteams` VALUES (40, 1, 40, 53, 94, 35, 72, 16, 59, NULL, NULL, NULL, 198);
INSERT INTO `selectedteams` VALUES (41, 1, 41, 35, 79, 37, 59, 15, 27, NULL, NULL, NULL, 310);
INSERT INTO `selectedteams` VALUES (42, 1, 42, 99, 17, 23, 65, 24, 72, NULL, NULL, NULL, -8);
INSERT INTO `selectedteams` VALUES (43, 1, 43, 16, 75, 4, 12, 82, 100, NULL, NULL, NULL, 210);
INSERT INTO `selectedteams` VALUES (44, 1, 44, 17, 72, 37, 35, 98, 79, NULL, NULL, NULL, 201);
INSERT INTO `selectedteams` VALUES (45, 1, 45, 27, 73, 37, 24, 33, 72, NULL, NULL, NULL, 105);
INSERT INTO `selectedteams` VALUES (46, 1, 46, 79, 17, 24, 35, 37, 4, NULL, NULL, NULL, 196);
INSERT INTO `selectedteams` VALUES (47, 1, 47, 53, 59, 79, 17, 24, 27, NULL, NULL, NULL, 205);
INSERT INTO `selectedteams` VALUES (48, 1, 48, 94, 27, 73, 53, 16, 59, NULL, NULL, NULL, 103);
INSERT INTO `selectedteams` VALUES (49, 1, 49, 37, 73, 94, 27, 53, 59, NULL, NULL, NULL, 97);
INSERT INTO `selectedteams` VALUES (50, 1, 50, 94, 53, 27, 73, 37, 59, NULL, NULL, NULL, 97);
INSERT INTO `selectedteams` VALUES (51, 1, 51, 39, 35, 59, 23, 13, 88, NULL, NULL, NULL, 385);
INSERT INTO `selectedteams` VALUES (52, 1, 52, 53, 27, 59, 35, 23, 37, NULL, NULL, NULL, 193);
INSERT INTO `selectedteams` VALUES (53, 1, 53, 35, 23, 59, 94, 27, 53, NULL, NULL, NULL, 191);
INSERT INTO `selectedteams` VALUES (54, 1, 54, 53, 27, 37, 75, 35, 59, NULL, NULL, NULL, 304);
INSERT INTO `selectedteams` VALUES (55, 1, 55, 37, 79, 72, 90, 17, 75, NULL, NULL, NULL, 195);
INSERT INTO `selectedteams` VALUES (56, 1, 56, 73, 53, 27, 59, 37, 75, NULL, NULL, NULL, 203);
INSERT INTO `selectedteams` VALUES (57, 1, 57, 72, 35, 75, 27, 73, 53, NULL, NULL, NULL, 214);
INSERT INTO `selectedteams` VALUES (58, 1, 58, 53, 72, 37, 75, 27, 86, NULL, NULL, NULL, 117);
INSERT INTO `selectedteams` VALUES (59, 1, 59, 53, 73, 27, 37, 72, 35, NULL, NULL, NULL, 110);
INSERT INTO `selectedteams` VALUES (60, 1, 60, 59, 79, 75, 53, 72, 24, NULL, NULL, NULL, 298);
INSERT INTO `selectedteams` VALUES (61, 1, 61, 53, 27, 37, 35, 75, 79, NULL, NULL, NULL, 304);
INSERT INTO `selectedteams` VALUES (62, 1, 62, 27, 73, 53, 79, 75, 82, NULL, NULL, NULL, 307);
INSERT INTO `selectedteams` VALUES (63, 1, 63, 27, 37, 35, 48, 60, 19, NULL, NULL, NULL, 217);
INSERT INTO `selectedteams` VALUES (64, 1, 64, 16, 79, 24, 72, 4, 37, NULL, NULL, NULL, 104);
INSERT INTO `selectedteams` VALUES (65, 1, 65, 24, 37, 59, 73, 53, 27, NULL, NULL, NULL, 99);
INSERT INTO `selectedteams` VALUES (66, 1, 73, 39, 1, 3, 7, 6, 20, NULL, NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (67, 1, 74, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (68, 1, 75, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (69, 5, 76, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (70, 6, 77, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (71, 0, 78, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (72, 0, 79, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (73, 0, 80, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (74, 5, 81, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (75, 5, 82, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (76, 16, 83, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (77, 17, 84, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (78, 17, 85, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (79, 17, 86, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `selectedteams` VALUES (80, 18, 87, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
