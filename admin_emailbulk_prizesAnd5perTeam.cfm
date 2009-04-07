<cfparam name="sHeaderMessage" default="Enter your email address and password" />
<cfset sFooterMessage = '#Year(now())#' & " Eye on Majors :: The Most Enjoyable and Competitive Golf Pool on the Planet!" />
<!-- -->
<cfset sHeaderMessage = "" />
<cfinclude template="header.cfm" />

<!--- 
used for testing to my email
<cfquery datasource="#sDSN2#" name="qGetAllEmailAddresses">
	SELECT emailaddy, fname, lname, entrantpassword
	FROM tentrant
	WHERE emailaddy LIKE '%@%'
	AND emailaddy LIKE '%.com'
	AND entrantid = 1
</cfquery> --->

<cfquery datasource="#sDSN2#" name="qGetAllEmailAddresses">
	SELECT entrantid, emailaddy, fname, lname, entrantpassword
	FROM tentrant
	WHERE emailaddy LIKE '%@%'
	AND emailaddy LIKE '%.com'
	AND entrantid = 1
	ORDER BY entrantid ASC
</cfquery>

<!--- <cfquery datasource="#sDSN2#" name="qGetAllEmailAddressesCheck">
	SELECT entrantid, emailaddy, fname, lname, entrantpassword
	FROM tentrant
	WHERE emailaddy LIKE '%@%'
	AND emailaddy LIKE '%.com'
	AND emailaddy LIKE '% %'
</cfquery> --->
<!--- <cfdump var="#qGetAllEmailAddresses#">
<cfabort> --->
<!--- <style type="text/css">
	
</style>

<link rel="STYLESHEET" type="text/css" href="styles.css"> --->
 
    <!--- <table>
	  <tr>
	    <td>
		  <cfdump var="#qGetAllEmailAddresses#">
		  
		</td>
	  </tr>
	  
	  </table> --->
<cfoutput query="qGetAllEmailAddresses">
	<cfquery datasource="#sDSN2#" name="qGetGroup">
		SELECT tG.groupname, tG.grouppassword, tG.groupid
		FROM tentrantgroup tEG LEFT OUTER JOIN tgroup tG ON tEG.groupid = tG.groupid
		WHERE
			tEG.entrantid = #qGetAllEmailAddresses.entrantid#
			AND
			tEG.eventid = 9 
	</cfquery>
	<cfquery datasource="#sDSN2#" name="qGetNumInGroup">
		SELECT count(entrantid) as NumInGroup
		FROM tentrantgroup tEG
		WHERE tEG.entrantid = #qGetAllEmailAddresses.entrantid#
			AND tEG.eventid = 9
			AND tEG.groupid = #qGetGroup.groupid#
	</cfquery>
	
	<cfmail from="EyeOnMajors@eyeonmajors.com" to="#qGetAllEmailAddresses.emailaddy#" 
			replyto="eyeonmajors@gmail.com" subject="EyeOnMajors.com 2007 - 6 Degrees of Wally" type="HTML">
		
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

       	<title>EyeOnMajors.com - Masters is 2 days away!</title>
		<link rel="STYLESHEET" type="text/css" href="styles.css">
       	<style>
			.trborder {
				border-color: ##003300;
				background-color: ##DDFFCC;
			}
		</style>

</head>

<body>

<div style="padding:10px;">Dear #qGetAllEmailAddresses.fname# #qGetAllEmailAddresses.lname#,</div>
<div style="padding:10px;"> 
The EyeOnMajors.com 2007 Masters is just two short days away!  
</div>
<div style="padding:10px;">
Should you be wise enough to defeat all members of the Global Pool, you will walk away with this year's Fantastic prizes --
a dozen (Titleist, Precept, or Callaway) premium golf balls of your choice, along with a copy of The Aviary game tracking software for the series golfer -- a total value of over $115!
</div>
<div style="padding:10px;">
<cfset numMembers = #qGetNumInGroup.NumInGroup#>

<strong>Currently your group, #qGetGroup.groupname#, has #qGetNumInGroup.NumInGroup# group members.</strong>
</div>
<div style="padding:10px;">
<cfif numMembers gte 5>
	Because you have more than 5 members in your group, you qualify for the Global Pool Championship, and are eligible for the prizes!
<cfelse>
	<cfset numInvites = (5 - numMembers)>
	You currently do not qualify for the prizes, because you only have #numMembers# members in your group.  
	You only need #numIvites# more member of your group to be eligible to compete for the Global Championship and the golf prizes!  
	What have you got to lose, it's FREE!  So invite #numIvites# more friends and you can all compete for the prizes! 
</cfif>
</div>

As you know, you can jostle your line up as much as you want prior to Wednesday's deadline!</div>

<div style="padding:10px;font-size:20px;font-color:##006600" align="center"><a href="www.eyeonmajors.com" style="color:green;">www.eyeonmajors.com</a></div>
<div style="padding:10px;">
	<a href="www.eyeonmajors.com">
	<img src="www.eyeonmajors.com/globalprizes.jpg">
	</a>
</div>
		
<div style="font-size:16px;" align="center">
		<div>Your login: <strong style="font-size:12px; color:blue;">#emailaddy#</strong></div>
		<div>Your password: <strong style="font-size:11px; color:blue;">#entrantpassword#</strong></div>
</div>
<div style="padding:10px;"></div>
<cfif qGetGroup.RecordCount gt 0>
<div style="font-size:12px" align="center">
		<div>Your Group Name: <strong style="font-size:12px; color:blue;">#qGetGroup.groupname#</strong></div>
		<div>Your Group Password: <strong style="font-size:11px; color:blue;">#qGetGroup.grouppassword#</strong></div>
		<div>You can pass your unique group name and group password to your friends and they can join your group easily when they register.</div>
</div>
<cfelse>
	<div style="font-size:12px;">Once you login, you will be able to create a group!</div>
</cfif>	
	     <table width="800px" border="0">
	      <tr style="border: 0px;"><td colspan="2" style="color:silver; font-size:small;" align="center">
		      If you have any questions, you can always email us at: eyeonmajors@gmail.com!  Thanks for playing and good luck!
		      <div style="font-size:x-small;">To unsubscribe from these mailings, reply to this message with "UNSUBSCRIBE" in the subject line.</div>
			</td></tr>
	  	<tr style="border: 0px;"><td colspan="2" style="color:gray;  font-size:small;" align="center"><i>EyeOnMajors : The Most Challenging and Enjoyable Golf Pool on the Planet!</i></td></tr>
		<tr>
			<td colspan="2" align="center" style="color:gray;">
				</td>
		</tr>
		</table>
		<div align="center" style="font-size: small; color:silver;">Brought to you by:</div>
		<div align="center" style="">Albatross Software - Software for the Serious Golfer</div>
		<div align="center"><a href="www.atross.com"><img src="www.eyeonmajors.com/albatrosslogo.gif" alt="Atross.com :: Software for the Serious Golfer" width="145" height="40"></a></div>
</body>

</html>
		
		
		 
	  
	</cfmail>
</cfoutput>
	
	
<cfinclude template="footer.cfm" />