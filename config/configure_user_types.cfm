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