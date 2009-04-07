<cfset golferHndcp = "--"/>
<!--- version 1 --->
<!--- <cfquery datasource="#sDSN#" name="qAllGolfers">
SELECT *
FROM golfer
WHERE active = 1
ORDER BY GolferLastName ASC
</cfquery> --->
<cfquery datasource="#sDSN2#" name="qAllGolfers">
	SELECT GolferID, GolferFirstName, GolferLastName, DegsofWallyVal, GolferImage, active
	FROM tgolfer
	WHERE active = 1
	ORDER BY GolferLastName ASC
</cfquery>
<link rel="STYLESHEET" type="text/css" href="../styles.css">
<style type="text/css">
<!--
.style1 {font-size: 12px}
-->
</style>

<cfquery name="qNumGolfersOnFullSquads" datasource="#sDSN2#">
	SELECT count(autoid) as numgolfersonfullsquads
	FROM tteamselected
	WHERE golferid > 0
	AND eventid = #SESSION.eventid#
</cfquery>
<cfset numfullsquads = #qNumGolfersOnFullSquads.numgolfersonfullsquads# / 6>
<cfif numfullsquads gte 1>
<cfelse>
	<cfset numfullsquads = 1000000000000>
</cfif>

<cfquery name="qGetEventInfo" datasource="#sDSN2#">
	SELECT 
		tE.eventid, tE.eventnameid, tE.eventyear,
		tEN.eventname
	FROM tevents tE INNER JOIN teventname tEN ON tE.eventnameid = tEN.eventnameid
	WHERE tE.eventid = #SESSION.eventid#
</cfquery>
<cfquery name="qGetHandicaps" datasource="#sDSN2#">
	SELECT
		tH.golferid, tH.numstrokes, tG.GolferFirstName, tG.GolferLastName
	FROM thandicaps tH INNER JOIN tgolfer tG ON tH.golferid = tG.golferid
	WHERE tH.numstrokes NOT IN(0) 
	AND tH.groupid = 1
	AND tH.eventid = #SESSION.eventid#
	AND tG.active = 1
	ORDER BY tH.numstrokes DESC
</cfquery>
<cfoutput>
<div style="font-size:large; font-weight:bold;">Instructions:</div>
<div style="font-size:large;">
	Select your team of 6 players from this list by clicking the player's face!
	Your team as selected will appear above. (required: 6 players before you are ready to checkout and play!) <br> <br>
</div>
<strong style="color:green;">
#qGetEventInfo.eventname# #qGetEventInfo.eventyear# Handicaps:
</strong> </br>
</cfoutput>
<cfset counter = 0>
<cfoutput query="qGetHandicaps">
	<cfset counter = counter + 1>
	<cfif counter eq qGetHandicaps.RecordCount>
		#GolferFirstName# #GolferLastName# = 
		<cfif numstrokes lt 0>
			<span style="font-weight:bold;color:red;">#numstrokes#</span> bonus!
		<cfelseif numstrokes gt 0>
			<span style="font-weight:bold;color:black;">#numstrokes#</span> shots <strong style="color:black">::</strong>
		</cfif> 
	<cfelse>
		#GolferFirstName# #GolferLastName#
		<cfif numstrokes lt 0>
			<span style="font-weight:bold;color:red;">#numstrokes#</span> bonus!
		<cfelseif numstrokes gt 0>
			<span style="font-weight:bold;color:black;">#numstrokes#</span> shots <strong style="color:black">::</strong>
		</cfif>
		
		<!--- #GolferFirstName# #GolferLastName# = #numstrokes# shots : --->
	</cfif>
	
</cfoutput>

