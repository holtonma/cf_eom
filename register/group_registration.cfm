<cfparam name="FORM.name_first" default="" />
<cfparam name="FORM.name_last" default="" />
<cfparam name="FORM.email" default="" />
<cfparam name="FORM.poolgroupname" default="" />

<cfset bGroupRegistrationSuccess = false />
<cfset SESSION.patronID = #SESSION.entrantid# />
<!--- <cfset SESSION.eventid = 10 /> --->

<!--- version 1 --->
<!--- <cfquery datasource="#sDSN#" name="qPopulateEmail">
   SELECT poolperson.EmailAddy
   FROM poolperson
   WHERE poolperson.EntrantID = #SESSION.patronID#
</cfquery> --->

<!--- <cfquery datasource="#sDSN2#" name="qPopulateEmail">
   SELECT tentrant.emailaddy
   FROM tentrant
   WHERE tentrant.entrantid = #SESSION.patronID#
</cfquery> --->


<cfif IsDefined('FORM.registergroup_button.y')>
   <!--- check to see this GroupName does not exist --->
   <!--- <cfquery datasource="#sDSN#" name="qGroupCheckExists">
	   SELECT PoolGroupName, PoolGroupID
	   FROM poolgroup
	   WHERE PoolGroupName = '#FORM.poolgroupname#'
   </cfquery> --->
	<cfquery datasource="#sDSN2#" name="qGroupCheckExists">
	   SELECT groupname, groupid
	   FROM tgroup
	   WHERE groupname = '#FORM.poolgroupname#'
   </cfquery>
   
   <!--- check if group exists --->
   <cfif qGroupCheckExists.RecordCount GT 0> 
   		<!--- group name exists: ask user to select a new group name --->
		<!--- enters the GroupID into the Poolperson table for the person who is logged in --->
		<cfset bGroupRegistrationSuccess = false />
   <cfelse>
	   <!--- group does not exist, need to create group --->
	   <!--- update poolperson table with group he or she is in (matches the authorized user who is logged in) --->
	   <!--- version 1: --->
	   <!--- <cfquery datasource="#sDSN#" name="qUpdatePoolGroup">
		   INSERT INTO poolgroup (PoolGroupName, PoolGroupPassword) 
		   VALUES ('#FORM.poolgroupname#', '#FORM.poolgrouppassword#')		   
		</cfquery> --->
		<!--- now need PoolGroupID of that very group you created: --->
	   <!--- version 1: --->
	   <!--- <cfquery datasource="#sDSN#" name="qGroupIDfind">
	   	   SELECT PoolGroupName, PoolGroupID
		   FROM poolgroup
		   WHERE PoolGroupName = '#FORM.poolgroupname#'
	   </cfquery> --->
	   
	   <cflock timeout="20">
			<cftransaction>
				<!--- first check to see there is no group with that name already --->
				<cfquery name="qCheckGroupExists" datasource="#sDSN2#">
					SELECT groupid
					FROM tgroup
					WHERE groupname = <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.poolgroupname#">
				</cfquery>
				<cfif qCheckGroupExists.RecordCount gte 1>
					<cfset returnvar = -1>
				<cfelse>
					<!--- insert into tgroup table --->
					<cfquery name="qInsertIntoGroup" datasource="#sDSN2#">
						INSERT INTO tgroup
							(groupname, grouppassword, groupruleid)
						VALUES
							(
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.poolgroupname#">,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.poolgrouppassword#">,
							1
							)
					</cfquery>
					<!--- eventually that 1 above will be from a user-selected rule --->
					<!--- find the last group inserted --->
					<cfquery name="qFindLastGroup" datasource="#sDSN2#">
						SELECT groupid
						FROM tgroup
						WHERE groupname  = <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.poolgroupname#">
					</cfquery>
					<!--- find MAX teamselectedid and add 1 to it (note, this is just the default group, they can add to it later) --->
					<cfquery name="qFindMaxTeamSelID" datasource="#sDSN2#">
						SELECT MAX(teamselectedid) as maxTeamSelected
						FROM tentrantgroup tEG
					</cfquery>
					<cfset newteamselid = qFindMaxTeamSelID.maxTeamSelected + 1>
					
					<!--- insert into tentrantgroup table (for user who created group) --->
					<!--- SESSION.patronid: <cfdump var="#SESSION.patronid#"></br>
					qFindLastGroup.groupid  <cfdump var="#qFindLastGroup.groupid#"></br>
					SESSION.eventid <cfdump var="#SESSION.eventid#"></br>
					newteamselid <cfdump var="#newteamselid#"></br>
					line 99 of group registration: <cfabort> --->
					
					<cfquery name="qInsertIntoTEG" datasource="#sDSN2#">
						INSERT INTO tentrantgroup
							(
							entrantid, 
							groupid, 
							teamselectedid, 
							eventid, 
							latestteamnetscore
							)
						VALUES
							(
							<cfqueryparam cfsqltype="cf_sql_integer" value="#SESSION.patronid#">,
							<cfqueryparam cfsqltype="cf_sql_integer" value="#qFindLastGroup.groupid#">,
							<cfqueryparam cfsqltype="cf_sql_integer" value="#newteamselid#">,
							#SESSION.eventid#,
							0
							)
					</cfquery>
					<!--- insert X records into tteamselected (based upon rules later) --->
					<!--- <cfloop from="1" to="6" step="1" index="i">
						<cfset qname = "qInsertIntoGroup" & ToString(i)>
						<cfquery name="#qname#" datasource="#sDSN2#">
							INSERT INTO tteamselected
								(teamselectedid, entrantid, groupid, eventid)
							VALUES
								(
								<cfqueryparam cfsqltype="cf_sql_integer" value="#newteamselid#">,
								<cfqueryparam cfsqltype="cf_sql_integer" value="#SESSION.patronID#">,
								<cfqueryparam cfsqltype="cf_sql_integer" value="#qFindLastGroup.groupid#">,
								<cfqueryparam cfsqltype="cf_sql_integer" value="#SESSION.eventid#">
								)
						</cfquery>
					</cfloop> --->
					<!--- find the last entry inserted into tEntrantGroup --->
					<cfquery name="qFindLastEntrantGroup" datasource="#sDSN2#">
						SELECT entrantgroupuniqueid
						FROM tentrantgroup
						WHERE groupid  = <cfqueryparam cfsqltype="cf_sql_integer" value="#qFindLastGroup.groupid#">
						AND entrantid = <cfqueryparam cfsqltype="cf_sql_integer" value="#SESSION.patronid#"> 
					</cfquery>
					
					<!--- line 142: </br>
					qFindLastEntrantGroup.RecordCount : <cfdump var="#qFindLastEntrantGroup.RecordCount#"> </br>
					<cfdump var="#qFindLastEntrantGroup#">  --->
					
					<cfif qFindLastEntrantGroup.RecordCount eq 1>
						<cfset returnvar = 1> <!--- success! --->
						<cfset bGroupRegistrationSuccess = true>
					<cfelse>
						<cfset returnvar = -2> <!--- unlikely error return code --->
						<cfset bGroupRegistrationSuccess = false>
					</cfif>
				</cfif>
			</cftransaction>
		</cflock> <!--- lock prevents another request stomping on these requests --->
	   
	   
	   	<!--- <cfquery datasource="#sDSN#" name="qUserRegWithTeam">
			UPDATE poolperson
			SET GroupID = #qGroupIDfind.PoolGroupID#
			WHERE EntrantID = #GetAuthUser()#
		</cfquery>
		
		<!-- update the selected teams table "SelectedTeamID' field -->
		<cfquery datasource="#sDSN#" name="qUserRegWithTeam">
			UPDATE selectedteams
			SET PoolGroupID = #qGroupIDfind.PoolGroupID#
			WHERE poolpersonID = #GetAuthUser()#
		</cfquery>
		<cfset SESSION.patronGroupID = #qGroupIDfind.PoolGroupID# > --->
		
		<cfset SESSION.patrongroupid = #qFindLastGroup.groupid#>
		
	   <cfset sHeaderMessage = "You just registered GroupName: " & '#FORM.poolgroupname#' & " with Password: " & '#FORM.poolgrouppassword#' & ".  Print or write this down for your records and so you can tell the rest of the members of your group!" >
   	   <a href="mailto:yourfriends?subject=PoolGroup:&'#FORM.poolgroupname#'Password:&'#FORM.poolgrouppassword#'">EMAIL GROUP INFO TO INVITE FRIENDS TO JOIN</a>
   </cfif>   
