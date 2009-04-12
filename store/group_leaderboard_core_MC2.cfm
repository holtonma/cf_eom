
<style type="text/css">
		.ltturq {  	background-color:  #DDFFCC;
			font-family: Helvetica, News Gothic MT Arial, sans-serif; 
			color: #666666;
			padding: 2px;
			font-size: 11px;   }

		.yourgroup {  	background-color:  #FFFF33;
			font-family: Helvetica, News Gothic MT Arial, sans-serif; 
			color: #444444;
			padding: 2px;
			font-size: 11px;   }
			
		.tblhead{
			font-size:13px;
		}
</style>

<cfset nettotalscore = 0 />
<cfset currentplace = 0 />
<cfset outputplace = 0 />
<cfset teamTotNETprev = -1234 />
<!--- tiedPLbool: 0 = not tied; 1 = tied --->
<cfset tieldPLbool = 0 />
<!--- <cfset tourneyName = "PGA Championship" /> --->



<cfparam name="pagegroupid" default="#SESSION.patrongroupid#">  <!--- defaults to last groupid, eventually will allow more than 1 group  --->
<cfparam name="SESSION.currenteventid" default="SESSION.eventid">

<!--- patrongroupid: <cfdump var="#pagegroupid#"> --->
<!--- this query will return the single record (groupID) related to the authorized user --->
<!--- not needed because we already have SESSION.patrongroupid and the default pagegroupid --->

<cfset intPageGroupID = #ListFirst(pagegroupid)#>

<cfquery datasource="#sDSN2#" name="qSpecificGroupID" >
	SELECT 
		groupname as PoolGroupName
	FROM 
		tgroup
	WHERE 
		groupid = #pagegroupid#
		
</cfquery> 


<!--- when tourney starts:  AND selectedteams.fullsquad = 1 --->
<!--- this query obtains a count of all of the entrants in the group --->
<!--- <cfquery datasource="#sDSN2#" name="qCountEntrants">
	SELECT 
		Count(tEG.entrantID) as NumEntrants 
	FROM 
		tentrantgroup tEG
	WHERE 
		tEG.groupid = #pagegroupid#
		AND 
		tEG.eventid = #SESSION.currenteventid#
</cfquery> --->

<!--- when tournament starts insert these : 
AND selectedteams.fullsquad = 1
AND selectedteams.madecut = 1--->
<!--- the following query selects all contestants in this group: 
LastName, FirstName, TeamSelected, GroupID, tiebreaker, latest team net score 
(another query that follows will use teamselectedID to obtain the recordset of all teams in the group )--->
<cfset fullsquadlist = "">
<cfquery datasource="#sDSN2#" name="qAllFullSquadEntrantIDs">
	SELECT DISTINCT tTS.entrantid 
	FROM tteamselected tTS 
	WHERE 
	tTS.golferid > 0
	AND
	tTS.groupid = #SESSION.patrongroupid#
	AND
	tTS.eventid = #SESSION.eventid#
</cfquery>
<cfoutput query="qAllFullSquadEntrantIDs">
	<cfset fullsquadlist=#ListAppend(fullsquadlist, qAllFullSquadEntrantIDs.entrantid)#>   
</cfoutput>

<cfquery datasource="#sDSN2#" name="qNumInGroupNew">
	SELECT COUNT(DISTINCT tTS.entrantid) as Num
	FROM tteamselected tTS 
	WHERE 
	tTS.golferid > 0
	AND
	tTS.groupid = #SESSION.patrongroupid#
	AND
	tTS.eventid = #SESSION.eventid#
</cfquery>
<cfset totalnumingroup = #qNumInGroupNew.Num#>

