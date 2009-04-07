
<cfset bPostSuccess = false />

<cfinclude template="header.cfm" />
<link rel="STYLESHEET" type="text/css" href="../EoM/styles.css">

<title>Eye On Majors Message Board Post</title>

<!--obtain user id's group -->
<cfquery datasource="#sDSN#" name="qUserGroupPost" >
  SELECT poolperson.EntrantID, poolperson.EntrantFirstName, poolperson.EntrantLastName, poolperson.GroupID
  FROM poolperson
  WHERE EntrantID = #GetAuthUser()#
</cfquery>

<cfquery datasource="#sDSN#" name="qMessagesPost" >
  SELECT messageboard.posterID, messageboard.message, messageboard.groupID, messageboard.timeofmessage
  FROM messageboard
  WHERE messageboard.groupID = #qUserGroupPost.GroupID#
  ORDER BY messageboard.timeofmessage DESC
</cfquery>

<cfquery datasource="#sDSN#" name="qPoolGroupNamePost" >
  SELECT PoolGroupName
  FROM poolgroup
  WHERE poolgroupID = #qUserGroupPost.GroupID#
</cfquery>


 
<table width="100%">
<tr>
    <td colspan="3">
	  <div align="center">EyeOnMajors.com Message Board for Group :: "<cfoutput>#qPoolGroupNamePost.PoolGroupName#</cfoutput>"</div></td>
  </tr>
</table>

	  <table>
      <tr>
        <td class="ltturq">
	      Posted by: <span class="ltturqdarkgreen"><cfoutput>#qUserGroupPost.EntrantFirstName# #qUserGroupPost.EntrantLastName#</cfoutput></span>
	    </td>
	  </tr>
	  <tr>
	    <td colspan="2" class="ltturq">
		Group Name: <span class="ltturqdarkgreen"><cfoutput>"#qPoolGroupNamePost.PoolGroupName#"</cfoutput></span> <br>
		<br>
		Type your message then click the "+" sign at right to submit</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="turqblue">
		  <form action="message_post_manage.cfm" method="post">
	  <tr>
		<td class="ltturq" align="center">
				<input name="message_text" type="text" onMouseOver="type message and click '+' sign to submit" value="" size="100" maxlength="200" width="100">
			  
		</td>
		<td><input type="image" name="message_post_button" src="../images/plusSign.gif" /></td>
	  </tr>
			  </form>
		</td>
	  </tr>
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
	      
	    </td>
	  </tr>
      <tr>
        
      </tr>
      <tr>
        
      </tr>
	  
    </table>
	<cfset bPostSuccess = True />


<br>
Your group's message board is your place to banter among friends during these golf championships.  EyeOnMajors.com wants you to use your group's message board as you see fit, posting messages among your group of friends from near and afar for your enjoyment.  Use your own judgment with the language and code of conduct in your group.  Keep in mind that the game of golf is an honorable one, and EyeOnMajors.com is the class of all golf pools, so we only ask that you are respectful to other members of your group.  In other words, have fun and be respectful of your fellow competitors and patrons, even while talking 'smack'<br>
<br>



e>
	<cfset bPostSuccess = True />


<br>
Your group's message board is your place to banter among friends during these golf championships.  
EyeOnMajors.com wants you to use your group's message board as you see fit, posting messages among your group of 
friends from near and afar for your enjoyment.  Use your own judgment with the language and code of conduct in your group.  
Keep in mind that the game of golf is an honorable one, and EyeOnMajors.com is the class of all golf pools, 
so we only ask that you are respectful to other members of your group.  
In other words, have fun and be respectful of your fellow competitors and patrons, even while talking 'smack'<br>
<br>



