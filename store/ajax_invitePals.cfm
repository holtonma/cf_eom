<!--- data passed from client --->

<cfset oParamsPar = FORM.oParams> <!--- fields are: "pals", "entrantid", "msg" --->

<cfset input_string = oParamsPar>

<cfinvoke component="json" method="decode" data="#input_string#" returnvariable="sMsg" />
<cfset sMsg.pals = #REReplaceNoCase( sMsg.pals, "</?[a-z].*?>", "", "ALL" )#>

<cfset json_return = StructNew()>
<cfset qEmails = QueryNew("address")>	
	
<cfset json_return.VALIDEMAILS = 0>
<cfloop index="addy" list = "#sMsg.pals#"> 
  <cfif isValid("email", addy)>
  	<cfset json_return.VALIDEMAILS = json_return.VALIDEMAILS + 1>
	  <cfset temp = QueryAddRow(qEmails)>
	  <cfset temp2 = QuerySetCell(qEmails, "address", addy)>
  </cfif>  
</cfloop>

<cfset json_return.PALS = #ValueList(qEmails.address, ",")#>

<!--- lookup sender's group name and password --->
<cfoutput>
	<cfquery datasource="#sDSN2#" name="qGetGroup">
		SELECT tG.groupname, tG.grouppassword, tG.groupid
		FROM tentrantgroup tEG LEFT OUTER JOIN tgroup tG ON tEG.groupid = tG.groupid
		WHERE
			tEG.entrantid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#sMsg.entrantid#"> 
			AND
			tEG.eventid = #SESSION.eventid#
	</cfquery>
</cfoutput>
	
<cfmail from="EyeOnMajors@gmail.com" To="EyeOnMajors@gmail.com" BCC="#json_return.PALS#" Subject="Masters Golf Pool 2008!" type="HTML">
	<html>
	<body>
		<div align="center"><a href="http://www.eyeonmajors.com"><img src="http://www.eyeonmajors.com/images/EyeOnMajors_onGlass.gif" border="0"></div>
	  <div align="left" style="padding:10px;"><cfoutput>#sMsg.msg#</cfoutput></div>
	  <div align="center"><a href="http://www.eyeonmajors.com" style="color:green;font-weight:bold;">www.eyeonmajors.com</a></div>
	  <div style="padding-top:10px;">If you are signing up new, simply use this information when prompted to join our group!</div>
	  <div>our group name: <b>#qGetGroup.groupname#</b></div>
	  <div>our group password: <b>#qGetGroup.grouppassword#</b></div>
	</body>
	</html>
</cfmail>

<!--- 
	<cfdump var="#qEmails.address#"><cfabort> 
--->

<cfset json_return.RETURNVAL = 0> <!--- 0 = completed sending --->
<cfset json_return.BADEMAILS = "bad_list">
<cfset json_return.PALS = #ValueList(qEmails.address, ",")#>

<cfinvoke component="json" method="encode" data="#json_return#" returnvariable="jsonReturn" />
<cfoutput>#jsonReturn#</cfoutput>
<cfabort>
<!--- 
1. loop through comma delimited list... 
  a. check that email address is a valid email
  b. if it is a valid email, build email and send email
  c. save valid email addresses to new list -- this will be part of the return payload to display to the user.
--->

<!---
	  <cftransaction>
		  <cfquery name="qCheckOld" datasource="#sDSN2#">
			  SELECT Count(DISTINCT entrantid) as nummatching
			  FROM tentrant
			  WHERE entrantid = #sMsg.patronid# AND entrantpassword = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#TRIM(sMsg.old)#">
		  </cfquery>
		</cftransaction>
		<cfset json_return.returnval = 2> <!--- 2 = new1 and new2 do not match on server side --->
	
--->




