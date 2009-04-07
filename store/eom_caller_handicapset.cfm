<!--- 	var pars = 'FORM.golferid=' + golferID + '&FORM.activeval=' + ActiveVal;
								
				var resultDomElem = updatedDOMelem
				new Ajax.Updater(resultDomElem, 'eom_caller_golferactive.cfm', 
				{ --->
<cfset handicapvalpar = FORM.handicapval>
<cfset golferidpar = FORM.golferid>
<!--- root is: /vservers/eyeonmaj/htdocs --->
<!--- <cfobject name="oUpdateScore" component="vservers.eyeonmaj.htdocs.components.eomajax">
<cfset result = #oUpdateScore.updateGolferScore(golferidpar, golferscorepar)#> --->

<!--- 
			UPDATE tgolfer 
			SET active = <cfqueryparam cfsqltype="cf_sql_integer" value="#Val(activevalpar)#">   
			WHERE GolferID = <cfqueryparam cfsqltype="cf_sql_integer" value="#Int(Val(golferidpar))#"> --->

<cftransaction>
	    <cfquery name="qCheckForHandicap" datasource="#sDSN2#" dbtype="query">
			SELECT handicapid, numstrokes
			FROM thandicaps
			WHERE golferid = <cfqueryparam cfsqltype="cf_sql_integer" value="#Int(Val(golferidpar))#">
			AND eventid = #SESSION.eventid#	
		</cfquery>
		<cfif qCheckForHandicap.RecordCount gte 1> <!--- UPDATE --->
			<cfquery name="qUpdateHandicap" datasource="#sDSN2#">
				UPDATE thandicaps
				SET numstrokes = <cfqueryparam cfsqltype="cf_sql_integer" value="#Int(Val(handicapvalpar))#">
				WHERE golferid = <cfqueryparam cfsqltype="cf_sql_integer" value="#Int(Val(golferidpar))#">
				AND eventid = #SESSION.eventid#
			</cfquery>
		<cfelse> <!--- INSERT --->
			<cfquery name="qInsertHandicap" datasource="#sDSN2#">
				INSERT INTO thandicaps(groupid, golferid, numstrokes, eventid)
				VALUES
					(
					1,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#Int(Val(golferidpar))#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#Int(Val(handicapvalpar))#">,
					#SESSION.eventid#
					) 
			</cfquery>
		</cfif>
		<!--- get active back--->
		<cfquery name="qGetHandicapBack" datasource="eyeon2" dbtype="query">
			SELECT numstrokes
			FROM thandicaps
			WHERE golferid = <cfqueryparam cfsqltype="cf_sql_integer" value="#Int(Val(golferidpar))#">
			AND groupid = 1
			AND eventid = #SESSION.eventid#
		</cfquery>
</cftransaction>

		<cfset result = #Val(qGetHandicapBack.numstrokes)#>
		
		<cfsavecontent variable="styledReturnVal">
			<cfoutput>
				<cfif result eq 0>
					<span style="color:green; font-weight:bold;">#result#</span>
				<cfelseif result lt 0>
					<span style="color:red; font-weight:bold;">#result#</span>
				<cfelseif result gt 0>
					<span style="color:black;  font-weight:bold;">#result#</span>
				</cfif>
			</cfoutput>
		</cfsavecontent>

<cfoutput>#styledReturnVal#</cfoutput>