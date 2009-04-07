<a href="/store/admin_post_data.cfm">LINK to admin page</a><cfset nettotalscore = 0 />


<!--- obtains cutline from datbase --->
<cfquery datasource="#sDSN#" name="qEntrantGroupV1">
SELECT 
	EntrantID, GroupID
FROM poolperson
WHERE GroupID > 0
</cfquery>



<cfoutput query="qEntrantGroupV1">
	<cflock timeout="200">
		<cftransaction>
		<cfquery datasource="#sDSN2#" name="qCheckIfExists">
			SELECT entrantid
			FROM tentrantgroup tEG
			WHERE tEG.entrantid = #qEntrantGroupV1.EntrantID#
			AND tEG.groupid = #qEntrantGroupV1.GroupID#
		</cfquery>
		<cfif qCheckIfExists.RecordCount eq 0> <!--- no record exists, so INSERT --->
			<cfquery datasource="#sDSN2#" name="qMigrateIntoTEG">
				INSERT INTO
				tentrantgroup (entrantid, groupid, teamselectedid, finaltiebreakerscore, eventid, latestteamnetscore)
				VALUES
					(#qEntrantGroupV1.EntrantID#, #qEntrantGroupV1.GroupID#, -1, 0, 9, 0)
			</cfquery>
		</cfif>
		</cftransaction>
	</cflock>
</cfoutput>

<!--- <cfdump var="#qEntrantGroupV1#"> --->


  