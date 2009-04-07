
<script type="text/javascript" src="eomjson.js"></script>

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
			font-size: 11px;  }
		
		.newGrpYes {
			border: 1px green solid;
			color: green;
			font-weight: bold;
			background-color: #EBFFEB; /* light green */
		}
		.newGrpNo {
			border: 1px red solid;
			color: red;
			font-weight: bold;
			background-color: #FFF5F5; /* light red */
		}
		
		.divAjaxResponse {
			padding-top: 8px;
		}
		
		#AMTgroupTable_placeholder {
			padding-top: 10px;
		}
		
		#tblAMTGroup {
			width: 750px;
			background-color: RGB(249, 252, 255);
		}
		
		#tblAMTGroup caption{
			font-weight:bold;
			font-size:large;
			background-color:RGB(245, 245, 245);
			border:1px solid silver;
		}
		
		#tblAMTGroup .groupinfo{
			text-align:center;
			font-size:12px;
			background-color:RGB(245, 245, 245);
			border:1px dotted silver;
		}
		
		#tblAMTGroup .addCUID{
			text-align:center;
			font-size:small;
			border:1px dotted silver;
		}
		
		.instructions {
			border: 1px dotted silver;
		}
		
		.amt_tblheader {
			padding: 3px;
			padding-left: 5px;
			padding-right: 5px;
			text-align: center;
			font-weight: bold;
		}
		
		.amt_tblheader td {
			padding: 3px;
			padding-left: 5px;
			padding-right: 5px;
		}
		
		.amt_tbldatacenter {
			padding: 3px;
			text-align: center;
		}
		
		.amt_tbldataleft {
			padding: 3px;
			text-align: left;
		}
		
		.amt_group_norecords {
			border: 1px dotted RGB(239, 242, 245);
			background-color: RGB(249, 252, 255);
			color: gray;
			text-align: center;
			width: 750px;
			font-size: small;
		}
		
		.addamtmember {
			padding:4px;
			border:1px dotted silver;
			width: 750px;
			text-align:center;
		}
		
		.remove_button{
			font-size:10px;
		}
		
		
		.memberRow{}
		
		.eomTeamGross{
			text-align:center;
		}
</style>

<cfset nettotalscore = 0 />
<cfset currentplace = 0 />
<cfset outputplace = 0 />
<cfset teamTotNETprev = -1234 />
<!-- tiedPLbool: 0 = not tied; 1 = tied -->
<cfset tieldPLbool = 0 />
<!--- <cfset tourneyName = "PGA Championship" /> --->



<cfparam name="pagegroupid" default="#SESSION.patrongroupid#">  <!--- defaults to last groupid, eventually will allow more than 1 group  --->
<cfparam name="SESSION.currenteventid" default="#SESSION.eventid#">

<!--- AJAX pulls : this will 1. run queries and 2. assemble JSON --->
<!---  1. active_golfers : active golfers for this tournament --->
<!---  2. returnGroupTeams : all teams in this group --->
<!---  ------------------------------------------------------------ --->

