<cfsilent>
<cfquery datasource="eyeon2" name="qAllGolfers">
SELECT *
FROM tgolfer
WHERE active = 1
AND eventid = #SESSION.eventid#
AND madecut = 1
ORDER BY CurrentScoreRelPar ASC, GolferLastName ASC
</cfquery>
<!--- AND madecut = 1 --->
<cfquery datasource="eyeon2" name="qAllGolfers_MC">
SELECT *
FROM tgolfer
WHERE active = 1
AND eventid = #SESSION.eventid#
AND madecut = 0
ORDER BY CurrentScoreRelPar ASC, GolferLastName ASC
</cfquery>

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
</cfsilent>

<div style="font-size:12px;">
<cfoutput>
	Leaderboard plus EyeOnMajors.com Handicaps
</cfoutput>
</div>


<table width="100%" class="white" cellpadding="10">
  <tr>
	<td class="tblehead">Contestant</td>
	<td class="tblehead">Last Name</td>
	<td class="tblehead">First Name</td>
	<td class="tblehead"align="center">6 Degrees of Wally</td>
	<td class="tblehead"align="center">R1</td>
	<td class="tblehead"align="center">R2</td>
	<td class="tblehead"align="center">R3</td>
	<td class="tblehead"align="center">R4</td>
	<td class="tblehead"align="center">Total</td>
	<td class="tblehead">Current Score</td>
	<td class="tblehead">thru</td>
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
		<td class="ltturq">
			<div style="font-size:9px;">
				<a href="Wally.cfm">Wally</a> Factor: <strong>#qAllGolfers.GolferLastName# has been selected on #percentageselected#% of teams globally</strong>
			</div>
			<div style="width:100%;border:1px solid ##006600">
				<div style="background-color:#colorstr#; color:#colorstr#; width:#percentageselected#%"></span><span style="color:black;text-align:center;">#percentageselected#%</div>
			</div>
			<!--- #qAllGolfers.DegsofWallyVal# degrees from . --->
		</td>
		<td class="ltturq">
		  <cfif r1 lt 72><cfset cls = "red"><cfelseif r1 eq 72><cfset cls = "green"><cfelse><cfset cls = "black"></cfif>
			<cfif r1 gt 0>
		    <span style="color:#cls#;">#R1#</span>
		  </cfif>
		</td>
		<td class="ltturq">
		  <cfif r2 lt 72><cfset cls = "red"><cfelseif r2 eq 72><cfset cls = "green"><cfelse><cfset cls = "black"></cfif>
		  <cfif r1 gt 0>
			  <span style="color:#cls#;">#R2#</span>
			</cfif>
		</td>
		<td class="ltturq">
		  <cfif r3 lt 72><cfset cls = "red"><cfelseif r3 eq 72><cfset cls = "green"><cfelse><cfset cls = "black"></cfif>
		  <cfif r1 gt 0>
			  <span style="color:#cls#;">#R3#</span>
			</cfif>
		</td>
		<td class="ltturq">
		  <cfif r4 lt 72><cfset cls = "red"><cfelseif r4 eq 72><cfset cls = "green"><cfelse><cfset cls = "black"></cfif>
		  <cfif r1 gt 0>
			  <span style="color:#cls#;">#R4#</span>
			</cfif>
		</td>
		<td class="ltturq" align="center">
			<cfif Total gt 0>
		    <b>#Total#</b>
		  <cfelse>
			  <b>-</b>
		  </cfif>
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
			#thru#
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
  <tr><td colspan="13" align="center" style="background-color:#660000;color:white;font-weight:bold;font-Family:Arial,Helvetica;border-top:2px dashed white;">M I S S E D   &nbsp;&nbsp;C U T  &nbsp;&nbsp;&nbsp;&nbsp;  B E L O W &nbsp;&nbsp;T H I S &nbsp;&nbsp;L I N E</td></tr>
  <cfoutput query="qAllGolfers_MC">
	<!--- Form start :: user click causes golfer to be added to Temporary Team/"cart"--->
	<tr>
		<td class="ltturq"><img src="#qAllGolfers_MC.GolferImage#.gif" /></td>
		<td class="ltturq">#qAllGolfers_MC.GolferLastName#</td>
		<td class="ltturq">#qAllGolfers_MC.GolferFirstName#</td>
		<cfquery name="qNumPatronsSelected" datasource="#sDSN2#">
					SELECT count(golferid) as NumPatronsSelected
					FROM tteamselected
					WHERE golferid = #qAllGolfers_MC.GolferID#
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
		<td class="ltturq">
			<div style="font-size:9px;">
				<a href="Wally.cfm">Wally</a> Factor: <strong>#qAllGolfers_MC.GolferLastName# has been selected on #percentageselected#% of teams globally</strong>
			</div>
			<div style="width:100%;border:1px solid ##006600">
				<div style="background-color:#colorstr#; color:#colorstr#; width:#percentageselected#%"></span><span style="color:black;text-align:center;">#percentageselected#%</div>
			</div>
		</td>
		<td class="ltturq" align="center">
			<cfif #qAllGolfers_MC.CurrentScoreRelPar# EQ 0>
				<div class="evenpartextongreen">E</div> 
			<cfelseif #qAllGolfers_MC.CurrentScoreRelPar# GT 0>
				<div class="overpartextongreen">+ #qAllGolfers_MC.CurrentScoreRelPar#</div>
			<cfelse>
				<div class="subpartextongreen">#qAllGolfers_MC.CurrentScoreRelPar#</div>
			</cfif>
		</td>
		<td class="ltturq" align="center">
			#thru#
		</td>
		<td class="ltturq" align="center">
			<cfquery datasource="#sDSN2#" name="qPlayerHandicap">
			  SELECT numstrokes as HandicapStrokes 
			  FROM thandicaps
			  WHERE GolferID = #qAllGolfers_MC.golferID#
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
				<cfset golfernetpoolscore = #qPlayerHandicap.HandicapStrokes# + #qAllGolfers_MC.CurrentScoreRelPar#  />
			<cfelse>
				<cfset golfernetpoolscore = #qAllGolfers_MC.CurrentScoreRelPar#  />
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
<div align="center">
  <!--- <cfinclude template="music_Augusta.cfm" /> --->
</div>
<cfinclude template="footer.cfm" />