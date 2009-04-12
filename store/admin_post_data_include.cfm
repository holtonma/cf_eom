<cfif NOT IsDefined('SESSION.golferscorecart')>
	<cfset SESSION.golferscorecart = ArrayNew(1) />
</cfif>


<cfinclude template="eom_header_global.cfm" />

<cfparam name="URL.orderby" default="1">
<cfparam name="URL.showinactive" default="1">
<cfif URL.orderby eq 1>
	<cfset orderbystring = " ORDER BY GolferLastName ASC ">
<cfelseif URL.orderby eq 2>
	<cfset orderbystring = " ORDER BY CurrentScoreRelPar ASC, GolferLastName ASC ">
<cfelse>
	<cfset orderbystring = " ORDER BY GolferLastName ASC">
</cfif>

<cfif URL.showinactive eq 0>
	<cfset activestring = " AND active = 1 ">
<cfelseif URL.showinactive eq 1>
	<cfset activestring = "">
<cfelse>
	<cfset activestring = "">
</cfif>

<link rel="STYLESHEET" type="text/css" href="../EoM/styles.css">
<cfoutput>admin user ID: #GetAuthUser()#</cfoutput> <br>
<!--- <cfoutput>updating #ArrayLen(SESSION.golferscorecart)# player data for EoM database</cfoutput>
<cfloop from="1" to="#ArrayLen(SESSION.golferscorecart)#" index="i">
	<cfoutput>#Session.golferscorecart[i].golfer_id#</cfoutput>
</cfloop> --->

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
				tTS.eventid = tH.eventid
				
				 --->
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


<!--- for now put this query here, but move this out of the page into a CFC later --->
<cfoutput>
	<!--- 
	AND active = 1
	AND madecut = 1
	 --->
<cfquery name="qGetAllActiveGolfers" datasource="eyeon2" dbtype="query">
	SELECT GolferID, golferfirstname, golferlastname, currentscorerelpar, golferimage, active
	FROM tgolfer
	WHERE 1 = 1	
	  AND active = 1
	ORDER BY golferlastname asc
</cfquery>
<!--- #activestring#  #orderbystring#--->

<!--- WHERE madecut = 1
	#activestring#
	#orderbystring# --->
</cfoutput>
<!--- WHERE active = 1 --->

<cfquery name="qNumGolfersOnFullSquads" datasource="#sDSN2#">
	SELECT count(autoid) as numgolfersonfullsquads
	FROM tteamselected
	WHERE golferid > 0
	AND eventid = #SESSION.eventid#
</cfquery>
<cfset numfullsquads = #qNumGolfersOnFullSquads.numgolfersonfullsquads# / 6>

<!--- Number of Full Squads: <cfoutput>#numfullsquads#</cfoutput> --->
<!--- <a href="admin_migrate_tEntrantGroup.cfm">Migrate to tEG</a> --->
<!--- <a href="admin_emailbulk.cfm">Email Bulk</a> --->
<!--- <a href="admin_emailbulk_6degsofwally.cfm">Email 6degsofWally</a> --->
<!--- <a href="admin_emailbulk_prizesAnd5perTeam.cfm">Email Prizes</a> --->
<!--- <a href="admin_emailbulk_DayBeforeChoseBadPlayers.cfm">Faldo, Quigley Out</a> --->
<!--- <a href="admin_andwereoff.cfm">and we're off</a>  --->
<!--- <a href="admin__madecut_post.cfm">set cutline</a>  --->
<!--- <a href="admin_setcutgolfers.cfm">set cut golfers</a> --->
<!--- <a href="group_leaderboard_pdf.cfm">PDF of Group</a>  --->
<!--- <a href="admin_emailbulk_thanksforplaying.cfm">Thanks for playing!</a> --->
<!--- <a href="admin_emailbulk_groupmagical.cfm">GroupMagical Email!</a> --->  |
<!--- <a href="admin_emailbulk_allentrants.cfm">All Entrants Email!</a> --->  |
<!--- <a href="admin_emailbulk_allentrants_Faldo_20shots.cfm">All Entrants Email -- Faldo 20 shots!</a> --->
<!--- <a href="admin_emailbulk_allentrants_Day1.cfm">All Entrants Email -- Day 1!</a>  --->
<!--- <a href="admin_nexttourney.cfm">Update For Next Tourney (British Open 2007)</a>  ---> 
<!--- <a href="admin_emailbulk_initial.cfm">Email Bulk</a> ---> <!---  ---> 
<a href="groupleaderboard_present_Ajax.cfm">Testing New Ajax Build</a>



