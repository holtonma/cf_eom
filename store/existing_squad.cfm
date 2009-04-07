<cfset nettotalscore = 0 />
<cfset currentplace = 0 />
<cfset outputplace = 0 />
<cfset teamTotNETprev = -1234 />
<!-- tiedPLbool: 0 = not tied; 1 = tied -->
<cfset tieldPLbool = 0 />

<!--- <cfset SESSION.eventid = 9 /> --->
<!--- <cfparam name="SESSION.eventid" default="10"> --->  <!--- this needs to be set in one place, and that's it --->

<!--- this query will return the single record (groupID) related to the authorized user --->
<!--- version 1 --->
<!--- <cfquery datasource="#sDSN#" name="qSpecificGroupID" >
SELECT poolperson.EntrantID, poolperson.GroupID, poolgroup.PoolgroupID
FROM poolperson, poolgroup
WHERE poolperson.EntrantID = #GetAuthUser()#
AND poolgroup.PoolgroupID = poolperson.GroupID
</cfquery> --->
<!--- obtain group, all golfers selected and personal information for this person all in one query --->
<cfquery datasource="#sDSN2#" name="qSpecificGroupID" >
	SELECT 
		tEG.entrantid as EntrantID, tEG.groupid as GroupID, tEG.teamselectedid as PoolgroupID
	FROM 
		tentrantgroup tEG 
	WHERE 
		tEG.eventid = #SESSION.eventid#
		AND 
		tEG.entrantid = #SESSION.entrantid#
		AND
		tEG.groupid = #SESSION.patrongroupid#
</cfquery> 

<!--- version 1 --->
<!--- <cfquery datasource="#sDSN#" name="qMyInfo" >
SELECT EntrantID, EntrantLastName, EntrantFirstName
FROM poolperson
WHERE EntrantID = #GetAuthUser()#
</cfquery> --->
<cfquery datasource="#sDSN2#" name="qMyInfo" >
SELECT entrantid as EntrantID, lname as EntrantLastName, fname as EntrantFirstName
FROM tentrant tE
WHERE EntrantID = #SESSION.entrantid#
</cfquery>

<!--- version 1 --->
<!--- <cfquery datasource="#sDSN#" name="qUserSelTeam" >
SELECT poolpersonID, selectedteams.golfer1ID, selectedteams.golfer2ID, selectedteams.golfer3ID, selectedteams.golfer4ID, selectedteams.golfer5ID, selectedteams.golfer6ID
FROM selectedteams
WHERE selectedteams.poolpersonID = #GetAuthUser()#
</cfquery> --->
<cfquery datasource="#sDSN2#" name="qUserSelTeam" >
	SELECT 
		tTS.golferid,
		tG.GolferFirstName, tG.GolferLastName, tG.DegsofWallyVal, tG.GolferImage
	FROM 
		tteamselected tTS LEFT OUTER JOIN tgolfer tG ON tTS.golferid = tG.GolferID
	WHERE 
		tTS.entrantid = #SESSION.entrantid#
		AND
		tTS.groupid = #SESSION.patrongroupid#
		AND
		tTS.eventid = #SESSION.eventid#
</cfquery> <!--- this will return X (6) players --->

<cfset ccutline = 10/>

<!-- this will be set by a random query to the database-->
<cfset strRandomMajorFact = "Major fact: the first ALBATROSS at The Masters was in 1935 by Gene Sarazen at the 15th hole.  There have been two in the tournament's history since then." />
<cfset strRandomMajorFactover = "Major fact: In 1956, Jack Burke, Jr. won The Masters by one-stroke over Ken Venturi with a total of +1, 289 strokes." />
<cfset strRandomMajorFacteven = "Major fact: In 1966, Jack Nicklaus finished with an EVEN par 288 total, and won his 2nd consecutive Masters, and his 3rd Green Jacket overall." />
<!-- -->
				

