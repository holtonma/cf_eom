
<link rel="STYLESHEET" type="text/css" href="styles.css">

<style type="text/css" media="screen">
	#nav {
		clear: left;
		float: left;
		width: 85%;
		max-width: 910px;
		margin: 0;
		padding: 15px 0px 0px 46px;
		list-style: none;
		background: #006600 url(images/nav_bg2.gif) repeat-x bottom left;
	}
	
	#nav li {
		float: left;
		margin: 0;
		padding: 0;
		font-family: "Lucida Grande", sans-serif;
		font-size: 85%;
	}
	
	#nav a {
		float: left;
		display: block;
		margin: 0 1px 0 0;
		padding: 4px 8px;
		color: #FFFFFF;
		text-decoration: none;
		border: 1px solid #CCCCCC;
		border-bottom: none;
		background: #19AA19 url(images/off_bg2.gif) repeat-x top left;
		/* #BDD9AE */
	}
	
	#nav a:hover, body#intro #t-intro a {
		color: #333;
		padding-bottom: 5px;
		border-color: #CCCCCC;
		background: #fff url(images/on_bg.gif) repeat-x top left;
	}
	
	#nav a:hover, body#about #t-about a {
		color: #333;
		padding-bottom: 5px;
		border-color: #CCCCCC;
		background: #fff url(images/on_bg.gif) repeat-x top left;
	}
	
	#nav a:hover, body#news #t-news a {
		color: #333;
		padding-bottom: 5px;
		border-color: #CCCCCC;
		background: #fff url(images/on_bg.gif) repeat-x top left;
	}
	
	#nav a:hover, body#sponsors #t-sponsors a {
		color: #333;
		padding-bottom: 5px;
		border-color: #CCCCCC;
		background: #fff url(images/on_bg.gif) repeat-x top left;
	}
	
	.headercontainer {
		float: left;
		display: block;
		width: 100%;
		margin: 0;
		color: white; /* might need to change this */
		padding: 45px 0 12px 25px;
		background: url(images/head_bglarge2.png) top left no-repeat;
	}
	
	.googleads {
		float:left;
		clear: left;
		padding: 90px 0 0 45px;
	}
</style>
	
	<cfset eventid = 8> <!--- this will be set in Application root --->
	<!--- move this into component --->
	 <cfquery name="qry_getUserTabs" datasource="eyeon2" dbtype="query">
		SELECT groupname
		FROM tgroup, tentrantgroup
		WHERE tgroup.groupID = tentrantgroup.GroupID
		AND tentrantgroup.EventID = <cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#"> 
		AND tentrantgroup.entrantID = 1 
	</cfquery>
	
	

<div class="headercontainer"></div>

<div class="googleads">[Google ads to go here]<br /><a href="../eyestory/index.cfm">to news</a></div>

<ul id="nav">
	<li id="t-home"><a href="home.cfm">Home</a></li>
	<li id="t-global"><a href="global_leaderboard_present.cfm">Global Leaderboard</a></li>
	<li id="t-major"><a href="major_leaderboard.cfm">Major Leaderboard</a></li>
	<li id="t-group"><a href="groupleaderboard_present.cfm">My Group's Leaderboard</a></li>
	
	<!--- output tabs--->
	<cfoutput query="qry_getUserTabs"> 
	<li id="#GroupName#">
		<a href="#GroupName#.cfm">
		Group:<span style="color:yellow">#GroupName#</span>
		</a></li>
	</cfoutput>
	
</ul>