




<!--- defaults to last groupid, eventually will allow more than 1 group  --->

<cfif IsDefined("SESSION.eventid")>
	<cfparam name="pagegroupid" default="#SESSION.patrongroupid#">  
		<cfquery datasource="#sDSN2#" name="qYourGroup" >
			SELECT 
				groupname as PoolGroupName
			FROM 
				tgroup
			WHERE 
				groupid = #SESSION.patrongroupid#
		</cfquery>
<cfinclude template="eom_header.cfm">

<body id="bGroup">
  <cfinclude template="eom_tabs.cfm">      
  
  <div id="group_leaderboard" align="center">
  <div class="subtle">Welcome
	  <cfif IsDefined("SESSION.patronfirstname")><cfoutput><b>#SESSION.patronfirstname# #SESSION.patronlastname#</b></cfoutput></cfif>!
	  We're glad you're back.  Your Group Leaderboard will auto-update every 5 minutes...
	</div>
    <div id="mygroupsboard" align="center" style="padding-bottom:50px;">
      <div class="section_head">Group Leaderboard - Group "<b><cfoutput>#qYourGroup.PoolGroupName#</cfoutput></b>"</div>
			<cfinclude template="portlet_group_leaderboard.cfm">
			<div style="padding:15px;"><cfinclude template="music_on_off.cfm"></div>
			<hr>
			<!---<cfinclude template="group_leaderboard_core_MC2.cfm">  --->
    </div>
    <div id="majortop10" class="right_col">
	    <cfinclude template="portlet_major_top10.cfm">
    </div>
    <cfinclude template="portlet_msg_board.cfm">
		<div id="committeemsg" class="right_col">
	    <div class="section_head">From 'The Committee':</div>
      [message from 'the committee']
    </div>
    <div id="committeemsg" class="right_col" align="center">
      <div class="section_head">Fast &amp; Secure Browsing:</div>
      <cfinclude template="../ad_group_right2.htm">
    </div>
  </div>
  
  <div id="bottom_section">
    <script type="text/javascript"><!--
		google_ad_client = "pub-3488777663690401";
		/* 728x90, created 3/15/08, group leaderboard bottom */
		google_ad_slot = "0561673053";
		google_ad_width = 728;
		google_ad_height = 90;
		//-->
		</script>
		<script type="text/javascript"
		src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
		</script>
  </div>
  
  <div class="subtle">
    We strive to continue to improve your experience. Enjoy and thank you for playing our game and using our site to interact with your friends and family.
  </div>
	<cfif SESSION.entrantid eq 1>
		<div>
		    <cfdump var="#SESSION#">
		    <!---
			  <cfdump var="#fullsquadlist#">
			  <cfdump var="#fullsquadlist#">
				<cfdump var="#qAllTeamsInGroup#">--->
		</div>
  </cfif>

  
  
</body>


<script type="text/javascript">
Event.observe(window, 'load', function(){
  Event.observe('post_msg', 'click', post_message.bind('post_msg'));
});
</script>

</html>
<cfelse>
	<cflocation url="../login_form.cfm">
</cfif>

