<cfparam name=sHeaderMessage default="Enter your email address and password" />
<cfset sFooterMessage = "Eye on the Majors 2005 :: Will more than one person make the cut??" />
<!-- "Not already signed up with Eye on Majors? <a href='register/user_registration.cfm'>Register HERE</a>" /> -->
<cfset sHeaderMessage = "Enter your email address plus PASSWORD of 'major' to access the leaderboard." />
<cfinclude template="header.cfm" />
<link rel="STYLESHEET" type="text/css" href="../EoM/styles.css">
 <form action="../store/groupleaderboard_present.cfm" method="post">
    <table>
	  <tr>
	    <td>
		  <img src="../EoM/images/spacer.gif" height="20" />
		</td>
	  </tr>
	  <tr>
	    <td class="ltturq">Email:</td>
	  </tr>
	  <tr>
		<td>
		  <input type="text" name="EmailAddress" class="field" />
		</td>
	  </tr>
	  <tr>
	    <td class="ltturq">Password:</td>
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
		  <img src="../EoM/images/spacer.gif" height="10" />
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