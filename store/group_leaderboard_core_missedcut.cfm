<cfset nettotalscore = 0 />
<cfset currentplace = 0 />
<cfset outputplace = 0 />
<cfset teamTotNETprev = -1234 />
<!-- tiedPLbool: 0 = not tied; 1 = tied -->
<cfset tieldPLbool = 0 />

<!-- this query will return the single record (groupID) related to the authorized user-->
<cfquery datasource="#sDSN#" name="qSpecificGroupID" >
SELECT poolperson.EntrantID, poolperson.GroupID, poolgroup.PoolgroupID, poolgroup.PoolGroupName
FROM poolperson, poolgroup
WHERE poolperson.EntrantID = #GetAuthUser()#
AND poolgroup.PoolgroupID = poolperson.GroupID
</cfquery>

<cfquery datasource="#sDSN#" name="qAllTeamsInGroup" >
SELECT poolperson.entrantID, poolperson.entrantLastName, poolperson.entrantFirstName, poolperson.selectedteam1id as SelectedTeam,
poolperson.groupid, selectedteams.golfer1ID, selectedteams.golfer2ID, selectedteams.golfer3ID, selectedteams.golfer4ID, selectedteams.golfer5ID, selectedteams.golfer6ID,
selectedteams.latest_teamnetscore
FROM poolperson, selectedteams
WHERE poolperson.GroupID = #qSpecificGroupID.GroupID#
AND poolperson.EntrantID = selectedteams.poolpersonID AND poolperson.groupid = selectedteams.PoolGroupID
AND selectedteams.fullsquad = 1
AND selectedteams.madecut = 0
ORDER BY selectedteams.latest_teamnetscore ASC
</cfquery>
<cfquery datasource="#sDSN#" name="qCutline">
SELECT Cutline, LastUpdatedTime
FROM currentcutline
WHERE CurrentCutlineID = 6
</cfquery>

<cfquery datasource="#sDSN#" name="qTenShotCutline">
	SELECT MIN(CurrentScoreRelPar) as CutLessTen
	FROM golfer
	WHERE active = 1
</cfquery>

<!-- this will be set by a random query to the database-->
<cfset strRandomMajorFact = "Major fact: the first ALBATROSS at The Masters was in 1935 by Gene Sarazen at the 15th hole.  There have been two in the tournament's history since then." />
<cfset strRandomMajorFactover = "Major fact: In 1956, Jack Burke, Jr. won The Masters by one-stroke over Ken Venturi with a total of +1, 289 strokes." />
<cfset strRandomMajorFacteven = "Major fact: In 1966, Jack Nicklaus finished with an EVEN par 288 total, and won his 2nd consecutive Masters, and his 3rd Green Jacket overall." />
<!-- -->
				
