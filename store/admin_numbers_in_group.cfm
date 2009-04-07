<a href="/store/admin_post_data.cfm">LINK to admin page</a><cfset nettotalscore = 0 />

<!-- query that shows groups with full teams-->
<cfquery datasource="#sDSN#" name="qNumInGroup">
	SELECT poolgroup.PoolGroupID, poolgroup.PoolGroupName, COUNT(selectedteams.SelectedTeamID) as NumInGroup
	FROM poolgroup, selectedteams
	WHERE selectedteams.PoolGroupID = poolgroup.PoolGroupID
	GROUP BY selectedteams.PoolGroupID
</cfquery>

<cfquery datasource="#sDSN#" name="qNumFullSquadsInGroup">
	SELECT poolgroup.PoolGroupID, poolgroup.PoolGroupName, COUNT(selectedteams.SelectedTeamID) as NumFullSquads
	FROM poolgroup, selectedteams
	WHERE selectedteams.PoolGroupID = poolgroup.PoolGroupID
	AND selectedteams.fullsquad = 1
	GROUP BY selectedteams.PoolGroupID
</cfquery>

<cfquery datasource="#sDSN#" name="qGolferPopularity">
	SELECT golfer.golferID, golfer.GolferFirstName, golfer.golferLastName, COUNT(selectedteams.Golfer1ID) as Numtimesgolferchosen
	FROM golfer, selectedteams
	WHERE selectedteams.Golfer1ID = golfer.golferID 
	GROUP BY selectedteams.Golfer1ID
</cfquery>
<cfquery datasource="#sDSN#" name="qGolferPopularity2">
	SELECT golfer.golferID, golfer.GolferFirstName, golfer.golferLastName, COUNT(selectedteams.Golfer1ID) as Numtimesgolferchosen
	FROM golfer, selectedteams
	WHERE selectedteams.Golfer2ID = golfer.golferID 
	GROUP BY selectedteams.Golfer2ID
</cfquery>
<cfquery datasource="#sDSN#" name="qGolferPopularity3">
	SELECT golfer.golferID, golfer.GolferFirstName, golfer.golferLastName, COUNT(selectedteams.Golfer1ID) as Numtimesgolferchosen
	FROM golfer, selectedteams
	WHERE selectedteams.Golfer3ID = golfer.golferID 
	GROUP BY selectedteams.Golfer3ID
</cfquery>
<cfquery datasource="#sDSN#" name="qGolferPopularity4">
	SELECT golfer.golferID, golfer.GolferFirstName, golfer.golferLastName, COUNT(selectedteams.Golfer1ID) as Numtimesgolferchosen
	FROM golfer, selectedteams
	WHERE selectedteams.Golfer4ID = golfer.golferID 
	GROUP BY selectedteams.Golfer4ID
</cfquery>
<cfquery datasource="#sDSN#" name="qGolferPopularity5">
	SELECT golfer.golferID, golfer.GolferFirstName, golfer.golferLastName, COUNT(selectedteams.Golfer1ID) as Numtimesgolferchosen
	FROM golfer, selectedteams
	WHERE selectedteams.Golfer5ID = golfer.golferID 
	GROUP BY selectedteams.Golfer5ID
</cfquery>
<cfquery datasource="#sDSN#" name="qGolferPopularity6">
	SELECT golfer.golferID, golfer.GolferFirstName, golfer.golferLastName, COUNT(selectedteams.Golfer1ID) as Numtimesgolferchosen
	FROM golfer, selectedteams
	WHERE selectedteams.Golfer6ID = golfer.golferID 
	GROUP BY selectedteams.Golfer6ID
</cfquery>

<!---
<cfquery datasource="eyeonmajorsu05final" name="qGolferPopularityu05">
	SELECT golfer.golferID, golfer.GolferFirstName, golfer.golferLastName, COUNT(selectedteams.Golfer1ID) as Numtimesgolferchosen
	FROM golfer, selectedteams
	WHERE selectedteams.Golfer1ID = golfer.golferID 
	GROUP BY selectedteams.Golfer1ID
</cfquery>
<cfquery datasource="eyeonmajorsu05final" name="qGolferPopularity2u05">
	SELECT golfer.golferID, golfer.GolferFirstName, golfer.golferLastName, COUNT(selectedteams.Golfer1ID) as Numtimesgolferchosen
	FROM golfer, selectedteams
	WHERE selectedteams.Golfer2ID = golfer.golferID 
	GROUP BY selectedteams.Golfer2ID
</cfquery>
<cfquery datasource="eyeonmajorsu05final" name="qGolferPopularity3u05">
	SELECT golfer.golferID, golfer.GolferFirstName, golfer.golferLastName, COUNT(selectedteams.Golfer1ID) as Numtimesgolferchosen
	FROM golfer, selectedteams
	WHERE selectedteams.Golfer3ID = golfer.golferID 
	GROUP BY selectedteams.Golfer3ID
</cfquery>
<cfquery datasource="eyeonmajorsu05final" name="qGolferPopularity4u05">
	SELECT golfer.golferID, golfer.GolferFirstName, golfer.golferLastName, COUNT(selectedteams.Golfer1ID) as Numtimesgolferchosen
	FROM golfer, selectedteams
	WHERE selectedteams.Golfer4ID = golfer.golferID 
	GROUP BY selectedteams.Golfer4ID
</cfquery>
<cfquery datasource="eyeonmajorsu05final" name="qGolferPopularity5u05">
	SELECT golfer.golferID, golfer.GolferFirstName, golfer.golferLastName, COUNT(selectedteams.Golfer1ID) as Numtimesgolferchosen
	FROM golfer, selectedteams
	WHERE selectedteams.Golfer5ID = golfer.golferID 
	GROUP BY selectedteams.Golfer5ID
</cfquery>
<cfquery datasource="eyeonmajorsu05final" name="qGolferPopularity6u05">
	SELECT golfer.golferID, golfer.GolferFirstName, golfer.golferLastName, COUNT(selectedteams.Golfer1ID) as Numtimesgolferchosen
	FROM golfer, selectedteams
	WHERE selectedteams.Golfer6ID = golfer.golferID 
	GROUP BY selectedteams.Golfer6ID
</cfquery>

--->

<cfdump var="#qNumInGroup#" label="All Users" />
<cfdump var="#qNumFullSquadsInGroup#" label="Full Teams" />

<!---
<cfdump var="#qGolferPopularity#" label="Golfer1ID" />
<cfdump var="#qGolferPopularity2#" label="Golfer2ID" />
<cfdump var="#qGolferPopularity3#" label="Golfer3ID" />
<cfdump var="#qGolferPopularity4#" label="Golfer4ID" />
<cfdump var="#qGolferPopularity5#" label="Golfer5ID" />
<cfdump var="#qGolferPopularity6#" label="Golfer6ID" />

<cfdump var="#qGolferPopularityu05#" label="Golfer1ID" />
<cfdump var="#qGolferPopularity2u05#" label="Golfer2ID" />
<cfdump var="#qGolferPopularity3u05#" label="Golfer3ID" />
<cfdump var="#qGolferPopularity4u05#" label="Golfer4ID" />
<cfdump var="#qGolferPopularity5u05#" label="Golfer5ID" />
<cfdump var="#qGolferPopularity6u05#" label="Golfer6ID" />
--->

<!-- error in chart engine b/c of Linux : -->
<cfchart show3d="yes">
	<cfchartseries
			type = "bar"
			query = "qNumInGroup"
			itemColumn = "PoolGroupName"
			valueColumn = "NumInGroup"
	/>
</cfchart> 



  