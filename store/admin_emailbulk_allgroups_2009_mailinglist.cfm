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
			tEG.eventid IN (7, 8, 9,10,11, 12, 13, 14, 15, 16, 17)
	</cfquery>



<cfif qGetGroup.RecordCount gt 0>


	<!--- #qEmails.emailaddy# --->
	<cfmail from="EyeOnMajors@gmail.com" to="#qEmails.emailaddy#" bcc="eyeonmajors@gmail.com"
			replyto="EyeOnMajors@gmail.com" subject="Share your ideas and feedback!" type="HTML">
		
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
<p>It never been easier to submit ideas, or get answers to questions & issues within the EyeOnMajors community!</p>
<p>You can submit ideas, feedback, questions here -- which will go directly to me, who is building and maintaining EyeOnMajors: <a href="http://www.eyeonmajors.com/feedback.htm">http://www.eyeonmajors.com/feedback.htm</a></p>
<p>We also have a community mailing list, where patrons can ask questions of other users in the community, or pose ideas.  'The Committee' will pay close attention to this, and see where we can improve your experience.  'The squeaky wheel gets the grease.'</p>
</div>
<div>
	<p>On that note, we heard your feedback from last year's End of Season survey, and are preparing some of those enhancements for 2009.  Here is a look at some data being gathered from 2008 PGA and European Tour tournaments, and is in the process of being incorporated into EyeOnMajors in 2009 and beyond: <a href="http://golfap.com/pgatour">http://golfap.com/pgatour</a></p>
	
<p>Thanks and happy 2009!</p>
<p>Holts, on behalf of The Committee</p>
</div>

<div style="padding:10px;">As always it's 100% FREE.  Thanks for playing and enjoy!</div>

<div align="center" style="color:gray;">For easy reference, here is your login information:</div>
<div style="padding:10px;font-size:20px;font-color:##006600" align="center"><a href="www.eyeonmajors.com" style="color:green;border:3px solid black;padding:2px;">www.eyeonmajors.com</a></div>

<div style="font-size:16px;" align="center">
		<div>Your login: <strong style="font-size:14px; color:blue;">#emailaddy#</strong></div>
		<div>Your password: <strong style="font-size:14px; color:blue;">#entrantpassword#</strong></div>
</div>
<div style="padding:10px;"></div>
<cfif qGetGroup.RecordCount gt 0>
    <div style="font-size:12px" align="center">
		<div>Your Group Name: <strong style="font-size:14px; color:blue;">#qGetGroup.groupname#</strong></div>
		<div>Your Group Password: <strong style="font-size:14px; color:blue;">#qGetGroup.grouppassword#</strong></div>
		<div style="padding-top:5px;">You can pass your unique group name and group password to your friends and they can join your group easily when they register.</div>
    </div>
<cfelse>
	<div style="font-size:12px;">Once you login, you will be able to create a group!</div>
</cfif>	
<div style="padding:10px;" align="center">
	<hr>
	<!---
	<a href="www.eyeonmajors.com" border="0">
	<img src="www.eyeonmajors.com/images/composite-placeholder_Masters_r1_c1_1.gif" border="0">
	</a>
	--->
</div>
	     <table width="800px" border="0">
	      <tr style="border: 0px;"><td colspan="2" style="color:silver;font-size:small;" align="center">
		      If you have any questions, you can always email us at this address.  Thanks for playing and good luck.  To unsubscribe from these mailings, reply to this message with "UNSUBSCRIBE" in the subject line.
			</td></tr>
	  	<tr style="border: 0px;"><td colspan="2" style="color:gray;font-size:small;" align="center">
		  	<i>EyeOnMajors : The Most Challenging and Enjoyable Golf Pool on the Planet!</i></td></tr>
		<tr>
			<td colspan="2" align="center" style="color:gray;">
				</td>
		</tr>
		</table>
		<div align="center" style="padding-top:10px;">www.golfap.com - Software for the Serious Golfer</div>
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