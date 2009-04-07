<cftry>
  <cfquery datasource="learningcoldfusion">
  DROP TABLE lcf_event
  </cfquery>
<cfcatch></cfcatch>
</cftry>
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