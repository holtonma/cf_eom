<cfset lFirstNames = "Sylvia,Hank,Anu,Van,Kim,Leslie,Sarah,Brian,Susan,George,Arun,Sindhu,Jorge,Franklin,Kerry,Samantha,Catherine,Waldo,Amir,Chafic" />
<cfset lLastNames = "Smith,Tran,Chen,Patel,Perez,Gomez,Jabobs,Petrov,Xu,Jensen,Moreau,Bertrand,Singh,Gupta,Quinn,Cohen,Suzuki,Sato,Song,Kowalski,Castro,Williams,Moore,Anderson" />
<cfquery datasource="learningcoldfusion" name="qUserType">
SELECT user_type_id
FROM lcf_user_type
</cfquery>
<cfloop from="1" to="1000" index="i">
  <cftry>
    <cfset sFirstName = ListGetAt(lFirstNames, RandRange(1,ListLen(lFirstNames))) />
    <cfset slastName = ListGetAt(lLastNames, RandRange(1,ListLen(lLastNames))) />
    <cfquery datasource="learningcoldfusion">
    INSERT INTO lcf_user(user_id, name_last, name_first, email, password, user_type_id, sign_up_date)
    VALUES('#CreateUUID()#', 
    '#sLastName#', 
    '#sFirstname#', 
    '#LCase(sFirstName)#.#LCase(sLastName)##RandRange(1, 1000)#@learningcoldufusion.com', 
    'password', 
    '#qUserType.user_type_id[RandRange(1, qUserType.RecordCount)]#',
    #CreateODBCDateTime(CreateDateTime(RandRange(2000, 2004), RandRange(1, 12), RandRange(1, 28), RandRange(0, 23), RandRange(0, 59), RandRange(0, 59)))#)
    </cfquery>
  <cfcatch>
    <cfset i = i - 1 />
  </cfcatch>
  </cftry>
</cfloop>