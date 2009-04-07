<cfparam name="FORM.name_first" default="" />
<cfparam name="FORM.name_last" default="" />
<cfparam name="FORM.email" default="" />
<cfparam name="FORM.poolgroupname" default="" />


<cfset bGroupRegistrationSuccess = false />


<cfif IsDefined('FORM.registergroup_button.y')>
   <!-- check to see this GroupName does not exist -->
   <cfquery datasource="#sDSN#" name="qGroupCheckExists">
   SELECT PoolGroupName
   FROM poolgroup
   WHERE PoolGroupName = #FORM.poolgroupname#
   </cfquery>
   
   <!-- check if group exists -->
   <cfif qGroupCheckExists.RecordCount GT 0> 
   		<!-- group name exists: ask user to select a new group name-->
		<!-- clear out the GroupName and GroupPassword boxes and update sHeaderMessage-->
		<cfquery datasource="#sDSN#" name="qUpdatePoolperson">
		   UPDATE poolperson
		   SET GroupID = ('#qGroupCheck.GroupID#')
		   WHERE EntrantID = ('#GetAuthUser()#')
		</cfquery>
		<cfset bGroupRegistrationSuccess = true />
   <cfelse>
	   <!--group does not exist, need to create group -->
	   <!-- update poolperson table with group he or she is in (matches the authorized user who is logged in) -->
	   <cfset bGroupRegistrationSuccess = false />
	   <cfset sHeaderMessage = "AuthUser:" & GetAuthUser() & '#qGroupCheck.GroupID#' & "That group does not exist with the Group Name and Password you specified.  <br> Try again or create a new group by clicking the link below." >
   		
   </cfif>   
</cfif>

<!-- this only executes if registration was a success-->
<cfif bGroupRegistrationSuccess>  
  <!--if group registration was a success, lead that person to his or her own
  web page -->
  <!-- pass session variables for GroupID, EntrantID?? -->
  <cflocation url="../poolpersonpage.cfm" />
    
 <cfelse>
 	<cfinclude template="header.cfm" />
	<cfform action="#CGI.SCRIPT_NAME#" method="post">
	Register a new group to compete against friends, fellow fans, and office-mates!.  You will have an opportunity to email them the Group Name and Group Password once you register the group.
	 
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
	    <td colspan="2" class="ltturq">Create Group!</td>
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
			If you wish to sign in to your existing group?  CLICK HERE <br>
			<cfoutput>#GetAuthUser()#</cfoutput>
	      <img src="/EoM/images/spacer.gif" height="10" />
	    </td>
      </tr>
	  
    </table>
  </cfform>
  <cfinclude template="footer.cfm" />
 </cfif>
