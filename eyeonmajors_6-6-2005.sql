/*
MySQL Backup
Source Host:           localhost
Source Server Version: 3.23.58-nt
Source Database:       eyeonmajors
Target Host:           localhost
Target Server Version: 3.23.58-nt
Target Database:       eyeonmajors
Date:                  2005/06/06 03:52:44
*/

SET FOREIGN_KEY_CHECKS=0;
use eyeonmajors;
#----------------------------
# Table structure for activeinviteeroster
#----------------------------
drop table if exists activeinviteeroster;
CREATE TABLE `activeinviteeroster` (
  `ActivePlayerID` smallint(6) default NULL,
  `GolferID` bigint(20) default NULL,
  `ExemptionID` smallint(6) default NULL
) TYPE=MyISAM;
#----------------------------
# No records for table activeinviteeroster
#----------------------------

#----------------------------
# Table structure for admineom
#----------------------------
drop table if exists admineom;
CREATE TABLE `admineom` (
  `adminID` smallint(6) NOT NULL default '0',
  `adminUserName` tinytext,
  `adminPassword` tinytext,
  `adminFirstName` tinytext,
  `adminLastName` tinytext,
  PRIMARY KEY  (`adminID`)
) TYPE=MyISAM;
#----------------------------
# No records for table admineom
#----------------------------

#----------------------------
# Table structure for eomhandicaps
#----------------------------
drop table if exists eomhandicaps;
CREATE TABLE `eomhandicaps` (
  `HandicapID` bigint(20) NOT NULL default '0',
  `GroupID` bigint(20) default NULL,
  `GolferID` bigint(20) default NULL,
  `HandicapStrokes` tinyint(3) unsigned default NULL,
  PRIMARY KEY  (`HandicapID`)
) TYPE=MyISAM;
#----------------------------
# Records for table eomhandicaps
#----------------------------


insert  into eomhandicaps values (1, 1, 94, 5) ;
insert  into eomhandicaps values (2, 1, 27, 2) ;
insert  into eomhandicaps values (3, 1, 73, 2) ;
insert  into eomhandicaps values (4, 1, 53, 3) ;
#----------------------------
# Table structure for golfer
#----------------------------
drop table if exists golfer;
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
) TYPE=MyISAM;
#----------------------------
# Records for table golfer
#----------------------------


