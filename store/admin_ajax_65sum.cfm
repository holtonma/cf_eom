<!--- UPDATE latestteamnetscore for all players --->
<cfset fullsquadlist = "">
<!--- for this event only, all fullsquad entrantid's--->
<cfquery datasource="#sDSN2#" name="qAllFullSquadEntrantIDs"> 
	SELECT DISTINCT tTS.entrantid from tteamselected tTS where tTS.golferid > 0 AND tTS.eventid = #SESSION.currenteventid#
</cfquery>

<cfoutput query="qAllFullSquadEntrantIDs">
	<cfset fullsquadlist=#ListAppend(fullsquadlist, qAllFullSquadEntrantIDs.entrantid)#>   
</cfoutput>

<cfoutput>
	<!--- all teams for this eventID who made the cut in the pick-6-count-5 format --->
	<cfquery datasource="#sDSN2#" name="qAllTeamsGlobal" >
		SELECT 
			tE.entrantid, tE.lname as entrantLastName, tE.fname as entrantFirstName,
			tEG.teamselectedid, tEG.finaltiebreakerscore as tiebreaker, tEG.latest65netscore as latest_teamnetscore
		FROM 
			tentrant tE 
			INNER JOIN tentrantgroup tEG ON tE.entrantid = tEG.entrantID
		WHERE 
			tEG.eventid = #SESSION.currenteventid#
			AND
			tEG.teamselectedid > 0
			AND
			tEG.entrantid IN (#fullsquadlist#)
		  AND
		  tEG.65madecut = 1
		
	</cfquery>
</cfoutput>

<cfoutput query="qAllTeamsGlobal">
	  <!--- for 6-count-5 we have to SUM the handicaps based on whether or not the golfers GROSS+HCP is in the 
		selectedTeam's TOP5 : so this must change to only count the top 5 for that user --->
		
		<!--- find the 5 records for this team with the lowest NET on the team --->
		<cfquery name="qLowest5of6" datasource="#sDSN2#">
			SELECT 
			  tG.golferid, tG.currentScoreRelPar, tH.numstrokes,
			  tG.eventid, (tG.currentscorerelpar + tH.numstrokes) as gNet
			FROM tgolfer tG
			LEFT OUTER JOIN thandicaps tH ON tH.golferid = tG.golferid AND tH.eventid = tG.eventid
			WHERE 
			  tG.golferid IN(
				  select tTS.golferid from tteamselected tTS 
				  where tTS.eventid = #SESSION.eventid# 
				  AND tTS.entrantid = #qAllTeamsGlobal.entrantid# 
				)
			AND
			tG.eventID = #SESSION.eventid#
			AND
			tG.active = 1
			ORDER BY gNET ASC
			LIMIT 5
		</cfquery>
		<cfquery name="qSumLow5" dbtype="query">
		  SELECT SUM(gNet) as low_5_total
		  FROM qLowest5of6
		</cfquery>		
		
		<cfset nettotalscore = Val(qSumLow5.low_5_total)>
	  
	  <!---
	  <div>
			entrantID: #qAllTeamsGlobal.entrantid#  -- NET 5 of 6 total: #nettotalscore#
		</div>
		--->
		
		<cfquery name="qUpdatetEG" datasource="#sDSN2#">
			UPDATE tentrantgroup tEG
			SET tEG.latest65netscore = #nettotalscore#
			WHERE tEG.entrantid = #qAllTeamsGlobal.entrantid#
			AND tEG.eventid = #SESSION.eventid#
		</cfquery>
</cfoutput>


<cfoutput>Last updated 6-count-5 Net totals: #DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "hh:mm:ss tt")#</cfoutput>




