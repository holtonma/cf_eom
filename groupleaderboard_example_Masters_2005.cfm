
	<!-- use patron id to populate other patron info -->
	<cfquery datasource="#sDSN#" name="qPatronInfo">
	   SELECT EntrantID, EntrantLastName, EntrantFirstName, EntrantRole, EmailAddy, GroupID
	   FROM poolperson
	   WHERE poolperson.EntrantID = #GetAuthUser()#
	</cfquery>
	<cfset SESSION.patronID = #GetAuthUser()#/>
	<cfset SESSION.patronLastName = '#qPatronInfo.EntrantLastName#' />
	<cfset SESSION.patronFirstName = '#qPatronInfo.EntrantFirstName#' />
	<cfset SESSION.patronEmail = '#qPatronInfo.EmailAddy#' />
	<cfset SESSION.patronGroupID = #qPatronInfo.GroupID# />


<cfinclude template="header.cfm" />
<link rel="STYLESHEET" type="text/css" href="../styles.css">
<table width="100%">
  <tr>
    <td colspan="3">
	  <img src="../images/spacer.gif" height="25" />
	</td>
  </tr>
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
	  <!-- include conditional message to user:
	  "Welcome, Mark Holton!  You have selected __ players out of the required __ for a competing team.  
	  FINISH SELECTING YOUR TEAM HERE! 
	  (only provide this before major cutoff date, Thurs at 2 a.m. PST
	  1. check if time is < cutoff time
	  2. check database to see if he/she has selected a team
	  . -->
	  <cfoutput> 
	  Welcome, #qPatronInfo.EntrantFirstName# #qPatronInfo.EntrantLastName#!  (#qPatronInfo.EmailAddy#)<br>
	  You are currently ranked __ in the world on EyeOnMajors.com <br>
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
	  <cfquery datasource="#sDSN#" name="qCheckEntryCutoffTime">
	  	   SELECT EntryCutoffTime
		   FROM currentcutline
		   WHERE CurrentCutLineID = 1
	  </cfquery>
	  <cfset datetimenow = #CreateODBCDateTime(Now())# />
		  <cfif #DateCompare(datetimenow, #qCheckEntryCutoffTime.EntryCutoffTime#)# EQ -1>
		  <!-- this means the first date is less than the 2nd, therefore provide link to config team-->
		  		<!-- query determines whether or not you have selected a team yet -->
				<cfquery datasource="#sDSN#" name="qChosenTeam">
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
					</cfif>
				<cfelse>
					<!-- somehow this person got to this page without a team, nor a group:
					therefore kick them out -->
					
				</cfif>
		  <cfelse>
		  </cfif>
	   
      <cfinclude template="group_leaderboard_core.cfm" />
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
<cfinclude template="music.cfm" />
<cfinclude template="footer.cfm" />