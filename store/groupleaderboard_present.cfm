<!---><cfdump var="is defined: #IsDefined(SESSION.eventid)#">
<cfdump var="eventid: #SESSION.eventid#">	--->
	
<cfif IsDefined("SESSION.eventid")>
  
<!--- <cfdump var="it is saying session.eventid is defined: #SESSION.eventid#"> --->
<!--- <cfparam name="SESSION.patrongroupid" default="-1">
<cfif SESSION.patrongroupid gte 1> --->

	<!-- use patron id to populate other patron info -->
	<cfquery datasource="#sDSN2#" name="qPatronInfo">
	   SELECT 
	   	EntrantID, lname, fname, roleid, 
	   	EmailAddy
	   FROM 
	   	tentrant
	   WHERE tentrant.EntrantID = #SESSION.entrantid#
	</cfquery> <!--- v2: find GroupID elsewhere --->

	<!--- AND fullsquad = 1  when tourney starts --->
	<!--- obtain latestteamnetscore and groupnames from as many groups as this person is in--->
	<cfquery datasource="#sDSN2#" name="qYourScoresAndGroupNames">
		SELECT 
			tEG.groupid, tEG.latestteamnetscore, tG.GroupName
		FROM 
			tentrantgroup tEG LEFT OUTER JOIN tgroup tG ON tEG.groupid = tG.groupid
		WHERE 
			entrantid = #qPatronInfo.EntrantID#
		LIMIT 1
	</cfquery> 
	
	<cfquery datasource="#sDSN2#" name="qPatronGroup2">
		SELECT groupid, latestteamnetscore as myscore
		FROM tentrantgroup tEG
		WHERE entrantid = #SESSION.entrantid#
		AND eventid = #SESSION.eventid#
	</cfquery>
	
	<cfif qPatronGroup2.RecordCount eq 0>
		<cfset qWorldRanking.NumAheadofMe = 0>
	<cfelse>
		<cfquery datasource="#sDSN2#" name="qWorldRanking">
			SELECT COUNT(latestteamnetscore) as NumAheadofMe
			FROM tentrantgroup
			WHERE latestteamnetscore < #qPatronGroup2.myscore#
			AND eventid = #SESSION.eventid#
			AND teamselectedid > -1
		</cfquery>
	</cfif>
	
	<cfset currentWorldRanking = #qWorldRanking.NumAheadofMe# + 1>
	
	<cfquery datasource="#sDSN2#" name="qGroupRanking">
		SELECT COUNT(latestteamnetscore) as NumAheadofMe
		FROM tentrantgroup
		WHERE 
		madecut = 1
		AND latestteamnetscore < #qPatronGroup2.myscore#
		AND groupid = #SESSION.patrongroupid#
		AND eventid = #SESSION.eventid#
		AND teamselectedid > -1
	</cfquery> <!--- fullsquad = 1 --->
	<cfset currentGroupRanking = #qGroupRanking.NumAheadofMe# + 1>
	<!--- when tourney starts 
	WHERE fullsquad = 1
		AND madecut = 1
		AND latest_teamnetscore < #qUsersNet.latest_teamnetscore# --->
	<!--- <cfquery datasource="#sDSN2#" name="qWorldRanking">
		SELECT Count(latest_teamnetscore) as NumAheadofMe
		FROM selectedteams
		WHERE fullsquad = 1
		AND madecut = 1
		AND latest_teamnetscore < #qUsersNet.latest_teamnetscore#
	</cfquery>  --->
	
	<!--- <cfquery datasource="#sDSN2#" name="qMadeOrMissedCut">
		SELECT MadeCut
		FROM selectedteams
		WHERE poolpersonID = #qPatronInfo.EntrantID#
	</cfquery> --->
	
	<!--- 
	<cfquery name="qry_getUserTabs" datasource="eyeon2" dbtype="query">
		SELECT groupname
		FROM tGroup, tEntrantGroup
		WHERE tGroup.GroupID = tEntrantGroup.GroupID
		AND tEntrantGroup.EventID = 9 
		<!---
		SELECT groupname
		FROM tGroup
		LEFT OUTER JOIN tEntrantGroup ON tGroup.GroupID = tEntrantGroup.GroupID
		WHERE tEntrantGroup.EventID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#">
		--->
	</cfquery>--->
	
	
	<!--- after tourney has concluded --->
	
	
	<cfset SESSION.patronID = #SESSION.entrantid#/>
	<cfset SESSION.patronLastName = '#qPatronInfo.lname#' />
	<cfset SESSION.patronFirstName = '#qPatronInfo.fname#' />
	<cfset SESSION.patronEmail = '#qPatronInfo.EmailAddy#' />
	
	<!--- create an array --->
	<cfset aGroups = ArrayNew(1)>
	<!--- loop through query, append names successively to last element --->
	<cfloop query = "qYourScoresAndGroupNames">
	   <cfset temp = ArrayAppend(aGroups, "#groupid#")>
	</cfloop>
	<!--- show the resulting array as a list --->
	<cfset listOfGroups = ArrayToList(aGroups, ",")>
	
	<!--- <cfset SESSION.patronGroupID = #qYourScoresAndGroupNames.groupid# /> --->
	
	<!--- <cfparam name="firstGroupInList" default="#aGroups[1]#"> --->
	<!--- current ranking ifs, when tourney begins --->
	<!--- <cfif #qMadeOrMissedCut.MadeCut# EQ 0>
		<cfset currentRanking = "[Missed Cut]">
	<cfelse>
		<cfset currentRanking = #qWorldRanking.NumAheadofMe# + 1>
	</cfif> --->


