<cfparam name="sHeaderMessage" default="Enter your email address and password" />
<cfset sFooterMessage = '#Year(now())#' & " Eye on Majors :: The Most Enjoyable and Competitive Golf Pool on the Planet!" />
<cfset sHeaderMessage = "" />
<cfinclude template="header.cfm" />

<cfquery datasource="#sDSN2#" name="qGetAllEmailAddresses">
	SELECT DISTINCT(tTS.entrantid) as tsentrantid, tE.entrantid, tE.emailaddy, tE.fname, tE.lname, tE.entrantpassword
	FROM tteamselected tTS 
	INNER JOIN tentrantgroup tEG ON tTS.entrantid = tEG.entrantid
	INNER JOIN tentrant tE  ON tTS.entrantid = tE.entrantid
	WHERE 1 = 1
	ORDER BY tE.entrantid ASC
</cfquery>
<!--- and tE.entrantid = 1 --->

<!--- check for validity of emails --->
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

<cfsavecontent variable="message">

<p class="message"><b>RULES heads-up you should be aware of:</b></p>

<p class="message">If a golfer on your team of 6 should WITHDRAW from the Masters between now and the Thurs a.m. start, the way that we handle that is by automatically replacing that golfer with the "most popular" player chosen among all patrons.  So for instance, <b>right now Furyk is the most popular player, then Tiger, then Ogilvy, then Mickelson</b> and so on.  For example, if a player on your team of 6 withdrew, and you already had Furyk and Tiger on your team, you would get Ogilvy as the replacement, plus whatever handicaps that replacement player may/may not have.  The popularity of player selections is shown on the Major Leaderboard page: http://eyeonmajors.com/store/major.cfm in the '6 degrees of Wally' column.</p>

<p class="message">The rationale here is that these players represent, theoretically, the least amount of *risk* in missing the cut.  <i>(Remember, that's only theoretically the least amount of risk -- it's 'the most challenging golf pool on the planet' for good reason!)</i>  As the pool organizers, rather than simply say "caveat emptor" and you missing out because a withdrawn player missed the cut, we decided 'we have the technology' to offer a safety net for you to enjoy the pool for the start despite a W/D and you not being able to react in time.  As you know, up until the 2:00 a.m. PST Thursday morning closing time, you ALWAYS have the option to modify your team (as a gutsy change, or to fake out your fellow group members!).  If a player withdraws after the start of the event, there's nothing we can do to help you there.</p>

<p class="message">In this case of one of your players withdrawing prior to Thursday, you would receive an email stating "your chosen player, [golfer widthdrawn name], has withdrawn and has been replaced by the most popular available player, [golfer name]".</p> 

<p class="message">Lastly as a reminder, you need 5 full teams in your group to be eligible for the global prizes (over $100 value) so spread the news to friends and family!  <b>You still have 4 days left to make or modify your team selections.</b></p>

<p class="message">Thanks and enjoy one of the best weeks of the year-</p>
<div class="sig">:Mark Holton</div>
<div class="sig">co-creator</div>
<div class="sig">www.EyeOnMajors.com</div>
<div class="sig">on behalf of 'The Committee'</div>

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



<cfif qGetGroup.RecordCount gt 0>


	<!--- #qEmails.emailaddy# --->
	<cfmail from="EyeOnMajors@gmail.com" to="#qEmails.emailaddy#" bcc="eyeonmajors@gmail.com"
			replyto="EyeOnMajors@gmail.com" subject="Masters 2008 : Player Withdraw Rules" type="HTML">
		
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
			.message{
				padding:10px;
			}
			.sig{
				padding-left:10px;
			}
		</style>

</head>

<body>
<div align="center"><a href="http://www.eyeonmajors.com" border="0"><img src="http://eyeonmajors.com/images/EyeOnMajors_onGlass.gif" border="0"></a></div>
<p class="message">Dear #qEmails.fname# #qEmails.lname#,</p>
<p class="message"> 
The <b style="font-weight:bold;color:green;">2008 Masters</b> at Augusta National Golf Club is almost here.  It's a good idea to select your team early.</p>

<div>
#message#
</div>

<hr>
<div style="padding-bottom:20px;"></div>
<div style="padding:10px;">As always it's 100% FREE.  Thanks for playing and we hope you continue to enjoy!</div>

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

<cfoutput>
<div style="color:red;">#valid_email_count# out of #qGetAllEmailAddresses.RecordCount# were valid</div>
</cfoutput>
<!--- <cfdump var="#qEmails#"> --->

<cfoutput query="qEmails">
	<div>#tsentrantid# : #lname#, #fname# : #emailaddy# :</div>
</cfoutput>
	
<cfinclude template="footer.cfm" />