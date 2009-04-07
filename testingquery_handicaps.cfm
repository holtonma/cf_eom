
<cfquery datasource="#sDSN#" name="qAllTeamsInGroup">
SELECT poolperson.entrantID, poolperson.entrantLastName, poolperson.entrantFirstName, poolperson.selectedteam1id as SelectedTeam,
poolperson.groupid, selectedteams.golfer1ID, selectedteams.golfer2ID, selectedteams.golfer3ID, selectedteams.golfer4ID, selectedteams.golfer5ID, selectedteams.golfer6ID
FROM poolperson, selectedteams
WHERE poolperson.EntrantID = selectedteams.poolpersonID AND poolperson.groupid = selectedteams.PoolGroupID
ORDER BY poolperson.entrantID ASC
</cfquery>

<cfoutput query="qAllTeamsInGroup">
		<cfquery datasource="#sDSN#" name="qHandicapSum">
			  SELECT Sum(HandicapStrokes) as TotHndcpStrForEntrant
			  FROM EoMHandicaps
			  WHERE GolferID = #qAllTeamsInGroup.golfer1ID# OR GolferID = #qAllTeamsInGroup.golfer2ID# OR GolferID = #qAllTeamsInGroup.golfer3ID#
			  OR GolferID = #qAllTeamsInGroup.golfer4ID# OR GolferID = #qAllTeamsInGroup.golfer5ID# OR GolferID = #qAllTeamsInGroup.golfer6ID#
		</cfquery> 
</cfoutput>


<cfoutput> #qAllTeamsInGroup.golfer1ID# </cfoutput>
<cfdump var="#qAllTeamsInGroup#">
<cfdump var="#qHandicapSum#">


