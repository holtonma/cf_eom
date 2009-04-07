
<cfinclude template="header.cfm" />
<link rel="STYLESHEET" type="text/css" href="../EoM/styles.css">

<!--obtain user id's group -->
<!--- <cfquery datasource="#sDSN#" name="qUserGroup" >
  SELECT poolperson.EntrantFirstName, poolperson.EntrantLastName, poolperson.GroupID
  FROM poolperson
  WHERE EntrantID = #GetAuthUser()#
</cfquery> --->
<cfquery datasource="#sDSN2#" name="qUserGroup" >
  SELECT tE.fname as EntrantFirstName, tE.lname as EntrantLastName
  FROM tentrant tE
  WHERE EntrantID = #SESSION.entrantid#
</cfquery>
<!--- all message fragements --->
<!--- need to look at this query in more detail --->
<cfquery datasource="#sDSN2#" name="qMessages" >
  SELECT tM.posterid, tM.messageid, tM.messagefragmentid, tM.parsedmessagetext as message, tM.messagefragmentlinkurl, tM.datetimeofmessage
  FROM tmessages tM
  WHERE tM.groupID = #SESSION.patrongroupid#
  ORDER BY tM.datetimeofmessage DESC
</cfquery>
<!--- GROUP BY tM.messageid --->
<!--- <cfquery datasource="#sDSN#" name="qMessages" >
  SELECT messageboard.posterID, messageboard.message, messageboard.groupID, messageboard.timeofmessage
  FROM messageboard
  WHERE messageboard.groupID = #qUserGroup.GroupID#
  ORDER BY messageboard.timeofmessage DESC
</cfquery> --->

<!--- <cfquery datasource="#sDSN#" name="qPoolGroupName" >
  SELECT PoolGroupName
  FROM poolgroup
  WHERE poolgroupID = #qUserGroup.GroupID#
</cfquery> --->
<cfquery datasource="#sDSN2#" name="qPoolGroupName" >
  SELECT groupname as PoolGroupName
  FROM tgroup
  WHERE groupid = #SESSION.patrongroupid#
</cfquery>

<title>Eye On Majors Message Board</title>

<table width="100%" class="ltturq">
	<tr>
		<div align="center">
			<object width="425" height="350"><param name="movie" value="http://www.youtube.com/v/fnP3Mz1wh9c"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/fnP3Mz1wh9c" type="application/x-shockwave-flash" wmode="transparent" width="425" height="350"></embed></object>
		</div>
		</br>
	</tr>
</table>	

<table width="100%" class="ltturq" border="0">
		 <tr>	
			<td colspan="3">
				<div align="center" style="font-size:18px;font-weight:bold;">EyeOnMajors.com Message Board for Group :: "<cfoutput>#qPoolGroupName.PoolGroupName#</cfoutput>"</div>
				<br>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="font-size:x-large;" align="center">
				<a href="messageboard_post.cfm">
					<span class="picclickred" title="...post message to board by clicking here." style="font-size:20px;padding:4px;">
					POST MESSAGE TO GROUP CLICK HERE
					</span>
				</a>
				</br>
			</td>
		</tr>
		<tr>
    		<br>
  	  	</tr>
		<cfoutput query="qMessages">
	  	<!-- this nested query identifies the person who posted the particular message-->
	  	<cfquery datasource="#sDSN2#" name="qPosterInfo" >
		  SELECT fname as EntrantFirstName, lname as EntrantLastName
		  FROM tentrant
		  WHERE entrantid = #qMessages.posterid#
		</cfquery>
	  	<!--- <cfquery datasource="#sDSN#" name="qPosterInfo" >
		  SELECT EntrantFirstName, EntrantLastName
		  FROM poolperson
		  WHERE EntrantID = #qMessages.posterID#
		</cfquery> --->
      <tr>
	    <span class="white"><td colspan="1" align="left" style="background-color:##EEEEEE">
			Posted by: <span class="mastersgreen">#qPosterInfo.EntrantFirstName# #qPosterInfo.EntrantLastName#</span> on 
			#DateFormat(qMessages.datetimeofmessage, "mm/dd/yyyy")# #TimeFormat(qMessages.datetimeofmessage, "hh:mm:ss")# <br>
		</td></span>
	  </tr>
	  <tr>
		<span class="mastersgreen">
		<td class="mastersgreen">
	        <div style="font-size:14px;">#qMessages.message#</div><br>
	    </td>
		</span>
	  </tr>
      <tr>
        <td colspan="2" class="ltturq">
	      <img src="../images/spacer.gif" height="10" />
	    </td>
  
</cfoutput>
	<tr>
		<td colspan="2">
			<div align="center">
			<object width="425" height="350"><param name="movie" value="http://www.youtube.com/v/yZUas1JCIHQ"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/yZUas1JCIHQ" type="application/x-shockwave-flash" wmode="transparent" width="425" height="350"></embed></object>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div  align="center">
			<object width="425" height="350"><param name="movie" value="http://www.youtube.com/v/XCO3rn_-TsU"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/XCO3rn_-TsU" type="application/x-shockwave-flash" wmode="transparent" width="425" height="350"></embed></object>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<cfif SESSION.patrongroupid eq 1>
			<div align="center"><object width="425" height="350"><param name="movie" value="http://www.youtube.com/v/2ID5cmpvwaE"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/2ID5cmpvwaE" type="application/x-shockwave-flash" wmode="transparent" width="425" height="350"></embed></object></div>
			</cfif>
		</td>
	</tr>
</table>


<table width="100%" class="ltturq">
<tr class="ltturq">
	<td colspan="3">
	<br>
	Your group's message board is your place to banter among friends during these golf championships.  
	EyeOnMajors.com wants you to use your group's message board as you see fit, posting messages among your group of friends from near 
	and afar for your enjoyment.  Use your own judgment with the language and code of conduct in your group.  
	Keep in mind that the game of golf is an honorable one, and EyeOnMajors.com is the class of all golf pools, 
	so we only ask that you are respectful to other members of your group.  In other words, have fun and be respectful of your 
	fellow competitors and patrons, even while talking 'smack'<br>
	<br>
	</td>
</tr>
</table>

<cfinclude template="footer.cfm" />