<cfset winnershare = #qAllTeamsInGroup.recordcount# * 10 />
<cfset numCutline10shot = #qTenShotCutline.CutLessTen# + 10/>
<cfset strCutline = "#numCutline10shot#" />
<form action="groupleaderboard_manage.cfm" method="post">
  <div class="worldrankingblack">
    <div align="center">2006 PGA Championship :: Missed Cut "<cfoutput>#qSpecificGroupID.PoolGroupName#</cfoutput>".  Choose wisely in the next EyeOnMajors.com tourney, Masters 2007! <br> </div>
  </div> 
  <cfset ccutline = -1/>  <!-- 8 was the cutline of the last major: US Open 2005, Pinehurst-->
  <cfif #ccutline# EQ 0>
	 <cfset strCutline = "E" />
  <cfelseif #ccutline# LT 0>
	 <cfset strCutline = #ccutline# /> 
  <cfelseif #ccutline# GT 0>
	  <cfset strCutline = #ccutline# />
  </cfif>
  <cfset finalcutline = -1 />
  <div class="headerTeam" align="center"><span class="worldrankingblack">In order to make our cut, all 6 of your players must make the cut. <br>
  EyeOnMajors.com is the most enjoyable and challenging golf pool in the world for a reason! It's not easy! </span></div> 
  <!-- Eye on Majors Cut Line : only 3 of <cfoutput>#qAllTeamsInGroup.recordcount#</cfoutput> make the cut</div> <br> -->
  
  <table width="100%">
    <tr valign="top">
	  <td>
	    <table width="100%" class="white">
          <tr>
			<td class="tblehead">Current Place</td>
			<td class="tblehead">Pool Entrant</td>
	        <td class="tblehead">Player 1</td>
			<td class="tblehead">Player 2</td>
			<td class="tblehead">Player 3</td>
			<td class="tblehead">Player 4</td>
			<td class="tblehead">Player 5</td>
			<td class="tblehead">Player 6</td>
	        <td class="tblehead">EoM <br> Handicaps</td> 
			<td class="tblehead">Team <br> Gross</td> 
			<td class="tblehead">Team Total <br> NET </td>
          </tr>
		  <cfoutput query="qAllTeamsInGroup">
			
		  	<tr class="ltturq">
		        <td height="40"  align="center" class="ltturq">
					<cfset currentplace = currentplace + 1 />
					<cfif currentplace eq 1 >
						<cfif tieldPLbool EQ 0>
							  <!-- not a tie, use next place -->
							  <span class="cut">CUT</span>
						<cfelse>
							  <!-- tie, use first tied place -->
							  <span class="cut">CUT</span>
						</cfif>
					<cfelse>
						<span class="cut">CUT</span>
					</cfif>
				</td>
				<td height="40" class="ltturq">
				  #qAllTeamsInGroup.entrantLastName#, #qAllTeamsInGroup.entrantFirstName#
				</td>
	            <td height="40" align="center"   class="ltturq">
				  <cfquery datasource="#sDSN#" name="qGolferpic" >
					  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
					  FROM golfer
					  WHERE golferID = #qAllTeamsInGroup.golfer1ID#
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
							<span class="cut">CUT</span> <!--CUT-->
						</cfif>
				  <cfelseif #qGolferpic.CurrentScoreRelPar# LT 0>
					<span class="coreboardsub" title="#strRandomMajorFact#">#qGolferpic.CurrentScoreRelPar#</span> 
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut"></span>
						</cfif>
				  <cfelseif #qGolferpic.CurrentScoreRelPar# GT 0>
				  	<span class="coreboardover" title="#strRandomMajorFactover#">+#qGolferpic.CurrentScoreRelPar#</span>  
						<cfif #qGolferpic.CurrentScoreRelPar# GT #ccutline# >
							<span class="cut">CUT</span>
						</cfif>
				  </cfif>
				</td>
				<td height="40" align="center"   class="ltturq">
				  <cfquery datasource="#sDSN#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM golfer
				  WHERE golferID = #qAllTeamsInGroup.golfer2ID#
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
				<td height="40" align="center"   class="ltturq">
				  <cfquery datasource="#sDSN#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM golfer
				  WHERE golferID = #qAllTeamsInGroup.golfer3ID#
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
				<td height="40" align="center"   class="ltturq">
				  <cfquery datasource="#sDSN#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM golfer
				  WHERE golferID = #qAllTeamsInGroup.golfer4ID#
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
				<td height="40" align="center"   class="ltturq">
				  <cfquery datasource="#sDSN#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM golfer
				  WHERE golferID = #qAllTeamsInGroup.golfer5ID#
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
				<td height="40" align="center"   class="ltturq">
				  <cfquery datasource="#sDSN#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM golfer
				  WHERE golferID = #qAllTeamsInGroup.golfer6ID#
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
	            <td height="40"  class="ltturq" align="center">
					<cfquery datasource="#sDSN#" name="qHandicapSum" >
					  SELECT Sum(HandicapStrokes) as TotHndcpStrForEntrant
					  FROM eomhandicaps
					  WHERE GolferID = #qAllTeamsInGroup.golfer1ID# OR GolferID = #qAllTeamsInGroup.golfer2ID# OR GolferID = #qAllTeamsInGroup.golfer3ID# OR GolferID = #qAllTeamsInGroup.golfer4ID# OR GolferID = #qAllTeamsInGroup.golfer5ID# OR GolferID = #qAllTeamsInGroup.golfer6ID#
				  	</cfquery> 
					<cfif #qHandicapSum.TotHndcpStrForEntrant# GT 0>
						+#qHandicapSum.TotHndcpStrForEntrant#
					<cfelse>
						--
					</cfif>
				</td>
				
				<td height="40" class="largegrntxt" align="center">
  				  <cfquery datasource="#sDSN#" name="qSumTeamScore" >
						SELECT SUM(CurrentScoreRelPar) as TeamTotal
						FROM golfer, selectedteams
						WHERE (golfer.golferid = selectedteams.golfer1ID OR golfer.golferid = selectedteams.golfer2ID OR golfer.golferid = selectedteams.golfer3ID
						OR golfer.golferid = selectedteams.golfer4ID OR golfer.golferid = selectedteams.golfer5ID OR golfer.golferid = selectedteams.golfer6ID)
						AND selectedteams.poolpersonid = #qAllTeamsinGroup.entrantID#
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
				<cfif #qHandicapSum.TotHndcpStrForEntrant# GTE 0 >
					<cfset nettotalscore = #qHandicapSum.TotHndcpStrForEntrant# + #qSumTeamScore.TeamTotal#  />
				<cfelse>
					<cfset nettotalscore = #qSumTeamScore.TeamTotal#  />
				</cfif>
				<cfif #nettotalscore# GT 0>
						<cfif #nettotalscore# GT 80>
							<div class="overpartextongreenlarge">+ #nettotalscore#</div>
						<cfelse>
							<div class="overpartextongreenlarge">+ #nettotalscore#</div>
						</cfif>
				<cfelseif #nettotalscore# EQ 0>
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
	          </tr>
           </cfoutput>
        </table>
	  </td>
	  <td><img src="../images/spacer.gif" width="25" /></td>
	</tr>
  </table>
</form>
