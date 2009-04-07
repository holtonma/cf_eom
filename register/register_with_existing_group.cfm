<script src="../js/prototype.js" type="text/javascript"></script>
<script src="../js/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript'>_ajaxConfig = {'_cfscriptLocation':'../components/eomajax.cfc', '_jsscriptFolder':'../js'};</script>
<script type='text/javascript' src='../js/ajax.js'></script>


<script type="text/javascript">
	function getFriendsEmailJS()	{
		// send data to CF
		DWRUtil.useLoadingMessage();
		fremailelement = document.getElementById("txtGetFriendsEmail").value;
		DWREngine._execute(_ajaxConfig._cfscriptLocation, null, 'getFriendGroupCF', fremailelement, getFriendsEmailReturnJS);
	}
	// call back function
	function getFriendsEmailReturnJS (r) {
		// set port price on page (use regular expression for price)
        $('friendsemailreturn').innerHTML = r;
		//$('friendsemailreturn').innerHTML = r;
	}
</script>


<cfparam name="FORM.name_first" default="" />
<cfparam name="FORM.name_last" default="" />
<cfparam name="FORM.email" default="" />
<cfparam name="FORM.existingpoolgroupname" default="" />

<cfset existingGroupRegistrationSuccess = false />
<!--- <cfset SESSION.patronID = #GetAuthUser()# /> --->
<cfset SESSION.patronID = #SESSION.entrantid#>
<!-- upon load, populate form with user's email address-->
	<!--- <cfquery datasource="#sDSN#" name="qPopulateEmail">
	   SELECT poolperson.EmailAddy
	   FROM poolperson
	   WHERE poolperson.EntrantID = #SESSION.patronID#
  	</cfquery> --->
	<cfquery datasource="#sDSN2#" name="qPopulateEmail">
	   SELECT emailaddy
	   FROM tentrant
	   WHERE entrantid = #SESSION.entrantid#
  	</cfquery>
	


