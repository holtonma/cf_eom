<!--- 	var pars = 'FORM.golferid=' + golferID + '&FORM.activeval=' + ActiveVal;
								
				var resultDomElem = updatedDOMelem
				new Ajax.Updater(resultDomElem, 'eom_caller_golferactive.cfm', 
				{ --->
<cfset activevalpar = FORM.activeval>
<cfset golferidpar = FORM.golferid>
<!--- root is: /vservers/eyeonmaj/htdocs --->
<!--- <cfobject name="oUpdateScore" component="vservers.eyeonmaj.htdocs.components.eomajax">
<cfset result = #oUpdateScore.updateGolferScore(golferidpar, golferscorepar)#> --->


<cftransaction>
	    <cfquery name="qUpdateScore" datasource="eyeon2" dbtype="query">
			UPDATE tgolfer 
			SET active = <cfqueryparam cfsqltype="cf_sql_integer" value="#Val(activevalpar)#">   
			WHERE GolferID = <cfqueryparam cfsqltype="cf_sql_integer" value="#Int(Val(golferidpar))#">
		</cfquery>
		<!--- get active back--->
		<cfquery name="qGetScoreBack" datasource="eyeon2" dbtype="query">
			SELECT active
			FROM tgolfer
			WHERE GolferID = <cfqueryparam cfsqltype="cf_sql_integer" value="#Int(Val(golferidpar))#">
		</cfquery>
</cftransaction>

		<cfset active = #Val(qGetScoreBack.active)#>
		
		<cfsavecontent variable="styledReturnVal">
			<cfoutput>
				<cfif active eq 0>
					<span style="color:red; font-weight:bold;">Inactive</span>
				<cfelseif active lt 0>
					<span style="color:red; font-weight:bold;">#active#</span>
				<cfelseif active gt 0>
					<span style="color:green;  font-weight:bold;">Active!</span>
				</cfif>
			</cfoutput>
		</cfsavecontent>

<cfoutput>#styledReturnVal#</cfoutput>