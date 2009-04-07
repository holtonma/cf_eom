-- phpMyAdmin SQL Dump
-- version 2.6.0-pl3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jul 05, 2005 at 02:39 PM
-- Server version: 3.23.58
-- PHP Version: 4.3.10
-- 
-- Database: `eompolls`
-- 
CREATE DATABASE `eompolls`;
USE eompolls;

-- --------------------------------------------------------

-- 
-- Table structure for table `optionanswer`
-- 

CREATE TABLE `optionanswer` (
  `OptionAnswerID` bigint(20) NOT NULL auto_increment,
  `OptionNum` tinyint(4) default NULL,
  `OptionText` text,
  `PollQuestionID` bigint(20) default NULL,
  `OptionLink` text,
  PRIMARY KEY  (`OptionAnswerID`)
) TYPE=MyISAM AUTO_INCREMENT=45 ;

-- 
-- Dumping data for table `optionanswer`
-- 

INSERT INTO `optionanswer` VALUES (1, 1, 'This is the most enjoyable golf website I have ever visited.  Thanks!', 1, NULL);
INSERT INTO `optionanswer` VALUES (2, 2, 'Great format, I enjoyed it and will tell my buddies to join my group for the British', 1, NULL);
INSERT INTO `optionanswer` VALUES (3, 3, 'Enjoyed myself, but would like to see some new features / features changed', 1, NULL);
INSERT INTO `optionanswer` VALUES (4, 4, 'Needs improvement, wasn''t impressed', 1, NULL);
INSERT INTO `optionanswer` VALUES (5, 1, 'Tiger Woods', 2, NULL);
INSERT INTO `optionanswer` VALUES (6, 2, 'Vijay Singh', 2, NULL);
INSERT INTO `optionanswer` VALUES (7, 3, 'Phil Mickelson', 2, NULL);
INSERT INTO `optionanswer` VALUES (8, 4, 'Retief Goosen', 2, NULL);
INSERT INTO `optionanswer` VALUES (9, 5, 'Ernie Els', 2, NULL);
INSERT INTO `optionanswer` VALUES (13, 1, 'Retief Goosen', 3, NULL);
INSERT INTO `optionanswer` VALUES (11, 6, '"Wally"', 2, 'http://www.eyeonmajors.com/store/Wally.cfm');
INSERT INTO `optionanswer` VALUES (12, 7, 'Other', 2, NULL);
INSERT INTO `optionanswer` VALUES (14, 5, 'Sergio Garcia', 3, NULL);
INSERT INTO `optionanswer` VALUES (15, 2, 'Tiger Woods', 3, NULL);
INSERT INTO `optionanswer` VALUES (16, 3, 'Olin Browne', 3, NULL);
INSERT INTO `optionanswer` VALUES (17, 4, 'Jason Gore', 3, NULL);
INSERT INTO `optionanswer` VALUES (18, 6, 'KJ Choi', 3, NULL);
INSERT INTO `optionanswer` VALUES (19, 7, '"Wally"', 3, NULL);
INSERT INTO `optionanswer` VALUES (20, 8, 'The Field', 3, NULL);
INSERT INTO `optionanswer` VALUES (21, 1, 'The field is lucky I pulled a hammy and missed Sectionals', 4, NULL);
INSERT INTO `optionanswer` VALUES (22, 2, 'Somewhere in the 70''s on a good day', 4, NULL);
INSERT INTO `optionanswer` VALUES (23, 3, 'Probably in the 80''s, that course is tough', 4, NULL);
INSERT INTO `optionanswer` VALUES (24, 4, 'I''m a pretty good player, but that course is set up tough, I''d have to CAREER it to shoot in the 80''s!', 4, NULL);
INSERT INTO `optionanswer` VALUES (25, 5, 'Between 90 and 100', 4, NULL);
INSERT INTO `optionanswer` VALUES (26, 6, 'Triple Digits', 4, NULL);
INSERT INTO `optionanswer` VALUES (27, 7, '"WWWS" ...What Would Wally shoot', 4, NULL);
INSERT INTO `optionanswer` VALUES (28, 1, 'Gatorade', 5, NULL);
INSERT INTO `optionanswer` VALUES (29, 2, 'Water', 5, NULL);
INSERT INTO `optionanswer` VALUES (30, 3, 'an "Arnold Palmer" : half iced team, half lemonade', 5, NULL);
INSERT INTO `optionanswer` VALUES (31, 3, 'light beer', 5, NULL);
INSERT INTO `optionanswer` VALUES (32, 4, 'Guinness draught', 5, NULL);
INSERT INTO `optionanswer` VALUES (33, 5, 'Tequila on the 19th hole', 5, NULL);
INSERT INTO `optionanswer` VALUES (34, 1, '20 or more (my office)', 6, NULL);
INSERT INTO `optionanswer` VALUES (35, 2, 'More than 10 -- I want to be eligible for the prizes', 6, NULL);
INSERT INTO `optionanswer` VALUES (36, 3, 'I wish I had 10 friends', 6, NULL);
INSERT INTO `optionanswer` VALUES (37, 4, 'Between 5 and 10', 6, NULL);
INSERT INTO `optionanswer` VALUES (38, 5, '1 or 2', 6, NULL);
INSERT INTO `optionanswer` VALUES (39, 6, 'None -- in today''s society where everyone wins, I''m somewhat bitter I was cut', 6, NULL);
INSERT INTO `optionanswer` VALUES (40, 1, 'Elin Nordegren', 7, NULL);
INSERT INTO `optionanswer` VALUES (41, 2, 'Butch Harmon', 7, NULL);
INSERT INTO `optionanswer` VALUES (42, 3, 'Hank Haney', 7, NULL);
INSERT INTO `optionanswer` VALUES (43, 4, 'Hootie Johnson', 7, NULL);
INSERT INTO `optionanswer` VALUES (44, 5, 'Martha Burke', 7, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `pollanswer`
-- 

CREATE TABLE `pollanswer` (
  `PollAnswerID` bigint(20) NOT NULL auto_increment,
  `UserID` bigint(20) default NULL,
  `GroupID` bigint(20) default NULL,
  `QuestionID` bigint(20) default NULL,
  `AnswerID` bigint(20) default NULL,
  PRIMARY KEY  (`PollAnswerID`)
) TYPE=MyISAM AUTO_INCREMENT=70 ;

-- 
-- Dumping data for table `pollanswer`
-- 

INSERT INTO `pollanswer` VALUES (1, 1, 1, 1, 1);
INSERT INTO `pollanswer` VALUES (31, 120, 20, 1, 3);
INSERT INTO `pollanswer` VALUES (3, 1, 1, 2, 1);
INSERT INTO `pollanswer` VALUES (4, 1, 1, 3, 2);
INSERT INTO `pollanswer` VALUES (5, 1, 1, 4, 3);
INSERT INTO `pollanswer` VALUES (6, 219, 53, 1, 1);
INSERT INTO `pollanswer` VALUES (7, 1, 1, 5, 3);
INSERT INTO `pollanswer` VALUES (8, 1, 1, 6, 1);
INSERT INTO `pollanswer` VALUES (9, 62, 1, 1, 1);
INSERT INTO `pollanswer` VALUES (10, 62, 1, 2, 1);
INSERT INTO `pollanswer` VALUES (11, 62, 1, 3, 8);
INSERT INTO `pollanswer` VALUES (12, 62, 1, 4, 6);
INSERT INTO `pollanswer` VALUES (13, 62, 1, 5, 1);
INSERT INTO `pollanswer` VALUES (14, 62, 1, 6, 2);
INSERT INTO `pollanswer` VALUES (15, 262, 29, 1, 1);
INSERT INTO `pollanswer` VALUES (16, 262, 29, 2, 1);
INSERT INTO `pollanswer` VALUES (17, 1, 1, 7, 4);
INSERT INTO `pollanswer` VALUES (18, 61, 1, 1, 1);
INSERT INTO `pollanswer` VALUES (19, 61, 1, 2, 6);
INSERT INTO `pollanswer` VALUES (20, 61, 1, 3, 6);
INSERT INTO `pollanswer` VALUES (21, 140, 33, 1, 2);
INSERT INTO `pollanswer` VALUES (22, 140, 33, 2, 2);
INSERT INTO `pollanswer` VALUES (23, 140, 33, 3, 6);
INSERT INTO `pollanswer` VALUES (24, 140, 33, 4, 6);
INSERT INTO `pollanswer` VALUES (25, 140, 33, 5, 3);
INSERT INTO `pollanswer` VALUES (26, 140, 33, 6, 2);
INSERT INTO `pollanswer` VALUES (27, 140, 33, 7, 4);
INSERT INTO `pollanswer` VALUES (28, 101, 20, 1, 3);
INSERT INTO `pollanswer` VALUES (29, 40, 1, 1, 2);
INSERT INTO `pollanswer` VALUES (30, 62, 1, 7, 4);
INSERT INTO `pollanswer` VALUES (32, 55, 1, 1, 4);
INSERT INTO `pollanswer` VALUES (33, 40, 1, 2, 1);
INSERT INTO `pollanswer` VALUES (34, 40, 1, 3, 1);
INSERT INTO `pollanswer` VALUES (35, 40, 1, 4, 4);
INSERT INTO `pollanswer` VALUES (36, 40, 1, 5, 2);
INSERT INTO `pollanswer` VALUES (37, 40, 1, 6, 5);
INSERT INTO `pollanswer` VALUES (38, 40, 1, 7, 4);
INSERT INTO `pollanswer` VALUES (39, 273, 1, 1, 2);
INSERT INTO `pollanswer` VALUES (40, 273, 1, 2, 2);
INSERT INTO `pollanswer` VALUES (41, 90, 1, 1, 1);
INSERT INTO `pollanswer` VALUES (42, 90, 1, 2, 1);
INSERT INTO `pollanswer` VALUES (43, 90, 1, 3, 1);
INSERT INTO `pollanswer` VALUES (44, 90, 1, 4, 6);
INSERT INTO `pollanswer` VALUES (45, 90, 1, 5, 3);
INSERT INTO `pollanswer` VALUES (46, 90, 1, 6, 3);
INSERT INTO `pollanswer` VALUES (47, 90, 1, 7, 4);
INSERT INTO `pollanswer` VALUES (48, 128, 29, 1, 3);
INSERT INTO `pollanswer` VALUES (49, 55, 1, 2, 1);
INSERT INTO `pollanswer` VALUES (50, 55, 1, 3, 2);
INSERT INTO `pollanswer` VALUES (51, 106, 1, 1, 1);
INSERT INTO `pollanswer` VALUES (52, 263, 29, 1, 2);
INSERT INTO `pollanswer` VALUES (53, 263, 29, 2, 2);
INSERT INTO `pollanswer` VALUES (54, 168, 29, 1, 3);
INSERT INTO `pollanswer` VALUES (55, 61, 1, 4, 7);
INSERT INTO `pollanswer` VALUES (56, 61, 1, 5, 5);
INSERT INTO `pollanswer` VALUES (57, 61, 1, 6, 3);
INSERT INTO `pollanswer` VALUES (58, 61, 1, 7, 5);
INSERT INTO `pollanswer` VALUES (59, 106, 1, 2, 1);
INSERT INTO `pollanswer` VALUES (60, 106, 1, 3, 2);
INSERT INTO `pollanswer` VALUES (61, 106, 1, 4, 6);
INSERT INTO `pollanswer` VALUES (62, 106, 1, 5, 3);
INSERT INTO `pollanswer` VALUES (63, 106, 1, 6, 4);
INSERT INTO `pollanswer` VALUES (64, 106, 1, 7, 4);
INSERT INTO `pollanswer` VALUES (65, 128, 29, 2, 1);
INSERT INTO `pollanswer` VALUES (66, 174, 45, 1, 4);
INSERT INTO `pollanswer` VALUES (67, 30, 1, 1, 1);
INSERT INTO `pollanswer` VALUES (68, 33, 1, 1, 1);
INSERT INTO `pollanswer` VALUES (69, 33, 1, 2, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `pollquestion`
-- 

CREATE TABLE `pollquestion` (
  `PollQuestionID` bigint(20) NOT NULL auto_increment,
  `PollQuestionText` text,
  `PollCategory` text,
  PRIMARY KEY  (`PollQuestionID`)
) TYPE=MyISAM AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `pollquestion`
-- 

INSERT INTO `pollquestion` VALUES (1, 'Have you enjoyed our website?', 'website');
INSERT INTO `pollquestion` VALUES (2, 'Forgetting about the "World Rankings", who do you think is the #1 player in the world?', 'progolf');
INSERT INTO `pollquestion` VALUES (3, 'Who will win the 2005 US Open?', 'golf');
INSERT INTO `pollquestion` VALUES (4, 'What do you think you would honestly shoot if you played from the US Open tees at Pinehurst this week?', 'patron');
INSERT INTO `pollquestion` VALUES (5, 'My favorite on course beverage is:', 'patron');
INSERT INTO `pollquestion` VALUES (6, 'How many friends are you going to invite into your British Open pool group?', 'patron');
INSERT INTO `pollquestion` VALUES (7, 'Who recently was quoted saying "Tigahh, what can I say, you''re the GREATEST!"', 'fun');
