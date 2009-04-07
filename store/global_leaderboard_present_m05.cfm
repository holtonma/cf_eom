
	<!-- use patron id to populate other patron info -->
	<cfquery datasource="eyeonmajorsm05final" name="qPatronInfo">
	   SELECT EntrantID, EntrantLastName, EntrantFirstName, EntrantRole, EmailAddy, GroupID
	   FROM poolperson
	   WHERE poolperson.EntrantID = #GetAuthUser()#
	</cfquery>
	
	<cfquery datasource="eyeonmajorsm05final" name="qUsersNet">
		SELECT latest_teamnetscore
		FROM selectedteams
		WHERE poolpersonID = #qPatronInfo.EntrantID#
	</cfquery>
	
	<cfquery datasource="eyeonmajorsm05final" name="qWorldRanking">
		SELECT Count(latest_teamnetscore) as NumAheadofMe
		FROM selectedteams
		WHERE latest_teamnetscore < #qUsersNet.latest_teamnetscore#
	</cfquery>
	
	<!-- World Champion -->
	<cfquery datasource="eyeonmajorsm05final" name="qWorldChampion">
		SELECT poolpersonID, latest_teamnetscore
		FROM selectedteams
		ORDER BY latest_teamnetscore ASC
		LIMIT 1
	</cfquery>
	
	<cfquery datasource="eyeonmajorsm05final" name="qNameofWorldChamp">
		SELECT EntrantFirstName, EntrantLastName
		FROM poolperson
		WHERE EntrantID = #qWorldChampion.poolpersonID#
	</cfquery>
	
	<cfset SESSION.patronID = #GetAuthUser()#/>
	<cfset SESSION.patronLastName = '#qPatronInfo.EntrantLastName#' />
	<cfset SESSION.patronFirstName = '#qPatronInfo.EntrantFirstName#' />
	<cfset SESSION.patronEmail = '#qPatronInfo.EmailAddy#' />
	<cfset SESSION.patronGroupID = #qPatronInfo.GroupID# />
	
	
	
	

	

