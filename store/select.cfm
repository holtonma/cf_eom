<cfinclude template="eom_header.cfm">

<cfoutput>
<cfquery name="qMsgs" datasource="#sDSN2#">
	SELECT tM.parsedmessagetext, tM.patronid, tM.datetimeofmessage, tE.fname, tE.lname
	FROM tmessages tM LEFT OUTER JOIN tentrant tE ON tE.entrantid = tM.posterid
	WHERE tM.groupid = #SESSION.patrongroupid#
	LIMIT 10
</cfquery>
</cfoutput>
	
<body id="bSelect">
  <cfinclude template="eom_tabs.cfm">      
  <cfif 1 neq 1> <!--- change to eq when selection period is underway, neq when tourney is underway --->
  <div id="byline">Select 6 Players.  Note the handicaps.  All of your players must make the cut.  Godspeed.</div>
  <div id="myteamselect">
    <div class="section_head">Select Your Squad for this Major:</div>
	  <cfinclude template="select_team.cfm">
	<cfelse>
		<div style="padding:15px;" align="center">The tournament is underway.  See you back for the 2010 United States Open!</div>
	</cfif>
</body>
</html>
