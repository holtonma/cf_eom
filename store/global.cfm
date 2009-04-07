<cfif IsDefined("SESSION.eventid")>

<cfinclude template="eom_header_global.cfm">

<body id="bGlobal">
  <cfinclude template="eom_tabs.cfm">      
  <div id="byline">Leaderboard automatically updates every 5 minutes.  Refresh for latest.</div>
  <div id="myglobalboard">
	  <div class="section_head">EyeOnMajors.com Global Leaderboard</div>
    <cfinclude template="global_leaderboard_core3.cfm">    
  </div>
  <div id="googleads">
  	<cfinclude template="../ad_global_bottom.htm">
  </div>
  
</body>
</html>

<cfelse>
	<cflocation url="../login_form.cfm">
</cfif>
