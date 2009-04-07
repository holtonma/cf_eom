<link rel="STYLESHEET" type="text/css" href="styles.css">
<!--- <cfobject name="testEoMajax" component="eyeonmaj.components.eomajax" > --->
<!--- eyeonmaj.htdocs. --->
<!--- vservers/eyeonmaj/htdocs/store/testeomajaxcomponent.cfm --->
<!--- <cfobject name="oDropdowndata" component="iPPDT.components.dropdowndataCFC"> --->

<!---
<cfset friendemail = "bigwallh@gmail.com">
<cfquery name="qGetFriendGroup" datasource="eyeonmajors" dbtype="query">
	SELECT PoolGroupName
	FROM poolgroup PG, poolperson PP
	WHERE 
		PG.PoolGroupID = PP.GroupID
		AND
		PP.EmailAddy = #friendemail#
</cfquery>
<cfset result = qGetFriendGroup.PoolGroupName>
--->
 
		<cfquery name="qGetLegacyGolferData" datasource="eyeonmajors" dbtype="query">
			SELECT *
			FROM golfer
		</cfquery>
		<!--- 
		<cfoutput query="qGetLegacyGolferData" startrow="1">
			<cfquery dbname="eyeon2" dbtype="query">
				INSERT INTO 
					tGolfer 
					(GolferID, GolferFirstName, GolferLastName, CurrentScoreRelPar, DegsOfWally, GolferImage, Active)
				VALUES 
					(#qGetLegacyGolferData.GolferID#, 
					'#qGetLegacyGolferData.GolferFirstName#', 
					'#qGetLegacyGolferData.GolferLastName#', 
					#qGetLegacyGolferData.CurrentScoreRelPar#, 
					#qGetLegacyGolferData.DegsofWallyVal#, 
					'#qGetLegacyGolferData.GolferImage#',
					 #qGetLegacyGolferData.Active#) 
			</cfquery>
		</cfoutput>
		--->
		
	
	
<table class="white" cellpadding="10">
	<tr>
		<td><cfdump var="#qGetLegacyGolferData#" label="method: getFriendGroupCF"> 
		</td>
	</tr>
</table>