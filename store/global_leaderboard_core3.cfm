<cfset nettotalscore = 0 />
<cfset currentplace = 0 />
<cfset outputplace = 0 />
<cfset teamTotNETprev = -1234 />
<!--- tiedPLbool: 0 = not tied; 1 = tied --->
<cfset tieldPLbool = 0 />

<cfparam name="pagegroupid" default="#SESSION.patrongroupid#">  <!--- defaults to last groupid  --->
<!--- this query will return the single record (groupID) related to the authorized user   #sDSN#---><!--- 
this is no longer needed because of SESSION.patrongroupid, and pagegroupid set the page to the current groupid that the patron wants to see (if patron has more than 1 group )--->
<!--- <cfquery datasource="#sDSN2#" name="qSpecificGroupID" >
	SELECT 
		poolperson.EntrantID, poolperson.GroupID, poolgroup.PoolgroupID
	FROM 
		poolperson, poolgroup
	WHERE 
		poolperson.EntrantID = #GetAuthUser()#
		AND 
		poolgroup.PoolgroupID = #SESSION.patrongroupid#
</cfquery> --->

<!--- version 1 --->
<!--- after cut :: 
AND selectedteams.fullsquad = 1 AND selectedteams.madecut = 1
--->
<!--- <cfquery datasource="#sDSN2#" name="qAllTeamsGlobal" >
SELECT 
	poolperson.entrantID, poolperson.entrantLastName, poolperson.entrantFirstName, poolperson.selectedteam1id as SelectedTeam,
	poolperson.groupid, selectedteams.golfer1ID, selectedteams.golfer2ID, selectedteams.golfer3ID, selectedteams.golfer4ID, selectedteams.golfer5ID, selectedteams.golfer6ID,
	selectedteams.latest_teamnetscore
FROM 
	poolperson, selectedteams
WHERE 
	poolperson.EntrantID = selectedteams.poolpersonID AND poolperson.groupid = selectedteams.PoolGroupID
ORDER BY selectedteams.latest_teamnetscore ASC
LIMIT 100
</cfquery> --->
<!--- join tentrant, tentrantgroup, tteamselected and limit based upon entrantid, groupid, eventid --->
<!--- <cfquery datasource="#sDSN2#" name="qAllTeamsGlobal" >
	SELECT 
		tE.entrantID, tE.lname as entrantLastName, te.fname as entrantFirstName, 
		tTS.teamselectedid as SelectedTeam, tTS.golferid,
		tEG.groupid, selectedteams.golfer1ID, selectedteams.golfer2ID, 
		selectedteams.golfer3ID, selectedteams.golfer4ID, selectedteams.golfer5ID, selectedteams.golfer6ID,
		selectedteams.latest_teamnetscore
	FROM 
		tentrant tE
			LEFT OUTER JOIN tentrantgroup tEG ON tE.entrantid = tEG.entrantid
			LEFT OUTER JOIN tteamselected tTS ON tE.entrantid = tTS.entrantid
	WHERE 
		tEG.entrantid = #SESSION.entrantid# 
		AND 
		tEG.groupid = #pagegroupid#
		AND
		tEG.eventid = #SESSION.eventid#
	ORDER BY selectedteams.latest_teamnetscore ASC
	LIMIT 100
</cfquery> --->
<cfset fullsquadlist = "">
<cfquery datasource="#sDSN2#" name="qAllFullSquadEntrantIDs">
	SELECT DISTINCT tTS.entrantid FROM tteamselected tTS WHERE tTS.golferid > 0 AND tTS.eventid = #SESSION.eventid#
</cfquery>
<cfoutput query="qAllFullSquadEntrantIDs">
	<cfset fullsquadlist=#ListAppend(fullsquadlist, qAllFullSquadEntrantIDs.entrantid)#>   
</cfoutput>

