<style typed="text/css">
	#auto_add{
		color:green;
		font-size:14px;
		font-weight:bold;
	}
</style>

<cfif IsDefined("SESSION.entrantid")>
	<cfinclude template="eom_header.cfm">

	<body id="bAdmin">
   <cfif (SESSION.entrantid eq 1 OR SESSION.entrantid eq 62 OR SESSION.entrantid eq 29)>

    <cfinclude template="eom_tabs.cfm">      
    <div id="byline">Thanks for all your help, big guy, greatly appreciate it!</div>

    <div>Every 3 minutes, this will updated:</div>    
		<div id="auto_add"><cfoutput>Last updated: #DateFormat(Now(), "mm/dd/yyyy")#</cfoutput></div>    
		
		<!--- <div><a href="admin_nexttourney.cfm">Update For Next Tourney (US Open 2008)</a></div> --->
    <div>
	    <cfinclude template="admin_post_data_include.cfm">
	  </div>
   <cfelse>
     <div class="mastersbigbold">You are not authorized to view this page.</div>
	 </cfif>
  </body>
</html>

<cfelse>
	<cflocation url="../login_form.cfm">
</cfif>

<script type="text/javascript">

new Ajax.PeriodicalUpdater('auto_add', 'admin_ajax_teamsum.cfm', {
	method: 'post', frequency: 75, decay: 2, 
	onCreate: function(){console.log("on create..."); Element.setOpacity('auto_add', 0.2 )},
	onSuccess: function(){console.log("hello success"); Element.setOpacity('auto_add', 1.0 )}
});

</script>