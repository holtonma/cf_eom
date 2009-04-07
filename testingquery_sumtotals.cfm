<cfquery datasource="#sDSN#" name="qSumTeamScore">
SELECT SUM(CurrentScoreRelPar) as TeamTotal
FROM golfer, selectedteams
WHERE (golfer.golferid = selectedteams.golfer1ID OR golfer.golferid = selectedteams.golfer2ID OR golfer.golferid = selectedteams.golfer3ID
OR golfer.golferid = selectedteams.golfer4ID OR golfer.golferid = selectedteams.golfer5ID OR golfer.golferid = selectedteams.golfer6ID)
AND selectedteams.poolpersonid = 2
</cfquery>


<cfdump var="#qSumTeamScore#">


