<cfsilent>
		<!---
			On the server side we needed to pass back content:
		--->
		<cfquery datasource="DATASOURCE_HERE" name="getItems">
		SQL_QUERY_HERE
		</cfquery>
		<cfquery datasource="#sDSN#" name="recordsets.getHeadlines">
			SELECT ID, headline, headlinetext 
			WHERE headlines.majorid = 1
			AND selectedteams.fullsquad = 1
		</cfquery>
		
		
		<!--- make sure there are records available --->
		
		<cfif recordsets.getHeadlines.recordCount>
		 <!--- number of records you want to show --->
		 <cfset showNum = 10>
		 <!--- make sure we aren't trying to show
		  more than what's in the DB --->
		 <cfif showNum gt getItems.recordCount>
		   <cfset showNum = getItems.recordCount>
		 </cfif>
		 <!--- make a list --->
		 <cfset itemList = "">
		 <cfloop from="1" to="#recordsets.getHeadlines.recordCount#" index="i">
		   <cfset itemList = ListAppend(itemList, i)>
		 </cfloop>
		 <!--- randomize the list --->
		 <cfset randomItems = "">
		 <cfset itemCount = ListLen(itemList)>
		 <cfloop from="1" to="#itemCount#" index="i">
		   <cfset random = ListGetAt(itemList, RandRange(1, itemCount))>
		   <cfset randomItems = ListAppend(randomItems, random)>
		   <cfset itemList = ListDeleteAt(itemList, ListFind(itemList, random))>
		   <cfset itemCount = ListLen(itemList)>
		 </cfloop>
		 <!--- display stuff here --->
		 <cfloop from="1" to="#showNum#" index="i">
		   <cfoutput>#recordsets.getHeadlines.COLUMN_NAME[ListGetAt(randomItems, i)]#</cfoutput><br>
		 </cfloop>
		</cfif>
</cfsilent>