<!--- defaults to last groupid, eventually will allow more than 1 group  --->
<cfif IsDefined("SESSION.eventid")>
	<cfparam name="pagegroupid" default="#SESSION.patrongroupid#">  
	<cfquery datasource="#sDSN2#" name="qYourGroup" >
		SELECT groupname as PoolGroupName
		FROM tgroup WHERE groupid = #SESSION.patrongroupid#
	</cfquery>
		
<cfinclude template="eom_header.cfm">

<body id="b65Group">
  <cfinclude template="eom_tabs.cfm">      
  
  <div id="group_leaderboard" align="center">
  <div class="subtle" align="left" style="text-align:left;">Welcome
	  <cfif IsDefined("SESSION.patronfirstname")><cfoutput><b>#SESSION.patronfirstname# #SESSION.patronlastname#</b></cfoutput></cfif>!
	  This 6-count-5 alternate format is undergoing <b>BETA</b> testing starting with the 2009 Masters.  We heard your <a href="http://getsatisfaction.com/eyeonmajors" target="_blank">feedback</a>, and have responded.  The OFFICIAL Global and Group Pools will always be select-6-and-count-all-6 with handicaps determined by 'The Committee', but we offer this alternate 6-count-5 option below as a side-game for you and your group's enjoyment!
	</div>
    <div id="mygroupsboard" align="center" style="padding-bottom:50px;">
      <div class="section_head"><b style="color:#660000;">6 count 5 Alternate Format</b> - Group "<b><cfoutput>#qYourGroup.PoolGroupName#</cfoutput></b>"</div>
			<cfinclude template="portlet_65group_leaderboard.cfm">
			<hr>	
			<cfinclude template="portlet_65group_leaderboard_MC.cfm">
			
			<div style="padding:15px;"><cfinclude template="music_on_off.cfm"></div>
			<hr>
			<!--- 
			<cfinclude template="65group_leaderboard_core_MC2.cfm"> 
			--->
    </div>
    <div id="majortop10" class="right_col"><cfinclude template="portlet_major_top10.cfm"></div>
    <cfinclude template="portlet_msg_board.cfm">
	  <cfinclude template="portlet_committee.cfm">
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

