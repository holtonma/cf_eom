
<!--- <cfquery datasource="#sDSN#" name="qUserGroupPost" >
  SELECT poolperson.EntrantID, poolperson.EntrantFirstName, poolperson.EntrantLastName, poolperson.GroupID
  FROM poolperson
  WHERE EntrantID = #GetAuthUser()#
</cfquery> --->
<cfquery datasource="#sDSN2#" name="qUserGroupPost" >
  SELECT tE.entrantid as EntrantID, tE.fname as EntrantFirstName, tE.lname as EntrantLastName
  FROM tentrant tE
  WHERE entrantid = #SESSION.entrantid#
</cfquery>

<!--related to golfers selected:: add to 'cart', if already selected, don't add -->
<cfif IsDefined('FORM.message_post_button.y')>
	
  <!--if message post was a success, then 1. log message to database, and 2. send to message board-->
  <!-- send message, etc to database -->
  <cfset messageDate = #CreateODBCDateTime(Now())#>
	  <cfquery datasource="#sDSN2#" name="qUpdateMessageboard">
		  INSERT INTO tmessages (posterid, groupid, parsedmessagetext, datetimeofmessage)
		  VALUES (#SESSION.entrantid#, #SESSION.patrongroupid#, '#FORM.message_text#', #messageDate#)
	  </cfquery>
	  <!--- <cfquery datasource="#sDSN#" name="qUpdateMessageboard" >
		  INSERT INTO messageboard (posterID, groupID, message, timeofmessage)
		  VALUES (#qUserGroupPost.EntrantID#, #qUserGroupPost.GroupID#, '#FORM.message_text#', #messageDate#)
	  </cfquery> --->
	  
		  
  <cflocation url="..\store\messageboard.cfm" />
<cfelse>
	<cfset FORM.message_text = "">
</cfif> 
	
