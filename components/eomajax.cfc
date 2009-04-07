
<cfcomponent displayname="eomajax" extends="ajax">
	
	<cffunction name="updateGolferScore" access="public" output="true" returntype="numeric"> <!--- returntype="numeric" --->
		<cfargument name="golfer_id" required="Yes" type="string">
		<cfargument name="golfer_score" required="Yes" type="string">
		
		<cftransaction>
		    <cfquery name="qUpdateScore" datasource="eyeon2" dbtype="query">
				UPDATE tgolfer 
				SET currentscorerelpar = <cfqueryparam cfsqltype="cf_sql_integer" value="#Val(golfer_score)#">   
				WHERE GolferID = <cfqueryparam cfsqltype="cf_sql_integer" value="#Int(Val(golfer_id))#">
			</cfquery>
			<!--- get score back--->
			<cfquery name="qGetScoreBack" datasource="eyeon2" dbtype="query">
				SELECT currentscorerelpar
				FROM tgolferWHERE GolferID = <cfqueryparam cfsqltype="cf_sql_integer" value="#Int(Val(golfer_id))#">
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
		
		<cfreturn styledReturnVal/>
	</cffunction>
	
	<cffunction name="getGolferScoreCF" access="public" output="true" returntype="string"> <!--- returntype="numeric" --->
		<cfargument name="golfer_id" required="Yes" type="string">
		<cfquery name="updateScore" datasource="eyeonmajors" dbtype="query">
			SELECT currentscorerelpar
			FROM golfer
			WHERE golferid = <cfqueryparam cfsqltype="cf_sql_integer" value="#Int(Val(golfer_id))#">
		</cfquery>
		<cfset updatedscoreresult = updateScore.currentscorerelpar>
		<cfreturn result/>
	</cffunction>
	
	<cffunction name="getFriendGroupCF" access="public" output="true" returntype="string"> 
		<cfargument name="friendemail" required="Yes" type="string">
		<cfoutput>
		<cfquery name="qGetFriendGroup" datasource="eyeonmajors" dbtype="query">
			SELECT PoolGroupName
			FROM poolgroup PG, poolperson PP
			WHERE 
				PG.PoolGroupID = PP.GroupID
				AND
				PP.EmailAddy = <cfqueryparam cfsqltype="cf_sql_varchar" value="#friendemail#">
		</cfquery>
		</cfoutput>
		<cfset result = qGetFriendGroup.PoolGroupName>
		<cfreturn result/>
	</cffunction>
	
	<!--- updates new db with old data --->
	<cffunction name="updateNewGolferTablewithOld" access="public" output="true" returntype="string"> 
		<cfquery name="qGetLegacyGolferData" datasource="eyeonmajors" dbtype="query">
			SELECT *
			FROM golfer
		</cfquery>
		<cfoutput query="qGetLegacyGolferData">
			<cfquery name="qInsertIntoNew" datasource="eyeon2" dbtype="query">
				INSERT INTO tGolfer (GolferID, GolferFirstName, GolferLastName, CurrentScoreRelPar, GolferMemo, DegsOfWally, GolferImage, Active)
				VALUES (#GolferID#, #GolferFirstName#, #GolferLastName#, #CurrentScoreRelPar#, #GolferMemo#, #DegsofWallyVal#, #GolferImage#, #Active#) 
			</cfquery>
		</cfoutput>
	</cffunction>
	
	<cffunction name="updateEyeItStory" access="public" output="true" returntype="string"> 
		<cfargument name="storyid" required="Yes" type="numeric">
		<cfargument name="userid" required="Yes" type="numeric">
		
		<cfoutput>
			<cfquery name="qGetNumEyesForStory" datasource="eyeon2" dbtype="query">
				SELECT numeyes FROM tStory 
				WHERE storyid = <cfqueryparam cfsqltype="cf_sql_integer" value="#storyid#">
			</cfquery>
			<cfset newnumeyes = #qGetNumEyesForStory.numeyes# + 1>
			<cfquery name="qUpdateEyeIt" datasource="eyeon2" dbtype="query">
				Update tStory
				SET numeyes = <cfqueryparam cfsqltype="cf_sql_integer" value="#newnumeyes#">
				WHERE storyid = <cfqueryparam cfsqltype="cf_sql_integer" value="#storyid#">
			</cfquery>
		</cfoutput>
		
		<cfset strNewNumeyes = ToString(newnumeyes)>
		<cfreturn #strNewNumeyes#/>
	</cffunction>

</cfcomponent>