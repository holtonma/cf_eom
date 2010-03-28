<a href="/store/admin_post_data.cfm">LINK to admin page</a><cfset nettotalscore = 0 />

<!--- --->
<!--- resets selected teams table --->
<cfquery datasource="#sDSN#" name="qResetSelectedTeams">
	UPDATE tteamselected
	SET Golfer1ID = 0, Golfer2ID = 0, Golfer3ID = 0, Golfer4ID = 0, Golfer5ID = 0, Golfer6ID = 0, fullsquad = 0, madecut = 0, latest_teamnetscore = 1000, tiebreaker = 0, madecut = 1
</cfquery>

<cfquery datasource="#sDSN#" name="qResetGolfer">
	UPDATE golfer
	SET CurrentScoreRelPar = 0
</cfquery>








  