<cfinclude template="header.cfm" />

<cfoutput>#GetAuthUser()#</cfoutput>
<cfoutput>cart qnty: #ArrayLen(SESSION.golferscorecart)# :: </cfoutput>
<cfloop from="1" to="#ArrayLen(SESSION.golferscorecart)#" index="i">
	<cfoutput>#Session.golferscorecart[i].golfer_id# (#Session.golferscorecart[i].CurrentScore#) ;</cfoutput>
</cfloop>

<cfif IsDefined('FORM.confirm_button.y')>
	<cfloop from="1" to="#ArrayLen(SESSION.golferscorecart)#" index="i">
		<cfquery datasource="#sDSN#">
			UPDATE golfer
			SET CurrentScoreRelPar = '#Session.golferscorecart[i].CurrentScore#' 
			WHERE GolferID = '#Session.golferscorecart[i].golfer_id#'
		</cfquery>
	</cfloop>
	<cfset ArrayClear(SESSION.golferscorecart) />
		<!-- now update the database 'selectedteams' table, 'latest_teamnetscore' field 
		this will contain the sum total of the selected teams (which can be ordered by later)-->
			<cfquery datasource="#sDSN#" name="qUpdateLessthanFullSquads" >
				UPDATE selectedteams
				SET selectedteams.latest_teamnetscore = 1000
				WHERE selectedteams.fullsquad = 0
			</cfquery>
			
			<!-- this recordset is of ALL fullsquads = 1, and thosesquads who have made cut --- this works properly-->
			<cfquery datasource="#sDSN#" name="qUpdateTeamNetScores">
				SELECT poolperson.entrantID, poolperson.selectedteam1id as SelectedTeam,
				poolperson.groupid, selectedteams.golfer1ID, selectedteams.golfer2ID, 
				selectedteams.golfer3ID, selectedteams.golfer4ID, selectedteams.golfer5ID, 
				selectedteams.golfer6ID
				FROM poolperson, selectedteams
				WHERE poolperson.EntrantID = selectedteams.poolpersonID AND poolperson.groupid = selectedteams.PoolGroupID
				AND selectedteams.fullsquad = 1
				AND selectedteams.madecut = 1
				ORDER BY poolperson.EntrantLastName ASC
			</cfquery>
			<cfif #qUpdateTeamNetScores.RecordCount# GT 0>
					<!--now that we've selected all the teams that have full squads, loop through them and update them with Handicap+TeamSum (NET) totals:  -->	
					<CFLOOP query="qUpdateTeamNetScores">
						<!--  this appears to work properly, returns total team score rel to par -->
						<cfquery datasource="#sDSN#" name="qSumTeamScore" >
							SELECT SUM(CurrentScoreRelPar) as TeamTotal
							FROM golfer, selectedteams
							WHERE (golfer.golferid = selectedteams.golfer1ID OR golfer.golferid = selectedteams.golfer2ID OR golfer.golferid = selectedteams.golfer3ID
							OR golfer.golferid = selectedteams.golfer4ID OR golfer.golferid = selectedteams.golfer5ID OR golfer.golferid = selectedteams.golfer6ID)
							AND selectedteams.poolpersonid = #qUpdateTeamNetScores.entrantID#
						</cfquery>
						<!-- searches through EoM Handicaps table to find out which golfers in a particular team have handicaps-->
						<cfquery datasource="#sDSN#" name="qHndcpCount" >
							SELECT GolferID
							FROM eomhandicaps
							WHERE GolferID = #qUpdateTeamNetScores.golfer1ID# OR GolferID = #qUpdateTeamNetScores.golfer2ID# OR GolferID = #qUpdateTeamNetScores.golfer3ID# OR GolferID = #qUpdateTeamNetScores.golfer4ID# OR GolferID = #qUpdateTeamNetScores.golfer5ID# OR GolferID = #qUpdateTeamNetScores.golfer6ID#
						</cfquery>
						<cfquery datasource="#sDSN#" name="qHandicapSum" >
							SELECT Sum(HandicapStrokes) as TotHndcpStrForEntrant
							FROM eomhandicaps
							WHERE GolferID = #qUpdateTeamNetScores.golfer1ID# OR GolferID = #qUpdateTeamNetScores.golfer2ID# OR GolferID = #qUpdateTeamNetScores.golfer3ID# OR GolferID = #qUpdateTeamNetScores.golfer4ID# OR GolferID = #qUpdateTeamNetScores.golfer5ID# OR GolferID = #qUpdateTeamNetScores.golfer6ID#
						</cfquery> 
							---EntrantID:<cfoutput>#qUpdateTeamNetScores.entrantID#</cfoutput>;qHandicapSumRecordCount:<cfoutput>#qHndcpCount.RecordCount#</cfoutput>
							<cfif #qHndcpCount.RecordCount# EQ 0>
								<cfset NETteamScore = #qSumTeamScore.TeamTotal#  />
							<cfelseif #qHandicapSum.TotHndcpStrForEntrant# EQ 0 >
								<cfset NETteamScore = #qSumTeamScore.TeamTotal#  />
							<cfelse>
								<cfset NETteamScore = #qHandicapSum.TotHndcpStrForEntrant# + #qSumTeamScore.TeamTotal#  /> <!--   -->
							</cfif>
								<!-- now only update 'latest_teamnetscore' for entrants who selected a team:
									 -->
									<CFQUERY datasource="#sDSN#" name="qUpdate" >
										UPDATE selectedteams 
										SET latest_teamnetscore = #NETteamScore#
										WHERE poolpersonid = #qUpdateTeamNetScores.entrantID#
									</CFQUERY>
								
						<!--find lowest score and update cutline, also save "lastupdatedtime" field -->
						<CFQUERY datasource="#sDSN#" name="qLowestScore" >
							SELECT MIN(CurrentScoreRelPar) as leaderscore
							FROM golfer
						</CFQUERY>
						<cfset ccutline = #qLowestScore.leaderscore# + 10 />
						<CFQUERY datasource="#sDSN#" name="qCutLine" >
							UPDATE currentcutline
							SET cutline = #ccutline#,
							LastUpdatedTime = #CreateODBCDateTime(Now())#
							WHERE CurrentCutLineID = 1
						</CFQUERY>
					</CFLOOP> 
			</cfif>
		<!----------------------------------------------------------------------------------->
<cfelse>
	<cfoutput>
		<form action="#CGI.SCRIPT_NAME#" method="post">
		If you are ready to save these changes to the database, click on the CHECKOUT button.  <br>
		Otherwise click your browser's BACK button to review and/or modify your changes.
		<br />
		<input type="image" name="confirm_button" src="../images/checkout.gif" />
		</form>
	</Cfoutput>
</cfif>

<cfinclude template="footer.cfm" />