</cfif>

<!--- this only executes if registration was a success--->
<cfif bGroupRegistrationSuccess>  
  <!---if group registration was a success, lead that person to his or her own
  web page --->
  <!--- pass session variables for GroupID, EntrantID?? --->
  	<cfset SESSION.groupRegSuccess = 1>
	<cfset SESSION.fromRegister = 1>
  	<cflocation url="proceedtoleaderboard.cfm" />
  <!--- <cflocation url="..\store\groupleaderboard_present.cfm" /> --->
    
 <cfelse>
 	<cfinclude template="header.cfm" />
	<cfform action="#CGI.SCRIPT_NAME#" method="post">
	Register a new group with a UNIQUE name -- you will have an opportunity to email the Group Name and Group Password once you register the group.
	<br>
	<br>
	You are either reaching this page for the first time, or you have selected a Group Name that already exists.
	<br>
	[Recommend: > 6 alpha-numeric characters for Group Name and Group Password] 
	  <table>
      <tr>
        <td colspan="2">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
	  </tr>
	  <tr>
	    <td colspan="2" class="ltturq">Group Name:</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="turqblue">
		  <cfinput type="text" name="poolgroupname" value="#FORM.poolgroupname#" class="field" required="yes" message="You must enter a first name."  />
		</td>
	  </tr>
      <tr>
        <td colspan="2">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
      </tr>
	  <tr>
        <td colspan="2">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
      </tr>
	  <tr>
	    <td colspan="2" class="ltturq">Group Password:</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="turqblue">
		  <cfinput type="password" name="poolgrouppassword" class="field" required="yes" message="You must enter a password." />
		</td>
	  </tr>
	  <tr>
        <td colspan="2">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
      </tr>
	  <tr>
        <td colspan="2">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
      </tr>
	  <!--- <tr>
	    <td colspan="2" class="ltturq">Your email (Commissioner of Group): <br>
		*<a href="/register/user_registration.cfm">REGISTER</a> individually before creating a group*</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="turqblue">
		  <cfinput type="text" name="poolgroupcommish" value="#qPopulateEmail.EmailAddy#" class="field" size="50" required="yes" 
		  		message="As registering 'Commissioner', you must enter your email." />
		</td>
	  </tr> --->
      <tr>
        <td colspan="2">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
      </tr>
	  <tr>
	    <td colspan="2" class="ltturq"></td>
	  </tr>
	  <tr>
		<td>
	      <input name="registergroup_button" type="image" src="../images/register.gif" width="75" height="21" />
	    </td>
	  </tr>
      <tr>
        <td colspan="2">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
      </tr>
      <tr>
        <td colspan="2">
			If you wish to sign in to your existing group (instead of creating a NEW group)?  CLICK HERE <br>
			<!--- <cfoutput>#GetAuthUser()#</cfoutput> --->
	      <img src="/EoM/images/spacer.gif" height="10" />
	    </td>
      </tr>
	  
    </table>
  </cfform>
  <cfinclude template="footer.cfm" />
 </cfif>
