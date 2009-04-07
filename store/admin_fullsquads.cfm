<a href="/store/admin_post_data.cfm">LINK to admin page</a><cfset nettotalscore = 0 />

<!--- query that shows total with full teams --->
<cfquery datasource="#sDSN2#" name="qNumFullSquads">
	SELECT COUNT(tEG.entrantgroupuniqueid) as NumFullSquads
	FROM tentrantgroup tEG
	WHERE tEG.eventid = #SESSION.eventid#
	AND tEG.teamselectedid > 0
	AND tEG.finaltiebreakerscore IS NOT NULL
</cfquery>

<!--- query that shows signups that happened gt date --->
<cfquery datasource="#sDSN2#" name="qNumSignups">
	SELECT COUNT(tEG.entrantid) as NumInGroup, tG.groupid, tG.groupname 
	FROM tentrantgroup tEG 
	LEFT OUTER JOIN tgroup tG ON tG.groupid = tEG.groupid
	WHERE tEG.eventid = #SESSION.eventid# 
	AND tEG.teamselectedid > 0
	AND tEG.finaltiebreakerscore IS NOT NULL
	GROUP BY tEG.groupid
	ORDER BY NumInGroup DESC
</cfquery>

<div>
	<cfdump var="#qNumFullSquads#" label="Number of Full Squads" />
</div>
<div>
<cfdump var="#qNumSignups#" label="Number of Signups today" />
</div>

<!--- UPDATE logins SET numlogins = numlogins+1 WHERE entrantid = 1 AND eventid = 13 --->



  