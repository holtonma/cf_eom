<div style="float:left;" id="appname_header">EyeOnMajors.com
  <span id="beta">BETA</span>
</div>
<div id="topright" style="float:right;">
  <!--- <span id="music">Music: <a href="../store/invite_friends.cfm">OFF</a></span> | --->
  <span><a href="../store/invite_friends.cfm">Invite Friends</a></span> |
  <span><a href="../logout.cfm">Logout</a></span>
</div>

<div style="float:right;padding-bottom:0px;"><!--- <img src="logo.gif"> ---></div>
<div style="border-bottom: 1px solid #DDD; clear:both;"></div>

<div id="nav" style="min-width:820px;padding-top:3px;">
<ul style="text-align:center;">
  <li id="t-global"><a href="global.cfm"><div>Global</div><div>Leaderboard</div></a></li> 
  <li id="t-group"><a href="group.cfm"><div>My Group's</div><div>Leaderboard</div></a></li>
  <li id="t-65group"><a href="65group.cfm"><div>Alternate</div><div>Group Format</div></a></li>
	<li id="t-major"><a href="major.cfm"><div>Masters</div><div>Leaderboard</div></a></li>
  <li id="t-message"><a href="message.cfm"><div>Message</div><div>Board</div></a></li> 
  <!--- <li id="t-photos"><a href="photos.cfm"><div>Sandbagger</div><div>Photos</div></a></li> --->
  <!--- <li id="t-mynews"><a href="mynews.cfm"><div>My</div><div>News</div></a></li>  --->
  <!--- <li id="t-settings"><a href="settings.cfm"><div>My</div><div>Settings</div></a></li>  --->
  <li id="t-home"><a href="home.cfm"><div>My</div><div>Settings</div></a></li>
	<cfif (SESSION.entrantid eq 1 OR SESSION.entrantid eq 62 OR SESSION.entrantid eq 29)>
	  <li id="t-admin"><a href="admin.cfm"><div>EoM</div><div>Admin</div></a></li>
	</cfif>
</ul>
</div>
<div id="poweredby" style="float:right;">
  <span>powered by <a href="http://www.golfap.com/news">golfap.com</a></span>
</div>
<br style="clear:left;">		

<!--- page goes here --->

