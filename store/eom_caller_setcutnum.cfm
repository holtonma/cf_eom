<!--- 	var pars = 'FORM.golferid=' + golferID + '&FORM.activeval=' + ActiveVal;
								
				var resultDomElem = updatedDOMelem
				new Ajax.Updater(resultDomElem, 'eom_caller_golferactive.cfm', 
				{ --->
<cfset cutnumpar = FORM.cutnum>


<cftransaction>
	    <cfquery name="qUpdateCutNum" datasource="#sDSN2#" dbtype="query">
			UPDATE tgolfer
			SET madecut = 0
			WHERE CurrentScoreRelPar > <cfqueryparam cfsqltype="cf_sql_integer" value="#cutnumpar#"> 
		</cfquery>
		
		<cfquery name="qGolfersThatMissedCut" datasource="#sDSN2#">
			SELECT GolferID
			FROM tgolfer
			WHERE CurrentScoreRelPar > <cfqueryparam cfsqltype="cf_sql_integer" value="#cutnumpar#">
		</cfquery>
		<cfset golfermissedcutlist = "">
		<!--- loop thru rs to obtain list --->
		<cfoutput query="qGolfersThatMissedCut">
			<cfset golfermissedcutlist = #ListAppend(golfermissedcutlist, qGolfersThatMissedCut.GolferID)#>   
		</cfoutput>
		<!--- obtain all ids of tentrantgroup.entrantid that have at least one golfer who missed the cut --->
		<cfoutput>
		<cfquery name="qEntrantsWhoMissedCut" datasource="#sDSN2#">
			SELECT DISTINCT entrantid
			FROM tteamselected
			WHERE eventid = #SESSION.eventid#
			AND golferid IN(#golfermissedcutlist#)
			ORDER BY entrantid ASC
		</cfquery>
		</cfoutput>
		<!--- loop thru rs to obtain list --->
		<cfset entrantMClist = "">
		<cfoutput query="qEntrantsWhoMissedCut">
			<cfset entrantMClist = #ListAppend(entrantMClist, qEntrantsWhoMissedCut.EntrantID)#>   
		</cfoutput>
		<cfoutput>
		<cfquery datasource="#sDSN2#" name="qUpdateMadeCutField" >
			UPDATE tentrantgroup
			SET madecut = 0
			WHERE entrantid IN(#entrantMClist#)
			AND eventid = #SESSION.eventid#
		</cfquery> 
		</cfoutput>


		<!--- get active back--->
		<cfquery name="qNumActiveGolfersMadeCut" datasource="eyeon2" dbtype="query">
			SELECT count(golferid) as nummadecut
			FROM tgolfer
			WHERE madecut = 1
			AND active = 1
		</cfquery>
</cftransaction>

		<cfset result = #Val(qNumActiveGolfersMadeCut.nummadecut)#>
		
		<cfsavecontent variable="styledReturnVal">
			<cfoutput>
				<span style="color:green; font-weight:bold;">#result# golfers made the cut at #cutnumpar# or lower.</span>
			</cfoutput>
		</cfsavecontent>

<cfoutput>#styledReturnVal#</cfoutput>