
<cfquery datasource="#sDSN2#" name="qGetPatronTiebreaker">
	SELECT
		finaltiebreakerscore as tiebreaker
	FROM
		tentrantgroup tEG
	WHERE 
		tEG.entrantid = #SESSION.entrantid#
		AND
		tEG.groupid = #SESSION.patrongroupid#
		AND
		tEG.eventid = #SESSION.eventid#
</cfquery>


<cfinclude template="eom_header_global.cfm">
<body id="bCheckout">
<cfinclude template="eom_tabs.cfm">
	
<div id="mycheckout" align="center">
  <div class="section_head">Saving Your EyeOnMajors.com Squad</div>
	<cfinclude template="existing_squad_confirm.cfm" />
  <div>

<cfif IsDefined('FORM.confirm_button.y')>
	<cfif ArrayLen(SESSION.cart) EQ 6>
		<cfset sSelectedTeamID = CreateUUID() />
		<cfset sPoolGroupID = 1 />
		<cfset g1ID = #Session.cart[1].golfer_id# />
		<cfset g2ID = #Session.cart[2].golfer_id# />
		<cfset g3ID = #Session.cart[3].golfer_id# />
		<cfset g4ID = #Session.cart[4].golfer_id# />
		<cfset g5ID = #Session.cart[5].golfer_id# />
		<cfset g6ID = #Session.cart[6].golfer_id# />
		<cflock timeout="20">
			<cftransaction >
			<cfquery datasource="#sDSN2#" name="qDELETEteam">
				DELETE
				FROM tteamselected
				WHERE 
					entrantid = #SESSION.entrantid#
				AND
					groupid = #SESSION.patrongroupid#
				AND
					eventid = #SESSION.eventid#
			</cfquery>
			<cfquery datasource="#sDSN2#" name="qNextAvailTeamSelID">
				SELECT MAX(teamselectedid) as MaxTSID
				FROM tteamselected
			</cfquery>
			<cfset AvailID = qNextAvailTeamSelID.MaxTSID + 1>
			</cftransaction>
		</cflock>
		
			<cfloop from="1" to="6" step="1" index="i">
				<cflock timeout="20">
					<cftransaction>
					<!--- get next available team selected id, and insert this into tEntrantGroup and tTeamSelected --->
					
					<cfquery datasource="#sDSN2#" name="qInsertTeam">
						INSERT INTO
							tteamselected(teamselectedid, entrantid, groupid, golferid, eventid)
						VALUES
							(
							#AvailID#,
							#SESSION.entrantid#,
							#SESSION.patrongroupid#,
							#SESSION.cart[i].golfer_id#,
							#SESSION.eventid#
							)
					</cfquery>
					</cftransaction>
				</cflock>
			</cfloop>
			<cflock timeout="20">
				<cftransaction>
					<cfquery datasource="#sDSN2#">
						UPDATE
							tentrantgroup tEG
						SET
							finaltiebreakerscore = #Val(FORM.tiebreaker)#,
							teamselectedid = #AvailID#
						WHERE 
							tEG.entrantid = #SESSION.entrantid#
							AND
							tEG.groupid = #SESSION.patrongroupid#
							AND
							tEG.eventid = #SESSION.eventid#
					</cfquery>
				</cftransaction>
			</cflock>
			<div style="color:green;font-size:12px;font-weight:bold;" align="center">
				Your team has been successfully saved.  You can modify your team as many times as you want prior to the tournament's
				start.  Good luck!  
			</div>
	<cfelse>
		<br>
		NOTE: You have only selected <cfoutput>#ArrayLen(SESSION.cart)# players</cfoutput>.  <br>
		Click your browser's BACK button to review and/or modify your Eye on Majors team and select 6 players.
	</cfif>
	<cfset ArrayClear(SESSION.cart) />
<cfelse>
	<cfif ArrayLen(SESSION.cart) EQ 6>
		<cfoutput>
			<div style="text-align:left;color:gray;font-size:12px;padding-bottom:10px;" align="left">
			  After entering a tiebreaker score (score of the winning golfer without handicaps), confirm and SAVE your 
			  selections by pressing the "SAVE TEAM" button.  If you would like to modify your selections, click on your 
			  browser's BACK button and modify.
			</div>
				<!--- self-posting form --->
				<form action="#CGI.SCRIPT_NAME#" method="POST">		
				<table width="100%">
					<tr>
						<td align="right">Winning Individual Golfer Prediction (tiebreaker) >></td>
						<td align="left">
							<input type="text" name="tiebreaker" class="field" width="3" size="3" style="font-size:16px;" 
							value="#qGetPatronTiebreaker.tiebreaker#" align="middle" />
						</td>
						<td align="left">(numbers only. Examples: &quot;-12&quot;, &quot;0&quot;, &quot;4&quot;) </td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<input type="image" name="confirm_button" src="../images/checkout.gif" /> 
							<!--- <button name="confirm_button" id="confirm_button" style="padding:10px;font-weight:bold;font-size:16px;">SAVE TEAM</button> --->
						</td>
					</tr>
				</table>
				</form>
		</cfoutput>
	<cfelse>
		NOTE: You have only selected <cfoutput>#ArrayLen(SESSION.cart)# players</cfoutput>.  <br>
		Click your browser's BACK button to review and/or modify your Eye on Majors team and select 6 players.
	</cfif>
</cfif>

</div>
<!---
debugging because of server error: 04/01/06: session.cart:<br />
<cfoutput>cart qnty: #ArrayLen(SESSION.cart)#</cfoutput>
<cfloop from="1" to="#ArrayLen(SESSION.cart)#" index="i">
	<cfoutput>#Session.cart[i].golfer_id#</cfoutput>
</cfloop>
PatronID::<cfoutput>#SESSION.patronID#</cfoutput>
PatronGroupID::<cfoutput>#SESSION.patrongroupID#</cfoutput>
--->
<div style="clear:both;padding-top:35px;" align="center"><cfinclude template="footer.cfm" /></div>
</div>
</body>

</html>