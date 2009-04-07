/*
MySQL Backup
Source Host:           localhost
Source Server Version: 3.23.58-nt
Source Database:       eompolls
Target Host:           localhost
Target Server Version: 3.23.58
Target Database:       eompolls
Date:                  2005/06/18 02:56:35
*/

SET FOREIGN_KEY_CHECKS=0;
use eompolls;
#----------------------------
# Table structure for optionanswer
#----------------------------
drop table if exists optionanswer;
CREATE TABLE `optionanswer` (
  `OptionAnswerID` bigint(20) NOT NULL auto_increment,
  `OptionNum` tinyint(4) default NULL,
  `OptionText` text,
  `PollQuestionID` bigint(20) default NULL,
  `OptionLink` text,
  PRIMARY KEY  (`OptionAnswerID`)
) TYPE=MyISAM;
#----------------------------
# Records for table optionanswer
#----------------------------


insert  into optionanswer values (1, 1, 'This is the most enjoyable golf website I have ever visited.  Thanks!', 1, null) ;
insert  into optionanswer values (2, 2, 'Great format, I enjoyed it and will tell my buddies to join my group for the British', 1, null) ;
insert  into optionanswer values (3, 3, 'Enjoyed myself, but would like to see some new features / features changed', 1, null) ;
insert  into optionanswer values (4, 4, 'Needs improvement, wasn\'t impressed', 1, null) ;
insert  into optionanswer values (5, 1, 'Tiger Woods', 2, null) ;
insert  into optionanswer values (6, 2, 'Vijay Singh', 2, null) ;
insert  into optionanswer values (7, 3, 'Phil Mickelson', 2, null) ;
insert  into optionanswer values (8, 4, 'Retief Goosen', 2, null) ;
insert  into optionanswer values (9, 5, 'Ernie Els', 2, null) ;
insert  into optionanswer values (10, 6, 'Brad Adamonis', 2, 'http://www.bradadamonis.com/') ;
insert  into optionanswer values (11, 7, '\"Wally\"', 2, 'http://www.eyeonmajors.com/store/Wally.cfm') ;
insert  into optionanswer values (12, 8, 'Other', 2, null) ;
#----------------------------
# Table structure for pollanswer
#----------------------------
drop table if exists pollanswer;
CREATE TABLE `pollanswer` (
  `PollAnswerID` bigint(20) NOT NULL auto_increment,
  `UserID` bigint(20) default NULL,
  `GroupID` bigint(20) default NULL,
  `QuestionID` bigint(20) default NULL,
  `AnswerID` bigint(20) default NULL,
  PRIMARY KEY  (`PollAnswerID`)
) TYPE=MyISAM;
#----------------------------
# No records for table pollanswer
#----------------------------

#----------------------------
# Table structure for pollquestion
#----------------------------
drop table if exists pollquestion;
CREATE TABLE `pollquestion` (
  `PollQuestionID` bigint(20) NOT NULL auto_increment,
  `PollQuestionText` text,
  `PollCategory` text,
  PRIMARY KEY  (`PollQuestionID`)
) TYPE=MyISAM;
#----------------------------
# Records for table pollquestion
#----------------------------


insert  into pollquestion values (1, 'Have you enjoyed our website?', 'website') ;
insert  into pollquestion values (2, 'Forgetting about the \"World Rankings\", who do you think is the #1 player in the world?', 'progolf') ;

