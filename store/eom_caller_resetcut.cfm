<!--- 	var pars = 'FORM.golferid=' + golferID + '&FORM.activeval=' + ActiveVal;
								
				var resultDomElem = updatedDOMelem
				new Ajax.Updater(resultDomElem, 'eom_caller_golferactive.cfm', 
				{ --->


<cftransaction>
	    <cfquery name="qResetCut" datasource="#sDSN2#" dbtype="query">
			UPDATE tgolfer
			SET madecut = 1
			WHERE active = 1
		</cfquery>
		
		<!--- get active back--->
		<cfquery name="qNumActiveGolfersMadeCut" datasource="eyeon2" dbtype="query">
			SELECT count(golferid) as nummadecut
			FROM tgolfer
			WHERE madecut = 1
			AND active = 1
		</cfquery>
		<cfquery datasource="#sDSN2#" name="qUpdateMadeCutField" >
			UPDATE tentrantgroup
			SET madecut = 1
			WHERE eventid = #SESSION.eventid#
		</cfquery> 
</cftransaction>

		<cfset result = #Val(qNumActiveGolfersMadeCut.nummadecut)#>
		
		<cfsavecontent variable="styledReturnVal">
			<cfoutput>
				<span style="color:green; font-weight:bold;">You have reset it so that all active golfers (#result#) are shown to make the cut.  Set cutline and click link to set cut.</span>
			</cfoutput>
		</cfsavecontent>

<cfoutput>#styledReturnVal#</cfoutput>