<!--- 1. active_golfers --->
	
	<!--- <cfquery datasource="#sDSN2#" name="qAllActiveGolfers">
		SELECT
			tG.GolferID, tG.GolferFirstName, tG.GolferLastName, tG.CurrentScoreRelPar, tG.GolferImage
	  	FROM 
	  		tgolfer tG 
	  	WHERE 
	  		tG.active = 1
	</cfquery>  --->
	
	<!--- need to add a tGolferActiveTable that sets whether or not golfers are active, and which Event... that way can keep tG without removing it each major --->
	<!--- build JSON for active_golfers --->
	<!--- active_golfers json could be built 2x (before tourney started, and after cut) -- this would enable this data to effectively be cached, rather than this being built every time!!! --->
	<!--- 'GenerateActiveGolfersJSON' or something similar --->
	<!--- <cfdump var="#qAllActiveGolfers#"> --->
	
	<!--- get all golfers with handicaps --->
	<!--- <cfquery datasource="#sDSN2#" name="qHandicapsPre">
		SELECT
			tG.GolferID, tH.numstrokes
	  	FROM 
	  		tgolfer tG LEFT OUTER JOIN thandicaps tH ON tG.GolferID = tH.GolferID
	  	WHERE 
	  		tG.active = 1
	  		AND
	  		tH.eventid = #SESSION.eventid#
	</cfquery>  --->
	<!--- <div><cfdump var="#qHandicapsPre#"></div> --->
	<!--- LEFT OUTER JOIN thandicaps tH ON tG.GolferID = tH.GolferID
	tH.numstrokes
	 --->
	
	<!--- this will be an array of structures --->
		<!--- <cfparam name="aActiveGolfers" default="#ArrayNew(1)#"> <!--- 1-D array --->
		<cfparam name="newArrayElementNum" default="1"> <!--- CF arrays start with an index of 1 --->
		
		<cfoutput query="qAllActiveGolfers">
			<!--- structure which will be an element of the array --->
			<cfset aActiveGolfers[newArrayElementNum] = StructNew()>
		  	<cfset aActiveGolfers[newArrayElementNum].GolferID = qAllActiveGolfers.GolferID>
		  	<cfset aActiveGolfers[newArrayElementNum].GolferFName = qAllActiveGolfers.GolferFirstName>
		  	<cfset aActiveGolfers[newArrayElementNum].GolferLName = qAllActiveGolfers.GolferLastName>
		  	<cfset aActiveGolfers[newArrayElementNum].CurrentScoreRelPar = qAllActiveGolfers.CurrentScoreRelPar>
		  	<!--- if the golfer has a handicap, place it here, otherwise, it's zero --->
		  	<cfquery dbtype="query" name="qCheckforHandicaps">
				  SELECT GolferID, numstrokes FROM qHandicapsPre WHERE GolferID = #qAllActiveGolfers.GolferID#
			</cfquery>
		  	<cfif qCheckforHandicaps.RecordCount eq 1>
			  	<cfset aActiveGolfers[newArrayElementNum].EoMHandicap = qCheckforHandicaps.numstrokes>
			<cfelse>
				<cfset aActiveGolfers[newArrayElementNum].EoMHandicap = 0>
			</cfif>
		  	<!---  --->
		  	<cfset aActiveGolfers[newArrayElementNum].CurrentNetScore = (qAllActiveGolfers.CurrentScoreRelPar + aActiveGolfers[newArrayElementNum].EoMHandicap)>
		  	<cfset aActiveGolfers[newArrayElementNum].img_path = qAllActiveGolfers.GolferImage & ".gif">
		  	<!--- increment the Array by 1 --->
		  	<cfset newArrayElementNum = newArrayElementNum + 1>
		</cfoutput>
		
		<cfinvoke component="json" method="encode" data="#aActiveGolfers#" returnvariable="out_activegolfers" />
		<div style="padding:10px;background-color:white;font-size: 10px; color:black;"><cfoutput>#out_activegolfers#</cfoutput></div> --->
 
<!--- 1. end --->	
	
