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

<!--- AND tTS.entrantid = 1--->

<cfquery datasource="#sDSN2#" name="qGetAllEmailAddresses">
	SELECT DISTINCT(tTS.entrantid) as tsentrantid, tE.entrantid, tE.emailaddy, tE.fname, tE.lname, tE.entrantpassword
	FROM tteamselected tTS 
	INNER JOIN tentrantgroup tEG ON tTS.entrantid = tEG.entrantid
	INNER JOIN tentrant tE  ON tTS.entrantid = tE.entrantid
	WHERE 1 = 1
	ORDER BY tE.entrantid ASC
</cfquery>

<!--- and tE.entrantid = 1 and tEG.groupid = 1
	 --->
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


	<!--- #qEmails.emailaddy# --->
	<cfmail from="EyeOnMajors@gmail.com" to="#qEmails.emailaddy#" bcc="eyeonmajors@gmail.com"
			replyto="EyeOnMajors@gmail.com" subject="Thanks for playing in 2008" type="HTML">
		
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>
<title>EyeOnMajors.com!</title>
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

<div style="padding:10px;" style="font-size:12px;">
Thank you for your participation in the EyeOnMajors.com events in 2008.  For your enjoyment we look forward to continuing to improve the site and the game in 2009 and beyond. 
</div>

<div style="padding:10px;" style="font-size:12px;">
In the spirit of that quest we have created a quick 1-2 minute survey and appreciate your valued feedback.  Most questions are multiple choice, with the opportunity to add comments and additional feedback if you so choose.
</div>

<div style="padding:10px;" style="font-size:14px;font-weight:bold;" align="center">
<a href="http://www.surveymonkey.com/s.aspx?sm=sKlL1RkWjRQdsZsbKtx4RA_3d_3d" style="font-size:large;font-weight:bold;color:green;">Click Here to take EyeOnMajors survey!</a>
</div>

<div style="padding:10px;" style="font-size:12px;">
Thanks again for a great 2008, and see you for the 2009 Masters!
</div>

<div style="padding:10px;" style="font-size:12px;">
Holts<br/>
on behalf of 'The Committee'<br/>
<a href="http://www.eyeonmajors.com">EyeOnMajors.com</a><br/>
<i>The Most Challenging and Enjoyable Golf Pool on the Planet (TM)</i>

<div><img border="0" src="http://eyeonmajors.com/images/EyeOnMajors_onGlass.gif"></div>
</div>

<hr>
</body>
</html>

</cfmail>
</cfif>
</cfoutput>

<cfoutput>
<div style="color:red;">#valid_email_count# out of #qGetAllEmailAddresses.RecordCount# were valid</div>
</cfoutput>
<!--- <cfdump var="#qEmails#"> --->

<cfoutput query="qEmails">
	<div>#tsentrantid# : #lname#, #fname# : #emailaddy# :</div>
</cfoutput>
	
<cfinclude template="footer.cfm" />