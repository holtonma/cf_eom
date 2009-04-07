<!-- loads prior to every .cfm page on site -->
<!-- 8 hour sessions -->
<cfapplication sessionmanagement="yes" sessiontimeout="#CreateTimeSpan(0, 8, 0, 0)#" />
<cfset sTitle = "Eye on Majors :: Fun and Free web-based golf pool for you,  your office, friends and fellow golf fans!" />
<!-- sets database name to 'eyeonmajors' -->
<cfset sDSN = "eyeonmajors" />
<cfset sDSN2 = "eyeon2" />
<cfset sHeaderMessage = "" />
<cfset sPersonPageMessage = "Do you wish to join another group?" />
<cfset eventID = 19> <!--- 19 =  Masters 2009 --->

<cfparam name="SESSION.currenteventid" default="#eventID#">
<cfparam name="SESSION.eventid" default="#eventID#">
<cfset SESSION.currenteventid = eventID>
<cfset SESSION.eventid = eventID>

<link rel="STYLESHEET" type="text/css" href="styles.css">
<!-- anything placed in between will run when the user is not logged in
<cfloginuser name="SampleUser" password="password" roles="basic" />

-->
<cflogin>
	<cfif IsDefined('FORM.login_button.y')>  <!-- image button is defined? -->
		<!--- version 1 --->
		<!--- <cfquery datasource="#sDSN#" name="qLogin">
			SELECT 
				EntrantID, EntrantLastName, EntrantFirstName, SelectedTeam1ID, SelectedTeam2ID, SelectedTeam3ID, 
				SelectedTeam4ID, SelectedTeam5ID, EntrantUserName, EntrantPassword, EntrantRole, GroupID
			FROM poolperson
			WHERE poolperson.EmailAddy = '#FORM.EmailAddress#'
			AND poolperson.EntrantPassword = '#FORM.Password#'
		</cfquery> --->
		<cfquery datasource="#sDSN2#" name="qLogin">
			SELECT 
				entrantid, lname, fname, entrantpassword, roleid
			FROM tentrant
			WHERE tentrant.emailaddy = '#FORM.EmailAddress#'
			AND tentrant.entrantpassword = '#FORM.Password#'
		</cfquery>
		
		<cfif qLogin.RecordCount GT 0> <!-- someone matches that email address and password -->
			<cfloginuser name="#qLogin.entrantid#" password="#FORM.password#" roles="#qLogin.roleid#" />
			<cfset SESSION.entrantid = #qLogin.entrantid#>
			<cfset SESSION.patronid = SESSION.entrantid>
			<!--- go find the group that this person is in  --->
			<cfquery name="qFindGroup" datasource="#sDSN2#">
				SELECT tEG.groupid, tEG.teamselectedid
				FROM tentrantgroup tEG
				WHERE
					tEG.entrantid = #SESSION.entrantid#
					AND
					tEG.eventid = #SESSION.currenteventid#
			</cfquery>
			<cfset SESSION.patrongroupid = qFindGroup.groupid>
			<cfif qFindGroup.teamselectedid gt 0>
				<cfset SESSION.teamselectedid = qFindGroup.teamselectedid>
			<cfelse>
				<cfset SESSION.teamselectedid = 0>
			</cfif>
			<!--this logs the person in using their email address and password-->
			<!---
			<cfobject name="oTabs" component="components.DAOpoolpersonCFC">
			<cfoutput>
			<cfset SESSION.usertabs = oTabs.GetTabsForUser(#sDSN2#, #eventID#)> 
			</cfoutput>
			--->
		<cfelse>   <!-- no match -->
			<cfset sHeaderMessage = "The email and password combination you tried is incorrect, or you have not registered with Eye on Majors." />
			<cfinclude template="login_form.cfm" />
			<cfabort /> 
		</cfif>
	<cfelseif IsDefined('FORM.newregister_button.y')>
		<cflocation url="../register/user_registration.cfm" />
	<cfelse>
		<!-- by default, if not logged in yet, then goto login form -->
		<!-- but if user clicked on REGISTER, then go to User Registration form (is this possible?)-->
		
		<cfset sHeaderMessage = "" />
		<cfinclude template="login_form.cfm" />
		<cfabort />  
	</cfif>
	
</cflogin>