<!--- <div class="coreboardeven">HANDICAPS FOR EyeOnMajors.com 2006 US Open:</div> <br> ---> 
<!--- <span class="mastersgreen">Tiger Woods <span class="coreboardover style1">+12 </span>, 
Phil Mickelson <span class="coreboardover style1"> +5 </span>, 
Vijay Singh <span class="coreboardover style1"> +5 </span>, , 
Retief Goosen <span class="coreboardover style1">+5 </span>, 
Jim Furyk <span class="coreboardover style1">+4 </span>, 
David Duval <span class="coreboardunder style1">-12 </span></span><br />
Select David Duval at your own risk --->
<br>
<br>
<table width="100%" class="white" cellpadding="10">
  <tr>
	<td class="tblehead" align="center">Add to Team<br>Button</td>
	<td class="tblehead">Research</td>
	<td class="tblehead">Last Name</td>
	<td class="tblehead">First Name</td>
	<td class="tblehead">6 Degrees of Wally</td>
	<td class="tblehead" align="center">EyeOnMajors.com<br>Handicap</td>
	
  </tr>
  <cfoutput query="qAllGolfers">
  	<!-- obtain the golferID of each golfer from this query being looped through, in order to see if that golfer has a handicap -->
	<!--- version 1 --->
	<!--- <cfquery datasource="#sDSN#" name="qGolferHndcp">
	SELECT *
	FROM eomhandicaps
	WHERE GolferID = #qAllGolfers.GolferID#
	</cfquery> --->
	<cfquery datasource="#sDSN2#" name="qGolferHndcp">
		SELECT numstrokes, numstrokes as HandicapStrokes
		FROM thandicaps
		WHERE 
			GolferID = #qAllGolfers.GolferID#
			AND
			groupid = 1
			AND
			eventid = #SESSION.eventid#
	</cfquery>
	<cfif qGolferHndcp.RecordCount EQ 0>
		<cfset golferHndcp = "--"/>
	<cfelseif qGolferHndcp.RecordCount EQ 1>
		<cfset golferHndcp = "#qGolferHndcp.HandicapStrokes# strokes"/>
	<cfelse>
		<cfset golferHndcp = "--"/>
	</cfif>
	<!--- Form start :: user click causes golfer to be added to Temporary Team/"cart"--->
	<form action="cart_manage.cfm" method="post">
	  <tr>
		<td class="ltturq" align="center">
		  <input type="hidden" name="golfer_id" value="#qAllGolfers.GolferID#" />
		  <input type="hidden" name="Last_Name" value="#qAllGolfers.GolferLastName#" />
		  <input type="hidden" name="First_Name" value="#qAllGolfers.GolferFirstName#" />
		  <input type="hidden" name="GolferImage" value="#qAllGolfers.GolferImage#" />
		  <input type="hidden" name="Handicap" value="#golferHndcp#" />
		  <input type="image" name="add_button" src="#qAllGolfers.GolferImage#.gif" />
		<td class="ltturq">
			<ul><i>Coming Soon...</i>
				<li>Tournaments</li>
				<li>World Ranking</li>
			</ul>
			
		</td>
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
				<a href="Wally.cfm">#SESSION.eventid# Wally</a> Factor: <strong>#qAllGolfers.GolferLastName# has been selected on #percentageselected#% of teams globally</strong>
			</div>
			<div style="width:100%;border:1px solid ##006600">
				<div style="background-color:#colorstr#; color:#colorstr#; width:#percentageselected#%"></span><span style="color:black;text-align:center;">#percentageselected#%</div>
			</div>
			<!--- #qAllGolfers.DegsofWallyVal# degrees from . --->
		</td>
		<td class="ltturq" align="center">#golferHndcp#</td>
		
		<!---
		  <input type="hidden" name="golfer_id" value="#qAllGolfers.GolferID#" />
		  <input type="hidden" name="Last_Name" value="#qAllGolfers.GolferLastName#" />
		  <input type="hidden" name="First_Name" value="#qAllGolfers.GolferFirstName#" />
		  <input type="hidden" name="GolferImage" value="#qAllGolfers.GolferImage#" />
		  <input type="image" name="add_button" src="#qAllGolfers.GolferImage#.gif" />
		  <!-- "../images/plusSign.gif"  
		    <img src="#qAllGolfers.GolferImage#.gif" /></td> 
		</td> --->
	  </tr>
    </form>
	<!--- Form close --->
  </cfoutput>
</table>