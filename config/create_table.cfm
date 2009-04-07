<cftry>
	<cfquery datasource="learningcoldfusion">
	DROP TABLE lcf_user, lcf_user_type, lcf_event
	</cfquery>
<cfcatch>

</cfcatch>
</cftry>
<cfquery datasource="learningcoldfusion">
CREATE TABLE lcf_user (
user_id VARCHAR(50) NOT NULL,
name_last VARCHAR(50) NOT NULL,
name_first VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
password VARCHAR(50) NOT NULL,
user_type_id VARCHAR(50) NOT NULL,
sign_up_date DATETIME NOT NULL,
PRIMARY KEY (user_id)
)
</cfquery>
<cfquery datasource="learningcoldfusion">
CREATE TABLE lcf_user_type (
user_type_id VARCHAR(50) NOT NULL,
type VARCHAR(50) NOT NULL,
PRIMARY KEY (user_type_id)
)
</cfquery>
<cfquery datasource="learningcoldfusion">
CREATE TABLE lcf_event (
event_id VARCHAR(50) NOT NULL,
event_date_time DATETIME NOT NULL,
title VARCHAR(50) NOT NULL,
description VARCHAR(255) NOT NULL,
type INTEGER NOT NULL,
user_id VARCHAR(50) NOT NULL,
PRIMARY KEY (event_id)
)
</cfquery>