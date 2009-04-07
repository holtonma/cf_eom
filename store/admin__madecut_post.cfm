<a href="/store/admin_post_data.cfm">LINK to admin page</a><cfset nettotalscore = 0 />
<!--- <cfset currentplace = 0 />
<cfset outputplace = 0 />
<cfset teamTotNETprev = -1234 />
<!-- tiedPLbool: 0 = not tied; 1 = tied -->
<cfset tieldPLbool = 0 /> --->

<cfset cutline = 4> <!--- all golfers over +10 missed cut --->
<cfset golfermissedcutlist = "">
<cfoutput>

<cfquery name="qUpdateGolfers" datasource="#sDSN2#">
	UPDATE tgolfer
	SET madecut = 1
</cfquery>	

<cfquery name="qUpdateGolfers" datasource="#sDSN2#">
	UPDATE tgolfer
	SET madecut = 0
	WHERE CurrentScoreRelPar > #cutline#
</cfquery>	

<cfquery name="qGolfersThatMissedCut" datasource="#sDSN2#">
	SELECT GolferID
	FROM tgolfer
	WHERE CurrentScoreRelPar > #cutline#
</cfquery>
</cfoutput>
<!--- loop thru rs to obtain list --->
<cfoutput query="qGolfersThatMissedCut">
	<cfset golfermissedcutlist = #ListAppend(golfermissedcutlist, qGolfersThatMissedCut.GolferID)#>   
</cfoutput>

<cfdump var="#golfermissedcutlist#">
<div><cfdump var="#ListLen(golfermissedcutlist)#"></div>

<!--- obtain all ids of tentrantgroup.entrantid that have at least one golfer who missed the cut --->
<cfoutput>
<cfquery name="qEntrantsWhoMissedCut" datasource="#sDSN2#">
	SELECT DISTINCT entrantid
	FROM tteamselected
	WHERE eventid = #SESSION.eventid#
	AND golferid IN(#golfermissedcutlist#)
	ORDER BY entrantid ASC
</cfquery>
</cfoutput>
<div><cfdump var="#qEntrantsWhoMissedCut#"></div>
<!--- loop thru rs to obtain list --->
<cfset entrantMClist = "">
<cfoutput query="qEntrantsWhoMissedCut">
	<cfset entrantMClist = #ListAppend(entrantMClist, qEntrantsWhoMissedCut.EntrantID)#>   
</cfoutput>

<cfoutput>
<cfquery datasource="#sDSN2#" name="qUpdateMadeCutField" >
	UPDATE tentrantgroup
	SET madecut = 0
	WHERE entrantid IN(#entrantMClist#)
	AND eventid = #SESSION.eventid#
</cfquery> 
</cfoutput>

<!--- obtains cutline from datbase --->
<!--- <cfquery datasource="#sDSN#" name="qCutline">
SELECT Cutline, LastUpdatedTime
FROM currentcutline
WHERE CurrentCutlineID = 8
</cfquery> --->

<!--- select leading score relative to par --->
<!--- <cfquery datasource="#sDSN#" name="qTenShotCutline">
	SELECT MIN(CurrentScoreRelPar) as CutLessTen
	FROM golfer
	WHERE active = 1
</cfquery> --->

<!--- set 10 shot rule --->
<!--- <cfset numCutline10shot = #qTenShotCutline.CutLessTen# + 10/>
<cfset strCutline = "#numCutline10shot#" />

  <cfset ccutline = 0/>  <!-- above this number, sets 'madecut' field to 0, below sets 'madecut' to 1 -->
  <cfif #ccutline# EQ 0>
	 <cfset strCutline = "E" />
  <cfelseif #ccutline# LT 0>
	 <cfset strCutline = #ccutline# /> 
  <cfelseif #ccutline# GT 0>
	  <cfset strCutline = #ccutline# />
  </cfif>
  <cfset finalcutline = 0 />
  <div class="headerTeam">Current PGA Championship Cut Line :: <span class="worldrankingblack">+<cfoutput>#finalcutline#</cfoutput></span> </div> <!-- (10 shot rule: all players within 10 shots of the leader make the cut) -->
   --->

<!--- all players who have missed the cut --->
<!--- <cfquery datasource="#sDSN#" name="qGolfersThatMissedCut">
	SELECT GolferID, golferfirstname, golferlastname
	FROM golfer
	WHERE CurrentScoreRelPar > #ccutline#
</cfquery>
<cfoutput>Num golfers who missed cut: #qGolfersThatMissedCut.RecordCount#</cfoutput> <br> --->


<!--- output all players who have missed the cut as a list --->
<!--- <cfoutput query="qGolfersThatMissedCut">GOLFER ID: #qGolfersThatMissedCut.GolferID# #qGolfersThatMissedCut.golferfirstname# #qGolfersThatMissedCut.golferlastname#<br></cfoutput>
<!-- show  array as a list -->
<cfoutput>#ValueList(qGolfersThatMissedCut.GolferID)#</cfoutput> --->

<!--- initialize all fullsquads to made cut or =1 --->
<!--- <cfquery datasource="#sDSN#" name="qUpdateMadeCutField" >
UPDATE selectedteams
SET Madecut = 1
WHERE fullsquad = 1
</cfquery> --->


<!--- updates the database...selectedteams table, MadeCut field set to 0 if any of your golfers GT cutline --->
<!--- <cfquery datasource="#sDSN#" name="qUpdateMadeCutField" >
UPDATE selectedteams
SET Madecut = 0
WHERE golfer1ID IN(#ValueList(qGolfersThatMissedCut.GolferID)#) OR golfer2ID IN(#ValueList(qGolfersThatMissedCut.GolferID)#)
 OR golfer3ID IN(#ValueList(qGolfersThatMissedCut.GolferID)#) OR golfer4ID IN(#ValueList(qGolfersThatMissedCut.GolferID)#)
  OR golfer5ID IN(#ValueList(qGolfersThatMissedCut.GolferID)#) OR golfer6ID IN(#ValueList(qGolfersThatMissedCut.GolferID)#)
</cfquery> --->

  