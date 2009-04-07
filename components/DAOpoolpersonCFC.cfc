
<cfcomponent name="DAOpoolpersonCFC" displayname="DAOpoolpersonCFC" extends="ajax">

	<cfset THIS.poolpersonID = -1>
	<cfset sDSN2 = "eyeon2">
	
	<cffunction name="GetTabsForUser" access="public" returntype="query" hint="This returns a recordset of all tabs in each user's page upon login">
		<cfargument name="datasource" displayname="datasource" required="yes" type="string">
		<cfargument name="eventid" displayname="eventid" required="yes" type="numeric" hint="the eventid of the current event">
		<!--- <cfproperty name="poolpersonID" displayname="poolpersonID" hint="patrons poolpersonid from database" required="yes" default="-1" type="numeric"> --->
		<!--- this query will obtain all of the groups this user is entered in for this event--->
		<cfoutput>
			<cfquery name="qry_getUserTabs" dbname="eyeon2" dbtype="query">
				SELECT groupname
				FROM tGroup, tEntrantGroup
				WHERE tGroup.GroupID = tEntrantGroup.GroupID
				AND tEntrantGroup.EventID = 9 
				<!---
				SELECT groupname
				FROM tGroup
				LEFT OUTER JOIN tEntrantGroup ON tGroup.GroupID = tEntrantGroup.GroupID
				WHERE tEntrantGroup.EventID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#">
				--->
			</cfquery>
		</cfoutput>
		
		<cfreturn qry_getUserTabs>
	</cffunction>
	
	
</cfcomponent>