<table width="80%">
	<cfoutput>
	<tr style="font-weight:bold; color:black; border:1px solid green;">
		<td><a href="admin_post_data.cfm?orderby=1&showinactive=#URL.showinactive#">Golfer</a></td>
		<td><a href="admin_post_data.cfm?orderby=2&showinactive=#URL.showinactive#">Current Score</a></td>
		<td>Change Score</td>
		<td><a href="admin_post_data.cfm?showinactive=0">Active = 1</a> /</br><a href="admin_post_data.cfm?showinactive=1">Inactive = 0</a></td>
		<td>Active</br>Status</td>
		<td>Handicap</td>
		<td>Current Handicap</td>
		<td>Patrons Select %</td>
	</tr>
	</cfoutput>
	<cfset counter = 0>
		<form name="adminAjax" id="adminAjax">
		<cfoutput query="qGetAllActiveGolfers">
			<cfset counter = counter + 1>
			<tr style="color:gray;">
				<cfset spnCurrentscore = "currentscorespan" & ToString(counter)>
				<td>#qGetAllActiveGolfers.golferlastname#, #qGetAllActiveGolfers.golferfirstname#</td>
				<td><span id="#spnCurrentscore#">#currentscorerelpar#</span></td>
				<td colspan="1">
					<cfset selname = "selGolfer" & ToString(counter)>
					<cfset txtScoreRelPar = "txtScore" & ToString(counter)>
					<cfset spnUpdateIndicator = "spnUpdate" & ToString(counter)>
					<cfset hdGolferID = "hdGolferID" & ToString(counter)>
					<cfset statusvar = "status" & ToString(counter)>
					<input type="hidden" id="#hdGolferID#" name="#hdGolferID#" value="#qGetAllActiveGolfers.GolferID#">
					<!--- form the $('name').value strings to be passed into the js: --->
					<input type="text" id="#txtScoreRelPar#" size="8" name="#txtScoreRelPar#" 
							value="#qGetAllActiveGolfers.currentscorerelpar#" 
							onblur="javascript:updateGolferScore($('#hdGolferID#').value, $('#txtScoreRelPar#').value, '#spnCurrentscore#', '#spnUpdateIndicator#');"
							> 
				</td>
				<td>
					<cfset txtActive = "txtActive" & ToString(counter)>
					<cfset spnActiveIndicator = "spnActive" & ToString(counter)>
					<input type="text" id="#txtActive#" size="5" name="#txtActive#" <cfif URL.showinactive eq 0><!--- disabled="true" ---></cfif>
							value="#qGetAllActiveGolfers.active#" 
							onblur="javascript:updateGolferActive(
								$('#hdGolferID#').value, 
								$('#txtActive#').value,
								'#spnUpdateIndicator#');" > <!--- disabled="true" --->
				</td>
				<!--- <td><span id="#spnActiveIndicator#"></td> --->
				<!--- <td align="center"><a href="">+</a></td> --->
				<td>
					<span id="#spnUpdateIndicator#">
						<cfif qGetAllActiveGolfers.active eq 1>
							Active!
						<cfelse>
							inactive
						</cfif>
					</span>
				</td>
				<td>
					<cfset txtHndcp = "txtHndcp" & ToString(counter)>
					<cfset spnHndcpInd = "spnHndcp" & ToString(counter)>
					<cfquery name="qHandicapFind" datasource="#sDSN2#">
						SELECT numstrokes
						FROM thandicaps
						WHERE groupid = 1
						AND golferid = #qGetAllActiveGolfers.GolferID#
						AND eventid = #SESSION.eventid#
					</cfquery>
					<input type="text" id="#txtHndcp#" size="5" name="#txtHndcp#" 
							value="#qHandicapFind.numstrokes#" 
							onblur="javascript:updateHandicap(
								$('#hdGolferID#').value, 
								$('#txtHndcp#').value,
								'#spnHndcpInd#');"> <!--- disabled="true" --->
				</td>
				<td><span id="#spnHndcpInd#"></span></td>
				<cfquery name="qNumPatronsSelected" datasource="#sDSN2#">
					SELECT count(golferid) as NumPatronsSelected
					FROM tteamselected
					WHERE golferid = #qGetAllActiveGolfers.GolferID#
					and eventid = #SESSION.eventid#
				</cfquery>
				<cfset numXselected = #qNumPatronsSelected.NumPatronsSelected#>
				<cfset percentageselected = #NumberFormat((numXselected/numfullsquads)*100, "0.00")#>
				<td>
					<div style="font-size:9px;">
					#numXselected# teams (#percentageselected#%)
					</div>
				</td>
			</tr>
		</cfoutput>
		</form>
  <!---
  <tr>
    <td colspan="3">
	  <img src="../images/spacer.gif" height="25" />
	</td>
  </tr>
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
	--->
		<!--- during tourney: --->
      <!--- <cfinclude template="admin_post_data_cart.cfm" /> --->
	  <!--- before tourney <cfinclude template="admin_post_data_cart_activegolfer.cfm" /> --->
	  
	  <!--- commented out during AJAX implementation
	  <cfinclude template="admin_post_data_cart.cfm" />
	  --->
	
	<!---
	</td>
    <td><img src="../images/spacer.gif" width="25" /></td>
    </td>
  </tr>
  <tr>
    <td colspan="3">
	  <img src="../images/spacer.gif" height="25" />
	</td>
  </tr>
  --->
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
		<!--- before tourney, set active golfers: 
		<cfinclude template="admin_post_data_active_golfers.cfm" />
		--->
		<!--- during tourney, set scores golfers: 
		<cfinclude template="admin_post_data_main_list.cfm" /> --->
      	
	 	<!--- this contains all of the experimental drag/drop, etc etc  --->
		<!--- <cfinclude template="admin_post_data_main_list.cfm" /> --->
	    
		
	</td>
    <td><img src="../images/spacer.gif" width="25" /></td>
    </td>
  </tr>
