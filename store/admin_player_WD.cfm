<style type="text/css">
<!--
.style1 {color: #000000}
-->
</style>
<a href="/store/admin_post_data.cfm">LINK to admin page</a><cfset nettotalscore = 0 />

<cfset wdgolferid = 79 />
<!-- query that selects all teams with a selected player that has previously been active yet WITHDRAWN-->
<cfquery datasource="#sDSN#" name="qAlertAboutWD">
	SELECT DISTINCT poolperson.EntrantID, poolperson.emailaddy
	FROM poolperson, selectedteams
	WHERE selectedteams.Golfer1ID = #wdgolferid# OR selectedteams.Golfer2ID = #wdgolferid#
	OR selectedteams.Golfer3ID = #wdgolferid# OR selectedteams.Golfer4ID = #wdgolferid#
	OR selectedteams.Golfer5ID = #wdgolferid# OR selectedteams.Golfer6ID = #wdgolferid#
</cfquery>

<cfoutput><span class="style1">#ValueList(qAlertAboutWD.EmailAddy)#</span></cfoutput>

<cfquery datasource="#sDSN#" name="qWD1">
	UPDATE selectedteams
	SET Golfer1ID = 0, fullsquad = 0
	WHERE selectedteams.Golfer1ID = #wdgolferid#
</cfquery>
<cfquery datasource="#sDSN#" name="qWD2">
	UPDATE selectedteams
	SET Golfer2ID = 0, fullsquad = 0
	WHERE selectedteams.Golfer2ID = #wdgolferid#
</cfquery>
<cfquery datasource="#sDSN#" name="qWD3">
	UPDATE selectedteams
	SET Golfer3ID = 0, fullsquad = 0
	WHERE selectedteams.Golfer3ID = #wdgolferid#
</cfquery>
<cfquery datasource="#sDSN#" name="qWD4">
	UPDATE selectedteams
	SET Golfer4ID = 0, fullsquad = 0
	WHERE selectedteams.Golfer4ID = #wdgolferid#
</cfquery>
<cfquery datasource="#sDSN#" name="qWD5">
	UPDATE selectedteams
	SET Golfer5ID = 0, fullsquad = 0
	WHERE selectedteams.Golfer5ID = #wdgolferid#
</cfquery>
<cfquery datasource="#sDSN#" name="qWD6">
	UPDATE selectedteams
	SET Golfer6ID = 0, fullsquad = 0
	WHERE selectedteams.Golfer6ID = #wdgolferid#
</cfquery>

  