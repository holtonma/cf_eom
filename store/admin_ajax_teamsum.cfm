
<!--- UPDATE latestteamnetscore for all players --->
<cfset fullsquadlist = "">
<cfquery datasource="#sDSN2#" name="qAllFullSquadEntrantIDs">
	SELECT DISTINCT tTS.entrantid from tteamselected tTS where tTS.golferid > 0
</cfquery>
<cfoutput query="qAllFullSquadEntrantIDs">
	<cfset fullsquadlist=#ListAppend(fullsquadlist, qAllFullSquadEntrantIDs.entrantid)#>   
</cfoutput>
<cfoutput>
	<cfquery datasource="#sDSN2#" name="qAllTeamsGlobal" >
		SELECT 
			tE.entrantid, tE.lname as entrantLastName, tE.fname as entrantFirstName,
			tEG.teamselectedid, tEG.finaltiebreakerscore as tiebreaker, tEG.latestteamnetscore as latest_teamnetscore
		FROM 
			tentrant tE 
			INNER JOIN tentrantgroup tEG ON tE.entrantid = tEG.entrantID
		WHERE 
			tEG.eventid = #SESSION.currenteventid#
			AND
			tEG.teamselectedid > 0
			AND
			tEG.entrantid IN (#fullsquadlist#)
		
	</cfquery>
</cfoutput>
<cfoutput query="qAllTeamsGlobal">
		<cfquery name="qHandicapSum" datasource="#sDSN2#">
			SELECT SUM(tH.numstrokes) as totalhandicapstrokes
			FROM thandicaps tH INNER JOIN tteamselected tTS ON tH.golferid = tTS.golferid 
			WHERE 
				tTS.entrantID = #qAllTeamsGlobal.entrantid#
				AND 
				tTS.eventid = #SESSION.eventid#
				AND
				tH.eventid = #SESSION.eventid#
		</cfquery>
		
		<!--- tH.golferid = tTS.golferid 
				AND AND
				tTS.eventid = tH.eventid--->
		<cfquery datasource="#sDSN2#" name="qSumTeamScore" >
			SELECT SUM(CurrentScoreRelPar) as TeamTotal
			FROM tgolfer tG, tteamselected tTS
			WHERE 
				tTS.golferid = tG.GolferID
				AND
				tTS.entrantID = #qAllTeamsGlobal.entrantID#
				AND
				tTS.eventid = #SESSION.eventid#
	  </cfquery>
	  	
	  	<cfif qHandicapSum.totalhandicapstrokes neq "">
			<cfif qHandicapSum.totalhandicapstrokes GTE 0 >
				<cfset nettotalscore = #Val(qHandicapSum.totalhandicapstrokes + qSumTeamScore.TeamTotal)#  />
			<cfelse>
				<cfset nettotalscore = #Val(qHandicapSum.totalhandicapstrokes + qSumTeamScore.TeamTotal)#/>
			</cfif>
		<cfelse>
			<cfset nettotalscore = #Val(qSumTeamScore.TeamTotal)#  />
		</cfif>
		<cfif entrantID eq 1>
			<!--- handicapsum:<cfdump var="#qHandicapSum#"> --->
			<cfquery name="qHandicapInd" datasource="#sDSN2#">
			SELECT tH.numstrokes, tTS.teamselectedid, tTS.golferid
			FROM thandicaps tH INNER JOIN tteamselected tTS ON tH.golferid = tTS.golferid 
			WHERE 
				tTS.entrantID = #qAllTeamsGlobal.entrantid#
				AND 
				tTS.eventid = #SESSION.eventid#
				AND
				tH.eventid = #SESSION.eventid#
			</cfquery>
			<!--- handicapInd:<cfdump var="#qHandicapInd#">
			SumTeamScore:<cfdump var="#qSumTeamScore#">
			nettotalscore: <cfdump var="#nettotalscore#"> --->
		</cfif>
	<cfquery name="qUpdatetEG" datasource="#sDSN2#">
		UPDATE tentrantgroup tEG
		SET latestteamnetscore = #nettotalscore#
		WHERE entrantid = #qAllTeamsGlobal.entrantid#
		AND eventid = #SESSION.eventid#
	</cfquery>
</cfoutput>


<cfoutput>Last updated 6-count-6 totals: #DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "hh:mm:ss tt")#</cfoutput>




