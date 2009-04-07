<!--- data passed from client --->

<cfset oParamsPar = FORM.oParams> <!--- fields are: "old": "new1": "new2": "patronid" (should probably strip /r/n with RegEx from msg)--->

<cfset input_string = oParamsPar>

<cfinvoke component="json" method="decode" data="#input_string#" returnvariable="sMsg" />

<!--- 
1. check that 'new1' = 'new2'
2. check that 'old' = current pass
3. check that 'new1' and 'new2' are greater than 4 characters
4. update db entry for that entrant
--->
<cfset json_return = StructNew()>
<!--- check that 'new1' = 'new2'--->
<cfif TRIM(sMsg.new1) eq TRIM(sMsg.new2)>
<cfoutput>
	  <cftransaction>
		  <cfquery name="qCheckOld" datasource="#sDSN2#">
			  SELECT Count(DISTINCT entrantid) as nummatching
			  FROM tentrant
			  WHERE entrantid = #sMsg.patronid# AND entrantpassword = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#TRIM(sMsg.old)#">
		  </cfquery>
		</cftransaction>
		<cfif qCheckOld.nummatching lt 1>
			<cfset json_return.returnval = 1> <!--- 1 = old password did not match password in database --->
			<cfinvoke component="json" method="encode" data="#json_return#" returnvariable="jsonReturn" />
			<cfoutput>#jsonReturn#</cfoutput> <!--- return encoded JSON --->
			<cfabort>
		<cfelse>
			<!--- we know now that the old matches the old in the db, and the two new1, new2 match, therefore run the update--->
			<cftransaction>
			<cfquery name="qUpdatePW" datasource="#sDSN2#">
				UPDATE tentrant
				SET entrantpassword = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#TRIM(sMsg.new1)#">
				WHERE entrantid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#sMsg.patronid#"> AND entrantpassword = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#TRIM(sMsg.old)#">
			</cfquery>
			<!--- double check that password has been saved --->
			<cfquery name="qCheckNew" datasource="#sDSN2#">
			  SELECT Count(DISTINCT entrantid) as nummatching
			  FROM tentrant
			  WHERE entrantid = #sMsg.patronid# AND entrantpassword = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#TRIM(sMsg.new1)#">
		  </cfquery>
			</cftransaction>
			<cfif qCheckNew.nummatching eq 1>
				<cfset json_return.returnval = 0> <!--- 0 = password successfully saved --->
				<cfinvoke component="json" method="encode" data="#json_return#" returnvariable="jsonReturn" />
				<cfoutput>#jsonReturn#</cfoutput> <!--- return encoded JSON --->
				<!--- successful... therefore it will continue down to the CFMail portion below --->
				
			<cfelse>
				<cfset json_return.returnval = 9> <!--- 9 = unknown password saved error  --->
				<cfinvoke component="json" method="encode" data="#json_return#" returnvariable="jsonReturn" />
				<cfoutput>#jsonReturn#</cfoutput> <!--- return encoded JSON --->
				<cfabort>
			</cfif>
		</cfif>
		
</cfoutput>
<cfelse>
	<cfset json_return.returnval = 2> <!--- 2 = new1 and new2 do not match on server side --->
	<cfinvoke component="json" method="encode" data="#json_return#" returnvariable="jsonReturn" />
	<cfoutput>#jsonReturn#</cfoutput> <!--- return encoded JSON --->
	<cfabort>
</cfif>




