<cfset sDSN = "eyeonmajors" />
<cfset sDSN2 = "eyeon2" />
<cfset sHeaderMessage = "" />
<cfapplication sessionmanagement="yes" sessiontimeout="#CreateTimeSpan(0, 16, 0, 0)#" />
<cfparam name="SESSION.eventid" default="22"> <!--- 22 = PGA Championship 2009--->


