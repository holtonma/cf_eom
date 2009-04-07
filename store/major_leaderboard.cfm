<cfsilent>
<cfquery datasource="eyeon2" name="qAllGolfers">
SELECT *
FROM tgolfer
WHERE active = 1
ORDER BY CurrentScoreRelPar ASC, GolferLastName ASC
</cfquery>
</cfsilent>
<cfquery datasource="#sDSN2#" name="qEventInfo">
	SELECT 
		tEs.eventyear,
		tEN.eventname
	FROM
		teventname tEN LEFT OUTER JOIN tevents tEs ON tEN.eventnameid = tEs.eventnameid
	WHERE
		tEs.eventID = #SESSION.currenteventid#
</cfquery>
<cfset tourneyname = #qEventInfo.eventname#>

<cfquery name="qNumGolfersOnFullSquads" datasource="#sDSN2#">
	SELECT count(autoid) as numgolfersonfullsquads
	FROM tteamselected
	WHERE golferid > 0
	AND eventid = #SESSION.eventid#
</cfquery>
<cfset numfullsquads = #qNumGolfersOnFullSquads.numgolfersonfullsquads# / 6>
<cfif numfullsquads eq 0>
	<cfset numfullsquads = 1000000000>
</cfif>

<cfinclude template="header.cfm" />
<link rel="STYLESHEET" type="text/css" href="../EoM/styles.css">
<br> 
<div>
<cfoutput>
	#qEventInfo.eventname# #qEventInfo.eventyear# :: Leaderboard plus EyeOnMajors.com Pool Handicaps
</cfoutput>
</div><br>


<table width="100%" class="white" cellpadding="10">
  <tr>
	<td class="tblehead">Contestant</td>
	<td class="tblehead">Last Name</td>
	<td class="tblehead">First Name</td>
	<td class="tblehead"align="center">6 Degrees of Wally</td>
	<td class="tblehead">Current Score</td>
	<td class="tblehead" align="center">EyeOnMajors.com<br>Handicap</td>
	<td class="tblehead" align="center">Golfer <br>Pool NET</td>
  </tr>
  <cfoutput query="qAllGolfers">
	<!--- Form start :: user click causes golfer to be added to Temporary Team/"cart"--->
	<tr>
		<td class="ltturq"><img src="#qAllGolfers.GolferImage#.gif" /></td>
		<td class="ltturq">#qAllGolfers.GolferLastName#</td>
		<td class="ltturq">#qAllGolfers.GolferFirstName#</td>
		<cfquery name="qNumPatronsSelected" datasource="#sDSN2#">
					SELECT count(golferid) as NumPatronsSelected
					FROM tteamselected
					WHERE golferid = #qAllGolfers.GolferID#
					AND eventid = #SESSION.eventid#
				</cfquery>
				<cfset numXselected = #qNumPatronsSelected.NumPatronsSelected#>
				<cfset percentageselected = #NumberFormat((numXselected/numfullsquads)*100, "0.00")#>
				<cfif percentageselected gt 30>
					<cfset colorstr = "##B90000">
				<cfelseif percentageselected gt 26>
					<cfset colorstr = "##FC3C03">
				<cfelseif percentageselected gt 22>
					<cfset colorstr = "##F4450B">
				<cfelseif percentageselected gt 18>
					<cfset colorstr = "##FAC905">
				<cfelseif percentageselected gt 14>
					<cfset colorstr = "##F4860B">
				<cfelseif percentageselected gt 10>
					<cfset colorstr = "##FAC905">
				<cfelseif percentageselected gt 6>
					<cfset colorstr = "##FCDA52">
				<cfelseif percentageselected gt 2>
					<cfset colorstr = "yellow">
				<cfelse>	
					<cfset colorstr = "yellow">
				</cfif>
				<!--- 1 : #B90000
						2 : #FC3C03
						3 : #F4450B
						4 : #FAC905
						5 : #F4860B
						6 : #FAC905
						7 : #FCDA52
						8 : #FFF --->
		<td class="ltturq">
			<div style="font-size:9px;">
				<a href="Wally.cfm">Wally</a> Factor: <strong>#qAllGolfers.GolferLastName# has been selected on #percentageselected#% of teams globally</strong>
			</div>
			<div style="width:100%;border:1px solid ##006600">
				<div style="background-color:#colorstr#; color:#colorstr#; width:#percentageselected#%"></span><span style="color:black;text-align:center;">#percentageselected#%</div>
			</div>
			<!--- #qAllGolfers.DegsofWallyVal# degrees from . --->
		</td>
		<td class="ltturq" align="center">
			<cfif #qAllGolfers.CurrentScoreRelPar# EQ 0>
				<div class="evenpartextongreen">E</div> 
			<cfelseif #qAllGolfers.CurrentScoreRelPar# GT 0>
				<div class="overpartextongreen">+ #qAllGolfers.CurrentScoreRelPar#</div>
			<cfelse>
				<div class="subpartextongreen">#qAllGolfers.CurrentScoreRelPar#</div>
			</cfif>
		</td>
		<td class="ltturq" align="center">
			<cfquery datasource="#sDSN2#" name="qPlayerHandicap">
			  SELECT numstrokes as HandicapStrokes 
			  FROM thandicaps
			  WHERE GolferID = #qAllGolfers.golferID#
			  AND eventid = #SESSION.eventid#
			</cfquery> 
			<cfif #qPlayerHandicap.recordcount# GT 0>
				#qPlayerHandicap.HandicapStrokes# Strokes
			<cfelse>
				-
			</cfif>
		</td>
		<td class="ltturq" align="center">
		    <cfif #qPlayerHandicap.recordcount# GT 0>
				<cfset golfernetpoolscore = #qPlayerHandicap.HandicapStrokes# + #qAllGolfers.CurrentScoreRelPar#  />
			<cfelse>
				<cfset golfernetpoolscore = #qAllGolfers.CurrentScoreRelPar#  />
			</cfif>
			<cfif #golfernetpoolscore# EQ 0>
				E
			<cfelseif #golfernetpoolscore# GT 0>
				+ #golfernetpoolscore#
			<cfelse>
				#golfernetpoolscore#
			</cfif>
			
		</td>
    </tr>
    
	<!--- Form close --->
  </cfoutput>
</table>
<div align="center">Music will be turned on when the Masters, EyeOnMajors.com-style, commences.
  <!--- <cfinclude template="music.cfm" /> --->
</div>
<cfinclude template="footer.cfm" />