<cfquery datasource="#sDSN2#" name="qAllTeamsInGroup" >
	SELECT 
		tE.entrantid, tE.lname as entrantLastName, tE.fname as entrantFirstName,
		tEG.teamselectedid, tEG.finaltiebreakerscore as tiebreaker, tEG.latestteamnetscore as latest_teamnetscore
	FROM 
		tentrant tE 
		INNER JOIN tentrantgroup tEG ON tE.entrantid = tEG.entrantID
	WHERE 
		tEG.groupid = #pagegroupid#
		AND
		tEG.eventid = #SESSION.eventid#
		AND
		tEG.latestteamnetscore IS NOT NULL
		AND
		tEG.entrantid IN (#fullsquadlist#)
		AND
		tEG.madecut = 0
	ORDER BY 
		tEG.latestteamnetscore ASC, entrantLastName ASC
</cfquery>

<!--- obtain the cutline and last time the cutline was updated --->
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
		tEN.eventname
	FROM
		teventname tEN LEFT OUTER JOIN tevents tEs ON tEN.eventnameid = tEs.eventnameid
	WHERE
		tEs.eventID = #SESSION.eventid#
</cfquery>
<cfset tourneyname = #qEventInfo.eventname#>
<!--- this will be set by a random query to the database --->
<cfset strRandomMajorFact = "Major fact: the first ALBATROSS at The Masters was in 1935 by Gene Sarazen at the 15th hole.  There have been two in the tournament's history since then." />
<cfset strRandomMajorFactover = "Major fact: In 1956, Jack Burke, Jr. won The Masters by one-stroke over Ken Venturi with a total of +1, 289 strokes." />
<cfset strRandomMajorFacteven = "Major fact: In 1966, Jack Nicklaus finished with an EVEN par 288 total, and won his 2nd consecutive Masters, and his 3rd Green Jacket overall." />
<!--- --->
				
<cfset winnershare = #qAllTeamsInGroup.recordcount# * 10 />
<cfset numCutline10shot = #qTenShotCutline.CutLessTen# + 10/>
<cfset strCutline = "#numCutline10shot#" />
<form action="groupleaderboard_manage.cfm" method="post">
  <div class="leaderboardheader" style="padding:15px;">
    <div align="center" style="border:4px solid red;padding:5px;">
      	<span style="font-size:20px;">Group "<cfoutput>#qSpecificGroupID.PoolGroupName#</cfoutput>" MISSED CUT</span>
		<!--- <cfoutput>#qEventInfo.eventyear# #qEventInfo.eventname#</cfoutput> Leaderboard  --->
		<div>Snakebit victims below</div>
	</div>
  </div> 
  
  
  <cfset ccutline = -1/>  <!--- set to 1000 b/c it's after cutline --->
  <cfif #ccutline# EQ 0>
	 <cfset strCutline = "E" />
  <cfelseif #ccutline# LT 0>
	 <cfset strCutline = #ccutline# /> 
  <cfelseif #ccutline# GT 0>
	  <cfset strCutline = #ccutline# />
  </cfif>
  <cfset finalcutline = -1 />
  <div class="headerTeam"><cfoutput>#tourneyname#</cfoutput> Cut Line was :: <span class="worldrankingblack">+ 1</span> </div> 
  <!--- Eye on Majors Cut Line : only 3 of <cfoutput>#qAllTeamsInGroup.recordcount#</cfoutput> make the cut</div> <br> --->
<cfquery name="qLastUpdated" datasource="#sDSN2#">
	SELECT DateTimeLastUpdated
	FROM tevents
	WHERE eventid = #SESSION.eventid#
</cfquery>  


  
  <!--- determine number of players required by checking that group's rules... --->
	<cfquery name="qGroupRules" datasource="#sDSN2#">
		SELECT numgolfersselect, numgolferscount, cutpenalty, handicapsYN
		FROM tgrouprules
		WHERE groupid = #pagegroupid#
	</cfquery>
	<cfif qGroupRules.RecordCount eq 0>
		<cfset NumGolfersToSelect = 6>
	<cfelse>
		<cfset NumGolfersToSelect = #qGroupRules.numgolfersselect#>
	</cfif>
	
  <table width="100%"  id="tblGroup2">
    <tr valign="top">
	  <td>
	    <div id="groupleaderboardAjaxDiv"> <!--- ************ begin Ajax Div ---> 
	    <table width="100%" >
        <!--- **********  HEADERS   ********** --->
				<tr>
					<th class="tblehead">Place</th>
					<th class="tblehead">Entrant <div style="font-size:9px;">(tie breaker)</div></th>
			        <cfset counter = 0> <!--- initialize --->
			        <!--- based on the number of players required in the group "X", this will only show that number of players X --->
			        <cfloop from="1" to="#NumGolfersToSelect#" index="i" step="1">
				        <cfset counter = counter + 1>
				  <th class="tblehead">Golfer <cfoutput>#counter#</cfoutput></th>
					</cfloop>
			    <th class="tblehead">EoM Hcp</th>
					<th class="tblehead">Team Gross</th> 
					<th class="tblehead">Team Total NET</th>
		    </tr>
		
			<!--- <cfset countinloop = 0>   --->
		  <!--- **********  qAllTeamsInGroup   ********** --->
		  <cfoutput query="qAllTeamsInGroup">
			<tr>
				<cfif #qAllTeamsInGroup.entrantid# eq #SESSION.entrantid#>
					<cfset classname="yourgroup">
					<cfset classnamescore = "largegrntxtmyteam">
					<!--- <cfdump var="#classname#"> --->
				<cfelse>
					<cfset classname="ltturq">
					<cfset classnamescore = "largegrntxt">
				</cfif>
		        <!--- ** COLUMN 1 ** --->
		        <td height="40"  align="center" class="#classname#">
					<cfset currentplace = currentplace + 1 />
					<span style="color:red;font-size:14px;">CUT!</span>
				</td>
				<!--- ** COLUMN 2 ** --->
				<td height="40" class="#classname#">
				  #qAllTeamsInGroup.entrantLastName#, #qAllTeamsInGroup.entrantFirstName# <br />
				  <cfif (#qAllTeamsInGroup.tiebreaker#) EQ 0>
					 (E)
				  <cfelseif (#qAllTeamsInGroup.tiebreaker#) LT 0>
					 (#qAllTeamsInGroup.tiebreaker#)
				  <cfelseif (#qAllTeamsInGroup.tiebreaker#) GT 0>
					 (#qAllTeamsInGroup.tiebreaker#)
				  </cfif>
				</td>
				<!--- ** COLUMN 3 thru 9 [3 + Num players in group] ** --->
	            <cfquery name="qATeamOfGolfers" datasource="#sDSN2#">
				  	SELECT 
				  		tTS.teamselectedid, tTS.entrantid, tTS.groupid, tTS.golferid, tTS.eventid,
				  		tG.GolferFirstName, tG.GolferLastName, tG.CurrentScoreRelPar, tG.GolferImage, tG.madecut
				  	FROM 
				  		tteamselected tTS INNER JOIN tgolfer tG ON tTS.golferid = tG.GolferID
				  	WHERE 
				  		tTS.teamselectedid = #qAllTeamsInGroup.teamselectedid#
				  		AND 
				  		tTS.eventid = #SESSION.eventid#
				</cfquery>
				<!--- line 197 group_leaderboard_core.cfm: </br>
				<cfdump var="#qATeamOfGolfers#"> --->
				<!---  --->
				<cfset diffBTrsANDrequired = (#NumGolfersToSelect# - #qATeamOfGolfers.RecordCount#)> <!--- this tells the server if there have been enough players selected: i.e. 5 players selected when 6 are required, etc. --->
					<cfif diffBTrsANDrequired eq 0> <!--- the correct number of golfers have been selected --->
						<cfloop query="qATeamOfGolfers" >
							<td height="40" align="center" class="#classname#">
								<!--- image --->
								<div><img src="#qATeamOfGolfers.GolferImage#.gif" /></div> 
								<!--- lastname --->
								<div>#qATeamOfGolfers.GolferLastName#</div>
								<!--- scorerelpar, with formatted output (R, G, black) --->
								<cfif qATeamOfGolfers.CurrentScoreRelPar EQ 0>
								<div class="coreboardeven" title="#strRandomMajorFacteven#"> E </div> 
									<cfif #qATeamOfGolfers.madecut# eq 0 >
										<div class="cut">CUT!</div>
									<cfelse>
										<div class="#classname#" style="color:##DDFFCC">ok!</div>
									</cfif>
							  	<cfelseif qATeamOfGolfers.CurrentScoreRelPar LT 0>
								<div class="coreboardsub" title="#strRandomMajorFact#">#qATeamOfGolfers.CurrentScoreRelPar#</div> 
									<cfif #qATeamOfGolfers.madecut# eq 0 >
										<span class="cut">CUT!</div>
									<cfelse>
										<div class="#classname#" style="color:##DDFFCC">ok!</div>
									</cfif>
							  	<cfelseif qATeamOfGolfers.CurrentScoreRelPar GT 0>
							  	<div class="coreboardover" title="#strRandomMajorFactover#">+#qATeamOfGolfers.CurrentScoreRelPar#</div>  
									<cfif #qATeamOfGolfers.madecut# eq 0 >
										<div class="cut">CUT!</div>
									<cfelse>
										<div class="#classname#" style="color:##DDFFCC">ok!</div>
									</cfif>
							  	</cfif>
							</td>
						</cfloop>
					<cfelse>
						<!--- output as many as are in the recordset  --->
						<cfset countgolfers = 0>
						<cfloop query="qATeamOfGolfers">
							<cfset countgolfers = countgolfers + 1>
							<td height="40" align="center" class="#classname#">
								<!--- image --->
								<div><img src="#qATeamOfGolfers.GolferImage#.gif" /></div>
								<!--- lastname --->
								<div>#qATeamOfGolfers.GolferLastName#</div>
								<!--- scorerelpar, with formatted output (R, G, black) --->
								<cfif qATeamOfGolfers.CurrentScoreRelPar EQ 0>
								<div class="coreboardeven" title="#strRandomMajorFacteven#"> E </div> 
									<cfif #qATeamOfGolfers.CurrentScoreRelPar# GT #numCutline10shot# ><div class="cut">CUT?</div></cfif>
							  	<cfelseif qATeamOfGolfers.CurrentScoreRelPar LT 0>
								<div class="coreboardsub" title="#strRandomMajorFact#">#qATeamOfGolfers.CurrentScoreRelPar#</div> 
									<cfif #qATeamOfGolfers.CurrentScoreRelPar# GT #numCutline10shot# ><div class="cut">CUT?</div></cfif>
							  	<cfelseif qATeamOfGolfers.CurrentScoreRelPar GT 0>
							  	<div class="coreboardover" title="#strRandomMajorFactover#">+#qATeamOfGolfers.CurrentScoreRelPar#</div>  
									<cfif #qATeamOfGolfers.CurrentScoreRelPar# GT #numCutline10shot# ><div class="cut">CUT?</div></cfif>
							  	</cfif>
							</td>
						</cfloop>
						<!--- now loop through remaining and post the alert to select remaining golfers  --->
						<cfset remaininggolfers = #NumGolfersToSelect# - #qATeamOfGolfers.RecordCount#>
						<cfset nextcountgolfersnum = countgolfers + 1>
						<cfloop from="#nextcountgolfersnum#" to="#NumGolfersToSelect#" index="j"> <!--- E.g. this will loop from 4 thru 6 --->
				        	<td height="40" align="center" class="ltturq">
						        <!--- <span class="cut"><a href="/store/index_future.cfm" class="cut">
							        team<br>not<br>complete</a>
								</span> --->
							</td>
				        </cfloop>
					</cfif>
					
				
	            <!--- ** EoM HANDICAPS COLUMN N (9 normally) ** --->
	            <!--- <cfif qGroupRules.handicapsYN eq 1> --->
	            <cfif 1 eq 1> <!--- this means there are handicaps, so go find out what they are --->
					<!--- loop through qATeamOfGolfers above and counted up the total handicap sum --->
					<cfquery name="qHandicapSum" datasource="#sDSN2#">
						SELECT SUM(tH.numstrokes) as totalhandicapstrokes
						FROM thandicaps tH INNER JOIN tteamselected tTS ON tH.golferid = tTS.golferid 
						WHERE 
							tTS.groupid = #pagegroupid#
							AND
							tTS.entrantID = #qAllTeamsinGroup.entrantID#
							AND 
							tTS.eventid = #SESSION.eventid#
							AND
							tH.eventid = #SESSION.eventid#
					</cfquery>
					<td height="40"  class="#classname#" align="center">
						<cfif qHandicapSum.totalhandicapstrokes GT 0>
							+#qHandicapSum.totalhandicapstrokes#
						<cfelseif qHandicapSum.totalhandicapstrokes LT 0>
							<span style="color:red;">#qHandicapSum.totalhandicapstrokes#</span>
						<cfelse>
							--
						</cfif>
					</td>
				<cfelse>
					<td height="40"  class="#classname#" align="center">--</td>
				</cfif>
	            
				<!--- ** Team Gross COLUMN N (10 normally) ** --->
				<td height="40" class="#classname#" align="center" nowrap="true">
  				  <cfquery datasource="#sDSN2#" name="qSumTeamScore" >
						SELECT SUM(CurrentScoreRelPar) as TeamTotal
						FROM tgolfer tG, tteamselected tTS
						WHERE 
							tTS.golferid = tG.GolferID
							AND 
							tTS.groupid = #pagegroupid#
							AND
							tTS.entrantID = #qAllTeamsinGroup.entrantID#
							AND
							tTS.eventid = #SESSION.eventid#
				  </cfquery>
					  <cfif #qSumTeamScore.TeamTotal# GT 0>
						  <div style="font-size:14px;font-weight:300;color:gray;"><span>+ #qSumTeamScore.TeamTotal#</span></div>
					  <cfelseif #qSumTeamScore.TeamTotal# EQ 0>
						  <div style="font-size:14px;font-weight:300;color:green;">E</div>
					  <cfelse>
						  <div style="font-size:14px;font-weight:300;color:red;">#qSumTeamScore.TeamTotal#</div>
					  </cfif>	  
				</td>
				
				<td height="40" class="#classname#" align="center" nowrap="true">
					<!--- <cfdump var="#classnamescore#"> --->
				<!-- turn this into an array: array(i, NET, ID)? -->
				<!--- <cfif qGroupRules.handicapsYN GT 0> --->
				<cfif 1 eq 1> <!-- this means there are handicaps to be added -->
					<cfif qHandicapSum.totalhandicapstrokes neq "">
						<cfif qHandicapSum.totalhandicapstrokes GTE 0 >
							<cfset nettotalscore = #Val(qHandicapSum.totalhandicapstrokes + qSumTeamScore.TeamTotal)#  />
						<cfelse>
							<cfset nettotalscore = #Val(qHandicapSum.totalhandicapstrokes + qSumTeamScore.TeamTotal)#/>
						</cfif>
					<cfelse>
						<cfset nettotalscore = #Val(qSumTeamScore.TeamTotal)#  />
					</cfif>
				<cfelse>
					<cfset nettotalscore = #Val(qSumTeamScore.TeamTotal)#  />
				</cfif>
					<cfparam name="nettotalscore" default="0">
					<cfif nettotalscore GT 0>
							<cfif nettotalscore GT 80>
								<div style="font-size:16px;font-weight:bold;color:red;">CUT?</div>
							<cfelse>
								<div style="font-size:16px;font-weight:bold;color:black;"><span>+ #nettotalscore#</span></div>
							</cfif>
					<cfelseif nettotalscore EQ 0>
						<div style="font-size:16px;font-weight:bold;color:green;">E</div>
					<cfelse>
						<div style="font-size:16px;font-weight:bold;color:red;">#nettotalscore#</div>
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
	          </tr>
	          	<!--- <cfset countinloop = countinloop + 1> --->
	          	<!--- <cfif countinloop gt 100>
		          	line 332 in core: more than 100 iterations, therefore ABORT!!!!!!!!!!!!! <cfabort>
				</cfif> --->
           </cfoutput>
			
        </table>
		</div> <!--- ************ end Ajax Div --->
	  </td>
	  <td><img src="../images/spacer.gif" width="25" /></td>
	</tr>
	<!--- <tr>
		<td colspan="2">
			<script type="text/javascript"><!--
			google_ad_client = "pub-3488777663690401";
			google_alternate_color = "FFFFFF";
			google_ad_width = 728;
			google_ad_height = 90;
			google_ad_format = "728x90_as";
			google_ad_type = "text";
			//2007-04-04: eom group core bottom
			google_ad_channel = "0438716860";
			google_color_border = "E6E6E6";
			google_color_bg = "FFFFFF";
			google_color_link = "1B703A";
			google_color_text = "000000";
			google_color_url = "008000";
			//-->
			</script>
			<script type="text/javascript"
			  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
		</td>
	</tr> --->
  </table>
</form>

