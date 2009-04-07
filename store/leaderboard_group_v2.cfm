<cfinclude template="groupleaderboard_queries.cfm">

<!--- <div>
	<cfoutput query="qYourScoresAndGroupNames">
		<span>#qYourScoresAndGroupNames.groupname# (#qYourScoresAndGroupNames.latestteamnetscore#)</span>
	</cfoutput>
</div> --->

<table width="100%">
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
		<!--- 
		<div align="center">
	      <!-- include conditional message to user:
		  "Welcome, Mark Holton!  You have selected __ players out of the required __ for a competing team.  
		  FINISH SELECTING YOUR TEAM HERE! 
		  (only provide this before major cutoff date, Thurs at 2 a.m. PST
		  1. check if time is < cutoff time
		  2. check database to see if he/she has selected a team
		  . -->
		</div> --->
	  <cfoutput> 
	    <div align="center" style="padding-bottom:9px;">Welcome, #qPatronInfo.fname# #qPatronInfo.lname#!  (#qPatronInfo.EmailAddy#)</div>
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
		
	  </cfoutput>
	  <!--- <cfquery datasource="#sDSN2#" name="qCheckEntryCutoffTime">
	  	   SELECT EntryCutoffTime
		   FROM currentcutline
		   WHERE CurrentCutLineID = #SESSION.eventid#
	  </cfquery> --->
	  <cfset datetimenow = #CreateODBCDateTime(Now())# />
		  <cfif -1 eq -1>  <!--- #DateCompare(datetimenow, #qCheckEntryCutoffTime.EntryCutoffTime#)# EQ --->
		  <!--- this means the first date is less than the 2nd, therefore provide link to config team-->
		  		<!-- query determines whether or not you have selected a team yet --->
					<cfquery datasource="#sDSN2#" name="qChosenTeam">
					   SELECT autoid, entrantid, groupid, golferid, eventid
					   FROM tteamselected
					   WHERE entrantid = #SESSION.entrantid#
					   AND groupid = #SESSION.patrongroupid#
					   AND eventid = #SESSION.eventid#
		  			</cfquery> 
		  			
		  			<!--- remove after tourney begins--->
		  			<!--- eventually change the 6 to correspond to tGroupRules --->
		  			<cfif qChosenTeam.RecordCount LT 6> 
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
	  				</cfif>  
	  				
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
				
		  <cfelse>
		  </cfif> 
    <td><cfinclude template="group_leaderboard_core.cfm" /></td>
    <td><img src="../images/spacer.gif" width="25" /></td>
  </tr>
  <tr align="center">
  	<td colspan="2"><div><cfinclude template="../eomppc.cfm" /></div></td>
  </tr>
		<!--- ============================================ after cut =========================================================== --->
        <!--- 
            <tr>
                <td></td>
                <td>
                    <cfinclude template="group_leaderboard_core_MC2.cfm" /> 
                </td>
                <td></td>
            </tr> 
        --->
        <!--- ============================================ after cut =========================================================== --->  
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td></td>
    <td><img src="../images/spacer.gif" width="25" /></td>
  </tr>
</table>
<div align="center">
	<!--- ============================================ music =========================================================== --->
     <!--- <cfinclude template="music_Augusta.cfm"/> --->
    <!--- cfinclude template="music.cfm"  Music will be turned on when the PGA Championship EyeOnMajors.com Style commences.--->
</div>
<span class="white"></span>
</body>
<cfinclude template="footer.cfm" />

