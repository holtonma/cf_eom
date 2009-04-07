	<cfparam name="currentRanking" default="">
	<!-- use patron id to populate other patron info -->
	<!--- version 1 --->
	<!--- <cfquery datasource="#sDSN#" name="qPatronInfo">
	   SELECT EntrantID, EntrantLastName, EntrantFirstName, EntrantRole, EmailAddy, GroupID
	   FROM poolperson
	   WHERE poolperson.EntrantID = #SESSION.entrantid#
	</cfquery> --->
	<cfquery datasource="#sDSN2#" name="qPatronInfo">
	   SELECT 
	   	entrantid as EntrantID, lname as EntrantLastName, fname as EntrantFirstName, 
	   	roleid as EntrantRole, emailaddy as EmailAddy
	   FROM tentrant tE
	   WHERE tE.EntrantID = #SESSION.entrantid#
	</cfquery> 
	<cfquery datasource="#sDSN2#" name="qPatronGroup">
		SELECT groupid, latestteamnetscore as myscore
		FROM tentrantgroup tEG
		WHERE entrantid = #SESSION.entrantid#
		AND eventid = #SESSION.eventid#
	</cfquery>
	<!--- version 1 --->
	<!--- when tourney starts: WHERE WHERE poolpersonID = #qPatronInfo.EntrantID# AND fullsquad = 1  --->
	<!--- <cfquery datasource="#sDSN#" name="qUsersNet">
		SELECT latest_teamnetscore
		FROM selectedteams
	</cfquery> --->
	<!--- <cfquery datasource="#sDSN2#" name="qUsersNet">
		SELECT latest_teamnetscore
		FROM selectedteams
	</cfquery> --->
	
	<!--- when tourney starts: WHERE fullsquad = 1 AND madecut = 1 AND latest_teamnetscore < #qUsersNet.latest_teamnetscore# --->
	<!--- version 1 --->
	<!--- <cfquery datasource="#sDSN#" name="qWorldRanking">
		SELECT Count(latest_teamnetscore) as NumAheadofMe
		FROM selectedteams
	</cfquery> --->
	<cfquery datasource="#sDSN2#" name="qWorldRanking">
		SELECT COUNT(latestteamnetscore) as NumAheadofMe
		FROM tentrantgroup
		WHERE latestteamnetscore < #qPatronGroup.myscore#
		AND eventid = #SESSION.eventid#
		AND teamselectedid > -1 
	</cfquery>
	
	<cfset currentRanking = #qWorldRanking.NumAheadofMe# + 1>
	<!-- World Champion 
	<cfquery datasource="#sDSN#" name="qWorldChampion">
		SELECT poolpersonID, latest_teamnetscore
		FROM selectedteams
		WHERE fullsquad = 1
		AND madecut = 1
		ORDER BY latest_teamnetscore ASC
		LIMIT 1
	</cfquery> -->
	
	<!--- after tourney WHERE EntrantID = #qWorldChampion.poolpersonID#
	<cfquery datasource="#sDSN#" name="qNameofWorldChamp">
		SELECT EntrantFirstName, EntrantLastName
		FROM poolperson
		
	</cfquery> --->
	
	<cfset SESSION.patronID = #SESSION.entrantid#/>
	<cfset SESSION.patronLastName = '#qPatronInfo.EntrantLastName#' />
	<cfset SESSION.patronFirstName = '#qPatronInfo.EntrantFirstName#' />
	<cfset SESSION.patronEmail = '#qPatronInfo.EmailAddy#' />
	
	<cfset SESSION.patronGroupID = #qPatronGroup.groupid# />
	
	<!--- version 1 --->
	<!--- <cfquery datasource="#sDSN#" name="qMadeOrMissedCut">
		SELECT MadeCut
		FROM selectedteams
		WHERE poolpersonID = #qPatronInfo.EntrantID#
	</cfquery> --->
	<!--- <cfquery datasource="#sDSN2#" name="qMadeOrMissedCut">
		SELECT 
			MadeCut
		FROM 
			tteamselected
		WHERE 
			entrantid = #qPatronInfo.EntrantID#
	</cfquery> --->
	
	
	<!--- <cfif #qMadeOrMissedCut.MadeCut# EQ 1>
		<cfset currentRanking = #qWorldRanking.NumAheadofMe# + 1>
	<cfelseif #qMadeOrMissedCut.MadeCut# EQ 0>
		<cfset currentRanking = "[Missed Cut]">
	<cfelse>
		<cfset currentRanking = "[Missed Cut]">
	</cfif> --->
<script type="text/javascript">
	function togglePrizes() {
		// methodstring can be 'blind', 'appear', 'slide'
		// this will show/hide the help content 
		var elem = $('divmoreaboutprizes')
		elem.visibility = "visible"
		Effect.toggle(elem, 'blind');
	}
	
</script>	
	

