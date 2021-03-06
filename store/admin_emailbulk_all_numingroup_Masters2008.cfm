<cfparam name="sHeaderMessage" default="Enter your email address and password" />
<cfset sFooterMessage = '#Year(now())#' & " Eye on Majors :: The Most Enjoyable and Competitive Golf Pool on the Planet!" />
<!--- --->
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
	SELECT DISTINCT(tTS.entrantid) as tsentrantid, tTS.teamselectedid, tE.entrantid, tE.emailaddy, tE.fname, tE.lname, tE.entrantpassword
	FROM tteamselected tTS 
	INNER JOIN tentrantgroup tEG ON tTS.entrantid = tEG.entrantid
	INNER JOIN tentrant tE  ON tTS.entrantid = tE.entrantid
	WHERE 1 = 1
	and tTS.eventid = #SESSION.eventid#
	ORDER BY tE.entrantid ASC
</cfquery>

<!--- and tE.entrantid = 1
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

	<cfquery name="qGetMyTeam" datasource="#sDSN2#">
	  	SELECT 
	  		tTS.teamselectedid, tTS.entrantid, tTS.groupid, tTS.golferid, tTS.eventid,
	  		tG.GolferFirstName, tG.GolferLastName, tG.CurrentScoreRelPar, tG.GolferImage
	  	FROM 
	  		tteamselected tTS INNER JOIN tgolfer tG ON tTS.golferid = tG.GolferID
	  	WHERE 
	  		tTS.teamselectedid = #qGetAllEmailAddresses.teamselectedid#
	  		AND 
	  		tTS.eventid = #SESSION.eventid#
	</cfquery>

<cfsavecontent variable="yourteam">
	<cfoutput>
	<ul style="text-align:left;list-style:none;"><div style="font-weight:bold;padding-bottom:5px;">Your Team as of #DateFormat(Now(), "mm/dd/yyyy")# -- you can modify your team all the way prior to Round 1 of the Masters</div>
	</cfoutput>
		<cfif qGetMyTeam.RecordCount eq 0>
			<li>
			<span style="font-size:14px;font-weight:bold;color:green;">
				<i> Team Not Yet Selected.  You still have time to enter!</i>
			</span>
			</li>
		<cfelse>
		<cfoutput query="qGetMyTeam">
			<li>
				<span><img src="http://s3.amazonaws.com/eomgimages/#GolferImage#.gif"></span>
				<span>#GolferFirstName# #GolferLastName#</span>
				<cfif CurrentScoreRelPar gt 0>
					<span style="font-size:14px;font-weight:bold;color:black;">Current Handicap Sum: +#CurrentScoreRelPar#</span>
				<cfelseif CurrentScoreRelPar lt 0>
					<span style="font-size:14px;font-weight:bold;color:red;">Current Bonus Sum: #CurrentScoreRelPar#</span>
				</cfif>
			</li>
		</cfoutput>
		</cfif>
	</ul>
</cfsavecontent>

<cfoutput query="qEmails">
	<cfquery datasource="#sDSN2#" name="qGetGroup">
		SELECT tG.groupname, tG.grouppassword, tG.groupid
		FROM tentrantgroup tEG LEFT OUTER JOIN tgroup tG ON tEG.groupid = tG.groupid
		WHERE
			tEG.entrantid = #qEmails.entrantid#
			AND
			tEG.eventid IN (8, 9,10,11, 12, 13)
	</cfquery>
  
  <cfquery datasource="#sDSN2#" name="qNumFullSquads">
		SELECT COUNT(tEG.entrantgroupuniqueid) as NumFullSquads
		FROM tentrantgroup tEG
		WHERE tEG.eventid = #SESSION.eventid#
		AND tEG.teamselectedid > 0
		AND tEG.finaltiebreakerscore IS NOT NULL
		AND tEG.groupid = #qGetGroup.groupid#
	</cfquery>
  
  <cfset numingroup = #qNumFullSquads.NumFullSquads#>

<cfif qGetGroup.RecordCount gt 0>


	<!--- #qEmails.emailaddy# --->
	<cfmail from="EyeOnMajors@gmail.com" to="#qEmails.emailaddy#" bcc="eyeonmajors@gmail.com"
			replyto="EyeOnMajors@gmail.com" subject="Group '#qGetGroup.groupname#' : #numingroup# full squads competing" type="HTML">
		
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
<div style="padding:10px;"> 
The <b style="font-weight:bold;color:green;">2008 Masters</b> at Augusta National Golf Club is less than 8 short days away!  
</div>
<div style="padding:10px;"> 
</br></br>Your group ('#qGetGroup.groupname#') currently has <b>#numingroup#</b> members with full squads competing.  
<cfif numingroup gte 5>
	This means that in addition to competing amongst your friends in your group for bragging rights, you <u>are competing</u> for the Global Pool Championship prizes of a free dozen golf balls and a free copy of the Aviary software!  If you are the number 1 team in the Global pool, you win!  Best of luck!  
<cfelse>
	<cfset numleft = 5 - numingroup>
	This means that your group is not yet eligible for the global prizes.  But don't worry, there is still plenty of time!  If you haven't filled out your full squad, you should help your group by doing so.  If you have, you just need to have <b>#numleft# more members of your group</b> in order to be eligible for the prizes in the Global Pool!  What do you have to lose -- share the fun and invite #numleft# more friends to join your group so you are eligible to win a dozen golf balls of your choice and The Aviary software (over $100 total retail value).  
</cfif>

#yourteam#

</div>

<div style="padding:10px;">As always EyeOnMajors is 100% FREE.  Thanks for playing and we hope you continue to enjoy!</div>

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
	      <tr style="border: 0px;"><td colspan="2" style="color:silver; font-size:small;" align="center">
		      If you have any questions, you can always email us at this address.  Thanks for playing and good luck.  To unsubscribe from these mailings, reply to this message with "UNSUBSCRIBE" in the subject line.
			</td></tr>
	  	<tr style="border: 0px;"><td colspan="2" style="color:gray;  font-size:small;" align="center">
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

<b>this parser fucking sucks</b>

<cfdump var="#qEmails#" label="valid emails">





