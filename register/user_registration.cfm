<style type="text/css">
.tblRegist{
font-size:14px;
}
</style>

<cfparam name="FORM.name_first" default="" />
<cfparam name="FORM.name_last" default="" />
<cfparam name="FORM.email" default="" />
<cfparam name="returnvar" default="-99" />

<cfset bRegistrationSuccess = false />
<cfset bMatedwithgroupyet = false />

<cfif IsDefined('FORM.register_button.y')>
	
	
   <!--- version 1 db --->
	<!--- <cfquery datasource="#sDSN#" name="qUserCheck">
	   SELECT *
	   FROM poolperson
	   WHERE EmailAddy = '#FORM.email#'
   </cfquery>  --->
		<!--- new database: --->
		<cfquery datasource="#sDSN2#" name="qUserCheck">
		   SELECT entrantid
		   FROM tentrant
		   WHERE emailaddy = '#FORM.email#'
   		</cfquery> 
   
   <!--- this query checks to see if this person has signed up for a group yet --->
   <!--- <cfquery datasource="#sDSN#" name="qUserGroupCheck">
   SELECT GroupID
   FROM poolperson
   WHERE EmailAddy = '#FORM.email#'
   </cfquery> --->
   
   <!--- is someone already registered with that email?? --->
   <cfif qUserCheck.RecordCount NEQ 0>
   		<cfset sHeaderMessage = "Someone has already registered with that email (probably you!).  Use a different email address and register again.  <br> NOTE: You can have 1 team per email address." >
   <cfelse>
	   <!--- no entries exist with that email address... therefore sign that person up --->
	   <cfset vDatecheck = #CreateODBCDateTime(Now())#>
	   
	   <!--- first check to see that this email has not yet been entered.  If it has, throw a -1 on return --->
		<cfquery name="qCheckExists" datasource="#sDSN2#">
			SELECT entrantid 
			FROM tentrant
			WHERE emailaddy = '#FORM.email#'
		</cfquery>
		<!--- might need to change the above to UCASE --->
		
		<cfif qCheckExists.RecordCount gte 1>
			<!--- 1 or more records exist, therefore return a -1 --->
			<cfset returnvar = -1>
		<cfelse> <!--- no records exist, therefore proceed --->
			<!--- trim all strings before passing into query --->
			<cfset patronemail = #TRIM(FORM.email)#>
			<cfset patronfname = #TRIM(FORM.name_first)#>
			<cfset patronlname = #TRIM(FORM.name_last)#>
			<cfset patronpassword = #TRIM(FORM.password)#>
			<cfset pass_confirm = #TRIM(FORM.password_confirm)#>
				
			<cfset valid_email = IsValid("email", patronemail)>

			<cfif valid_email eq "YES">
				<cfif patronpassword NEQ pass_confirm> <!--- passwords do not match --->
					<cfset returnvar = 5> 
				<cfelse> <!--- passwords match --->
				 <cfif Len(patronpassword) gte 5> <!--- password > 4 chars long --->
				  <cfif FindNoCase(" ", patronpassword) eq 0>  <!--- no spaces in pass --->
					    <!--- valid email, valid password--->
							<!--- ********** all valid, therefore attempt insert **************** --->
							<cflock timeout="30">
								<cftransaction>
									<cfquery name="qInsertNewPatron" datasource="#sDSN2#">
										INSERT INTO tentrant
										(fname, lname, emailaddy, entrantpassword, roleid, createddate, aviarydeals, addressid)
										VALUES
										(
										<cfqueryparam cfsqltype="cf_sql_varchar" value="#patronfname#">,
										<cfqueryparam cfsqltype="cf_sql_varchar" value="#patronlname#">,
										<cfqueryparam cfsqltype="cf_sql_varchar" value="#patronemail#">,
										<cfqueryparam cfsqltype="cf_sql_varchar" value="#patronpassword#">,
										<cfqueryparam cfsqltype="cf_sql_tinyint" value="1">,
										#Now()#,
										<cfqueryparam cfsqltype="cf_sql_tinyint" value="1">,
										1
										)
									</cfquery><!--- #ARGUMENTS.aviarydeals# --->
									<!--- in order to confirm it was inserted, do a check on the last record entered --->
									<cfquery name="qConfirmInsert" datasource="#sDSN2#">
										SELECT emailaddy
										FROM tentrant
										ORDER BY entrantid DESC
										LIMIT 1
									</cfquery>
									<cfif TRIM(qConfirmInsert.emailaddy) eq patronemail>
										<!--- insert successful --->
										<cfset returnvar = 1>
									<cfelse> <!--- insert unsuccessful --->
										<cfset returnvar = -2>
									</cfif>
								</cftransaction>
							</cflock>
			    <cfelse>
					  <cfset returnvar = 4> <!--- valid email, password cannot contain spaces--->
					</cfif> <!--- Find no case --->
					
				 <cfelse> <!--- len gte 5... --->
				  <!--- valid email address, invalid password (too short)--->
				  <!--- check for any spaces in pass --->
				  <cfset returnvar = 3>	
				 </cfif> <!--- len gte 5 --->
				</cfif> <!--- pass = pass_confirm --->
			<cfelse>
				<!--- invalid email --->
				<cfset returnvar = 2>
			</cfif>
			
			
		</cfif>
		
		<!---
		returnvar: <cfdump var="#returnvar#"> </br>
		qConfirmInsert: <cfdump var="#qConfirmInsert.emailaddy#">
		--->
		<cfif returnvar eq 1>
			<!--- registration was a success, therefore login the user --->
   			<cfquery datasource="#sDSN2#" name="qLogin">
					SELECT 
						entrantid, lname, fname, emailaddy, entrantpassword, roleid
					FROM 
						tentrant
					WHERE tentrant.emailaddy = '#FORM.email#'
					AND tentrant.entrantpassword = '#FORM.password#'
				</cfquery>		
				
				<!--- qLogin.entrantid: <cfdump var="#qLogin.entrantid#"> </br>
				FORM.password: <cfdump var="#FORM.password#"> </br>
				roles:  --->
				<cfset rolesStr = "basic">
				<!--- <cfdump var="#rolesStr#"> </br> --->
				<!--- qLogin.RecordCount: <cfdump var="#qLogin.RecordCount#"> Line 164 of user_reg --->
				<cfif qLogin.RecordCount GT 0> <!--- someone matches that email address and password --->
					<cfset SESSION.entrantid = qLogin.entrantid>
					<cfset SESSION.lname = qLogin.lname>
					<cfset SESSION.fname = qLogin.fname>
					<cfset SESSION.emailaddy = qLogin.emailaddy>
					<cfset SESSION.roleid = qLogin.roleid>
					<!--- <cflogin>
						<cfloginuser name="#qLogin.entrantid#" password="#FORM.password#" roles="#rolesStr#" />
					</cflogin> --->
					<!---this logs the person in using their email address and password--->
				<cfelse>   <!--- no match --->
				</cfif>
		 		<!--- line 177 of user reg:
		 		</br>
		 		<cfdump var="#SESSION#">
		 		<cfabort> --->
				
	   		<cfset bRegistrationSuccess = true />	   
		</cfif>
		
	   			
   </cfif>   