<form action="existing_squad_manage.cfm" method="post">
  
  
  <table width="100%">
    <tr valign="top">
	  <td>
	    <table width="100%" class="ltblu">
          <tr>
			<td class="tblehead"></td>
			<td class="tblehead">Pool Entrant</td>
	        <td class="tblehead">Player 1</td>
			<td class="tblehead">Player 2</td>
			<td class="tblehead">Player 3</td>
			<td class="tblehead">Player 4</td>
			<td class="tblehead">Player 5</td>
			<td class="tblehead">Player 6</td>
	        <td class="tblehead">Your Total</br> Handicaps</td> 
			<!--- <td class="tblehead">Team <br> Gross</td> 
			<td class="tblehead">Team Total <br> NET </td> --->
          </tr>
		  	<tr>
		  		<td height="40"  align="center" class="tblehead">
					My <br>
					Saved <br>
					Team
				</td>
				<td height="40" class="ltblu">
				  <cfoutput>
				  #qMyInfo.entrantLastName#, #qMyInfo.entrantFirstName#
				  </cfoutput>
				</td>
		  	<cfoutput query="qUserSelTeam">
			  	<td height="40"  class="ltblu" align="center">
				  	<cfif #GolferLastName# EQ "">
						<span class="cut"><a href="/store/index_future.cfm" class="cut">team<br>
						not<br>complete</a></span>
					<cfelse>
						<!-- golfer selected -->
						<div><img src="#GolferImage#.gif" /></div>
						<div>#GolferLastName#</div>
					</cfif> 
				</td>
			</cfoutput>
				<td height="40"  class="ltblu" align="center">
					<!--- <cfquery datasource="#sDSN2#" name="qHandicapSum" >
					  SELECT Sum(HandicapStrokes) as TotHndcpStrForEntrant
					  FROM eomhandicaps
					  WHERE GolferID = #qUserSelTeam.golfer1ID# OR GolferID = #qUserSelTeam.golfer2ID# OR GolferID = #qUserSelTeam.golfer3ID# OR GolferID = #qUserSelTeam.golfer4ID# OR GolferID = #qUserSelTeam.golfer5ID# OR GolferID = #qUserSelTeam.golfer6ID#
				  	</cfquery> 
					<cfif #qHandicapSum.TotHndcpStrForEntrant# GT 0>
						+#qHandicapSum.TotHndcpStrForEntrant#
					<cfelse>
						--
					</cfif> --->
					[sum handicaps]
				</td>
				<!--- <td height="40" class="ltblu" align="center">
  				  <!--- <cfquery datasource="#sDSN#" name="qSumTeamScore" >
						SELECT SUM(CurrentScoreRelPar) as TeamTotal
						FROM golfer, selectedteams
						WHERE (golfer.golferid = selectedteams.golfer1ID OR golfer.golferid = selectedteams.golfer2ID OR golfer.golferid = selectedteams.golfer3ID
						OR golfer.golferid = selectedteams.golfer4ID OR golfer.golferid = selectedteams.golfer5ID OR golfer.golferid = selectedteams.golfer6ID)
						AND selectedteams.poolpersonid = #qUserSelTeam.poolpersonID#
				  </cfquery>
					  <cfif #qSumTeamScore.TeamTotal# GT 0>
						  <div class="ltblu">+ #qSumTeamScore.TeamTotal#</div>
					  <cfelseif #qSumTeamScore.TeamTotal# EQ 0>
						  <div class="ltblu">E</div>
					  <cfelse>
						  <div class="ltblu">#qSumTeamScore.TeamTotal#</div>
					  </cfif>	 --->
					  [sum team score]  
				</td> --->
			</tr>
			
			
		  <!--- <cfoutput query="qSpecificGroupID">
			<tr>
		        
	            <td height="40" align="center"   class="ltblu">
				  <cfquery datasource="#sDSN#" name="qGolferpic" >
					  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
					  FROM golfer
					  WHERE golferID = #qUserSelTeam.golfer1ID#
				  </cfquery>
				  		<cfif #qGolferpic.GolferLastName# EQ "">
						<span class="cut"><a href="/store/index_future.cfm" class="cut">team<br>
						not<br>complete</a></span>
						<cfelse>
						<!-- golfer selected -->
						<img src="#qGolferpic.GolferImage#.gif" /> <br> #qGolferpic.GolferLastName# <br>
						</cfif> 
				  <cfif #qGolferpic.CurrentScoreRelPar# EQ 0>
					<span class="coreboardeven" title="#strRandomMajorFacteven#"> E </span> 
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  <cfelseif #qGolferpic.CurrentScoreRelPar# LT 0>
					<span class="coreboardsub" title="#strRandomMajorFact#">#qGolferpic.CurrentScoreRelPar#</span> 
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  <cfelseif #qGolferpic.CurrentScoreRelPar# GT 0>
				  	<span class="coreboardover" title="#strRandomMajorFactover#">+#qGolferpic.CurrentScoreRelPar#</span>  
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  </cfif>
				</td>
				<td height="40" align="center"   class="ltblu">
				  <cfquery datasource="#sDSN#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM golfer
				  WHERE golferID = #qUserSelTeam.golfer2ID#
				  </cfquery>
				  		<cfif #qGolferpic.GolferLastName# EQ "">
						<span class="cut"><a href="/store/index_future.cfm" class="cut">team<br>
						not<br>complete</a></span>
						<cfelse>
						<!-- golfer selected -->
						<img src="#qGolferpic.GolferImage#.gif" /> <br> #qGolferpic.GolferLastName# <br>
						</cfif> 
				  <cfif #qGolferpic.CurrentScoreRelPar# EQ 0>
					<span class="coreboardeven" title="#strRandomMajorFacteven#"> E </span> 
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  <cfelseif #qGolferpic.CurrentScoreRelPar# LT 0>
					<span class="coreboardsub" title="#strRandomMajorFact#">#qGolferpic.CurrentScoreRelPar#</span> 
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  <cfelseif #qGolferpic.CurrentScoreRelPar# GT 0>
				  	<span class="coreboardover" title="#strRandomMajorFactover#">+#qGolferpic.CurrentScoreRelPar#</span>  
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  </cfif>
				</td>
				<td height="40" align="center"   class="ltblu">
				  <cfquery datasource="#sDSN#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM golfer
				  WHERE golferID = #qUserSelTeam.golfer3ID#
				  </cfquery>
				  		<cfif #qGolferpic.GolferLastName# EQ "">
						<span class="cut"><a href="/store/index_future.cfm" class="cut">team<br>
						not<br>complete</a></span>
						<cfelse>
						<!-- golfer selected -->
						<img src="#qGolferpic.GolferImage#.gif" /> <br> #qGolferpic.GolferLastName# <br>
						</cfif> 
				  <cfif #qGolferpic.CurrentScoreRelPar# EQ 0>
					<span class="coreboardeven" title="#strRandomMajorFacteven#"> E </span> 
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  <cfelseif #qGolferpic.CurrentScoreRelPar# LT 0>
					<span class="coreboardsub" title="#strRandomMajorFact#">#qGolferpic.CurrentScoreRelPar#</span> 
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  <cfelseif #qGolferpic.CurrentScoreRelPar# GT 0>
				  	<span class="coreboardover" title="#strRandomMajorFactover#">+#qGolferpic.CurrentScoreRelPar#</span>  
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  </cfif>
				</td>
				<td height="40" align="center"   class="ltblu">
				  <cfquery datasource="#sDSN#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM golfer
				  WHERE golferID = #qUserSelTeam.golfer4ID#
				  </cfquery>
				  		<cfif #qGolferpic.GolferLastName# EQ "">
						<span class="cut"><a href="/store/index_future.cfm" class="cut">team<br>
						not<br>complete</a></span>
						<cfelse>
						<!-- golfer selected -->
						<img src="#qGolferpic.GolferImage#.gif" /> <br> #qGolferpic.GolferLastName# <br>
						</cfif>  
				  <cfif #qGolferpic.CurrentScoreRelPar# EQ 0>
					<span class="coreboardeven" title="#strRandomMajorFacteven#"> E </span> 
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  <cfelseif #qGolferpic.CurrentScoreRelPar# LT 0>
					<span class="coreboardsub" title="#strRandomMajorFact#">#qGolferpic.CurrentScoreRelPar#</span> 
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  <cfelseif #qGolferpic.CurrentScoreRelPar# GT 0>
				  	<span class="coreboardover" title="#strRandomMajorFactover#">+#qGolferpic.CurrentScoreRelPar#</span>  
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  </cfif>
				</td>
				<td height="40" align="center"   class="ltblu">
				  <cfquery datasource="#sDSN#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM golfer
				  WHERE golferID = #qUserSelTeam.golfer5ID#
				  </cfquery>
				  		<cfif #qGolferpic.GolferLastName# EQ "">
						<span class="cut"><a href="/store/index_future.cfm" class="cut">team<br>
						not<br>complete</a></span>
						<cfelse>
						<!-- golfer selected -->
						<img src="#qGolferpic.GolferImage#.gif" /> <br> #qGolferpic.GolferLastName# <br>
						</cfif>  
				  <cfif #qGolferpic.CurrentScoreRelPar# EQ 0>
					<span class="coreboardeven" title="#strRandomMajorFacteven#"> E </span> 
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  <cfelseif #qGolferpic.CurrentScoreRelPar# LT 0>
					<span class="coreboardsub" title="#strRandomMajorFact#">#qGolferpic.CurrentScoreRelPar#</span> 
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  <cfelseif #qGolferpic.CurrentScoreRelPar# GT 0>
				  	<span class="coreboardover" title="#strRandomMajorFactover#">+#qGolferpic.CurrentScoreRelPar#</span>  
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  </cfif>
				</td>
				<td height="40" align="center"   class="ltblu">
				  <cfquery datasource="#sDSN#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM golfer
				  WHERE golferID = #qUserSelTeam.golfer6ID#
				  </cfquery>
				  		<cfif #qGolferpic.GolferLastName# EQ "">
						<span class="cut"><a href="/store/index_future.cfm" class="cut">team<br>
						not<br>complete</a></span>
						<cfelse>
						<!-- golfer selected -->
						<img src="#qGolferpic.GolferImage#.gif" /> <br> #qGolferpic.GolferLastName# <br>
						</cfif>  
				  <cfif #qGolferpic.CurrentScoreRelPar# EQ 0>
					<span class="coreboardeven" title="#strRandomMajorFacteven#"> E </span> 
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  <cfelseif #qGolferpic.CurrentScoreRelPar# LT 0>
					<span class="coreboardsub" title="#strRandomMajorFact#">#qGolferpic.CurrentScoreRelPar#</span> 
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  <cfelseif #qGolferpic.CurrentScoreRelPar# GT 0>
				  	<span class="coreboardover" title="#strRandomMajorFactover#">+#qGolferpic.CurrentScoreRelPar#</span>  
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  </cfif>
				</td>
	            <td height="40"  class="ltblu" align="center">
					<cfquery datasource="#sDSN#" name="qHandicapSum" >
					  SELECT Sum(HandicapStrokes) as TotHndcpStrForEntrant
					  FROM eomhandicaps
					  WHERE GolferID = #qUserSelTeam.golfer1ID# OR GolferID = #qUserSelTeam.golfer2ID# OR GolferID = #qUserSelTeam.golfer3ID# OR GolferID = #qUserSelTeam.golfer4ID# OR GolferID = #qUserSelTeam.golfer5ID# OR GolferID = #qUserSelTeam.golfer6ID#
				  	</cfquery> 
					<cfif #qHandicapSum.TotHndcpStrForEntrant# GT 0>
						+#qHandicapSum.TotHndcpStrForEntrant#
					<cfelse>
						--
					</cfif>
				</td>
				
				<td height="40" class="ltblu" align="center">
  				  <cfquery datasource="#sDSN#" name="qSumTeamScore" >
						SELECT SUM(CurrentScoreRelPar) as TeamTotal
						FROM golfer, selectedteams
						WHERE (golfer.golferid = selectedteams.golfer1ID OR golfer.golferid = selectedteams.golfer2ID OR golfer.golferid = selectedteams.golfer3ID
						OR golfer.golferid = selectedteams.golfer4ID OR golfer.golferid = selectedteams.golfer5ID OR golfer.golferid = selectedteams.golfer6ID)
						AND selectedteams.poolpersonid = #qUserSelTeam.poolpersonID#
				  </cfquery>
					  <cfif #qSumTeamScore.TeamTotal# GT 0>
						  <div class="ltblu">+ #qSumTeamScore.TeamTotal#</div>
					  <cfelseif #qSumTeamScore.TeamTotal# EQ 0>
						  <div class="ltblu">E</div>
					  <cfelse>
						  <div class="ltblu">#qSumTeamScore.TeamTotal#</div>
					  </cfif>
						  
				</td>
				<td height="40" class="ltblu" align="center">
				<!-- turn this into an array: array(i, NET, ID)? -->
				<cfif #qHandicapSum.TotHndcpStrForEntrant# GTE 0 >
					<cfset nettotalscore = #qHandicapSum.TotHndcpStrForEntrant# + #qSumTeamScore.TeamTotal#  />
				<cfelse>
					<cfset nettotalscore = #qSumTeamScore.TeamTotal#  />
				</cfif>
				<cfif #nettotalscore# GT 0>
						<cfif #nettotalscore# GT 80>
							<div class="ltblu">CUT</div>
						<cfelse>
							<div class="ltblu">+ #nettotalscore#</div>
						</cfif>
				<cfelseif #nettotalscore# EQ 0>
					<div class="ltblu">E</div>
				<cfelse>
					<div class="ltblu">#nettotalscore#</div>
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
           </cfoutput> --->
        </table>
	  </td>
	  <td><img src="../images/spacer.gif" width="25" /></td>
	</tr>
  </table>
</form>