<cfif IsDefined('FORM.registerwithgroup_button.y')>
   <!-- check to see this GroupName does not exist -->
   <!--- <cfquery datasource="#sDSN#" name="qGroupCheckExists">
   SELECT poolgroup.PoolGroupName, poolgroup.PoolGroupPassword, poolgroup.PoolGroupID
   FROM poolgroup, poolperson
   WHERE poolgroup.PoolGroupName = '#FORM.existingpoolgroupname#'
   AND poolgroup.PoolGroupPassword = '#FORM.poolgrouppassword#'
   AND poolperson.EntrantPassword = '#FORM.entrant_password#'
   </cfquery> --->
	<cfquery datasource="#sDSN2#" name="qGroupCheckExists">
	   SELECT tG.groupname, tG.grouppassword, tG.groupid
	   FROM tgroup tG
	   WHERE 
	   	tG.groupname = '#FORM.existingpoolgroupname#'
	   	AND tG.grouppassword = '#FORM.poolgrouppassword#'
   	</cfquery>
      
   
   <!-- check if group exists -->
   <cfif qGroupCheckExists.RecordCount GT 0> 
   		<!-- login user and define SESSION.patronID-->		
		<!-- group name exists: assign the user to this group by updating the "poolperson" table and 'GroupID' field-->
		<!-- this query checks returns a recordset containing info about whether or not the EyeOnMajors golf pool AuthUser has registered with a team-->
		<!--- <cfquery datasource="#sDSN#" name="qUserRegWithTeam">
			UPDATE poolperson
			SET GroupID = #qGroupCheckExists.PoolGroupID#
			WHERE poolperson.EntrantID = #GetAuthUser()#
		</cfquery> --->
		<!--- has there been any tEG entry for a new user? --->
		<cfquery datasource="#sDSN2#" name="qchecktEGexists">
			SELECT entrantgroupuniqueid
			FROM
				tentrantgroup
			WHERE entrantid = #SESSION.entrantid#
			AND groupid = #qGroupCheckExists.groupid#
			AND eventid = #SESSION.eventid#
		</cfquery>
		<cfset SESSION.patronGroupID = #qGroupCheckExists.groupid# >
		<cfif qchecktEGexists.RecordCount neq 0>
			<!--- already exists, therefore UPDATE --->
			<cfquery datasource="#sDSN2#" name="qUserRegWithTeam">
				UPDATE tentrantgroup 
				SET groupid = #SESSION.patrongroupid#
				WHERE entrantid = #SESSION.entrantid#
				AND eventid = #SESSION.eventid#
			</cfquery>
			<cfset existingGroupRegistrationSuccess = true />
			<!-- update the selected teams table "SelectedTeamID' field -->
			<!--- <cfquery datasource="#sDSN#" name="qUserRegWithTeam">
				UPDATE selectedteams
				SET PoolGroupID = #qGroupCheckExists.PoolGroupID#
				WHERE selectedteams.poolpersonID = #GetAuthUser()#
			</cfquery> --->
		<cfelse>
			<!--- does not already exist, therefore INSERT --->
			<cfquery datasource="#sDSN2#" name="qInsertGroupRelation">
				INSERT INTO tentrantgroup (entrantid, groupid, teamselectedid, eventid)
				VALUES (#SESSION.entrantid#, #SESSION.patrongroupid#, -1, #SESSION.eventid#)
			</cfquery>
			
			<cfset existingGroupRegistrationSuccess = true />
		</cfif>
   <cfelse>
	   <!--group does not exist, need to enter correct name & password or create group -->
	   <!-- refresh form, blanking only user password -->
	   <cfset existingGroupRegistrationSuccess = false />
	   
   </cfif>   
</cfif>

<!-- this only executes if registration was a success-->
<cfif existingGroupRegistrationSuccess>  
  <!--if group registration was a success, lead that person to his or her own
  web page -->
  <!-- since the user has registered a group, proceed to group page:-->
	<cflocation url="../store/group.cfm" />
    
<cfelse>
 	<cfinclude template="header.cfm" />
	
	<cfform action="#CGI.SCRIPT_NAME#" method="post">
	You want to register with an existing pool group?<br>
	Simply enter the Group Name and Group Password, along with your entry password and you will be registered with that group
	: <br>
	<br>
	<table>
      <tr>
        <td colspan="2">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
	  </tr>
	  <tr>
	  	<td>
		</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="ltturq">Group Name:</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="turqblue">
		  <cfinput type="text" name="existingpoolgroupname" value="#FORM.existingpoolgroupname#" class="field" required="yes" message="You must enter a first name."  />
		</td>
	  </tr>
	  <!--- <tr>
	  	<td class="ltturq"><a href="Effect.BlindDown('friendsemailslidedown');return false;">CLICK HERE IF you don't remember your friend's GROUP NAME, but know your friend's email address</a>
		</td>
	  </tr> --->
	  <!--- <div style="display: none" id="friendsemailslidedown">
	  	<table>
			<tr>
			<td class="ltturq">My friend's email:
			<input type="text" name="txtGetFriendsEmail" id="txtGetFriendsEmail" value="" onblur="getFriendsEmailJS();return false;"/></td>
			
			<td class="ltturq"><span id="friendsemailreturn"></span>
		  </tr>
		</table>
	  </div> --->
       <tr>
	    <td colspan="2" class="ltturq">Group Password:</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="turqblue">
		  <cfinput type="password" name="poolgrouppassword" class="password" required="yes" message="You must enter a password." />
		</td>
	  </tr>
	  <tr>
        <td colspan="2">
	      
	    </td>
      </tr>
	  <tr>
        <td colspan="2">
	      
	    </td>
      </tr>
	  <tr>
	    <td colspan="2" class="ltturq">Your email: </td>
	  </tr>
	  <tr>
	    <td colspan="2" class="turqblue">
		  <cfinput type="text" name="poolgroupmember" value="#qPopulateEmail.EmailAddy#" class="field" size="50" required="yes" message="Enter your email so we can assign you to the group you want." />
		</td>
	  </tr>
	  <tr>
        <td colspan="2"></td>
      </tr>
	  <!--- <tr>
        <td colspan="2" class="ltturq">Your password: </td>
      </tr>
	  <tr>
        <td colspan="2" class="turqblue"><cfinput type="password" name="entrant_password" class="field" required="yes" message="Don't forget to enter your password." /></td>
      </tr>
       ---><tr>
        <td colspan="2">
	      
	    </td>
      </tr>
	  <tr>
	    <td colspan="2" class="ltturq"></td>
	  </tr>
	  <tr>
		<td>
	      <input name="registerwithgroup_button" type="image" src="../images/register.gif" width="75" height="21" />
	    </td>
	  </tr>
      <tr>
        <td colspan="2">
	      
	    </td>
      </tr>
      <tr>
        <td colspan="2">
			If you do not have a group, and wish to create a new group?  <a href="/register/group_registration.cfm">CLICK HERE</a> <br>
			<!--- <cfoutput>#SESSION.entrantid#</cfoutput> --->
	      <!---<img src="/EoM/images/spacer.gif" height="10" />--->
	    </td>
      </tr>
	  
    </table>
  </cfform>
  <cfinclude template="footer.cfm" />
</cfif>