</cfif>

<!--- check to see if this person is assigned to a group yet --->


<!--- this only executes if registration was a success --->
<cfif NOT bRegistrationSuccess>  
  <cfinclude template="header.cfm" />
    <cfform action="#CGI.SCRIPT_NAME#" method="post">
	<table class="tblReg">
      <tr>
        <td colspan="2">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
	  </tr>
	  <tr>
	  	<td colspan="2" class="ltturq">
	  		<cfif returnvar eq 2>
		      <div style="border:2px solid red;background-color:#FFF;color:red;font-weight:bold;font-size:14px;padding:5px;" align="center">
			      Invalid email address.  Enter in a valid email address and try again.
			    </div>
		    <cfelseif returnvar eq -1>
					<div style="border:2px solid red;background-color:#FFF;color:red;font-weight:bold;font-size:14px;padding:5px;" align="center">
					  Email address already exists inside EyeOnMajors.  Try again.
					</div>
				<cfelseif returnvar eq -2>
					<div style="border:2px solid red;background-color:#FFF;color:red;font-weight:bold;font-size:14px;padding:5px;" align="center">
						Could not insert record.  Try again.  If this happens again, contact EyeOnMajors@gmail.com
					</div>
				<cfelseif returnvar eq 3>
			    <div style="border:2px solid red;background-color:#FFF;color:red;font-weight:bold;font-size:14px;padding:5px;" align="center">
			      Password must be 5 or more characters long without spaces.  Try again.
			    </div>
		    <cfelseif returnvar eq 4>
			    <div style="border:2px solid red;background-color:#FFF;color:red;font-weight:bold;font-size:14px;padding:5px;" align="center">
			      Password cannot contain spaces.  Try again.
			    </div>
				<cfelseif returnvar eq 5>
				  <div style="border:2px solid red;background-color:#FFF;color:red;font-weight:bold;font-size:14px;padding:5px;" align="center">
				    Password does not match Password Confirm.  Try again.
				  </div>
				</cfif>
	  	</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="ltturq greybigbold">First Name:</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="turqblue mastersbigbold">
		  <cfinput type="text" name="name_first" value="#FORM.name_first#" class="field" required="yes" message="You must enter a first name."  size="30" style="font-size:14px;color:darkgreen;font-weight:bold;" />
		</td>
	  </tr>
      <tr>
        <td colspan="2">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
      </tr>
	  <tr>
	    <td colspan="2" class="ltturq greybigbold">Last Name:</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="turqblue mastersbigbold">
		  <cfinput type="text" name="name_last" value="#FORM.name_last#" class="field" required="yes" message="You must enter a last name."  size="30" style="font-size:14px;color:darkgreen;font-weight:bold;"/>
		</td>
	  </tr>
      <tr>
        <td colspan="2">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
      </tr>
      <tr>
	    <td colspan="2" class="ltturq greybigbold">Email:</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="turqblue mastersbigbold">
		  <cfinput type="text" name="email" value="#FORM.email#" class="field" required="yes" message="You must enter an email address."  size="30" style="font-size:14px;color:darkgreen;font-weight:bold;"/>
		</td>
	  </tr>
	  <tr>
        <td colspan="2">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
      </tr>
	  <tr>
	    <td colspan="2" class="ltturq greybigbold">Password:</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="turqblue mastersbigbold">
		  <cfinput type="password" name="password" class="field" required="yes" message="You must enter a password." size="30" style="font-size:14px;color:darkgreen;font-weight:bold;"/>
		</td>
	  </tr>
      <tr>
        <td colspan="2">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
      </tr>
	  <tr>
	    <td colspan="2" class="ltturq greybigbold">Confirm Password:</td>
	  </tr>
	  <tr>
	    <td class="turqblue mastersbigbold">
		  <cfinput type="password" name="password_confirm" class="field" required="yes" message="You must enter a confirmation password." size="30" style="font-size:14px;color:darkgreen;font-weight:bold;"/>
		</td>
		<td>
	      <input name="register_button" type="image" src="../images/register.gif" width="75" height="21" />
	    </td>
	  </tr>
      <tr>
        <td colspan="2">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
      </tr>
	  <tr>
	    <td colspan="1" class="ltturq greybigbold">
		  <span class="ltturq" >  
		  <input type="checkbox" name="partner_emails" class="field" value="AviaryDeals" checked="true" class="mastersbigbold"/>Please inform me about Golfap.com :: Trusted by Tour Pros & College Golf Teams, Recommended by Top Teachers... becoming a web-based application in the next year!
	    </span>
		  <div class="ltturq" style="padding:10px;padding-top:25px;">
			EyeOnMajors.com will not under ANY circumstances use, rent, or sell your email address for anything other than for information related to the EyeOnMajors 
			free web-based pool.  Your email is simply used to send you updates to your pool, and used as your unique login name.  Enjoy the events!
			</div>
		  
		</td>
		<td>
	    </td>
	  </tr>
      
    </table>
  </cfform>
  <cfinclude template="footer.cfm" />
 <cfelse>
 	<!--- registration was a success --->
 	<cfset sHeaderMessage = "You have been registered.  Now Join/Create a Group and make your picks!"  />
	<!--- check to see if this person has been assigned to a group yet --->
	   	<cfif NOT bMatedwithgroupyet>
	   			<cflocation url="notwithgroupyet.cfm" />
	 	</cfif>
	</cfif>
		
