<cfparam name="sHeaderMessage" default="Enter your email address and password" />
<cfset sFooterMessage = '#Year(now())#' & " Eye on Majors :: The Most Enjoyable and Competitive Golf Pool on the Planet!" />
<cfset sHeaderMessage = "" />
<cfinclude template="header.cfm" />

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
	
	and tE.entrantid = 1
	
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
<!--- 
	and tE.entrantid = 1 
--->

	
<cfoutput query="qEmails">
	<cfquery datasource="#sDSN2#" name="qGetGroup">
		SELECT tG.groupname, tG.grouppassword, tG.groupid
		FROM tentrantgroup tEG LEFT OUTER JOIN tgroup tG ON tEG.groupid = tG.groupid
		WHERE
			tEG.entrantid = #qEmails.entrantid#
			AND
			tEG.eventid IN (7, 8, 9,10,11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21)
	</cfquery>
	
<cfif qGetGroup.RecordCount gt 0>
	
	<cfmail from="EyeOnMajors@gmail.com" to="#qEmails.emailaddy#" bcc="eyeonmajors@gmail.com"
			replyto="EyeOnMajors@gmail.com" subject="Group 'Magical' - British #Year(Now())#" type="HTML">
		
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>EyeOnMajors.com - Masters is almost here!</title>
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
Friends, we are back again, providing Major entertainment for your enjoyment. Join in our fun and get your picks in by Wednesday 10 p.m. PST.
</div>

<div style="padding:10px;">
Congrats to Dawn Jarosz for her winner-take-all Masters victory!  Looking forward to more good times the last 3 majors.
</div>

<div style="font-size:18px;font-weight:bold;padding:20px;" align="center">
Our commissioner for this major is Wally Holton. 
<span>Therefore, please send your entry fee of $10 to: 
	<div style="color:black;text-decoration:underline;">
	Wally Holton | 335 Nora Ave | Glenview, IL 60025
	</div>
	<div>( you can also PayPal your $11 entry fee to: holtonma@gmail.com.  The extra $1 is to cover the vig from PayPal )</div>
	<div>Thanks, and to all - enjoy the week and good luck!</div>
</span>
</div>

<div>
	<ul>As a refresher, here are our simple rules:
		<li>select 6 players. they are your team.</li>
		<li>all players are created equal except:
		Tiger Woods. -- is giving 10 shots to every player in the field in our game.  Otherwise, it's too easy.</li>
		<li>all of your players must make the cut. </li>
		<li>our winner will be the 6 selected players ( the team )  with the lowest total score for 72 holes.we only have a 1st prize. winner takes all.</li>
		<li>tiebreaker. predict the winning individual score for the tournament. </li>
		<li>all entries must be posted to the web page at www.eyeonmajors.com before 12:59 a.m. PST Thursday before the tournament.  (When the clock strikes the deadline time listed above, the website automatically refuses to accept entries, so get your picks in early!).  Entries are posted by simply logging in, and clicking on the red text next to your name that says "team not complete".  This will take you to a page where you simply click the players' faces that you want on your squad and checkout.   Tell as many friends as you like to join our group, or create a unique group. </li>
		<li>100% of all entry fees will be paid to the lone winner!  Invite your friends to join our group's pool -- the more the merrier. </li>
		<li>the decision of the committee shall be final on all matters. the committee is Mr Eye and Mr Mark Holton. 
		Technical questions about the website can be sent to: holtonma@gmail.com (note: I will be out of town until Wed)</li>
		<li>Good luck and please keep those checks rolling in....... remember our motto: <i>fast pay makes fast friends</i></li>
	</ul>
</div>

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
	<div style="font-size:12px;">Once you login, you will be able to join an existing group or create a new group!</div>
</cfif>	
<div style="padding:10px;" align="center">
	<a href="www.eyeonmajors.com">EyeOnMajors.com<!--- <img src="www.eyeonmajors.com/pga_championship_index.gif" border="0"> ---></a>
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