<cfinclude template="global_leaderboard_header_m05.cfm" />
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
        <img src="/images/prizes_small.gif" width="193" height="89">	    </div></td>
  </tr>
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
		<p>The entrant  who finishes at the top of this board for each major is eligible for a lifelong membership in the prestigious EyeOnMajors.com's Champion's Lockerroom.  
	    The global winner will win a dozen golf balls of your choice, including Titleist, Callaway, or Nike brands. The global winner also receives a copy of <a href="http://www.atross.com/" target="_blank" class="style1">The Aviary : Software Package for the Serious golfer</a>, which is recommended by top teachers and trusted by over 50 tour pros. An over $100 value total to our winner. </p>
		<p>In order to be eligible for the Global Prize we require you compete in a group with at least 10 of your friends or officemates.   We hope you enjoy the pool as much as we enjoy running it, and good luck to your squad during this year's <span class="mastersgreen" title="Augusta National">Masters</span>! <br>
		  -"The Eye On Majors Committee"

	      <!-- include conditional message to user:
	  "Welcome, Mark Holton!  You have selected __ players out of the required __ for a competing team.  
	  FINISH SELECTING YOUR TEAM HERE! 
	  (only provide this before major cutoff date, Thurs at 2 a.m. PST
	  1. check if time is < cutoff time
	  2. check database to see if he/she has selected a team
	  . -->
        </p>
	  <cfoutput> 
	  <br><span class="worldranking">All patrons: the total score updates have been made.  Thank you for playing!  We hope you enjoyed our free pool.  Please tell your friends, and submit feedback anytime to support@albatross-software.com.  We'd love to hear what yout think.  Look for new features during the US Open,
	   check out the Masters images, and see you in June! <br> -The EyeOnMajors.com Committee
		</span><br><br>
	  Welcome, #qPatronInfo.EntrantFirstName# #qPatronInfo.EntrantLastName#!  (#qPatronInfo.EmailAddy#).  
	  <span class="worldrankingblack">You are currently ranked number <span class="worldranking">MISSED CUT</span> in the world on EyeOnMajors.com</span><br>
	  <br>
	  
	  <!-- for debugging:
	  Session.patronID: #SESSION.patronID# <br>
	  Session.patronGroupID: #SESSION.patronGroupID# <br>
	  GetAuthUser: #GetAuthUser()# <br>
	  qPatronInfo.EntrantID: #qPatronInfo.EntrantID# <br>
	  qPatronInfo.EntrantLastName: #qPatronInfo.EntrantLastName# <br>
	  qPatronInfo.EntrantFirstName: #qPatronInfo.EntrantFirstName# <br>
	  qPatronInfo.EmailAddy: #qPatronInfo.EmailAddy# <br>
	  qPatronInfo.GroupID: #qPatronInfo.GroupID# <br> -->
	  
	  </cfoutput>
	  <cfquery datasource="eyeonmajorsm05final" name="qCheckEntryCutoffTime">
	  	   SELECT EntryCutoffTime
		   FROM currentcutline
		   WHERE CurrentCutLineID = 1
	  </cfquery>
	  <cfset datetimenow = #CreateODBCDateTime(Now())# />
		  <cfif #DateCompare(datetimenow, #qCheckEntryCutoffTime.EntryCutoffTime#)# EQ -1>
		  <!-- this means the first date is less than the 2nd, therefore provide link to config team-->
		  		<!-- query determines whether or not you have selected a team yet -->
				<cfquery datasource="eyeonmajorsm05final" name="qChosenTeam">
			   SELECT *
			   FROM selectedteams
			   WHERE poolpersonID = #SESSION.patronID#
			   AND PoolGroupID = #SESSION.patronGroupID#
	  			</cfquery>
				<cfif qChosenTeam.RecordCount GT 0>
					<cfif qChosenTeam.Golfer1ID LT 1>
						<span class="cut">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
	  					<a href="">SELECT YOUR TEAM HERE!</a></span> <br>
					<cfelseif qChosenTeam.Golfer2ID LT 1>
						<span class="cut">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
	  					<a href="">SELECT YOUR TEAM HERE!</a></span> <br>
					<cfelseif qChosenTeam.Golfer3ID LT 1>
						<span class="cut">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
	  					<a href="">SELECT YOUR TEAM HERE!</a></span> <br>
					<cfelseif qChosenTeam.Golfer4ID LT 1>
						<span class="cut">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
	  					<a href="">SELECT YOUR TEAM HERE!</a></span> <br>
					<cfelseif qChosenTeam.Golfer5ID LT 1>
						<span class="cut">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
	  					<a href="">SELECT YOUR TEAM HERE!</a></span> <br>
					<cfelseif qChosenTeam.Golfer6ID LT 1>
						<span class="cut">**You have not yet selected your full team of 6 players**.  Select all 6 to be eligible to compete in your group, and to become a member of the elite CHAMPION'S LOCKERROOM!  <br>
	  					<a href="">SELECT YOUR TEAM HERE!</a></span> <br>
					<cfelse>
						<!-- all 6 golfers have been chosen, therefore allow to modify team-->
						<a href="/store/index_future.cfm">Entries have not closed yet, you can still MODIFY YOUR TEAM HERE!</a></span> <br>
						<br>
						<cfinclude template="countdown_to_next_major.cfm" />
						<br>
					</cfif>
				<cfelse>
					<!-- somehow this person got to this page without a team, nor a group:
					therefore kick them out -->
					
				</cfif>
		  <cfelse>
		  </cfif>
	   
      <cfinclude template="global_leaderboard_core_m05.cfm" />
	</td>
    <td><img src="../images/spacer.gif" width="25" /></td>
    </td>
  </tr>
  <tr>
    <td colspan="3">
	  <img src="../images/spacer.gif" height="25" />
	</td>
  </tr>
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
      
	</td>
    <td><img src="../images/spacer.gif" width="25" /></td>
    </td>
  </tr>
</table>
<cfinclude template="music_Augusta.cfm" />
<cfinclude template="footer.cfm" />