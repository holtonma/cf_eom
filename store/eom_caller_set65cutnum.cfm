
<cfset cutnumpar = Val(FORM.cutnum)>

<cftransaction>		
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
		<cfquery name="qEntrantsWhoMayHaveMissed65Cut" datasource="#sDSN2#">
			SELECT DISTINCT entrantid
			FROM tteamselected
			WHERE eventid = #SESSION.eventid#
			AND golferid IN(#golfermissedcutlist#)
			ORDER BY entrantid ASC
		</cfquery>
		</cfoutput>
		
		<cfset teams_missed_cut = 0> <!--- counter --->
		<cfoutput query="qEntrantsWhoMayHaveMissed65Cut">
			<cfquery datasource="#sDSN2#" name="qCountMCs">
			  select count(tTS.entrantid) as MC
				FROM tteamselected tTS LEFT OUTER JOIN tgolfer tG ON tTS.golferID = tG.golferID
				LEFT OUTER JOIN tentrantgroup tEG ON tEG.teamselectedid = tTS.teamselectedid
				WHERE tEG.entrantid = #qEntrantsWhoMayHaveMissed65Cut.entrantid# 
				AND tEG.eventid = #SESSION.eventid# 
				AND tG.madecut = 0
			</cfquery>
			<cfset mc_for_this_team = qCountMCs.MC>
			<!--- if 2 more more missed the cut, set 65madecut = 0--->
			<cfif mc_for_this_team gte 2>
				<cfquery datasource="#sDSN2#" name="qUpdateMadeCutField" >
					UPDATE tentrantgroup
					SET 65madecut = 0
					WHERE entrantid = #qEntrantsWhoMayHaveMissed65Cut.entrantid# 
					AND eventid = #SESSION.eventid#
				</cfquery>
				<cfset teams_missed_cut = teams_missed_cut + 1>
			</cfif>
		</cfoutput>
	
</cftransaction>


		<cfsavecontent variable="styledReturnVal">
			<cfoutput>
				<span style="color:green; font-weight:bold;">updated all tEntrantGroups who successfully made/missed the 6-count-5 cut (#teams_missed_cut# teams missed the cut in 6-count-5 format)</span>
			</cfoutput>
		</cfsavecontent>

<cfoutput>#styledReturnVal#</cfoutput>