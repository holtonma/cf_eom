	
<cfif IsDefined("SESSION.eventid")>
  
	<!-- use patron id to populate other patron info -->
	<cfquery datasource="#sDSN2#" name="qPatronInfo">
	   SELECT 
	   	EntrantID, lname, fname, roleid, 
	   	EmailAddy
	   FROM 
	   	tentrant
	   WHERE tentrant.EntrantID = #SESSION.entrantid#
	</cfquery> <!--- v2: find GroupID elsewhere --->

	<!--- AND fullsquad = 1  when tourney starts --->
	<!--- obtain latestteamnetscore and groupnames from as many groups as this person is in--->
	<cfquery datasource="#sDSN2#" name="qYourScoresAndGroupNames">
		SELECT 
			tEG.groupid, tEG.latestteamnetscore, tG.GroupName
		FROM 
			tentrantgroup tEG LEFT OUTER JOIN tgroup tG ON tEG.groupid = tG.groupid
		WHERE 
			entrantid = #qPatronInfo.EntrantID#
		LIMIT 1
	</cfquery> 
	
	<cfquery datasource="#sDSN2#" name="qPatronGroup2">
		SELECT groupid, latestteamnetscore as myscore
		FROM tentrantgroup tEG
		WHERE entrantid = #SESSION.entrantid#
		AND eventid = #SESSION.eventid#
	</cfquery>
	
	<cfif qPatronGroup2.RecordCount eq 0>
		<cfset qWorldRanking.NumAheadofMe = 0>
	<cfelse>
		<cfquery datasource="#sDSN2#" name="qWorldRanking">
			SELECT COUNT(latestteamnetscore) as NumAheadofMe
			FROM tentrantgroup
			WHERE latestteamnetscore < #qPatronGroup2.myscore#
			AND eventid = #SESSION.eventid#
			AND teamselectedid > -1
		</cfquery>
	</cfif>
	
	<cfset currentWorldRanking = #qWorldRanking.NumAheadofMe# + 1>
	
	<cfquery datasource="#sDSN2#" name="qGroupRanking">
		SELECT COUNT(latestteamnetscore) as NumAheadofMe
		FROM tentrantgroup
		WHERE 
		madecut = 1
		AND latestteamnetscore < #qPatronGroup2.myscore#
		AND groupid = #SESSION.patrongroupid#
		AND eventid = #SESSION.eventid#
		AND teamselectedid > -1
	</cfquery> <!--- fullsquad = 1 --->
	<cfset currentGroupRanking = #qGroupRanking.NumAheadofMe# + 1>
	<!--- when tourney starts 
	WHERE fullsquad = 1
		AND madecut = 1
		AND latest_teamnetscore < #qUsersNet.latest_teamnetscore# --->
	<!--- <cfquery datasource="#sDSN2#" name="qWorldRanking">
		SELECT Count(latest_teamnetscore) as NumAheadofMe
		FROM selectedteams
		WHERE fullsquad = 1
		AND madecut = 1
		AND latest_teamnetscore < #qUsersNet.latest_teamnetscore#
	</cfquery>  --->
	
	<!--- <cfquery datasource="#sDSN2#" name="qMadeOrMissedCut">
		SELECT MadeCut
		FROM selectedteams
		WHERE poolpersonID = #qPatronInfo.EntrantID#
	</cfquery> --->
	
	<!--- 
	<cfquery name="qry_getUserTabs" datasource="eyeon2" dbtype="query">
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
	</cfquery>--->
	
	<!--- after tourney has concluded --->
	
	<cfset SESSION.patronID = #SESSION.entrantid#/>
	<cfset SESSION.patronLastName = '#qPatronInfo.lname#' />
	<cfset SESSION.patronFirstName = '#qPatronInfo.fname#' />
	<cfset SESSION.patronEmail = '#qPatronInfo.EmailAddy#' />
	
	<!--- create an array --->
	<cfset aGroups = ArrayNew(1)>
	<!--- loop through query, append names successively to last element --->
	<cfloop query = "qYourScoresAndGroupNames">
	   <cfset temp = ArrayAppend(aGroups, "#groupid#")>
	</cfloop>
	<!--- show the resulting array as a list --->
	<cfset listOfGroups = ArrayToList(aGroups, ",")>
	
	<!--- <cfset SESSION.patronGroupID = #qYourScoresAndGroupNames.groupid# /> --->
	
	<!--- <cfparam name="firstGroupInList" default="#aGroups[1]#"> --->
	
	<!--- current ranking ifs, when tourney begins --->
	<!--- <cfif #qMadeOrMissedCut.MadeCut# EQ 0>
		<cfset currentRanking = "[Missed Cut]">
	<cfelse>
		<cfset currentRanking = #qWorldRanking.NumAheadofMe# + 1>
	</cfif> --->
<cfelse>
  <cflocation url="../login.cfm">
</cfif>

