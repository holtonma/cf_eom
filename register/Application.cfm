<cfset sDSN = "eyeonmajors" />
<cfset sDSN2 = "eyeon2" />
<cfset sHeaderMessage = "" />
<cfapplication sessionmanagement="yes" sessiontimeout="#CreateTimeSpan(0, 8, 0, 0)#" />
<cfparam name="SESSION.eventid" default="19"> <!--- 19 = 2009 Masteers --->