<!--- 2. returnGroupTeams --->
	<!--- initialize full squad list --->
	<!--- <cfset fullsquadlist = "">
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
	<cfquery datasource="#sDSN2#" name="qAllTeamsInGroup2" >
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
			tEG.entrantid IN (#fullsquadlist#)
		ORDER BY 
			tEG.latestteamnetscore ASC, entrantLastName ASC
	</cfquery>  <!--- can remove the order by later when my JS sorting improves --->
		
		<cfparam name="aGroupTeams" default="#ArrayNew(1)#"> <!--- 1-D array --->
		<cfparam name="newElementNum" default="1"> <!--- CF arrays start with an index of 1 --->
		<cfoutput query="qAllTeamsInGroup2">
			<!--- array of golfers in group --->
			<cfquery name="qGolfersInGroup2" datasource="#sDSN2#">
				SELECT 
			  		tTS.golferid
			  	FROM 
			  		tteamselected tTS 
			  	WHERE 
			  		tTS.teamselectedid = #qAllTeamsInGroup2.teamselectedid#
			  		AND 
			  		tTS.eventid = #SESSION.eventid#
			</cfquery>
			<!--- populate array from query --->
			<cfset teamgolfers = ArrayNew(1)>
			<cfloop query="qGolfersInGroup2">
			   <cfset teamgolfers[CurrentRow] = golferid>
			</cfloop>
			<!--- structure which will be an element of the array --->
			<!--- tE.entrantid, tE.lname as entrantLastName, tE.fname as entrantFirstName,
			tEG.teamselectedid, tEG.finaltiebreakerscore as tiebreaker, tEG.latestteamnetscore as latest_teamnetscore --->
			<cfset aGroupTeams[newElementNum] = StructNew()>
		  	<cfset aGroupTeams[newElementNum].TeamID = qAllTeamsInGroup2.teamselectedid>
		  	<cfset aGroupTeams[newElementNum].EntrantID = qAllTeamsInGroup2.entrantid>
		  	<cfset aGroupTeams[newElementNum].EntrantFName = qAllTeamsInGroup2.entrantLastName>
		  	<cfset aGroupTeams[newElementNum].EntrantLName = qAllTeamsInGroup2.entrantFirstName>
		  	<cfset aGroupTeams[newElementNum].TotalGrossRelPar = qAllTeamsInGroup2.latest_teamnetscore>
		  	<!--- need to modify this TotalNetRelPar to include the handicaps --->
		  	<cfset aGroupTeams[newElementNum].TotalNetRelPar = qAllTeamsInGroup2.latest_teamnetscore>
		  	<cfset aGroupTeams[newElementNum].Golfers = teamgolfers> 
		  	<!--- increment the Array by 1 --->
		  	<cfset newElementNum = newElementNum + 1>
		</cfoutput>
		
		<cfinvoke component="json" method="encode" data="#aGroupTeams#" returnvariable="out_groupteams" /> --->
		<!--- <div style="padding:10px;background-color:white;font-size: 10px; color:black;" id="jsonshow"> --->
		<cfoutput><!--- #out_groupteams# ---></cfoutput></div>


<!--- <cfset intPageGroupID = #ListFirst(pagegroupid)#>

<cfquery datasource="#sDSN2#" name="qSpecificGroupID" >
	SELECT 
		groupname as PoolGroupName
	FROM 
		tgroup
	WHERE 
		groupid = #pagegroupid#
</cfquery> 



<cfquery datasource="#sDSN2#" name="qNumInGroupNew">
	SELECT COUNT(DISTINCT tTS.entrantid) as Num
	FROM tteamselected tTS 
	WHERE 
	tTS.golferid > 0
	AND
	tTS.groupid = #SESSION.patrongroupid#
</cfquery> --->




<!--- <cfquery datasource="#sDSN2#" name="qTenShotCutline">
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
<!-- this will be set by a random query to the database-->
<cfset strRandomMajorFact = "Major fact: the first ALBATROSS at The Masters was in 1935 by Gene Sarazen at the 15th hole.  There have been two in the tournament's history since then." />
<cfset strRandomMajorFactover = "Major fact: In 1956, Jack Burke, Jr. won The Masters by one-stroke over Ken Venturi with a total of +1, 289 strokes." />
<cfset strRandomMajorFacteven = "Major fact: In 1966, Jack Nicklaus finished with an EVEN par 288 total, and won his 2nd consecutive Masters, and his 3rd Green Jacket overall." />
<!-- -->
				
<cfset numCutline10shot = #qTenShotCutline.CutLessTen# + 10/>
<cfset numCutline10shot = 4>
<cfset strCutline = "#numCutline10shot#" />
<form action="groupleaderboard_manage.cfm" method="post">
  <div class="leaderboardheader" style="padding:15px;">
    <div align="center" style="border:4px solid green;padding:5px;">
      	<span style="font-size:20px;">Group "<cfoutput>#qSpecificGroupID.PoolGroupName#</cfoutput>" Leaderboard</span>
		<!--- <cfoutput>#qEventInfo.eventyear# #qEventInfo.eventname#</cfoutput> Leaderboard  --->
		<div><!--- <cfoutput>#totalnumingroup#</cfoutput> ---> pool entrants: winner take all</div>
	</div>
  </div> 
  
  
  <cfset ccutline = -1/>  <!-- set to 1000 b/c it's after cutline-->
  <cfif #ccutline# EQ 0>
	 <cfset strCutline = "E" />
  <cfelseif #ccutline# LT 0>
	 <cfset strCutline = #ccutline# /> 
  <cfelseif #ccutline# GT 0>
	  <cfset strCutline = #ccutline# />
  </cfif>
  <cfset finalcutline = -1 />
  <div class="headerTeam"><cfoutput>#tourneyname#</cfoutput> Projected Cut Line :: <span class="worldrankingblack">+ <cfoutput>#numCutline10shot#</cfoutput></span> </div> 
  <!--- Eye on Majors Cut Line : only 3 of <cfoutput>#qAllTeamsInGroup.recordcount#</cfoutput> make the cut</div> <br> --->
<cfquery name="qLastUpdated" datasource="#sDSN2#">
	SELECT DateTimeLastUpdated
	FROM tevents
	WHERE eventid = #SESSION.eventid#
</cfquery>  

<cfoutput>
	<div style="font-size: small; font-weight:400;" align="left">
	Leaderboard last updated : 
	#DateFormat(qLastUpdated.DateTimeLastUpdated, "medium")# #TimeFormat(qLastUpdated.DateTimeLastUpdated, "hh:mm:ss")#<!--- #qCutline.LastUpdatedTime# --->
	CST (Golf, Illinois)
	</div>
	<!--- <div style="font-size: small; font-weight:400;" align="left">
	You are currently ranked number<!--- #currentRanking# ---></span> in the world on EyeOnMajors.com</span>	  <br>
	</div> --->
</cfoutput> 
	
  
   --->
	

	

<div id="checkGroupExists" style="background: #DDEEDD; padding: 8px 8px 8px 8px; width: 800px;clear:both;" class="txtBold" align="center">
		JSON powered:
		 <div id="JSONorig" style="border: 2px solid red;">
		</div> 
		<div id="JSONreturn" style="border: 2px solid yellow;padding-top:10px;">
		</div>
		<div id="tblEoMGroupContainer" style="border: 3px solid green;padding-top:10px;">
		</div>
		<div id="tblEoMGroupContainer2" style="border: 3px solid green;padding-top:10px;">
		</div>
</div>


