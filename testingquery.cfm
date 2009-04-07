<cfquery datasource="#sDSN#" name="qAllTeamsInGroup"  username="eyeonmajors" >
SELECT entrantID, entrantLastName
FROM poolperson
ORDER BY entrantID ASC
</cfquery>


<cfdump var="#qAllTeamsInGroup#">


