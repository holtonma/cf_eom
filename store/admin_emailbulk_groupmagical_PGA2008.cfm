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

<!--- and tE.entrantid = 1
 --->

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

<cfset qEmails = QueryNew("tsentrantid, entrantid, emailaddy, fname, lname, entrantpassword")>	
<cfset valid_email_count = 0>
<cfoutput query="qGetAllEmailAddresses">
  <cfif isValid("email", emailaddy)>
  	<cfset valid_email_count = valid_email_count + 1>
	  <cfset temp = QueryAddRow(qEmails)>
	  <cfset temp2 = QuerySetCell(qEmails, "tsentrantid", tsentrantid)>
		<cfset temp2 = QuerySetCell(qEmails, "entrantid", entrantid)>
	  <cfset temp2 = QuerySetCell(qEmails, "emailaddy", emailaddy)>
		<cfset temp2 = QuerySetCell(qEmails, "fname", fname)>
		<cfset temp2 = QuerySetCell(qEmails, "lname", lname)>
		<cfset temp2 = QuerySetCell(qEmails, "entrantpassword", entrantpassword)>
  </cfif>  
</cfoutput>
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
	
<cfoutput query="qEmails">
	<cfquery datasource="#sDSN2#" name="qGetGroup">
		SELECT tG.groupname, tG.grouppassword, tG.groupid
		FROM tentrantgroup tEG LEFT OUTER JOIN tgroup tG ON tEG.groupid = tG.groupid
		WHERE
			tEG.entrantid = #qEmails.entrantid#
			AND
			tEG.eventid IN (7, 8, 9,10,11, 12, 13, 14, 15, 16)
	</cfquery>
	
<cfif qGetGroup.RecordCount gt 0>
	
	<cfmail from="EyeOnMajors@gmail.com" to="#qEmails.emailaddy#" bcc="eyeonmajors@gmail.com"
			replyto="EyeOnMajors@gmail.com" subject="Group Magical PGA '08" type="HTML">
		
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

<div style="padding:10px;">Dear #qEmails.fname# #qEmails.lname#,</div>
<div style="padding:10px;"> 
We are back for the final major of the year, the 2008 PGA Championship at Oakland Hills CC.  If you are game, get your picks in by Wednesday night at 2 a.m. PST!
</div>

<div style="font-size:18px;font-weight:bold;padding:20px;" align="center">
Our commissioner for this major is JD Goering. 
<span>Therefore, please send your entry fee of $10 to: 
	<div style="color:black;text-decoration:underline;">
	JD Goering |
	934 N Wood |
	Unit 1  |
	Chicago, IL 60622
	</div>
	<div>( as always, you can always PayPal your $10 entry fee to: holtonma@gmail.com )</div>
	<div>Thanks, JD, and to all - enjoy the week and good luck!</div>
</span>
</div> <!---  --->


<div align="center">For your reference, here is your login information:</div>
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
	<img src="www.eyeonmajors.com/pga_championship_index.gif" border="0">
	</a>
</div>
	     <table width="800px" border="0">
	      <tr style="border: 0px;"><td colspan="2" style="color:silver; font-size:small;" align="center">
		      If you have any questions, you can always email us at: eyeonmajors@gmail.com.  Thanks for playing and good luck-
			</td></tr>
	  	
		</table>
		
</body>

</html>
		
		
		 
	  
	</cfmail>
	
	</cfif>
</cfoutput>

<cfdump var="#qEmails.RecordCount#">

<cfoutput query="qEmails">
	<div>#tsentrantid# : #lname#, #fname# : #emailaddy# :</div>
</cfoutput>
	
<cfinclude template="footer.cfm" />