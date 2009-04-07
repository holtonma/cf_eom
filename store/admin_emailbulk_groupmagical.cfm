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
	SELECT DISTINCT(tTS.entrantid) as tsentrantid, tE.entrantid, tE.emailaddy, tE.fname, tE.lname, tE.entrantpassword
	FROM tteamselected tTS 
	INNER JOIN tentrantgroup tEG ON tTS.entrantid = tEG.entrantid
	INNER JOIN tentrant tE  ON tTS.entrantid = tE.entrantid
	WHERE tE.emailaddy LIKE '%@%'
	AND (tE.emailaddy LIKE '%.com' OR tE.emailaddy LIKE '%.net' OR tE.emailaddy LIKE '%.ca' OR tE.emailaddy LIKE '%.za' OR tE.emailaddy LIKE '%.gov' OR tE.emailaddy LIKE '%.org')
	AND tE.emailaddy NOT LIKE '% %'
	AND tEG.groupid = 1
	ORDER BY tE.entrantid ASC
</cfquery>

<!--- and tE.entrantid = 1
	 --->

<!--- <cfdump var="#qGetAllEmailAddresses#">
<cfabort> --->
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
			tEG.eventid IN (9,10,11)
	</cfquery>

<cfif qGetGroup.RecordCount gt 0>

	



	
	<cfmail from="EyeOnMajors@gmail.com" to="#qGetAllEmailAddresses.emailaddy#" bcc="eyeonmajors@gmail.com"
			replyto="EyeOnMajors@gmail.com" subject="British Open 2007 Magical Champion -- Phales!" type="HTML">
		
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
Group Magical's 2007 British Open champion is: <strong>Phales!  Congrats, Bob Phalen, you win the cheese!  700 bones, nice haul!</strong>  
</div>
<div style="padding:10px;">
	Thanks for playing everyone, and hope you all enjoyed.  Get your picks ready for the PGA Championship pool coming up -- last pool of the year
	before we take some time in the off-season to prepare for the first major upgrade to EyeOnMajors in 2008!
</div>
<div style="padding:10px; color: red">
	Note that we have not received many of your entry fees still for the US and British Open.  In order to pay our winner, please send in your entry fees asap.
</div>

<div style="font-size:18px;font-weight:bold;padding:20px;" align="center">
If you have not paid your US Open entry fee, 
<span>please send your entry fee of $10 and your $10 British Open entry fee to: 
	<div style="color:black;text-decoration:underline;">
	Wally Holton |
	335 Nora Ave |
	Glenview, IL 60025
	</div>
	<div>(bigwallh@gmail.com)</div>
</span>
</div> <!---  --->


<div align="center">For future reference, here is your login information:</div>
<div style="padding:10px;font-size:20px;font-color:##006600" align="center"><a href="www.eyeonmajors.com" style="color:green;border:2px solid black;">www.eyeonmajors.com</a></div>

		
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
<div style="padding:10px;" align="center">
	<a href="www.eyeonmajors.com">
	<img src="www.eyeonmajors.com/images/BritishWelcome.gif">
	</a>
</div>
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

<cfoutput query="qGetAllEmailAddresses">
	<div>#tsentrantid# : #lname#, #fname# : #emailaddy# :</div>
</cfoutput>
	
<cfinclude template="footer.cfm" />