<cfinclude template="header.cfm" />
<link rel="STYLESHEET" type="text/css" href="../styles.css">
<style type="text/css">
<!--
.style1 {
	color: #003300;
	font-weight: bold;
}
-->
</style>
<table width="100%">
  <tr>
    <td colspan="3">
	  	<div align="center"><img src="../images/spacer.gif" height="25" />
        	<img src="/images/prizes_small.gif" width="193" height="89">
		</div>
		<div align="center" style="font-size:10px;"><a href="javascript:togglePrizes();">Click here to read more about prizes</a></div>
	</td>
  </tr>
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
		<div id="divmoreaboutprizes" style="padding:10px;display:none;">
		The entrant  who finishes at the top of this board for each major is eligible for a lifelong membership in the 
		prestigious EyeOnMajors.com's Champion's Lockerroom.  
	    The global winner will win a dozen golf balls of your choice, including Titleist, Callaway, Precept or Nike brands. 
	    The global winner also receives a copy of 
	    <a href="http://www.atross.com/" target="_blank" class="style1">The Aviary : Software Package for the Serious golfer</a>, 
	    which is recommended by top teachers and trusted by over 50 tour pros. An over $115 value total to our winner. 
		In order to be eligible for the Global Prize we require you compete in a group with at least 5 of your friends or officemates.   
		We hope you enjoy the pool as much as we enjoy running it, and good luck to your squad during this year's 
		<span class="mastersbigbold" title="Augusta National Golf Club">Masters</span>! </br>
		-"The Eye On Majors Committee"
	      <!--- include conditional message to user:
	  "Welcome, Mark Holton!  You have selected __ players out of the required __ for a competing team.  
	  FINISH SELECTING YOUR TEAM HERE! 
	  (only provide this before major cutoff date, Thurs at 2 a.m. PST
	  1. check if time is < cutoff time
	  2. check database to see if he/she has selected a team
	  . --->
        </div>
	  <cfoutput>
	  	<div style="padding:10px;" 
	  	<span class="worldranking">
		  	All patrons: Thank you for playing.   As always, submit feedback anytime to eyeonmajors@gmail.com.  
	   		</br> -The EyeOnMajors.com Committee
		</span>
		</div>
	  	<div style="padding:10px;" align="center">
	  	Welcome, #qPatronInfo.EntrantFirstName# #qPatronInfo.EntrantLastName#!  (#qPatronInfo.EmailAddy#).
	  	</div>
	  	<div style="padding:5px;" align="center">
		  	<span class="worldrankingblack">You are currently ranked number <span class="worldranking" style="font-size:20px;">#currentRanking#</span> in the world on EyeOnMajors.com</span>
		</div>  
	  <!-- #currentRanking# [Open not yet started]-->
	  
	  <!--- when championship is over:
	   <div class="groupchampion" align="center">2005 EyeOnMajors.com US Open World Champion: <cfoutput>#qNameofWorldChamp.EntrantFirstName# #qNameofWorldChamp.EntrantLastName#</cfoutput> with a winning total of +<cfoutput>#qWorldChampion.latest_teamnetscore#</cfoutput>.  
	  <br>Congrats, <cfoutput>#qNameofWorldChamp.EntrantFirstName#</cfoutput>, you win our Global Prizes since you were in a group with 10+ players!</div> <br>
	  <div class="ltturq" align="center">We will contact you shortly, assuming you used your valid email address.  You can also contact us at support@albatross-software.com</div> 
	  --->
	  
	  <!--- for debugging:
	  Session.patronID: #SESSION.patronID# <br>
	  Session.patronGroupID: #SESSION.patronGroupID# <br>
	  GetAuthUser: #GetAuthUser()# <br>
	  qPatronInfo.EntrantID: #qPatronInfo.EntrantID# <br>
	  qPatronInfo.EntrantLastName: #qPatronInfo.EntrantLastName# <br>
	  qPatronInfo.EntrantFirstName: #qPatronInfo.EntrantFirstName# <br>
	  qPatronInfo.EmailAddy: #qPatronInfo.EmailAddy# <br>
	  qPatronInfo.GroupID: #qPatronInfo.GroupID# <br> --->
	  
	  </cfoutput>
	  <!--- version 1 --->
	  <!--- <cfquery datasource="#sDSN#" name="qCheckEntryCutoffTime">
	  	   SELECT EntryCutoffTime
		   FROM currentcutline
		   WHERE CurrentCutLineID = 4
	  </cfquery> --->
	  <!--- <cfquery datasource="#sDSN2#" name="qCheckEntryCutoffTime">
	  	   SELECT EntryCutoffTime
		   FROM tevents
		   WHERE eventid = #SESSION.eventid#
	  </cfquery> --->
	  <cfset entrycutoffstatic = #CreateODBCDateTime("April 4, 2007 11:59:00")#>
	  <cfset datetimenow = #CreateODBCDateTime(Now())# />
		  <cfif #DateCompare(datetimenow, #entrycutoffstatic#)# EQ -1>
		  <!-- this means the first date is less than the 2nd, therefore provide link to config team-->
		  		<!-- query determines whether or not you have selected a team yet -->
				<!--- version 1 --->
				<!--- <cfquery datasource="#sDSN#" name="qChosenTeam">
				   SELECT *
				   FROM selectedteams
				   WHERE poolpersonID = #SESSION.patronID#
				   AND PoolGroupID = #SESSION.patronGroupID#
	  			</cfquery> --->
	  			<cfquery datasource="#sDSN2#" name="qChosenTeam">
				   SELECT golferid 
				   FROM tteamselected
				   WHERE entrantid = #SESSION.patronID#
				   AND groupid = #SESSION.patronGroupID#
				   AND eventid = #SESSION.eventid#
	  			</cfquery> <!--- this will return a record of 6 golfers --->
					<cfif qChosenTeam.RecordCount LT 6>
					<span class="greybigbold">
						**You have not yet selected your full team of 6 players**.  
						Select all 6 to be eligible to compete in your group, 
						and to become a member of the prestigious CHAMPION'S LOCKERROOM!  </br>
	  				SELECT YOUR TEAM HERE!<br />
	  				<a href="/store/index_future.cfm"><img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" border="0" /></a></span><br>
					
					<!--- <cfif qChosenTeam.Golfer1ID LT 1>
					  <span class="greybigbold">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
  					  <a href="">SELECT YOUR TEAM HERE!</a></span> <br />
	  					<a href="/store/index_future.cfm"><img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" border="0" /></a><br>
					<cfelseif qChosenTeam.Golfer2ID LT 1>
						<span class="greybigbold">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
	  					SELECT YOUR TEAM HERE!<br />
	  					<a href="/store/index_future.cfm"><img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" border="0" /></a></span><br>
					<cfelseif qChosenTeam.Golfer3ID LT 1>
						<span class="greybigbold">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
	  					<a href="">SELECT YOUR TEAM HERE!</a></span> <br />
	  					<a href="/store/index_future.cfm"><img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" border="0" /></a><br>
					<cfelseif qChosenTeam.Golfer4ID LT 1>
						<span class="greybigbold">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
	  					<a href="">SELECT YOUR TEAM HERE!</a></span> <br />
	  					<a href="/store/index_future.cfm"><img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" border="0" /></a><br>
					<cfelseif qChosenTeam.Golfer5ID LT 1>
						<span class="greybigbold">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
	  					<a href="">SELECT YOUR TEAM HERE!</a></span> <br />
	  					<a href="/store/index_future.cfm"><img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" border="0" /></a><br>
					<cfelseif qChosenTeam.Golfer6ID LT 1>
						<span class="greybigbold">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
	  					<a href="">SELECT YOUR TEAM HERE!</a></span> <br />
	  					<a href="/store/index_future.cfm"><img src="team_not_yet_selected.gif" alt="Click here to select squad" width="416" height="80" border="0" /></a><br>
					 --->
					 <cfelse>
						<!-- all 6 golfers have been chosen, therefore allow to modify team-->
						<div style="border: 5px solid green;" align="center" style="font-size: 20px; color:green; padding:10px;">
						<a href="/store/index_future.cfm">Entries have not closed yet, you can still MODIFY YOUR TEAM HERE!</a>
						</div>
						<!--- <cfinclude template="countdown_to_next_major.cfm" /> --->
					</cfif>
			<cfelse>
				<!-- somehow this person got to this page without a team, nor a group:
				therefore kick them out -->
			</cfif>
		  
	   
      	<!--- <div style="border: 5px solid green;" align="center" style="font-size: 20px; color:green; padding:10px;">
		<span style="padding:15px;">The Global Leaderboard will be turned on when the tournament commences!  Good luck!</span>
		</div> --->
		<cfinclude template="global_leaderboard_core.cfm" /> 
	</td>
    <td><img src="../images/spacer.gif" width="25" /></td>
    </td>
  </tr>
  <tr>
    <td colspan="3">
	  <img src="../images/spacer.gif" height="25" />
	</td>
  </tr>
	<!--- <tr>
		<td><img src="../images/spacer.gif" width="25" /></td>
		<td><cfinclude template="global_leaderboard_core_MC2.cfm" /> </td>
		<td colspan="3"><img src="../images/spacer.gif" height="25" />
	</td>
	</tr> --->
  <!--- <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
      	<cfinclude template="global_leaderboard_core_missedcut.cfm" />
	</td>
    <td><img src="../images/spacer.gif" width="25" /></td>
    </td>
  </tr> --->
</table>

<div align="center"><!-- Music will be turned on when the Open Championship, EyeOnMajors.com-style, commences. -->
  <!-- "music.cfm" -->
</div>
<div align="center"><span class="white">
<cfinclude template="../eomppc.cfm" /> </span></div>
<cfinclude template="footer.cfm" />