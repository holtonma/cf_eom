<a href="/store/admin_post_data.cfm">LINK to admin page</a><cfset nettotalscore = 0 />

<!--- get all records from last event, and add them to next event, with regards to tEntrantGroup --->

<!--- here we want all of the unique entrants and the last group they were in --->
<cfquery datasource="#sDSN2#" name="qAllTeamsLastEvent">
	SELECT DISTINCT(entrantid)
	FROM tentrant
	ORDER BY entrantid ASC
</cfquery>

<!--- , groupid, teamselectedid, finaltiebreakerscore, eventid
	FROM tentrantgroup --->


<!--- <cfdump var="#qAllTeamsLastEvent#"> --->

<cfoutput query="qAllTeamsLastEvent">
	<cfquery datasource="#sDSN2#" name="qLookupLastGroupID">
		SELECT MAX(groupid) as maxgroupid
		FROM tentrantgroup
		WHERE entrantid = #qAllTeamsLastEvent.entrantid#
	</cfquery>
	<!---  20 below equals US Open 2009 --->
	<cfif #Trim(qLookupLastGroupID.maxgroupid)# neq "">
		<cfquery datasource="#sDSN2#" name="qResetGolfer">
			INSERT INTO tentrantgroup (entrantid, groupid, teamselectedid, finaltiebreakerscore, eventid, latestteamnetscore, madecut)
			VALUES(#qAllTeamsLastEvent.entrantid#, #qLookupLastGroupID.maxgroupid#, -1, 0, 20, 0, 1)
		</cfquery>
		<div>EntrantID: #qAllTeamsLastEvent.entrantid# ::: GroupID: #qLookupLastGroupID.maxgroupid#</div>
	</cfif>
</cfoutput> 

<!--- <cfquery datasource="#sDSN2#" name="qCheck">
	SELECT entrantid, groupid, teamselectedid, finaltiebreakerscore, eventid
	FROM tentrantgroup
	WHERE eventid = 13
</cfquery> --->

<!--- <cfdump var="#qCheck#"> --->








  