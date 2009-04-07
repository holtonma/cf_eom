
<cfoutput>
<cfquery datasource="eyeon2" name="qMagical">
	SELECT DISTINCT(tTS.entrantid) as tsentrantid, tE.entrantid, tE.emailaddy, tE.fname, tE.lname, tE.entrantpassword
	FROM tteamselected tTS 
	INNER JOIN tentrantgroup tEG ON tTS.entrantid = tEG.entrantid
	INNER JOIN tentrant tE  ON tTS.entrantid = tE.entrantid
	WHERE tEG.groupid = 1
	ORDER BY tE.entrantid ASC
</cfquery>
</cfoutput>

	
<cfset qEmails = QueryNew("tsentrantid, entrantid, emailaddy, fname, lname, entrantpassword")>	
<cfset valid_email_count = 0>
<cfoutput query="qMagical">
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


<body>
<cfoutput><div>Group Magical emails: (#qEmails.RecordCount#)</div></cfoutput>
<div>
<cfoutput query="qEmails">
	#emailaddy#, 
</cfoutput>
</div>
</body>

	