
<cfset golferscorepar = FORM.scorerelpar>
<cfset golferidpar = FORM.golferid>
<!--- root is: /vservers/eyeonmaj/htdocs --->
<!--- <cfobject name="oUpdateScore" component="vservers.eyeonmaj.htdocs.components.eomajax">
<cfset result = #oUpdateScore.updateGolferScore(golferidpar, golferscorepar)#> --->

<cfset timeofupdate = #CreateODBCDateTime(Now())#>
<cftransaction>
	    <cfquery name="qUpdateScore" datasource="#sDSN2#" dbtype="query">
			UPDATE tgolfer 
			SET currentscorerelpar = <cfqueryparam cfsqltype="cf_sql_integer" value="#Val(golferscorepar)#">   
			WHERE GolferID = <cfqueryparam cfsqltype="cf_sql_integer" value="#Int(Val(golferidpar))#">
		</cfquery>
		<!--- get score back--->
		<cfquery name="qGetScoreBack" datasource="#sDSN2#" dbtype="query">
			SELECT currentscorerelpar
			FROM tgolfer
			WHERE GolferID = <cfqueryparam cfsqltype="cf_sql_integer" value="#Int(Val(golferidpar))#">
		</cfquery>
		<cfquery name="qUpdateTime" datasource="#sDSN2#">
			UPDATE tevents
			SET DateTimeLastUpdated = #timeofupdate#
			WHERE eventid = #SESSION.eventid#
		</cfquery>
</cftransaction>

		<cfset golferscore = #Val(qGetScoreBack.currentscorerelpar)#>
		
		<cfsavecontent variable="styledReturnVal">
			<cfoutput>
				<cfif golferscore eq 0>
					<span style="color:green; font-weight:bold;">#golferscore#</span>
				<cfelseif golferscore lt 0>
					<span style="color:red; font-weight:bold;">#golferscore#</span>
				<cfelseif golferscore gt 0>
					<span style="color:black;  font-weight:bold;">#golferscore#</span>
				</cfif>
			</cfoutput>
		</cfsavecontent>

<cfoutput>#styledReturnVal#</cfoutput>