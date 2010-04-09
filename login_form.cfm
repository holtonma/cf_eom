<cfparam name="sHeaderMessage" default="Enter your email address and password" />
<cfset sFooterMessage = '#Year(now())#' & " Eye on Majors :: The Most Enjoyable and Competitive Golf Pool on the Planet!" />
<!-- -->
<cfset sHeaderMessage = "" />
<cfinclude template="header.cfm" />

<link rel="STYLESHEET" type="text/css" href="styles.css">
 <form action="proceed.cfm" method="post">
    <table>
	  <tr>
	    <td>
		  <img src="/images/spacer.gif" height="20" />
		</td>
	  </tr>
	  <tr>
	    <td class="greybigbold">Email Address:</td>
	  </tr>
	  <tr>
		<td>
		  <input type="text" name="EmailAddress" class="mastersbigbold" />
		</td>
	  </tr>
	  <tr>
	    <td class="greybigbold">Password:</td>
	  </tr>
	  <tr>
		<td>
		  <input type="password" name="Password" class="mastersbigbold" />
		</td>
	    <td>
		  <input name="login_button" type="image" src="login.gif" width="142" height="29" /> 
		</td>
		<td width="100">
		</td>
		<td>
		  <!--- <input name="newregister_button" type="image" src="create_login.gif" width="215" height="23" /> --->
		  
		</td>
	  </tr>
	  <!--- <tr>
		  <td colspan="4"><a href="javascript:showhideGetPass();">Forgot Password?  Click Here</a></td>
	  </tr> --->
	  <!--- <tr>
		<td colspan="4">
			<cfinclude template="forgotpassword.cfm">
		</td>
	  </tr> --->
	  <tr>
	    <td colspan="2">
		  <img src="/images/spacer.gif" height="10" />
		</td>
	  </tr>
	  <tr>
	    <td colspan="2">
		  Not already signed up with Eye on Majors? 
		  
		  Registration for the 2010 US Open will be open 
		    after the Masters has concluded! 
			<!---  --->
			<!---  
			Sign Up Here! 
		  <div><a href='register/user_registration.cfm'>Register HERE</a></div> 
		  --->
		  <!---   --->
		  <br /><!--- Coming Soon : Password Retrieval Feature --->
		</td>
	  </tr>
	</table>
  </form>
  <!---<table width="800">
  	  <tr>
	  	<td width="100%">
	  	<!--
		Having trouble?  View this short DEMO with instructions.
		-->
		<cfform action="#CGI.SCRIPT_NAME#" method="post">
			<table border="0" cellpadding="5">
				<tr>If you have forgotten or misplaced your password, please enter your email address below</tr>
				<tr>
					<td>Email Address:</td>
				</tr>
				<tr>
					<td><cfinput type="text" name="emailaddress" id="emailaddress"></td>	
				</tr>
				<tr>
					<td><cfinput type="button" name="emailgo" value="Email Me My Info"/></td>
				</tr>
			</table>
		</cfform>
	
		<cfif IsDefined('FORM.emailgo.y')>
			<cfquery name="qGetUserInfoFromEmail" datasource="YourDatasource">
				SELECT 
					poolperson.EntrantLastName, 
					poolperson.EntrantFirstName, 
					poolperson.EntrantPassword,
					poolperson.GroupID,
					poolperson.EmailAddy,
					poolgroup.PoolGroupName,
					poolgroup.PoolGroupPassword
				FROM poolperson 
					JOIN poolgroup ON poolperson.groupID = poolgroup.poolgroupID 
				WHERE poolperson.EmailAddy = '#Form.username#' 
			</cfquery>
			<!-- results -->
			<cfif qGetUserInfoFromEmail.RecordCount NEQ 0>
				<CFMAIL FROM="noreply@eyeonmajors.com" TO="#Form.emailaddress#" SUBJECT="Your Info">
					Dear #poolperson.EntrantFirstName# #poolperson.EntrantLastName#,<br>
					Your logon email address is: #poolperson.EmailAddy#<br>
					Your password is: #qGetUserInfoFromEmail.PasswordColumn#<br><br><br>
					
					If you would like to invite friends to join your group, your group information is as follows:<br>
					Your group name is: #poolgroup.PoolGroupName#<br>
					Your group password is: #poolgroup.PoolGroupPassword#<br>
				</CFMAIL>
			<cfoutput>Your password has been sent to #Form.emailaddress#</cfoutput>
			<cfelse>
			Sorry, your email address does not exist in our database.  Please correct and re-submit, or try a different email address.
			</cfif>
		</cfif>
			</td>
		  </tr>
	  </table>--->

<cfinclude template="footer.cfm" />