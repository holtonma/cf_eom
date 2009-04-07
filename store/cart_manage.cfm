


<!--- selecting golfers for team :: add to team, if already selected, don't add --->
<cfif IsDefined('FORM.add_button.y')>
	<cfset bMatching = false />  <!--- false means ready to add: --->
		<!--- do not add to cart if more than 6 --->
		<cfif ArrayLen(SESSION.cart) GTE 6>
			<cfset bMatching = true />
		</cfif>
		<!--- do not add to cart if golfer already exists --->
		<cfloop from="1" to="#ArrayLen(SESSION.cart)#" index="i">
			<!--- this looops through the cart to first check and see if this item has already been selected --->
			<cfif SESSION.cart[i].golfer_id EQ FORM.golfer_ID>  <!--- don't add to cart if you've already selected player--->
				<cfset bMatching = true />
			</cfif>
		</cfloop>
	<!---  this case adds to SESSION.cart --->	
	<cfif NOT bMatching> 
		<!--- only add to cart if it's false (meaning golfer doesn't already exist, and team doesn't have more than 6 players) --->
		<cfset stPlayer = StructNew() />
		<cfset stPlayer.golfer_id = FORM.golfer_id />
		<cfset stPlayer.Last_Name = FORM.Last_Name />
		<cfset stPlayer.First_Name = FORM.First_Name />
		<cfset stPlayer.GolferImage = FORM.GolferImage />
		<cfset stPlayer.Handicap = FORM.Handicap />
		<cfset ArrayAppend(SESSION.cart, stPlayer) />
	</cfif>
	<cflocation url="select.cfm" />
	
<cfelseif IsDefined('FORM.delete_button.y')>
		<!--- listlen is of items that are checked only --->
		Patrons, We are undergoing maintenance on this feature, please accept our apologies as we remedy this in the next 40 minutes.
		-Mark Holton
		</br>Line 33: cart_manage.cfm: </br>
		<cfdump var="#FORM.delete_index#"></br>
		
		<!--- <cfabort> --->
		<cfloop from="#ListLen(FORM.delete_index)#" to="1" index="i" step="-1">
			<!--- reverse order, so indices match ... 6 to 1, by -1 : 6, 5, 4, 3, 2, 1 --->
					<!--- also delete from database --->
					<!--- line 39: cart_manage.cfm: SESSION.cart[i].golfer_id: <cfoutput>#SESSION.cart[i].golfer_id#</cfoutput>
					listgetat 1(4): <cfdump var="#ListGetAt(FORM.delete_index, 1)#"> </br>
					listgetat 2(6): <cfdump var="#ListGetAt(FORM.delete_index, 2)#"> </br>
					SESSION.cart[i].golfer_id: <cfdump var="#SESSION.cart[i].golfer_id#"></br>
					<cfset numArrayIndInCart = #ListGetAt(FORM.delete_index, 1)#>
					<cfset numArrayIndInCart2 = #ListGetAt(FORM.delete_index, 2)#>:::
					SESSION.cart[ListGetAt(FORM.delete_index, 1)].golfer_id: <cfdump var="#SESSION.cart[numArrayIndInCart].golfer_id#"></br>
					SESSION.cart[ListGetAt(FORM.delete_index, 2)].golfer_id: <cfdump var="#SESSION.cart[numArrayIndInCart2].golfer_id#"></br>
					 --->
					<cfset numArrayIndexInCart = #ListGetAt(FORM.delete_index, i)#>
					<!--- <cfabort> --->
					<cfquery name="qDelFromTeam" datasource="#sDSN2#">
						DELETE 
						FROM tteamselected
						WHERE
							golferid = #SESSION.cart[numArrayIndexInCart].golfer_id#
							AND
							entrantid = #SESSION.entrantid#
							AND
							groupid = #SESSION.patrongroupid#
							AND
							eventid = #SESSION.eventid#
					</cfquery>
					<!--- the following line deletes the entry in SESSION.cart at the next delete check box --->
					<cfset ArrayDeleteAt(SESSION.cart, ListGetAt(FORM.delete_index, i)) />
					
					<!--- use ListGetAt(FORM.delete_index, i) to locate "stPlayer.golfer_id" and use this to delete from database --->
					<!--- cfset tempgolferIDtodelete = #Session.cart[ListGetAt(FORM.delete_index, i)].golfer_id#  --->
		</cfloop>
	<cflocation url="select.cfm" />


<cfelseif IsDefined('FORM.checkout_button.y')>
	<cfif ArrayLen(SESSION.cart) EQ 6>
		<cflocation url="checkout.cfm" />
	<cfelse>
		<br>
	</cfif>

<cfelse>
		
</cfif>