</table>
<div style="border: 2px solid red;">
<div style="font-size:16px; font-weight;bold;">SET CUTLINE after all scores have been posted after Friday's round</div>
<div>After ALL scores are in Friday, type in the cutline number here 
	<input type="text" id="txtCutNumber" size="5"> and click this link: 
	<a href="javascript:setCutline()";>Set Cut Line</a> to include golfers at this score and below (E.g. 4 means all golfers at +4 or better made cut)
	<span id="cutnumupdated" style="color:green;font-weight:bold;font-size:12px;"></span>
</div>

<div><a href="javascript:set65Cutline()";>Set 6-count-5 Cut Line</a>
<span id="65cutnumupdated" style="color:green;font-weight:bold;font-size:12px;"></span>
</div>

<div>
	(if you accidentally mess up, you can reset the cutline by clicking this link <a href="javascript:resetcut();">reset cutline</a>)
	<span id="resetcutupdate" style="color:green;font-weight:bold;font-size:12px;"></span>
	<span style="color:red;font-size:12px;font-weight:bold;">IMPORTANT: Friday night you can set cutline once all scores have been posted.  If you need to reset for some reason, you can click the reset link.  But once you start keeping score for Saturday or Sunday, DO NOT click these links.  If you do, you will have to set all scores back to Friday night's scores and then set cutline again.</span>
</div>
</div>
<cfinclude template="footer.cfm" />

<!--- <cfset golferscorepar = FORM.scorerelpar>
<cfset golferidpar = FORM.golferid> --->

<script type="text/javascript">
		function updateGolferScore(golferID, scoreRelPar, updatedDOMelem, indicatorDOMelem) {
				var pars = 'FORM.golferid=' + golferID + '&FORM.scorerelpar=' + scoreRelPar;
								
				var resultDomElem = updatedDOMelem
				new Ajax.Updater(resultDomElem, 'eom_caller_updatescore.cfm', 
				{
				asynchronous:true,
				parameters: pars,
				onSuccess:function(){ }
				}
				);
				
				// updated in database
		}
</script>
<script type="text/javascript">
		function updateGolferActive(golferID, ActiveVal, updatedDOMelem) {
				var pars = 'FORM.golferid=' + golferID + '&FORM.activeval=' + ActiveVal;
								
				var resultDomElem = updatedDOMelem
				new Ajax.Updater(resultDomElem, 'eom_caller_golferactive.cfm', 
				{
				asynchronous:true,
				parameters: pars,
				onSuccess:function(){ }
				}
				);
				
				// updated in database
		}
</script>
<script type="text/javascript">
		function updateHandicap(golferID, HandicapValue, updatedDOMelem) {
				var pars = 'FORM.golferid=' + golferID + '&FORM.handicapval=' + HandicapValue;
								
				var resultDomElem = $(updatedDOMelem);
				new Ajax.Updater(resultDomElem, 'eom_caller_handicapset.cfm', 
				{
				asynchronous:true,
				parameters: pars,
				onSuccess:function(){ }
				}
				);
				
				// updated in database
		}
</script>

<script type="text/javascript">
	function setCutline(){
		var cutnum = $('txtCutNumber').value;
		var pars = 'FORM.cutnum=' + cutnum;
		var resultDomElem = cutnumupdated;
		new Ajax.Updater(resultDomElem, 'eom_caller_setcutnum.cfm', 
		{
		asynchronous:true,
		parameters: pars,
		onSuccess:function(){ }
		}
		);
	}
	
	function set65Cutline(){
		var cutnum = $('txtCutNumber').value;
		var pars = 'FORM.cutnum=' + cutnum;
		var resultDomElem = '65cutnumupdated';
		new Ajax.Updater(resultDomElem, 'eom_caller_set65cutnum.cfm', 
		{
		asynchronous:true,
		parameters: pars,
		onSuccess:function(){ }
		}
		);
	}
</script>

<script type="text/javascript">
	function resetcut(){
		var pars = "";
		var resultDomElem = resetcutupdate;
		new Ajax.Updater(resultDomElem, 'eom_caller_resetcut.cfm', 
		{
		asynchronous:true,
		parameters: pars,
		onSuccess:function(){ }
		}
		);
	}
</script>
<!--- value="#qHandicapFind.numstrokes#" 
							onblur="javascript:updateHandicap(
								$('#hdGolferID#').value, 
								$('#txtHndcp#').value,
								#spnUpdateIndicator#);"> --->
								
</body>
</html>