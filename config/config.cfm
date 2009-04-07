<cfset aUserTypes = ArrayNew(1) />
<cfset ArrayAppend(aUserTypes, "basic") />
<cfset ArrayAppend(aUserTypes, "plus") />
<cfset ArrayAppend(aUserTypes, "super") />
<cfset ArrayAppend(aUserTypes, "admin") />
<cfquery datasource="learningcoldfusion">
  DELETE FROM lcf_user_type
</cfquery>
<cfloop from="1" to="#ArrayLen(aUserTypes)#" index="i">
  <cfquery datasource="learningcoldfusion">
  INSERT INTO lcf_user_type(user_type_id, type)
  VALUES('#CreateUUID()#', '#aUserTypes[i]#')
  </cfquery>
</cfloop>
<cfquery datasource="learningcoldfusion" name="qUserTypes">
SELECT * FROM lcf_user_type
</cfquery>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Learning ColdFusion Configuration</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
  <table>
    <tr bgcolor="#99FF00">
	  <td>User Type ID</td>
	  <td>User Type</td>
	</tr>
    <cfoutput query="qUserTypes">
	<tr bgcolor="##CCFF00">
	  <td>#qUserTypes.user_type_id#</td>
	  <td>#qUserTypes.type#</td>
	</tr>
	</cfoutput>
  </table>
</body>
</html>
