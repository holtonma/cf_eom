<cfset nettotalscore = 0 />
<cfset currentplace = 0 />
<cfset outputplace = 0 />
<cfset teamTotNETprev = -1234 />
<!--- tiedPLbool: 0 = not tied; 1 = tied --->
<cfset tieldPLbool = 0 />

<!--- this query will return the single record (groupID) related to the authorized user --->
<cfquery datasource="#sDSN2#" name="qSpecificGroupID" >
SELECT 
	tE.entrantid as EntrantID, tEG.groupid as GroupID, tEG.groupid as PoolgroupID
FROM 
	tentrant tE INNER JOIN tentrantgroup tEG ON tE.entrantid = tEG.entrantid
WHERE 
	tE.entrantid = #SESSION.entrantid#
	AND 
	tEG.groupid = #SESSION.patrongroupid#
</cfquery>

<!--- <cfquery datasource="#sDSN#" name="qMyInfo" >
SELECT EntrantID, EntrantLastName, EntrantFirstName
FROM poolperson
WHERE EntrantID = #GetAuthUser()#
</cfquery> --->
<cfquery datasource="#sDSN2#" name="qMyInfo" >
SELECT entrantid as EntrantID, lname as EntrantLastName, fname as EntrantFirstName
FROM tentrant
WHERE EntrantID = #SESSION.entrantid#
</cfquery>

<!--- this query doesn't do anything but support the cfoutput query below --->
<!--- <cfquery datasource="#sDSN#" name="qUserSelTeam" >
	SELECT poolpersonID 
	FROM selectedteams
	WHERE selectedteams.poolpersonID = #GetAuthUser()#
</cfquery>  --->
<cfquery datasource="#sDSN2#" name="qUserSelTeam" >
	SELECT entrantid, fname, lname
	FROM tentrant
	WHERE entrantid = #SESSION.entrantid#
</cfquery> 

<cfset ccutline = 10/>

<!--- this will be set by a random query to the database --->
<cfset strRandomMajorFact = "Major fact: the first ALBATROSS at The Masters was in 1935 by Gene Sarazen at the 15th hole.  There have been two in the tournament's history since then." />
<cfset strRandomMajorFactover = "Major fact: In 1956, Jack Burke, Jr. won The Masters by one-stroke over Ken Venturi with a total of +1, 289 strokes." />
<cfset strRandomMajorFacteven = "Major fact: In 1966, Jack Nicklaus finished with an EVEN par 288 total, and won his 2nd consecutive Masters, and his 3rd Green Jacket overall." />
<!--- --->
				

<form action="existing_squad_manage.cfm" method="post">
  
  
  <table width="100%">
    <tr valign="top">
	  <td>
	    <table width="100%" class="ltblu">
          <tr>
			<td class="ltturq"></td>
			<td class="ltturq">Pool Entrant</td>
	        <td class="ltturq">Player 1</td>
			<td class="ltturq">Player 2</td>
			<td class="ltturq">Player 3</td>
			<td class="ltturq">Player 4</td>
			<td class="ltturq">Player 5</td>
			<td class="ltturq">Player 6</td>
	        <td class="ltturq"></td> 
			<td class="ltturq"></td> 
			<td class="ltturq">EoM <br> Handicaps</td>
          </tr>
		  <cfoutput query="qUserSelTeam">
			
		  	<tr>
		        <td height="40"  align="center" class="ltturq">
					<cfif IsDefined('FORM.confirm_button.y')>
						<strong style="color:green; font-size:14px;">Team Saved!</strong>
					<cfelse>
						<strong>
						Click<br>
						"checkout"<br>
						to Save<br>
						Team
						</strong>
					</cfif>
				</td>
				<td height="40" class="ltblu">
				  #qMyInfo.entrantLastName#, #qMyInfo.entrantFirstName#
				</td>
	            <td height="40" align="center"   class="ltblu">
				  <cfquery datasource="#sDSN2#" name="qGolferpic" >
					  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
					  FROM tgolfer
					  WHERE golferID = #Session.cart[1].golfer_id#
				  </cfquery>
				  		<cfif #qGolferpic.GolferLastName# EQ "">
						<span class="cut"><a href="/store/index_future.cfm" class="cut">team<br>
						not<br>complete</a></span>
						<cfelse>
						<!--- golfer selected --->
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
				  <cfquery datasource="#sDSN2#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM tgolfer
				  WHERE golferID = #Session.cart[2].golfer_id#
				  </cfquery>
				  		<cfif #qGolferpic.GolferLastName# EQ "">
						<span class="cut"><a href="/store/index_future.cfm" class="cut">team<br>
						not<br>complete</a></span>
						<cfelse>
						<!--- golfer selected --->
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
				  <cfquery datasource="#sDSN2#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM tgolfer
				  WHERE golferID = #Session.cart[3].golfer_id#
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
				  <cfquery datasource="#sDSN2#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM tgolfer
				  WHERE golferID = #Session.cart[4].golfer_id#
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
				  <cfquery datasource="#sDSN2#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM tgolfer
				  WHERE golferID = #Session.cart[5].golfer_id#
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
				  <cfquery datasource="#sDSN2#" name="qGolferpic" >
				  SELECT GolferImage, GolferFirstName, GolferLastName, CurrentScoreRelPar 
				  FROM tgolfer
				  WHERE golferID = #Session.cart[6].golfer_id#
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
						<cfquery datasource="#sDSN2#" name="qHndcpCount">
							SELECT GolferID
							FROM thandicaps
							WHERE GolferID = #Session.cart[1].golfer_id# OR GolferID = #Session.cart[2].golfer_id# OR GolferID = #Session.cart[3].golfer_id# OR GolferID = #Session.cart[4].golfer_id# OR GolferID = #Session.cart[5].golfer_id# OR GolferID = #Session.cart[6].golfer_id#
							AND eventid = #SESSION.eventid#
						</cfquery>							
					
					<cfquery datasource="#sDSN2#" name="qHandicapSum" >
					  SELECT Sum(numstrokes) as TotHndcpStrForEntrant
					  FROM thandicaps
					  WHERE 
					  	(GolferID = #Session.cart[1].golfer_id# AND eventid = #SESSION.eventid#) 
					  	OR 
					  	(GolferID = #Session.cart[2].golfer_id# AND eventid = #SESSION.eventid#)
					  	OR 
					  	(GolferID = #Session.cart[3].golfer_id# AND eventid = #SESSION.eventid#)
					  	OR 
					  	(GolferID = #Session.cart[4].golfer_id# AND eventid = #SESSION.eventid#)
					  	OR 
					  	(GolferID = #Session.cart[5].golfer_id# AND eventid = #SESSION.eventid#)
					  	OR 
					  	(GolferID = #Session.cart[6].golfer_id# AND eventid = #SESSION.eventid#)
				  	  
					</cfquery> 
					
				</td>
				
				<td height="40" class="ltblu" align="center">
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
					  </cfif> --->
						  
				</td>
				<td height="40" class="ltblu" align="center">
				<!--- turn this into an array: array(i, NET, ID)? --->
				<cfif qHndcpCount.recordcount GT 0>
					<cfset nettotalscore = #qHandicapSum.TotHndcpStrForEntrant#  />
				<cfelse>
					<cfset nettotalscore = #qHandicapSum.TotHndcpStrForEntrant#   />
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
						<!--- this block is for the next iteration determining if the PLACE is a tie --->
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