<!---
	AND
	tEG.entrantid IN (#fullsquadlist#)  
	AND
		tEG.madecut = 1 --->
<cfquery datasource="#sDSN2#" name="qAllTeamsGlobal" >
	SELECT 
		tE.entrantid, tE.lname as entrantLastName, tE.fname as entrantFirstName,
		tEG.teamselectedid, tEG.finaltiebreakerscore as tiebreaker, tEG.latestteamnetscore as latest_teamnetscore
	FROM 
		tentrant tE 
		INNER JOIN tentrantgroup tEG ON tE.entrantid = tEG.entrantID
	WHERE 
		tEG.eventid = #SESSION.eventid#
		AND
		tEG.teamselectedid > 0
		AND
		tEG.madecut = 1
		AND
		tEG.entrantid IN (#fullsquadlist#)
	ORDER BY 
		tEG.latestteamnetscore ASC, entrantLastName ASC
	LIMIT 100
</cfquery>

<!--- AND
tEG.entrantid IN (#fullsquadlist#)--->
<cfquery datasource="#sDSN2#" name="qCountGlobalTeams" >
	SELECT 
		count(tE.entrantid) as numglobal 
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

<!--- version 1 --->
<!--- <cfquery datasource="#sDSN2#" name="qCutline">
	SELECT Cutline, LastUpdatedTime
	FROM currentcutline
	WHERE CurrentCutlineID = 8
</cfquery> --->
<cfquery datasource="#sDSN2#" name="qTenShotCutline">
	SELECT MIN(CurrentScoreRelPar) as CutLessTen
	FROM tgolfer
	WHERE active = 1
</cfquery>

<!--- obtain event and event name information --->
<cfquery datasource="#sDSN2#" name="qEventInfo">
	SELECT 
		tEs.eventyear,
		tEN.eventname,
		tEs.DateTimeLastUpdated
	FROM
		teventname tEN LEFT OUTER JOIN tevents tEs ON tEN.eventnameid = tEs.eventnameid
	WHERE
		tEs.eventID = #SESSION.currenteventid#
</cfquery>

<cfset tourneyname = #qEventInfo.eventname#>
<!-- this will be set by a random query to the database-->
<cfset strRandomMajorFact = "Major fact: the first ALBATROSS at The Masters was in 1935 by Gene Sarazen at the 15th hole.  There have been two in the tournament's history since then." />
<cfset strRandomMajorFactover = "Major fact: In 1956, Jack Burke, Jr. won The Masters by one-stroke over Ken Venturi with a total of +1, 289 strokes." />
<cfset strRandomMajorFacteven = "Major fact: In 1966, Jack Nicklaus finished with an EVEN par 288 total, and won his 2nd consecutive Masters, and his 3rd Green Jacket overall." />
<!-- -->
				
				
				

<cfset winnershare = #qAllTeamsGlobal.recordcount# * 10 />
<cfset strCutline = "" />
<form action="groupleaderboard_manage.cfm" method="post">
  <div class="leaderboardheader">
    <div align="center" style="font-size:11px; padding-top:7px;">
		  <cfoutput>
		  #Int(qCountGlobalTeams.numglobal)# Patrons competing for the prizes (those with at least 5 friends in a group).  Good luck!
		  <div>EyeOnMajors rewards the winner of our global game: one dozen golf balls of your choice and a free copy of The Aviary golf software.</div>
		  </cfoutput>
	  </div>
  </div> 
  <div align="center"><br>
  </div>
  <cfset ccutline = 100/>  <!-- set to 1000 b/c it's after the cut has been made, therefore don't want to indicate players are approaching cut, etc-->
  <cfif #ccutline# EQ 0>
	 <cfset strCutline = "E" />
  <cfelseif #ccutline# LT 0>
	 <cfset strCutline = #ccutline# /> 
  <cfelseif #ccutline# GT 0>
	  <cfset strCutline = #ccutline# />
  </cfif>
  <cfset finalcutline = 4 />
  <div class="headerTeam"></div> <!-- <cfoutput>#finalcutline#</cfoutput> or better<br> -->
  <!-- Eye on Majors Cut Line : only 3 of <cfoutput>#qAllTeamsGlobal.recordcount#</cfoutput> make the cut</div> <br> -->
  <cfoutput>Leaderboard last updated : #qEventInfo.DateTimeLastUpdated#</cfoutput> PST
  
  <table width="100%">
    <tr valign="top">
	  <td>
	    <table width="100%" class="white">
          <tr>
			<td class="tblehead" align="center">Current Place</td>
			<td class="tblehead" align="center">
				<div>Pool</div>
				<div>Entrant</div>
			</td>
	        <td class="tblehead" align="center">Golfer 1</td>
			<td class="tblehead" align="center">Golfer 2</td>
			<td class="tblehead" align="center">Golfer 3</td>
			<td class="tblehead" align="center">Golfer 4</td>
			<td class="tblehead" align="center">Golfer 5</td>
			<td class="tblehead" align="center">Golfer 6</td>
	        <td class="tblehead" align="center">EoM <br> Handicaps</td> 
			<td class="tblehead" align="center">Team <br> Gross</td> 
			<td class="tblehead" align="center">Team Total <br> NET </td>
			<td class="tblehead" align="center">Prize Eligible?</td>
          </tr>
		  <cfoutput query="qAllTeamsGlobal">
			<cfif #qAllTeamsGlobal.entrantid# eq #SESSION.entrantid#>
					<cfset classname="yourgroup">
					<cfset classnamescore = "largegrntxtmyteam">
					<!--- <cfdump var="#classname#"> --->
				<cfelse>
					<cfset classname="ltturq">
					<cfset classnamescore = "largegrntxt">
				</cfif>
		  	<tr>
		        <td height="40"  align="center" class="ltturq">
					<cfset currentplace = currentplace + 1 />
					<cfif currentplace eq 1 >
						<cfif tieldPLbool EQ 0>
							  <!-- not a tie, use next place -->
							  <cfset outputplace = currentplace/>
							  Eyeing the<br>EyeOnMajors.com <br>
							  <div class="evenpartextongreenlarge">World<br>Championship</div>
						<cfelse>
							  <!-- tie, use first tied place -->
							  <cfset outputplace = outputplace/>
							  ...eyeing <br>
							  the <br>
							  <div class="evenpartextongreenlarge">$#winnershare#</div>
						</cfif>
					<cfelse>
						No <br>
						pts <br>
						for <br>
						no. #currentplace#
					</cfif>
				</td>
				<td height="40" class="ltturq" style="text-transform: capitalize;">
				  <div>#qAllTeamsGlobal.entrantLastName#,<!--- #qAllTeamsGlobal.entrantid#, #qAllTeamsGlobal.teamselectedid# ---></div>
				  <div>#qAllTeamsGlobal.entrantFirstName#</div>
				</td>
				<!--- loop through team selected and output td's --->
				<!--- ** COLUMN 3 thru 9 [3 + Num players in group] ** --->
	            <cfquery name="qATeamOfGolfers" datasource="#sDSN2#">
				  	SELECT 
				  		tTS.teamselectedid, tTS.entrantid, tTS.groupid, tTS.golferid, tTS.eventid,
				  		tG.GolferFirstName, tG.GolferLastName, tG.CurrentScoreRelPar, tG.GolferImage
				  	FROM 
				  		tteamselected tTS INNER JOIN tgolfer tG ON tTS.golferid = tG.GolferID
				  	WHERE 
				  		tTS.teamselectedid = #qAllTeamsGlobal.teamselectedid#
				  		AND 
				  		tTS.eventid = #SESSION.eventid#
				</cfquery>
				<!--- line 197 group_leaderboard_core.cfm: </br>
				<cfdump var="#qATeamOfGolfers#"> --->
				<!---  --->
					<cfloop query="qATeamOfGolfers" >
						<td height="40" align="center" class="#classname#">
								<!--- image --->
								<div><img src="#qATeamOfGolfers.GolferImage#.gif" /></div> 
								<!--- lastname --->
								<div>#qATeamOfGolfers.GolferLastName#</div>
								<!--- scorerelpar, with formatted output (R, G, black) --->
								<cfif qATeamOfGolfers.CurrentScoreRelPar EQ 0>
								<div class="coreboardeven" title="#strRandomMajorFacteven#"> E </div> 
							  	<cfelseif qATeamOfGolfers.CurrentScoreRelPar LT 0>
								<div class="coreboardsub" title="#strRandomMajorFact#">#qATeamOfGolfers.CurrentScoreRelPar#</div> 
							  	<cfelseif qATeamOfGolfers.CurrentScoreRelPar GT 0>
							  	<div class="coreboardover" title="#strRandomMajorFactover#">+#qATeamOfGolfers.CurrentScoreRelPar#</div>  
							  	</cfif>
							</td>
					</cfloop>
				<!--- ***** handicaps and eligible for prizes below *****	 --->
				
				<!--- global pool is with handicaps, handicaps --->
					<!--- loop through qATeamOfGolfers above and counted up the total handicap sum --->
					<cfquery name="qHandicapSum" datasource="#sDSN2#">
						SELECT SUM(tH.numstrokes) as totalhandicapstrokes
						FROM thandicaps tH, tteamselected tTS
						WHERE 
							tH.golferid = tTS.golferid 
							AND
							tTS.entrantID = #qAllTeamsGlobal.entrantid#
							AND 
							tTS.eventid = #SESSION.eventid#
							AND
							tH.eventid = #SESSION.eventid#
					</cfquery>
					<td height="40"  class="ltturq" align="center">
						<cfif qHandicapSum.totalhandicapstrokes GT 0>
							+#qHandicapSum.totalhandicapstrokes#
						<cfelseif qHandicapSum.totalhandicapstrokes LT 0>
							<span style="color:red;">#qHandicapSum.totalhandicapstrokes#</span>
						<cfelse>
							--
						</cfif>
					</td>
				
				 <!--- ** Team Gross COLUMN N (10 normally) ** --->
				<td height="40" class="largegrntxt" align="center">
  				  <cfquery datasource="#sDSN2#" name="qSumTeamScore" >
						SELECT SUM(CurrentScoreRelPar) as TeamTotal
						FROM tgolfer tG, tteamselected tTS
						WHERE 
							tTS.golferid = tG.GolferID
							AND
							tTS.entrantID = #qAllTeamsGlobal.entrantID#
							AND
							tTS.eventid = #SESSION.currenteventid#
				  </cfquery>
					  <cfif #qSumTeamScore.TeamTotal# GT 0>
						  <div class="grossoverpartextongreen">+ #qSumTeamScore.TeamTotal#</div>
					  <cfelseif #qSumTeamScore.TeamTotal# EQ 0>
						  <div class="grossevenpartextongreen">E</div>
					  <cfelse>
						  <div class="grosssubpartextongreen">#qSumTeamScore.TeamTotal#</div>
					  </cfif>	  
				</td>
				
				<td height="40" class="largegrntxt" align="center">
				<!-- turn this into an array: array(i, NET, ID)? -->
					<cfif qHandicapSum.totalhandicapstrokes neq "">
						<cfif qHandicapSum.totalhandicapstrokes GTE 0 >
							<cfset nettotalscore = #Val(qHandicapSum.totalhandicapstrokes + qSumTeamScore.TeamTotal)#  />
						<cfelse>
							<cfset nettotalscore = #Val(qHandicapSum.totalhandicapstrokes + qSumTeamScore.TeamTotal)#/>
						</cfif>
					<cfelse>
						<cfset nettotalscore = #Val(qSumTeamScore.TeamTotal)#  />
					</cfif>
				
					<cfparam name="nettotalscore" default="0">
					<cfif nettotalscore GT 0>
							<cfif nettotalscore GT 80>
								<div class="overpartextongreenlarge">CUT?</div>
							<cfelse>
								<div class="overpartextongreenlarge">+ #nettotalscore#</div>
							</cfif>
					<cfelseif nettotalscore EQ 0>
						<div class="evenpartextongreenlarge">E</div>
					<cfelse>
						<div class="subpartextongreenlarge">#nettotalscore#</div>
					</cfif>
						<!-- this block is for the next iteration determining if the PLACE is a tie-->
						  <cfif teamTotNETprev EQ #nettotalscore#>
						  		<!-- tied last pool entrant -->
								<cfset tieldPLbool = 1 />
						  <cfelse>
						  		<!-- not tied last pool entrant -->
						  		<cfset tieldPLbool = 0 />
						  </cfif>
						  <cfset teamTotNETprev = #nettotalscore# />
				</td>
				<td height="40" class="largegrntxt" align="center">
					<!--- obtain the groupid for this entrant (limit 1) --->
					<cfquery datasource="#sDSN2#" name="qGetGroupID">
						SELECT groupid from tentrantgroup WHERE entrantid = #qAllTeamsGlobal.entrantid#
					</cfquery>
					<cfset prizeeligible = 0>
					<cfloop query="qGetGroupID" startrow="1" endrow="#qGetGroupID.RecordCount#">
						<cfquery datasource="#sDSN2#" name="qCheckEligible">
							SELECT Count(entrantid) as numTeamsInGroup
							FROM tentrantgroup tEG
							WHERE groupid = #qGetGroupID.groupid#
						</cfquery>
						<cfif qCheckEligible.numTeamsInGroup GTE 5>
							<cfset prizeeligible = 1>
							<cfbreak>
						<cfelse>
							<cfset prizeeligible = 0>
						</cfif>
					</cfloop>
					<!-- this is where the prize eligible goes... if groupID > 10-->
					<cfif #prizeeligible# eq 1>
						<div class="coreboardeven" title="eligibility requires 5 full teams in group">YES!</div>
					<cfelse>
						<cfset needXplayers = (5 - qCheckEligible.numTeamsInGroup)>
						<div class="coreboardover" title="eligibility requires 5 full teams in group">no<!--- t<br>yet ---></div>
						<div style="font-size:x-small;color:gray;">Needed just #needXplayers# more player(s)</div>
					</cfif>
				</td>
	          </tr>
				</cfoutput>
        </table>
	  </td>
	  <td><img src="../images/spacer.gif" width="25" /></td>
	</tr>
  </table>
</form>

<!--- <cfdump var="#SESSION.eventid#"> --->
