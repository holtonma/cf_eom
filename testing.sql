/*
MySQL Backup
Source Host:           localhost
Source Server Version: 3.23.58-nt
Source Database:       testing
Target Host:           localhost
Target Server Version: 3.23.58
Target Database:       testing
Date:                  2005/03/28 22:32:19
*/

SET FOREIGN_KEY_CHECKS=0;
use testing;
#----------------------------
# Table structure for onlytable
#----------------------------
drop table if exists onlytable;
CREATE TABLE `onlytable` (
  `Field1` bigint(20) NOT NULL default '0',
  `Field2` bigint(20) default NULL,
  PRIMARY KEY  (`Field1`)
) TYPE=MyISAM;
#----------------------------
# No records for table onlytable
#----------------------------


