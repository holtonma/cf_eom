<!--- loads prior to every .cfm page on site --->
<!--- 8 hour sessions --->
<cfapplication sessionmanagement="yes" sessiontimeout="#CreateTimeSpan(0, 16, 0, 0)#" />
<cfset sTitle = "Eye on Majors :: Fun and Free web-based golf pool for you,  your office, friends and fellow golf fans!" />
<!--- sets database name to 'eyeonmajors' --->
<cfset sDSN = "eyeonmajors" />
<cfset sDSN2 = "eyeon2">
<cfset sHeaderMessage = "" />
<cfset sPersonPageMessage = "Do you wish to join another group?" />

<cfparam name="SESSION.fromRegister" default="0">
<cfparam name="SESSION.entrantid" default="#GetAuthUser()#">

<!--- anything placed in between will run when the user is not logged in
<cfloginuser name="SampleUser" password="password" roles="basic" />

--->
<cfif SESSION.fromRegister gt 0>
	<!--- <cfset SESSION.fromRegister = 1> set in register page--->
	<!--- <cflocation url="..\store\groupleaderboard_present.cfm" />  --->
	<!--- <cfinclude template="groupleaderboard_present.cfm"> --->
<cfelse>
	<cflogin>
		<cfif IsDefined('FORM.login_button.y')>  <!-- image button is defined, meaning someone clicked login -->
			
			<cfquery datasource="#sDSN2#" name="qLogin">
				SELECT entrantid as EntrantID, lname as EntrantLastName, fname as EntrantFirstName, EntrantPassword, roleid as EntrantRole
				FROM tentrant
				WHERE tentrant.EmailAddy = '#FORM.EmailAddress#'
				AND tentrant.EntrantPassword = <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.Password#"> 
			</cfquery> <!--- SelectedTeam1ID --->
			
			<cfif qLogin.RecordCount GT 0> <!--- someone matches that email address and password ---> 
				<cfloginuser name="#qLogin.EntrantID#" password="#FORM.password#" roles="#qLogin.EntrantRole#" />
				<cfif not isDefined("SESSION.patronID")>	
					<cfset SESSION.patronID = #SESSION.entrantid#/>  <!--- GetAuthUser() --->
					<!--- use patron id to populate other patron info --->
					<cfquery datasource="#sDSN2#" name="qPatronInfo">
					   SELECT lanme as EntrantLastName, fname as EntrantFirstName, roledid as EntrantRole, emailaddy
					   FROM tentrant
					   WHERE entrantid = SESSON.patronID
					</cfquery>
					<cfquery datasource="#sDSN2#" name="qDefaultGroup">
						SELECT 
							MAX(entrantgroupuniqueid) as latestUniqueID, groupid
						FROM
							tentrantgroup
						WHERE entrantid = #SESSION.patronID#
					</cfquery>
					<cfset SESSION.patronLastName = '#qPatronInfo.EntrantLastName#' />
					<cfset SESSION.patronFirstName = '#qPatronInfo.EntrantFirstName#' />
					<cfset SESSION.patronEmail = '#qPatronInfo.EmailAddy#' />
					<cfset SESSION.patronGroupID = #qDefaultGroup.GroupID# />
				</cfif>
			<cfelse>   <!--- no match --->
				<cfset sHeaderMessage = "The email and password combination you tried is incorrect, or you have not registered with Eye on Majors." />
				<!--- <cfinclude template="../login_form.cfm" /> --->
				<cflocation url="../login_form.cfm">
				<cfabort /> 
			</cfif>
		<cfelseif IsDefined('FORM.newregister_button.y')>
			<cflocation url="../register/user_registration.cfm" />
		<cfelse>
			<cfparam name="SESSION.entrantid" default="0">
			<!--- if you came from the group registration (i.e. having just registered) then  --->
			<!--- by default, if not logged in yet, then goto login form --->
			<cflocation url="../login_form.cfm">
			<cfset sHeaderMessage = "YOU ARE HERE"/>
			<cfabort> 
		</cfif>
		
	</cflogin>
</cfif>