<cfinclude template="header.cfm" />
<!--- <cfinclude template="EoMtabs.cfm" /> --->
<body id="groupleaderboard" style="font-size:small;" >
<link rel="STYLESHEET" type="text/css" href="../styles.css">
<!--- <div>
	<cfoutput query="qYourScoresAndGroupNames">
		<span>#qYourScoresAndGroupNames.groupname# (#qYourScoresAndGroupNames.latestteamnetscore#)</span>
	</cfoutput>
</div> --->
<table style="clear:left;">
	<tr>
		<td><!--- <cfdump var="#qry_getUserTabs#"><br />--->
		</td>
	</tr>
</table>
<table width="100%">
  <!--- <tr>
    <td colspan="3">
	  <script type="text/javascript"><!--
		google_ad_client = "pub-3488777663690401";
		google_alternate_color = "FFFFFF";
		google_ad_width = 728;
		google_ad_height = 90;
		google_ad_format = "728x90_as";
		google_ad_type = "text";
		//2007-04-04: eom group present top
		google_ad_channel = "9080982453";
		google_color_border = "E6E6E6";
		google_color_bg = "FFFFFF";
		google_color_link = "1B703A";
		google_color_text = "000000";
		google_color_url = "008000";
		//-->
		</script>
		<script type="text/javascript"
		  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
		</script>
	  <!--- <img src="../images/spacer.gif" height="25" /> --->
	</td>
  </tr> --->
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
		<!--- <div align="center">
	      <!-- include conditional message to user:
	  "Welcome, Mark Holton!  You have selected __ players out of the required __ for a competing team.  
	  FINISH SELECTING YOUR TEAM HERE! 
	  (only provide this before major cutoff date, Thurs at 2 a.m. PST
	  1. check if time is < cutoff time
	  2. check database to see if he/she has selected a team
	  . -->
	    </div> --->
	  <cfoutput> 
	    <div align="center" style="padding-bottom:9px;">Welcome, #qPatronInfo.fname# #qPatronInfo.lname#!  (#qPatronInfo.EmailAddy#)<br>
	    <div align="center" style="padding-bottom:9px;">
		    <!---
		    <span style="font-weight:200;font-size:12px;color:green;">
			    Thank you for playing.   As always, submit feedback anytime to eyeonmajors@gmail.com.  -The EyeOnMajors.com Committee
			</span>
			--->
		</div>
		<div style="padding:5px;" align="center">
		  	<span class="worldrankingblack">
			  	You are currently ranked number 
			  	<span class="worldranking" style="font-size:20px;">#currentWorldRanking#</span> 
			  	in the world on EyeOnMajors.com
			</span>
		</div> 
		<div style="padding:5px;" align="center">
		  	<span class="worldrankingblack">
			  	You are currently ranked number 
			  	<span class="worldranking" style="font-size:18px;">#currentGroupRanking#</span> 
			  	in your group.
			</span>
		</div>  
		
	  <!--- currentRanking [Open has not started] --->
	  
	  
	  
	  
	  
	  <!--- for debugging:
	  Session.patronID: #SESSION.patronID# <br>
	  Session.patronGroupID: #SESSION.patronGroupID# <br>
	  GetAuthUser: #GetAuthUser()# <br>
	  qPatronInfo.EntrantID: #qPatronInfo.EntrantID# <br>
	  qPatronInfo.EntrantLastName: #qPatronInfo.EntrantLastName# <br>
	  qPatronInfo.EntrantFirstName: #qPatronInfo.EntrantFirstName# <br>
	  qPatronInfo.EmailAddy: #qPatronInfo.EmailAddy# <br>
	  qPatronInfo.GroupID: #qPatronInfo.GroupID# <br> --->
	  
	    </div>
	  </cfoutput>
	  <!--- <cfquery datasource="#sDSN2#" name="qCheckEntryCutoffTime">
	  	   SELECT EntryCutoffTime
		   FROM currentcutline
		   WHERE CurrentCutLineID = 8
	  </cfquery> --->
	  <cfset datetimenow = #CreateODBCDateTime(Now())# />
		  <cfif -1 eq -1>  <!--- #DateCompare(datetimenow, #qCheckEntryCutoffTime.EntryCutoffTime#)# EQ --->
		  <!--- this means the first date is less than the 2nd, therefore provide link to config team-->
		  		<!-- query determines whether or not you have selected a team yet --->
					<cfquery datasource="#sDSN2#" name="qChosenTeam">
					   SELECT autoid, entrantid, groupid, golferid, eventid
					   FROM tteamselected
					   WHERE entrantid = #SESSION.patronID#
					   AND groupid = #SESSION.patrongroupid#
					   AND eventid = #SESSION.eventid#
		  			</cfquery> <!--- eventually change that 9 to a variable: done session.eventid --->
		  			
		  			<!--- remove after tourney begins--->
		  			<!--- eventually change the 6 to correspond to tGroupRules --->
		  			<!--- <cfif qChosenTeam.RecordCount LT 6> 
		  				<div align="center">
						  <span class="greybigbold">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
	  					  <a href="/store/index_future.cfm">SELECT YOUR TEAM HERE!</a></span><br /> 
	  					  <a href="/store/index_future.cfm"><img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" border="0" /></a><br>
	  					</div>
	  				<cfelse>
	  					<div align="center">
						  <span class="greybigbold">**Entries have not closed yet**.  Modify your team here<br>
	  					  <a href="/store/index_future.cfm">SELECT YOUR TEAM HERE!</a></span><br /> 
	  					  <a href="/store/index_future.cfm"><img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" border="0" /></a><br>
	  					</div>
	  				</cfif>  --->
	  				
	  				
				<!--- <cfif qChosenTeam.RecordCount GT 0>
					<cfif qChosenTeam.Golfer1ID LT 1>
					<div align="center">
					  <span class="greybigbold">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
  					  <a href="/store/index_future.cfm">SELECT YOUR TEAM HERE!</a></span><br /> 
  					  <a href="/store/index_future.cfm"><img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" border="0" /></a><br>
					<cfelseif qChosenTeam.Golfer2ID LT 1>
					  <span class="greybigbold">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
  					  <a href="/store/index_future.cfm">SELECT YOUR TEAM HERE!</a></span> <br />
	  					<a href="/store/index_future.cfm"><img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" border="0" /></a><br>
					<cfelseif qChosenTeam.Golfer3ID LT 1>
					  <span class="greybigbold">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
  					  <a href="/store/index_future.cfm">SELECT YOUR TEAM HERE!</a></span><br />
  					  <a href="/store/index_future.cfm"><img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" border="0" /></a>	  					<br>
					<cfelseif qChosenTeam.Golfer4ID LT 1>
					  <span class="greybigbold">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
  					  <a href="/store/index_future.cfm">SELECT YOUR TEAM HERE!</a></span><br />
  					  <a href="/store/index_future.cfm"><img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" border="0" /></a>	  					<br>
					<cfelseif qChosenTeam.Golfer5ID LT 1>
					  <span class="greybigbold">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
  					  <a href="/store/index_future.cfm">SELECT YOUR TEAM HERE!</a></span><br />
  					  <a href="/store/index_future.cfm"><img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" border="0" /></a>	  					<br>
					<cfelseif qChosenTeam.Golfer6ID LT 1>
					  <span class="greybigbold">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
  					  <a href="/store/index_future.cfm">SELECT YOUR TEAM HERE!</a></span><br />
  					  <img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" />	  					<br>
					  </div>
					<cfelse>
						<!-- all 6 golfers have been chosen, therefore allow to modify team-->
						<div align="center"><span class="greybigbold"><a href="/store/index_future.cfm">Entries have not closed yet, you can still MODIFY YOUR TEAM HERE!</a></span> <br>
						</div><br>
						<!--- <cfinclude template="countdown_to_next_major.cfm" /> --->
						<br>
					</cfif>
				<cfelse>
					<!-- somehow this person got to this page without a team, nor a group:
					therefore kick them out -->
					
				</cfif> --->
				<!--- <div align="center"><span class="greybigbold"><a href="/store/index_future.cfm">Entries have not closed yet, you can still MODIFY YOUR TEAM HERE!</a></span> <br>
				</div>
				<div align="center" style="font-size:20px;">
					Time Remaining: <script language="JavaScript">
						TargetDate = "04/05/2007 1:59 AM UTC-0500";
						BackColor = "#DDFFCC";
						ForeColor = "#003300";
						CountActive = true;
						CountStepper = -1;
						LeadingZero = true;
						DisplayFormat = "%%D%% Days, %%H%% Hours, %%M%% Minutes, %%S%% Seconds.";
						FinishMessage = "The Masters is underway!";
					</script>
					<script language="JavaScript" src="http://scripts.hashemian.com/js/countdown.js"></script>
				</div> --->
				<!--- <div align="center">
					<form name="theClock">
					<input type=text name="theTime" size=8>
					<form>	
				</div> --->
				<!--- </br>
				<div>Debug inside of groupleaderboard_present.cfm line 214:<cfdump var="#SESSION#"></div> --->
		  <cfelse>
		  </cfif>
	   
      <cfinclude template="group_leaderboard_core.cfm" />
	</td>
    <td><img src="../images/spacer.gif" width="25" /></td>
    </td>
  </tr>
			<!--- ====== after cut ====== --->
			<!--- 
				<tr>
					<td></td>
					<td>
						<cfinclude template="group_leaderboard_core_MC2.cfm" /> 
					</td>
					<td></td>
				</tr> 
				--->
				<!--- ====== after cut ====== --->
  <tr align="center">
  	<td colspan="2">
		<cfinclude template="../eomppc.cfm" />
		<br>
	</td>
  </tr>
  <!--- <tr align="center">
  	<td colspan="2">
		<cfinclude template="poll_list.cfm" />
		<br>
	</td>
  </tr> --->
  <!--- <tr>
    <td colspan="3"> 
	  <!-- AFTER CUT include template="group_leaderboard_core_missedcut" .cfm -->
	  <cfinclude template="group_leaderboard_core_missedcut.cfm" />
	</td>
  </tr> --->
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
      
	</td>
    <td><img src="../images/spacer.gif" width="25" /></td>
    </td>
  </tr>
</table>
<div align="center">
<!--- <cfinclude template="music_Augusta.cfm"/> --->
<!--- cfinclude template="music.cfm"  Music will be turned on when the PGA Championship EyeOnMajors.com Style commences.--->
  
</div>
<span class="white">
</span>
</body>
<cfinclude template="footer.cfm" />

<cfelse>
	<cflocation url="../login_form.cfm">
</cfif>