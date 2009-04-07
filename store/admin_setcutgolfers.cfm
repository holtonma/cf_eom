<a href="/store/admin_post_data.cfm">LINK to admin page</a><cfset nettotalscore = 0 />



<cfset cutline = 8> <!--- all golfers over +8 missed cut --->
<cfset golfermissedcutlist = "">
<cfoutput>
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




<cfoutput>
<cfquery datasource="#sDSN2#" name="qUpdateMadeCutField" >
	UPDATE tgolfer
	SET madecut = 0
	WHERE GolferID IN(#golfermissedcutlist#)
</cfquery> 
</cfoutput>

  