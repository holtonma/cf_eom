<cfif IsDefined("SESSION.currenteventid")>

<cfinclude template="eom_header_global.cfm">

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

<body id="bMajor">
  <cfinclude template="eom_tabs.cfm">      
  <!--- <h1>Golf News Daily</h1> --->
  <div id="byline">Leaderboard updated every 5 minutes for your convenience.</div>
  <div id="mymajorsboard" align="center">
    <div class="section_head">Major Leaderboard - <cfoutput>#tourneyname# #qEventInfo.eventyear#</cfoutput></div>
		<cfinclude template="major_leaderboard_core.cfm">
  </div>
	<div id="sponsorship" class="right_col" align="center">
    <div class="section_head">From Our Sponsors:</div>
    <div style="padding-bottom:25px;"><cfinclude template="../ad_major_right_sky.htm"></div>
		<div style="padding-bottom:25px;"><cfinclude template="../ad_major_right2.htm"></div>
	  <div style="padding-bottom:5px;"><cfinclude template="../ad_group_right2.htm"></div>
  </div>
   
  

</body>
</html>

<cfelse>
	<cflocation url="../login_form.cfm">
</cfif>