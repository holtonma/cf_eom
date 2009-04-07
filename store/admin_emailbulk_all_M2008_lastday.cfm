<cfparam name="sHeaderMessage" default="Enter your email address and password" />
<cfset sFooterMessage = '#Year(now())#' & " Eye on Majors :: The Most Enjoyable and Competitive Golf Pool on the Planet!" />
<cfset sHeaderMessage = "" />
<cfinclude template="header.cfm" />

<cfquery datasource="#sDSN2#" name="qGetAllEmailAddresses">
	SELECT DISTINCT(tTS.entrantid) as tsentrantid, tE.entrantid, tE.emailaddy, tE.fname, tE.lname, tE.entrantpassword
	FROM tteamselected tTS 
	INNER JOIN tentrantgroup tEG ON tTS.entrantid = tEG.entrantid
	INNER JOIN tentrant tE  ON tTS.entrantid = tE.entrantid
	WHERE 1 = 1 and tE.entrantid = 1
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
			<cfset temp2 = QuerySetCell(qEmails, "entrantpassword", entrantpasswor