insert  into golfer values (1, 'Tommy', 'Aaron', 0, 999, null, 2, 999, 999, 999, 'Aaron_Tommy') ;
insert  into golfer values (2, 'Robert', 'Allenby', 0, 999, null, 2, null, null, null, 'Allenby_Robert') ;
insert  into golfer values (3, 'Stephen', 'Ames', 0, null, null, 2, null, null, null, 'Ames_Steven') ;
insert  into golfer values (4, 'Stuart', 'Appleby', 0, null, null, 2, null, null, null, 'Appleby_Stuart') ;
insert  into golfer values (5, 'George', 'Archer', 0, null, null, 2, null, null, null, 'Archer_George') ;
insert  into golfer values (6, 'Severiano', 'Ballesteros', 0, null, null, 2, null, null, null, 'Ballesteros_Severiano') ;
insert  into golfer values (7, 'Rich', 'Beem', 0, null, null, 2, null, null, null, 'Beem_Rich') ;
insert  into golfer values (8, 'Thomas', 'Bjorn', 0, null, null, 2, null, null, null, 'Bjorn_Thomas') ;
insert  into golfer values (9, 'Gay', 'Brewer Jr.', 0, null, null, 2, null, null, null, 'Brewer_GayJr') ;
insert  into golfer values (10, 'Jack', 'Burke Jr.', 0, null, null, 2, null, null, null, 'Burke_JackJr') ;
insert  into golfer values (11, 'Angel', 'Cabrera', 0, null, null, 2, null, null, null, 'Cabrera_Angel') ;
insert  into golfer values (12, 'Chad', 'Campbell', 0, null, null, 2, null, null, null, 'Campbell_Chad') ;
insert  into golfer values (13, 'Paul', 'Casey', 0, null, null, 2, null, null, null, 'Casey_Paul') ;
insert  into golfer values (14, 'Billy', 'Casper', 0, null, null, 2, null, null, null, 'Casper_Billy') ;
insert  into golfer values (15, 'K.J.', 'Choi', 0, null, null, 2, null, null, null, 'Choi_KJ') ;
insert  into golfer values (16, 'Stewart', 'Cink', 0, null, null, 2, null, null, null, 'Cink_Stewart') ;
insert  into golfer values (17, 'Darren', 'Clarke', 0, null, null, 2, null, null, null, 'Clarke_Darren') ;
insert  into golfer values (18, 'Charles', 'Coody', 0, null, null, 2, null, null, null, 'Coody_Charles') ;
insert  into golfer values (19, 'Fred', 'Couples', 0, null, null, 2, null, null, null, 'Couples_Fred') ;
insert  into golfer values (20, 'Ben', 'Crenshaw', 0, null, null, 2, null, null, null, 'Crenshaw_Ben') ;
insert  into golfer values (21, 'Ben', 'Curtis', 0, null, null, 2, null, null, null, 'Curtis_Ben') ;
insert  into golfer values (22, 'John', 'Daly', 0, null, null, 2, null, null, null, 'Daly_John') ;
insert  into golfer values (23, 'Chris', 'DiMarco', 0, null, null, 2, null, null, null, 'DiMarco_Chris') ;
insert  into golfer values (24, 'Luke', 'Donald', 0, null, null, 2, null, null, null, 'Donald_Luke') ;
insert  into golfer values (25, 'David', 'Duval', 0, null, null, 2, null, null, null, 'Duval_David') ;
insert  into golfer values (26, 'Austin', 'Eaton III', 0, null, null, 2, null, null, null, 'Eaton_AustinIII') ;
insert  into golfer values (27, 'Ernie', 'Els', 0, null, null, 2, null, null, null, 'Els_Ernie') ;
insert  into golfer values (28, 'Nick', 'Faldo', 0, null, null, 2, null, null, null, 'Faldo_Nick') ;
insert  into golfer values (29, 'Steve', 'Flesch', 0, null, null, 2, null, null, null, 'Flesch_Steve') ;
insert  into golfer values (30, 'Raymond', 'Floyd', 0, null, null, 2, null, null, null, 'Floyd_Raymond') ;
insert  into golfer values (31, 'Doug', 'Ford', 0, null, null, 2, null, null, null, 'Ford_Doug') ;
insert  into golfer values (32, 'Carlos', 'Franco', 0, null, null, 2, null, null, null, 'Franco_Carlos') ;
insert  into golfer values (33, 'Fred', 'Funk', 0, null, null, 2, null, null, null, 'Funk_Fred') ;
insert  into golfer values (34, 'Jim', 'Furyk', 0, null, null, 2, null, null, null, 'Furyk_Jim') ;
insert  into golfer values (35, 'Sergio', 'Garcia', 0, null, null, 2, null, null, null, 'Garcia_Sergio') ;
insert  into golfer values (36, 'Bob', 'Goalby', 0, null, null, 2, null, null, null, 'Goalby_Bob') ;
insert  into golfer values (37, 'Retief', 'Goosen', 0, null, null, 2, null, null, null, 'Goosen_Retief') ;
insert  into golfer values (38, 'Jay', 'Haas', 0, null, null, 2, null, null, null, 'Haas_Jay') ;
insert  into golfer values (39, 'Zach', 'Johnson', 0, null, null, 2, null, null, null, 'Johnson_Zach') ;
insert  into golfer values (40, 'Shingo', 'Katayama', 0, null, null, 2, null, null, null, 'Katayama_Shingo') ;
insert  into golfer values (41, 'Jonathan', 'Kaye', 0, null, null, 2, null, null, null, 'Kaye_Jonathan') ;
insert  into golfer values (42, 'Jerry', 'Kelly', 0, null, null, 2, null, null, null, 'Kelly_Jerry') ;
insert  into golfer values (43, 'Bernhard', 'Langer', 0, null, null, 2, null, null, null, 'Langer_Bernhard') ;
insert  into golfer values (44, 'Justin', 'Leonard', 0, null, null, 2, null, null, null, 'Leonard_Justin') ;
insert  into golfer values (45, 'Thomas', 'Levet', 0, null, null, 2, null, null, null, 'Levet_Thomas') ;
insert  into golfer values (46, 'Luke', 'List', 0, null, null, 2, null, null, null, 'List_Luke') ;
insert  into golfer values (47, 'Peter', 'Lonard', 0, null, null, 2, null, null, null, 'Lonard_Peter') ;
insert  into golfer values (48, 'Davis', 'Love III', 0, null, null, 2, null, null, null, 'Love_DavisIII') ;
insert  into golfer values (49, 'Sandy', 'Lyle', 0, null, null, 2, null, null, null, 'Lyle_Sandy') ;
insert  into golfer values (50, 'Jeff', 'Maggert', 0, null, null, 2, null, null, null, 'Maggert_Jeff') ;
insert  into golfer values (51, 'Shigeki', 'Maruyama', 0, null, null, 2, null, null, null, 'Maruyama_Shigeki') ;
insert  into golfer values (52, 'Shaun', 'Micheel', 0, null, null, 2, null, null, null, 'Micheel_Shaun') ;
insert  into golfer values (53, 'Phil', 'Mickelson', 0, null, null, 2, null, null, null, 'Mickelson_Phil') ;
insert  into golfer values (54, 'Larry', 'Mize', 0, null, null, 2, null, null, null, 'Mize_Larry') ;
insert  into golfer values (55, 'Ryan', 'Moore', 0, null, null, 2, null, null, null, 'Moore_Ryan') ;
insert  into golfer values (56, 'Byron', 'Nelson', 0, null, null, 2, null, null, null, 'Nelson_Byron') ;
insert  into golfer values (57, 'Jack', 'Nicklaus', 0, null, null, 2, null, null, null, 'Nicklaus_Jack') ;
insert  into golfer values (58, 'Nick', 'O\'Hearn', 0, null, null, 2, null, null, null, 'OHern_Nick') ;
insert  into golfer values (59, 'Jose Maria', 'Olazabal', 0, null, null, 2, null, null, null, 'Olazabal_JoseMaria') ;
insert  into golfer values (60, 'Mark', 'O\'Meara', 0, null, null, 2, null, null, null, 'OMeara_Mark') ;
insert  into golfer values (61, 'Arnold', 'Palmer', 0, null, null, 2, null, null, null, 'Palmer_Arnold') ;
insert  into golfer values (62, 'Ryan', 'Palmer', 0, null, null, 2, null, null, null, 'Palmer_Ryan') ;
insert  into golfer values (63, 'Rod', 'Pampling', 0, null, null, 2, null, null, null, 'Pampling_Rod') ;
insert  into golfer values (64, 'Jesper', 'Parnevik', 0, null, null, 2, null, null, null, 'Parnevik_Jesper') ;
insert  into golfer values (65, 'Kenny', 'Perry', 0, null, null, 2, null, null, null, 'Perry_Kenny') ;
insert  into golfer values (66, 'Gary', 'Player', 0, null, null, 2, null, null, null, 'Player_Gary') ;
insert  into golfer values (67, 'Ian', 'Poulter', 0, null, null, 2, null, null, null, 'Poulter_Ian') ;
insert  into golfer values (68, 'Nick', 'Price', 0, null, null, 2, null, null, null, 'Price_Nick') ;
insert  into golfer values (69, 'Ted', 'Purdy', 0, null, null, 2, null, null, null, 'Purdy_Ted') ;
insert  into golfer values (70, 'Chris', 'Riley', 0, null, null, 2, null, null, null, 'Riley_Chris') ;
insert  into golfer values (71, 'Rory', 'Sabbatini', 0, null, null, 2, null, null, null, 'Sabbatini_Rory') ;
insert  into golfer values (72, 'Adam', 'Scott', 0, null, null, 2, null, null, null, 'Scott_Adam') ;
insert  into golfer values (73, 'Vijay', 'Singh', 0, null, null, 2, null, null, null, 'Singh_Vijay') ;
insert  into golfer values (74, 'Craig', 'Stadler', 0, null, null, 2, null, null, null, 'Stadler_Craig') ;
insert  into golfer values (75, 'David', 'Toms', 0, null, null, 2, null, null, null, 'Toms_David') ;
insert  into golfer values (76, 'Kirk', 'Triplett', 0, null, null, 2, null, null, null, 'Triplett_Kirk') ;
insert  into golfer values (77, 'Joakim', 'Haeggman', 0, null, null, 2, null, null, null, 'Haeggman_Joakim') ;
insert  into golfer values (78, 'Todd', 'Hamilton', 0, null, null, 2, null, null, null, 'Hamilton_Todd') ;
insert  into golfer values (79, 'Padraig', 'Harrington', 0, null, null, 2, null, null, null, 'Harrington_Padraig') ;
insert  into golfer values (80, 'Mark', 'Hensby', 0, null, null, 2, null, null, null, 'Hensby_Mark') ;
insert  into golfer values (81, 'Tim', 'Herron', 0, null, null, 2, null, null, null, 'Herron_Tim') ;
insert  into golfer values (82, 'Charles', 'Howell III', 0, null, null, 2, null, null, null, 'Howell_CharlesIII') ;
insert  into golfer values (83, 'David', 'Howell', 0, null, null, 2, null, null, null, 'Howell_David') ;
insert  into golfer values (84, 'Trevor', 'Immelman', 0, null, null, 2, null, null, null, 'Immelman_Trevor') ;
insert  into golfer values (85, 'Fredrik', 'Jacobson', 0, null, null, 2, null, null, null, 'Jacobson_Fredrik') ;
insert  into golfer values (86, 'Miguel Angel', 'Jimenez', 0, null, null, 2, null, null, null, 'Jimenez_MiguelAngel') ;
insert  into golfer values (87, 'Bo', 'Van Pelt', 0, null, null, 2, null, null, null, 'VanPelt_Bo') ;
insert  into golfer values (88, 'Scott', 'Verplank', 0, null, null, 2, null, null, null, 'Verplank_Scott') ;
insert  into golfer values (89, 'Tom', 'Watson', 0, null, null, 2, null, null, null, 'Watson_Tom') ;
insert  into golfer values (90, 'Mike', 'Weir', 0, null, null, 2, null, null, null, 'Weir_Mike') ;
insert  into golfer values (91, 'Lee', 'Westwood', 0, null, null, 2, null, null, null, 'Westwood_Lee') ;
insert  into golfer values (92, 'Stuart', 'Wilson', 0, null, null, 2, null, null, null, 'Wilson_Stuart') ;
insert  into golfer values (93, 'Casey', 'Wittenberg', 0, null, null, 2, null, null, null, 'Wittenberg_Casey') ;
insert  into golfer values (94, 'Tiger', 'Woods', 0, null, null, 1, null, null, null, 'Woods_Tiger') ;
insert  into golfer values (95, 'Ian', 'Woosnam', 0, null, null, 2, null, null, null, 'Woosnam_Ian') ;
insert  into golfer values (96, 'Fuzzy', 'Zoeller', 0, null, null, 2, null, null, null, 'Zoeller_Fuzzy') ;
insert  into golfer values (98, 'Craig', 'Parry', 0, null, null, 2, null, null, null, 'parry_craig') ;
insert  into golfer values (97, 'Graeme', 'McDowell', 0, null, null, 2, null, null, null, 'mcdowell_graeme') ;
insert  into golfer values (99, 'Tom', 'Lehman', 0, null, null, 2, null, null, null, 'lehman_tom') ;
insert  into golfer values (100, 'Joe', 'Ogilvie', 0, null, null, 2, null, null, null, 'ogilvie_joe') ;
#----------------------------
# Table structure for messageboard
#----------------------------
drop table if exists messageboard;
CREATE TABLE `messageboard` (
  `messageID` bigint(20) NOT NULL default '0',
  `posterID` bigint(20) default NULL,
  `message` mediumtext,
  PRIMARY KEY  (`messageID`)
) TYPE=MyISAM;
#----------------------------
# No records for table messageboard
#----------------------------

