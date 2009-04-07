<cfset aUsers = ArrayNew(1) />
<cfset aUsers[1] = StructNew() />
<cfset aUsers[1].name_last = "" />
<cfset aUsers[1].name_first = "Basic" />
<cfset aUsers[1].email = "basic@learningcoldfusion.com" />
<cfset aUsers[1].password = "password" />

<cfset aUsers[2] = StructNew() />
<cfset aUsers[2].name_last = "" />
<cfset aUsers[2].name_first = "Plus" />
<cfset aUsers[2].email = "plus@learningcoldfusion.com" />
<cfset aUsers[2].password = "password" />

<cfset aUsers[3] = StructNew() />
<cfset aUsers[3].name_last = "" />
<cfset aUsers[3].name_first = "Super" />
<cfset aUsers[3].email = "super@learningcoldfusion.com" />
<cfset aUsers[3].password = "password" />

<cfset aUsers[4] = StructNew() />
<cfset aUsers[4].name_last = "" />
<cfset aUsers[4].name_first = "Admin" />
<cfset aUsers[4].email = "admin@learningcoldfusion.com" />
<cfset aUsers[4].password = "password" />


<cfquery datasource="learningcoldfusion">
DELETE FROM lcf_user
</cfquery>
<cfquery datasource="learningcoldfusion" name="qUserTypeBasic">
SELECT user_type_id
FROM lcf_user_type
WHERE type = 'basic'
</cfquery>
<cfquery datasource="learningcoldfusion" name="qUserTypePlus">
SELECT user_type_id
FROM lcf_user_type
WHERE type = 'plus'
</cfquery>
<cfquery datasource="learningcoldfusion" name="qUserTypeSuper">
SELECT user_type_id
FROM lcf_user_type
WHERE type = 'super'
</cfquery>
<cfquery datasource="learningcoldfusion" name="qUserTypeAdmin">
SELECT user_type_id
FROM lcf_user_type
WHERE type = 'admin'
</cfquery>
<cfloop from="1" to="#ArrayLen(aUsers)#" index="i">
  <cfquery datasource="learningcoldfusion">
  INSERT INTO lcf_user(user_id, name_last, name_first, email, password, user_type_id, sign_up_date)
  VALUES('#CreateUUID()#', 
  '#aUsers[i].name_last#', 
  '#aUsers[i].name_first#', 
  '#aUsers[i].email#', 
  '#aUsers[i].password#', 
  '#VARIABLES["qUserType" & aUsers[i].name_first].user_type_id[1]#',
  #CreateODBCDateTime(Now())#)
  </cfquery>
</cfloop>
<cfquery datasource="learningcoldfusion" name="qUser">
SELECT * FROM lcf_user
</cfquery>