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
	SELECT tE.entrantid, tE.emailaddy, tE.fname, tE.lname, tE.entrantpassword, tG.GolferLastName, tG.GolferFirstName
	FROM tteamselected tTS
	INNER JOIN tentrant tE ON tE.entrantid = tTS.entrantid
	INNER JOIN tgolfer tG ON tTS.golferid = tG.golferid
	WHERE tTS.golferid in (28, 295, 1, 9, 10, 14, 18, 31, 36, 57, 61) 
</cfquery>

<!---  where tTS.golferid in (28, 295, 1, 9, 10, 14, 18, 31, 36, 57, 61) --->


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

<cfif qGetGroup.RecordCount gt 0>

	



<!--- #qGetAllEmailAddresses.emailaddy# --->	
	<cfmail from="EyeOnMajors@eyeonmajors.com" to="#qGetAllEmailAddresses.emailaddy#" bcc="holtonma@gmail.com" 
			replyto="eyeonmajors@gmail.com" subject="Update: Faldo is out. Quigley is tentative" type="HTML">
		
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
You are receiving this note because you chose either: Nick Faldo, Brett Quigley, or Gay Brewer on your team.  
</div>
<div style="padding:10px;" style="font-size:14px;">You chose: <strong>#GolferFirstName# #GolferLastName#</strong></div>
<div style="padding:10px;" style="font-size:12px;">
Nick Faldo will not be playing this year's Masters.  If you have selected him, he has been removed from your team.  Simply add your 6th player and you are good to go.
</div>
<div  style="font-size:12px;padding:10px;">Brett Quigley, <a href="http://www.cbsnews.com/stories/2007/04/03/ap/sportsline/main2644261.shtml">left Augusta on Tuesday for the birth of his child.</a> 
If he does not return to play the Masters, and you chose Quigley, you would obviously not compete, as you need all 6 players to make the cut.  Therefore, it might be wise to remove Quigley from your team and replace him with another player.  But the risk there is up to you.</div>

<div style="padding:10px;">
As you know, you can jostle your line up as much as you want prior to Wednesday night's deadline!  Your login and group information is shown below.</div>
</div>

<div style="padding:10px;font-size:20px;font-color:##006600" align="center">
	<a href="www.eyeonmajors.com" style="color:green;">www.eyeonmajors.com</a></div>

		
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
	  	<tr style="border: 0px;"><td colspan="2" style="color:gray;  font-size:small;" align="center">
		  	<i>EyeOnMajors : Striving to be the Most Challenging and Enjoyable Golf Pool on the Planet!</i></td></tr>
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
	
	</cfif>
</cfoutput>

<cfdump var="#qGetAllEmailAddresses.RecordCount#">
	
<cfinclude template="footer.cfm" />