#----------------------------
# Table structure for poolgroup
#----------------------------
drop table if exists poolgroup;
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
) TYPE=MyISAM;
#----------------------------
# Records for table poolgroup
#----------------------------


insert  into poolgroup values (1, 'Magical', 'testing', 2, 94, 27, 73, 53, null, null, null, null, null, null, 5, 2, 2, 3, null, null, null, null, null, null) ;
insert  into poolgroup values (5, 'testing2', 'major', 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null) ;
#----------------------------
# Table structure for poolperson
#----------------------------
drop table if exists poolperson;
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
) TYPE=MyISAM;
#----------------------------
# Records for table poolperson
#----------------------------


insert  into poolperson values (30, 'basic', 'Murphy', 'Brian', 'brian_murph@yahoo.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:04:02', 1) ;
insert  into poolperson values (1, 'admin', 'Holton', 'Mark', 'holtonma@gmail.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 17:53:58', 1) ;
insert  into poolperson values (23, 'admin', 'Eye', 'Jerry', 'mreye1@ameritech.net', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 18:19:00', 1) ;
insert  into poolperson values (24, 'basic', 'McDon', 'Brain', 'DMcdon6452@aol.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 19:02:17', 1) ;
insert  into poolperson values (25, 'basic', 'Lamoree', 'Jim', 'Jlamoree65@cs.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 19:17:59', 1) ;
insert  into poolperson values (26, 'basic', 'Lamoree', 'Jan', 'Janlamoree65@cs.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 19:18:29', 1) ;
insert  into poolperson values (27, 'basic', 'Judson', 'Oswald', 'oswaldja@hotmail.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 19:43:45', 1) ;
insert  into poolperson values (28, 'basic', 'Henry', 'HK', 'HKHENRY@aol.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 19:55:45', 1) ;
insert  into poolperson values (29, 'basic', 'Goering', 'JD', 'goerinjd@hotmail.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:01:50', 1) ;
insert  into poolperson values (38, 'basic', 'Eliason', 'Garth', 'gweliason@gmail.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:26:00', 1) ;
insert  into poolperson values (37, 'basic', 'Shimp', 'Jon', 'jon.shimp@gmail.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:24:11', 1) ;
insert  into poolperson values (36, 'basic', 'Shulman', 'Joe', 'j.j.shulman@att.net', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:21:25', 1) ;
insert  into poolperson values (35, 'basic', 'Swami', 'The', 'jerry.ing@cbre.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:19:34', 1) ;
insert  into poolperson values (34, 'basic', 'Pellati', 'R', 'rpellati@aol.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:16:34', 1) ;
insert  into poolperson values (33, 'basic', 'Phales', 'Bob', 'rpdelta7@sbcglobal.net', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:13:52', 1) ;
insert  into poolperson values (32, 'basic', 'Bultinck', 'Chris', 'chrisbultinck@hotmail.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:10:06', 1) ;
insert  into poolperson values (31, 'basic', 'Nethercott', 'Candice', 'candicen@pro-shop.co.za', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:06:39', 1) ;
insert  into poolperson values (39, 'basic', 'Carroll', 'Andrew', 'andrewdcarroll@gmail.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:28:44', 1) ;
insert  into poolperson values (40, 'basic', 'Inguagiato', 'Dennis', 'golfing_dennis225@yahoo.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:30:24', 1) ;
insert  into poolperson values (41, 'basic', 'TGlass', 'Brad', 'brad@tglass.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:32:58', 1) ;
insert  into poolperson values (42, 'basic', 'Watson', 'Tee', 'teewatson@sbcglobal.net', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:35:00', 1) ;
insert  into poolperson values (43, 'basic', 'Watson2', 'Tee', 'teewatson2@sbcglobal.net', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:37:25', 1) ;
insert  into poolperson values (44, 'basic', 'Watson3', 'Tee', 'teewatson3@sbcglobal.net', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:45:26', 1) ;
insert  into poolperson values (45, 'basic', 'Clark', 'Chris', 'cclark@farmersagent.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:47:26', 1) ;
insert  into poolperson values (46, 'basic', 'Pulford', 'Ros', 'rosp331@aol.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:48:46', 1) ;
insert  into poolperson values (47, 'basic', 'Pulford', 'Bob', 'rosp3312@aol.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:49:06', 1) ;
insert  into poolperson values (48, 'basic', 'Goering', 'Stevie', 'stephengoering@yahoo.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:52:41', 1) ;
insert  into poolperson values (49, 'basic', 'Hall', 'Amy', 'amy_hall@microvision.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 20:56:56', 1) ;
insert  into poolperson values (50, 'basic', 'Salmans', 'Van', 'van@salmans.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 21:30:14', 1) ;
insert  into poolperson values (51, 'basic', 'Salmans', 'CK 1', 'van2@salmans.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 21:32:05', 1) ;
insert  into poolperson values (52, 'basic', 'Salmans', 'Vanman', 'van3@salmans.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 21:34:47', 1) ;
insert  into poolperson values (53, 'basic', 'Jacobson', 'Bob', 'bob@jacobson.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 21:36:44', 1) ;
insert  into poolperson values (54, 'basic', 'Stavriotis', 'Eric', 'ericstavriotis@hotmail.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 21:38:34', 1) ;
insert  into poolperson values (55, 'basic', 'Giato', 'Mike', 'mikegiato@aol.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 21:39:55', 1) ;
insert  into poolperson values (56, 'basic', 'Adamonis', 'Dave', 'radamonis@cox.net', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 21:41:45', 1) ;
insert  into poolperson values (57, 'basic', 'Adamonis', 'Trifecta', 'radamonis2@cox.net', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 21:43:23', 1) ;
insert  into poolperson values (58, 'basic', 'Bryn', 'Bob', 'bob.bryn@gmail.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 21:48:56', 1) ;
insert  into poolperson values (59, 'basic', 'Schock', 'Brad', 'bschock@kpmg.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 21:50:52', 1) ;
insert  into poolperson values (60, 'basic', 'Parker', 'Tim', 'tim_parker@verizon.net', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 21:52:41', 1) ;
insert  into poolperson values (61, 'basic', 'Schnack', 'Andy', 'aschnack@hotmail.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 21:54:53', 1) ;
insert  into poolperson values (62, 'basic', 'Holton', 'Wally', 'bigwallh@hotmail.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 21:58:32', 1) ;
insert  into poolperson values (63, 'basic', 'Dedekind', 'Brendon', 'dedekind@hotmail.com', 1, null, '', 'major', null, null, null, null, null, '2005-04-06 22:03:13', 1) ;
insert  into poolperson values (64, 'basic', 'Holton', 'Mark', 'holtonma@holton.com', 1, null, '', 'scramjet', null, null, null, null, null, '2005-06-02 04:28:23', 1) ;
insert  into poolperson values (65, 'basic', 'Holton', 'Mark ', 'holton@hotlon.com', 1, null, '', 'scramjet', null, null, null, null, null, '2005-06-02 04:32:21', 1) ;
#----------------------------
# Table structure for selectedteams
#----------------------------
drop table if exists selectedteams;
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
) TYPE=MyISAM;
#----------------------------
# Records for table selectedteams
#----------------------------


insert  into selectedteams values (1, 1, 1, 0, 73, 0, 86, 35, 37, 'team1', 'this is a sample team headline', null, null) ;
insert  into selectedteams values (2, 1, 2, 94, 73, 27, 16, 82, 37, 'team2', null, null, null) ;
insert  into selectedteams values (23, 1, 23, 94, 16, 27, 37, 82, 73, null, null, null, null) ;
insert  into selectedteams values (24, 1, 24, 27, 73, 24, 37, 79, 97, null, null, null, null) ;
insert  into selectedteams values (25, 1, 25, 73, 53, 37, 94, 27, 72, null, null, null, null) ;
insert  into selectedteams values (26, 1, 26, 23, 59, 16, 98, 79, 38, null, null, null, null) ;
insert  into selectedteams values (27, 1, 27, 27, 73, 37, 24, 33, 15, null, null, null, null) ;
insert  into selectedteams values (28, 1, 28, 37, 75, 72, 82, 35, 99, null, null, null, null) ;
insert  into selectedteams values (29, 1, 29, 53, 73, 27, 37, 79, 35, null, null, null, null) ;
insert  into selectedteams values (30, 1, 30, 19, 37, 35, 72, 53, 27, null, null, null, null) ;
insert  into selectedteams values (31, 1, 31, 27, 37, 35, 44, 19, 79, null, null, null, null) ;
insert  into selectedteams values (32, 1, 32, 37, 53, 79, 15, 91, 88, null, null, null, null) ;
insert  into selectedteams values (33, 1, 33, 75, 16, 53, 73, 17, 91, null, null, null, null) ;
insert  into selectedteams values (34, 1, 34, 94, 53, 27, 73, 23, 75, null, null, null, null) ;
insert  into selectedteams values (35, 1, 35, 37, 53, 73, 81, 22, 93, null, null, null, null) ;
insert  into selectedteams values (36, 1, 36, 53, 27, 35, 19, 37, 59, null, null, null, null) ;
insert  into selectedteams values (37, 1, 37, 53, 27, 37, 72, 75, 48, null, null, null, null) ;
insert  into selectedteams values (38, 1, 38, 27, 53, 37, 59, 75, 72, null, null, null, null) ;
insert  into selectedteams values (39, 1, 39, 27, 73, 34, 37, 90, 15, null, null, null, null) ;
insert  into selectedteams values (40, 1, 40, 53, 94, 35, 72, 16, 59, null, null, null, null) ;
insert  into selectedteams values (41, 1, 41, 35, 79, 37, 59, 15, 27, null, null, null, null) ;
insert  into selectedteams values (42, 1, 42, 99, 17, 23, 65, 24, 72, null, null, null, null) ;
insert  into selectedteams values (43, 1, 43, 16, 75, 4, 12, 82, 100, null, null, null, null) ;
insert  into selectedteams values (44, 1, 44, 17, 72, 37, 35, 98, 79, null, null, null, null) ;
insert  into selectedteams values (45, 1, 45, 27, 73, 37, 24, 33, 72, null, null, null, null) ;
insert  into selectedteams values (46, 1, 46, 79, 17, 24, 35, 37, 4, null, null, null, null) ;
insert  into selectedteams values (47, 1, 47, 53, 59, 79, 17, 24, 27, null, null, null, null) ;
insert  into selectedteams values (48, 1, 48, 94, 27, 73, 53, 16, 59, null, null, null, null) ;
insert  into selectedteams values (49, 1, 49, 37, 73, 94, 27, 53, 59, null, null, null, null) ;
insert  into selectedteams values (50, 1, 50, 94, 53, 27, 73, 37, 59, null, null, null, null) ;
insert  into selectedteams values (51, 1, 51, 39, 35, 59, 23, 13, 88, null, null, null, null) ;
insert  into selectedteams values (52, 1, 52, 53, 27, 59, 35, 23, 37, null, null, null, null) ;
insert  into selectedteams values (53, 1, 53, 35, 23, 59, 94, 27, 53, null, null, null, null) ;
insert  into selectedteams values (54, 1, 54, 53, 27, 37, 75, 35, 59, null, null, null, null) ;
insert  into selectedteams values (55, 1, 55, 37, 79, 72, 90, 17, 75, null, null, null, null) ;
insert  into selectedteams values (56, 1, 56, 73, 53, 27, 59, 37, 75, null, null, null, null) ;
insert  into selectedteams values (57, 1, 57, 72, 35, 75, 27, 73, 53, null, null, null, null) ;
insert  into selectedteams values (58, 1, 58, 53, 72, 37, 75, 27, 86, null, null, null, null) ;
insert  into selectedteams values (59, 1, 59, 53, 73, 27, 37, 72, 35, null, null, null, null) ;
insert  into selectedteams values (60, 1, 60, 59, 79, 75, 53, 72, 24, null, null, null, null) ;
insert  into selectedteams values (61, 1, 61, 53, 27, 37, 35, 75, 79, null, null, null, null) ;
insert  into selectedteams values (62, 1, 62, 27, 73, 53, 79, 75, 82, null, null, null, null) ;
insert  into selectedteams values (63, 1, 63, 27, 37, 35, 48, 60, 19, null, null, null, null) ;

