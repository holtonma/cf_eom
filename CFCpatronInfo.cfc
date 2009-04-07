
<cfcomponent name="CFCpatronInfo" displayname="CFCpatronInfo" hint="API for EoM patron info">
	<cffunction name="setNewPatron" output="true" hint="inserts records into database for new patron" 
				access="public" returntype="numeric" >
		<cfargument name="patronemail" displayName="patronemail" required="Yes" type="string" hint="patron's email"> 
		<cfargument name="fname" required="Yes" type="string" hint="user's first name"> 
		<cfargument name="lname" required="Yes" type="string" hint="user's last name"> 
		<cfargument name="entrantpassword" required="Yes" type="string" hint="user's password"> 
		<cfargument name="aviarydeals" required="Yes" type="numeric" hint="if 1, user wants Aviary deals, if 0, does not "> 
		
		<!--- first check to see that this email has not yet been entered.  If it has, throw a -1 on return --->
		<cfquery name="qCheckExists" datasource="#sDSN2#">
			SELECT entrantid 
			FROM tentrant
			WHERE emailaddy = '#ARGUMENTS.patronemail#'
		</cfquery>
		<!--- might need to change the above to UCASE --->
		
		<cfif qCheckExists.RecordCount gte 1>
			<!--- 1 or more records exist, therefore return a -1 --->
			<cfset returnvar = -1>
		<cfelse> <!--- no records exist, therefore proceed --->
			<!--- trim all strings before passing into query --->
			<cfset patronemail = #TRIM(ARGUMENTS.patronemail)#>
			<cfset patronfname = #TRIM(ARGUMENTS.fname)#>
			<cfset patronlname = #TRIM(ARGUMENTS.lname)#>
			<cfset patronpassword = #TRIM(ARGUMENTS.entrantpassword)#>
			
			<cflock timeout="30">
				<cftransaction>
					<cfquery name="qInsertNewPatron" datasource="#sDSN2#">
						INSERT INTO tentrant
						(fname, lname, emailaddy, entrantpassword, roleid, createddate, aviarydeals, addressid)
						VALUES
						(
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#patronfname#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#patronlname#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#patronemail#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#patronpassword#">,
						<cfqueryparam cfsqltype="cf_sql_tinyint" value="1">,
						#Now()#,
						<cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.aviarydeals#">,
						1
						)
					</cfquery>
					<!--- in order to confirm it was inserted, do a check on the last record entered --->
					<cfquery name="qConfirmInsert" datasource="#sDSN2#">
						SELECT lname
						FROM tentrant
						ORDER BY entrantid DESC
						LIMIT 1
					</cfquery>
					<cfif TRIM(qConfirmInsert.lname) eq patronlname>
						<!--- insert successful --->
						<cfset returnvar = 1>
					<cfelse>
						<cfset returnvar = -2>
					</cfif>
				</cftransaction>
			</cflock>
		<!--- 
		- signup inserting records to tentrant database (signup form validation)
		:: INSERT into tentrant table
		} [entrantid] -- autoINC
		} fname = FORM.
		} lname = FORM.
		} emailaddy = FORM.
		} entrantpassword = FORM.
		} roleid = 1
		} aviarydeals (if checked = 1, otherwise 0)
		} addressid = 1 
		
		what other tables to insert into?? None, the other tables are added upon choice of user 
		--->
		</cfif>
		
		<cfreturn returnvar>
	</cffunction>
	
	<cffunction name="setNewSquad" access="public" output="true" returntype="numeric" hint="inserts new squad into database">
		<cfargument name="entrantid" required="true" hint="entrantid of patron saving his/her squad" type="numeric">
		<cfargument name="groupid" required="true" hint="groupid of patron saving his/her squad" type="numeric">
		<cfargument name="aSquad" required="true" hint="array containing id's of golfers" type="Array">
		<cfargument name="eventid" required="true" hint="eventid of event adding" type="numeric">
		<!--- the basic purpose of this METHOD is to INSERT records into the db upon save of squad --->
		<!--- **** this is ONLY FOR A NEW SQUAD **** --->
		<!--- find group rules (NOTE: for now it's hard-coded as groupID = 1, but later it will accept the groupid argument)--->
		<cfquery name="qFindGroupRules" datasource="#sDSN2#">
			SELECT 
				handicapsYN, numgolfersselect, numgolferscount, cutpenalty
			FROM
				tgrouprules
			WHERE
				groupID = <cfqueryparam cfsqltype="cf_sql_integer" value="1">
		</cfquery>
		
		<cfif qFindGroupRules.RecordCount gte 1>
			<!--- a record exists for this group's rules, therefore set related values per those rules --->
			<cfset numGolfersInSquad = qFindGroupRules.numgolfersselect>
		<cfelse>
			<!--- rules don't exist, therefore use default (6 count 6, all must make cut) --->
			<cfset numGolfersInSquad = 6> <!--- default --->
		</cfif>
		
		<!--- we will assume that the array passed in was of length 6 (X), this validation per GroupRules
		will be performed on INPUT.  If there was a RULES entry for this group, it will be set above.--->
		<!--- we know the array length of golfers sent in, 'aSquad', is the number to insert --->
			<!--- turn array into a list of ID's that we will loop through --->
			<cfset lsSquadSelected = ArrayToList(ARGUMENTS.aSquad)>
		
		
				<cflock timeout="30">
					<cftransaction>
						<!--- obtain next available teamselectedid through MAX --->
						<cfquery name="qNextAvailTeamID" datasource="#sDSN2#">
							SELECT MAX(teamselectedid) as nextAvailTeamID
							FROM tteamselected
						</cfquery>
						<cfset varNextAvailTeamID = #qNextAvailTeamID# + 1> <!--- increment next avail by 1 --->
						<cfloop list="#lsSquadSelected#" index="i">
							<cfquery name="insertGolferIDintoSquad" datasource="#sDSN2#">
								INSERT INTO
									tteamselected (teamselectedid, entrantid, groupid, golferid, eventid)
								VALUES
									(
									<cfqueryparam cfsqltype="cf_sql_integer" value="#varNextAvailTeamID#">,
									<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.entrantid#">,
									<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.groupid#">,
									<cfqueryparam cfsqltype="cf_sql_integer" value="#lsSquadSelected[i]#">,
									<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.eventid#">
									)
							</cfquery>
						</cfloop>
					</cftransaction>
				</cflock>
				<!--- check to make sure than N (6) golfers --->
				<cfquery name="qCheckNumInSquad" datasource="#sDSN2#">
					SELECT COUNT(autoid) as numInSquad
					FROM tteamselected
					WHERE
						teamselectedid = <cfqueryparam cfsqltype="cf_sql_integer" value="#varNextAvailTeamID#">
						AND 
						entrantid = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.entrantid#">
						AND 
						groupid = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.groupid#">
				</cfquery>
				
				<!--- update tentrantgroup for this entrantid+groupid combination where teamselectedid is NULL--->
				<cflock timeout="20">
					<cftransaction>
						<cfquery name="qUpdateEntrantGroup" datasource="#sDSN2#">
							UPDATE
								tentrantgroup
							SET
								teamselectedid = #varNextAvailTeamID#
							WHERE
								entrantid = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.entrantid#">
								AND
								groupid = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.groupid#">
								AND
								eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.eventid#">
						</cfquery>
					</cftransaction>
				</cflock>
				
				<cfif qCheckNumInSquad.numInSquad eq numGolfersInSquad>
					<cfset returnvar = 1>
				<cfelse>
					<cfset returnvar = -1>
				</cfif>
		
		<cfreturn returnvar>
	</cffunction>
	
	<cffunction name="insertNewGroup" output="true" hint="inserts records into database for new group" access="public" returntype="numeric">
		<cfargument name="entrantid" required="true" hint="entrantid of patron creating the group" type="numeric">
		<cfargument name="groupname" required="true" hint="name of new group" type="string">
		<cfargument name="groupruleid" required="true" type="numeric" hint="ID of group rules: integer that relates to tGroupRules table">
		<cfargument name="grouppassword" required="true" type="string" hint="password of group">
		<cfargument name="eventid" required="true" type="numeric" hint="id of current event">
		
		<cflock timeout="20">
			<cftransaction>
				<!--- first check to see there is no group with that name already --->
				<cfquery name="qCheckGroupExists" datasource="#sDSN2#">
					SELECT groupid
					FROM tgroup
					WHERE groupname = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.groupname#">
				</cfquery>
				<cfif qCheckGroupExists.RecordCount gte 1>
					<cfset returnvar = -1>
				<cfelse>
					<!--- insert into tgroup table --->
					<cfquery name="qInsertIntoGroup" datasource="#sDSN2#">
						INSERT INTO tgroup
						(groupname, grouppassword, groupruleid)
						VALUES
						(
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.groupname#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.grouppassword#">,
						1
						)
					</cfquery>
					<!--- find the last group inserted --->
					<cfquery name="qFindLastGroup" datasource="#sDSN2#">
						SELECT groupid
						FROM tgroup
						WHERE groupname  = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.groupname#">
					</cfquery>
					<!--- insert into tentrantgroup table (for user who created group) --->
					<cfquery name="qInsertIntoTEG" datasource="#sDSN2#">
						INSERT INTO tentrantgroup
						(entrantid, groupid, eventid, latestteamnetscore)
						VALUES
						(
						<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.entrantid#">,
						<cfqueryparam cfsqltype="cf_sql_integer" value="#qFindLastGroup.groupid#">,
						<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.eventid#">,
						0
						)
					</cfquery>
					<!--- find the last entry inserted into tEntrantGroup --->
					<cfquery name="qFindLastGroup" datasource="#sDSN2#">
						SELECT entrantgroupuniqueid
						FROM tentrantgroup
						WHERE groupid  = <cfqueryparam cfsqltype="cf_sql_integer" value="#qFindLastGroup.groupid#">
						AND entrantid = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.entrantid#"> 
					</cfquery>
					<cfif qFindLastGroup.RecordCount eq 1>
						<cfset returnvar = 1> <!--- success! --->
					<cfelse>
						<cfset returnvar = -2> <!--- unlikely error return code --->
					</cfif>
				</cfif>
			</cftransaction>
		</cflock> <!--- lock prevents another request stomping on these requests --->
		
		<cfreturn returnvar>
	</cffunction>
	
	<cffunction name="getandsendPatronPassword" displayname="getandsendPatronPassword" output="true" hint="obtains patron's password (if it exists) and sends it to the patron, given the email address they send in.  If no password exists, returns a 0 (zero)" access="public" returntype="numeric">
		<cfargument name="patronemail" displayName="patronemail" required="Yes" type="string" hint="lookup password via patronemail"> 
		<cfparam name="userpass" default="">
		<!--- obtain the user's Group and Password --->
		<cfquery name="qGetUserPass" datasource="#sDSN2#">
			SELECT 
				entrantpassword, fname, lname
			FROM
				tentrant
			WHERE
				emailaddy = <cfqueryparam cfsqltype="cf_sql_varchar" value="#patronemail#">
		</cfquery>
		
		<cfif qGetUserPass.RecordCount gte 1>
			<!--- found the one and only! --->
			<cfset userpass = #qGetUserPass.entrantpassword#>
			<cfmail 
				from="passwordadmin@eyeonmajors.com" 
				to="#patronemail#" 
				subject="The EyeOnMajors.com information you requested"
				type="HTML" >
				
				Dear <cfoutput>#fname# #lname#</cfoutput>, your EyeOnMajors.com password is "<cfoutput>#userpass#</cfoutput>".
				<p>
				If you have any questions, email us at: eyeonmajors@gmail.com.<br/>
				<br/>
				EyeOnMajors(TM) : Dynamic, Free, and Fun Web-Based Golf Office Pool<br/>
				<i>The Most Enjoyable Golf Pool on the Planet!</i>
		
			</cfmail>
		<cfelse>
			<cfset userpass = "0">
		</cfif>
	
		<cfif userpass neq "0">
			<cfreturn 1> <!--- lookup successful --->
		<cfelse>
			<cfreturn 0> <!--- lookup failure --->
		</cfif>
	
	
	</cffunction>
	
	<cffunction name="ajaxTeamAddGolfer" output="true" returntype="string" access="public">
		<cfargument name="golferid" required="true" type="numeric">
		<cfargument name="entrantid" required="true" type="numeric">
		<cfargument name="groupid" required="true" type="numeric">
		<cfargument name="eventid" required="true"type="numeric">
		<cfargument name="teamselectedid" required="true" type="numeric">
		<!--- not sure we need all of the above args, but passing them in, just in case --->
		
		<!--- team selected information will be stored in SESSION until saved --->
		<!--- the purpose of this function is to pass back html which gets rendered each time a user selects another player for his/her squad --->
		
		<!--- each time a golfer is selected, we will grab that golfer's ID, handicap, and store it in the structure --->
		<!--- allocate SESSION.aPendingSquad to hold golfers pending a full squad --->
			<cfparam name="SESSION.aPendingSquad" default="#ArrayNew(1)#">
			<cfparam name="SESSION.newArrayElementNum" default="0">
		<!--- look up RULES for this entrantid and groupid --->
			<cfquery name="qFindRules" datasource="#sDSN2#">
				SELECT handicapsYN, numgolfersselect
				FROM tgrouprules
				WHERE groupid = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.groupid#">
			</cfquery>
			<cfif qFindRules.RecordCount eq 1> <!--- groupid found in rules --->
				<cfset thisRuleH = #qFindRules.handicapsYN#>
				<cfset thisRuleNumGolfers = #qFindRules.numgolfersselect#>
			<cfelse> <!--- groupid not found in rules, therefore use default --->
				<cfset thisRuleH = 1>
				<cfset thisRuleNumGolfers = 6>
			</cfif>
		
		<!--- if there are already N (6) golfers, then do not add golfer --->
		<!--- if handicapsYN = 0, then disregard handicaps  --->
		
		<!--- look up handicap of golfer selected --->
		<cfquery name="qFindHandicap" datasource="#sDSN2#">
			SELECT numstrokes
			FROM thandicaps
			WHERE groupid = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.groupid#">
			AND
			golferid = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.golferid#">
			AND
			eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.eventid#">
		</cfquery>
		<cfif qFindHandicap.RecordCount eq 1> <!--- found handicap --->
			<cfset thisGolferHandicap = #qFindHandicap.numstrokes#>
		<cfelse> <!--- didn't find record of handicap --->
			<cfset thisGolferHandicap = 0>
		</cfif>
		
		<!--- structure ready for CartItem to be added to array --->
		<cfset SESSION.sPendingSquad = StructNew()>
		
		<cflock scope="session"  timeout="60">
			<cfset newArrayElementNum = ArrayLen(SESSION.aPendingSquad) + 1>
			<cfset SESSION.newArrayElementNum = SESSION.newArrayElementNum + 1>
			
			<cfset SESSION.sPendingSquad.PendingID = SESSION.newArrayElementNum>
		  	<cfset SESSION.sPendingSquad.GolferID = ARGUMENTS.golferid>
		  	<cfset SESSION.sPendingSquad.HandicapVal = ARGUMENTS.LocationStateID> <!--- this is so we can add handicaps on the fly, rather than looking them up each day --->
		</cflock>
	</cffunction>
</cfcomponent>