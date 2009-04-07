<cfparam name=sHeaderMessage default="Enter your email address and password" />
<cfset sFooterMessage = "Eye on the Majors 2005 :: The Toughest Golf Office Pool in America" />
"Not already signed up with Eye on Majors? Sign-ups for British now OPEN!!! <a href='register/user_registration.cfm'>Register HERE</a>" /> 
<cfset sHeaderMessage = "" />
<cfinclude template="genheader.cfm" />
<link rel="STYLESHEET" type="text/css" href="styles.css">
 <form action="redirectuponlogin.cfm" method="post">
    <p>Select a unique Group Name and Password for your group!<br>
      (Group Name &gt; 7 characters, alpha-numeric)
    </p>
    <table>
	  <tr>
	    <td>
		  <img src="/images/spacer.gif" height="20" />
		</td>
	  </tr>
	  <tr>
	    <td class="ltturq">Group Name:</td>
	  </tr>
	  <tr>
		<td>
		  <input type="text" name="EmailAddress" class="field" />
		</td>
	  </tr>
	  <tr>
	    <td class="ltturq">Group Password:</td>
	  </tr>
	  <tr>
		<td>
		  <input type="password" name="Password" class="field" />
		</td>
	    <td>
		  <input type="image" name="login_button" src="login.gif" />
		</td>
	  </tr>
	  <tr>
	    <td colspan="2">
		  <img src="/images/spacer.gif" height="10" />
		</td>
	  </tr>
	  <tr>
	    <td colspan="2">
		  <!--- Link to password retrieval --->
		</td>
	  </tr>
	</table>
 </form>
<cfinclude template="footer.cfm" />