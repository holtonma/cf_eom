
<cfif NOT IsDefined('SESSION.cart')>
	<cfset SESSION.cart = ArrayNew(1) />
</cfif>
					<!--- version 1 ---><!-- load existing team -->
					<!--- <cfquery datasource="#sDSN#" name="qExistingSquad">
						SELECT *
						FROM selectedteams
						WHERE selectedteams.PoolGroupID = #SESSION.patronGroupID#
						AND selectedteams.poolpersonID = #SESSION.patronID#
					</cfquery> --->
					<cfquery datasource="#sDSN2#" name="qExistingSquad">
						SELECT teamselectedid, entrantid, groupid, golferid, eventid
						FROM tteamselected tTS
						WHERE tTS.entrantid = #SESSION.entrantid#
						AND tTS.groupid = #SESSION.patrongroupid#
						AND tTS.eventid = #SESSION.eventid#
					</cfquery>
					
					<cfset nTotal = 0 />
					<cfset bMatching = false />
					<!--- line 22 index_future.cfm:</br>
					<cfdump var="#qExistingSquad#"> --->
					
					<!--- v2: loop thru recordset of 0 thru 6 (N) golfers, and CART ...and check for matches --->
						<!--- <cfloop query="qExistingSquad" startrow="1" endrow="#qExistingSquad.RecordCount#" index="i"> --->
						<cfset i = 0>
							<cfoutput query="qExistingSquad">
								<cfset i = i + 1>
								<cfset bMatching = false> <!--- initialize each iteration of the loop --->
								<!--- line 26 index_future: counter, i: #i#</br> --->
								<cfset stPlayer = StructNew() />
								<cfset stPlayer.golfer_id = #qExistingSquad.golferid# />
								<!-- look up golfer in the database to obtain his: last name, first name, and image -->
									<cfquery datasource="#sDSN2#" name="qGolferNamesAndImage">
										SELECT GolferID, GolferFirstName, GolferLastName, GolferImage
										FROM tgolfer
										WHERE tgolfer.GolferID = #qExistingSquad.golferid#
									</cfquery>
									<!--- line: 39, index_future: ArrayLen(SESSION.cart) GTE 6?  <cfdump var="#ArrayLen(SESSION.cart) GTE 6#"></br> --->
									<cfif ArrayLen(SESSION.cart) GTE 6>
										<!--- line 40: size of cart: #ArrayLen(SESSION.cart)#
										</br>line 41: bMatching set to true --->
										<cfset bMatching = true />
										<!--- do not add to SESSION.cart --->
									</cfif>
									<!--- this will loop through as many records as there are in the recordset --->
									<cfloop from="1" to="#ArrayLen(SESSION.cart)#" index="i">
										<!--- this loops through the cart to first check and see if this item has already been selected --->
										<cfif SESSION.cart[i].golfer_id EQ #qExistingSquad.golferid#>  <!--- don't add to cart if you've already selected player--->
											<cfset bMatching = true />
											<!--- line 45 index_future: #bMatching# --->
										</cfif>
									</cfloop>
									<!--- </br>NOT bMatching: <cfdump var="#NOT bMatching#"> --->
									<cfif NOT bMatching> <!---only add to cart if variable 'bMatching' is false --->
										<cfset stPlayer = StructNew() />
										<cfset stPlayer.golfer_id = qGolferNamesAndImage.GolferID />
										<cfset stPlayer.Last_Name = qGolferNamesAndImage.GolferLastName />
										<cfset stPlayer.First_Name = qGolferNamesAndImage.GolferFirstName />
										<cfset stPlayer.GolferImage = qGolferNamesAndImage.GolferImage />
										<!--- </br>line 55 index_future: <cfdump var="#stPlayer#"> --->
										<cfset ArrayAppend(SESSION.cart, stPlayer) />
									</cfif>
							</cfoutput>
						
					
					
					<!--- <cfif #qExistingSquad.Golfer1ID# LT 1>
						<cfset nTotal = nTotal>
					<cfelse>
						<cfset stPlayer = StructNew() />
						<cfset stPlayer.golfer_id = #qExistingSquad.Golfer1ID# />
						<!-- look up golfer in the database to obtain his: last name, first name, and image -->
							<cfquery datasource="#sDSN#" name="qGolferNamesAndImage">
								SELECT GolferID, GolferFirstName, GolferLastName, GolferImage
								FROM golfer
								WHERE golfer.GolferID = #qExistingSquad.Golfer1ID#
							</cfquery>
						<cfif ArrayLen(SESSION.cart) GTE 6>
							<cfset bMatching = true />
						</cfif>
						<cfloop from="1" to="#ArrayLen(SESSION.cart)#" index="i">
							<!-- this loops through the cart to first check and see if this item has already been selected -->
							<cfif SESSION.cart[i].golfer_id EQ #qExistingSquad.Golfer1ID#>  <!-- don't add to cart if you've already selected player-->
								<cfset bMatching = true />
							</cfif>
						</cfloop>
						<cfif NOT bMatching> <!--only add to cart if it's false -->
							<cfset stPlayer = StructNew() />
							<cfset stPlayer.golfer_id = qGolferNamesAndImage.GolferID />
							<cfset stPlayer.Last_Name = qGolferNamesAndImage.GolferLastName />
							<cfset stPlayer.First_Name = qGolferNamesAndImage.GolferFirstName />
							<cfset stPlayer.GolferImage = qGolferNamesAndImage.GolferImage />
							<cfset ArrayAppend(SESSION.cart, stPlayer) />
						</cfif>
					</cfif>
					
					<cfif #qExistingSquad.Golfer2ID# LT 1>
						<cfset nTotal = nTotal>
					<cfelse>
						<cfset stPlayer = StructNew() />
						<cfset stPlayer.golfer_id = #qExistingSquad.Golfer2ID# />
						<!-- look up golfer in the database to obtain his: last name, first name, and image -->
							<cfquery datasource="#sDSN#" name="qGolferNamesAndImage">
							SELECT GolferID, GolferFirstName, GolferLastName, GolferImage
							FROM golfer
							WHERE golfer.GolferID = #qExistingSquad.Golfer2ID#
							</cfquery>
						<cfif ArrayLen(SESSION.cart) GTE 6>
							<cfset bMatching = true />
						</cfif>
						<cfloop from="1" to="#ArrayLen(SESSION.cart)#" index="i">
							<!-- this looops through the cart to first check and see if this item has already been selected -->
							<cfif SESSION.cart[i].golfer_id EQ #qExistingSquad.Golfer2ID#>  <!-- don't add to cart if you've already selected player-->
								<cfset bMatching = true />
							</cfif>
						</cfloop>
						<cfif NOT bMatching> <!--only add to cart if it's false -->
							<cfset stPlayer = StructNew() />
							<cfset stPlayer.golfer_id = qGolferNamesAndImage.GolferID />
							<cfset stPlayer.Last_Name = qGolferNamesAndImage.GolferLastName />
							<cfset stPlayer.First_Name = qGolferNamesAndImage.GolferFirstName />
							<cfset stPlayer.GolferImage = qGolferNamesAndImage.GolferImage />
							<cfset ArrayAppend(SESSION.cart, stPlayer) />
						</cfif>
					</cfif>
					<cfif #qExistingSquad.Golfer3ID# LT 1>
						<cfset nTotal = nTotal>
					<cfelse>
						<cfset stPlayer = StructNew() />
						<cfset stPlayer.golfer_id = #qExistingSquad.Golfer3ID# />
						<!-- look up golfer in the database to obtain his: last name, first name, and image -->
							<cfquery datasource="#sDSN#" name="qGolferNamesAndImage">
								SELECT GolferID, GolferFirstName, GolferLastName, GolferImage
								FROM golfer
								WHERE golfer.GolferID = #qExistingSquad.Golfer3ID#
							</cfquery>
						<cfif ArrayLen(SESSION.cart) GTE 6>
							<cfset bMatching = true />
						</cfif>
						<cfloop from="1" to="#ArrayLen(SESSION.cart)#" index="i">
							<!-- this looops through the cart to first check and see if this item has already been selected -->
							<cfif SESSION.cart[i].golfer_id EQ #qExistingSquad.Golfer3ID#>  <!-- don't add to cart if you've already selected player-->
								<cfset bMatching = true />
							</cfif>
						</cfloop>
						<cfif NOT bMatching> <!--only add to cart if it's false -->
							<cfset stPlayer = StructNew() />
							<cfset stPlayer.golfer_id = qGolferNamesAndImage.GolferID />
							<cfset stPlayer.Last_Name = qGolferNamesAndImage.GolferLastName />
							<cfset stPlayer.First_Name = qGolferNamesAndImage.GolferFirstName />
							<cfset stPlayer.GolferImage = qGolferNamesAndImage.GolferImage />
							<cfset ArrayAppend(SESSION.cart, stPlayer) />
						</cfif>
					</cfif>
					<cfif #qExistingSquad.Golfer4ID# LT 1>
						<cfset nTotal = nTotal>
					<cfelse>
						<cfset stPlayer = StructNew() />
						<cfset stPlayer.golfer_id = #qExistingSquad.Golfer4ID# />
						<!-- look up golfer in the database to obtain his: last name, first name, and image -->
							<cfquery datasource="#sDSN#" name="qGolferNamesAndImage">
								SELECT GolferID, GolferFirstName, GolferLastName, GolferImage
								FROM golfer
								WHERE golfer.GolferID = #qExistingSquad.Golfer4ID#
							</cfquery>
						<cfif ArrayLen(SESSION.cart) GTE 6>
							<cfset bMatching = true />
						</cfif>
						<cfloop from="1" to="#ArrayLen(SESSION.cart)#" index="i">
							<!-- this looops through the cart to first check and see if this item has already been selected -->
							<cfif SESSION.cart[i].golfer_id EQ #qExistingSquad.Golfer4ID#>  <!-- don't add to cart if you've already selected player-->
								<cfset bMatching = true />
							</cfif>
						</cfloop>
						<cfif NOT bMatching> <!--only add to cart if it's false -->
							<cfset stPlayer = StructNew() />
							<cfset stPlayer.golfer_id = qGolferNamesAndImage.GolferID />
							<cfset stPlayer.Last_Name = qGolferNamesAndImage.GolferLastName />
							<cfset stPlayer.First_Name = qGolferNamesAndImage.GolferFirstName />
							<cfset stPlayer.GolferImage = qGolferNamesAndImage.GolferImage />
							<cfset ArrayAppend(SESSION.cart, stPlayer) />
						</cfif>
					</cfif>
					<cfif #qExistingSquad.Golfer5ID# LT 1>
						<cfset nTotal = nTotal>
					<cfelse>
							<!-- if no buttons were clicked, load existing team -->
							<cfset stPlayer = StructNew() />
							<cfset stPlayer.golfer_id = #qExistingSquad.Golfer5ID# />
							<!-- look up golfer in the database to obtain his: last name, first name, and image -->
								<cfquery datasource="#sDSN#" name="qGolferNamesAndImage">
									SELECT GolferID, GolferFirstName, GolferLastName, GolferImage
									FROM golfer
									WHERE golfer.GolferID = #qExistingSquad.Golfer5ID#
								</cfquery>
							<cfif ArrayLen(SESSION.cart) GTE 6>
								<cfset bMatching = true />
							</cfif>
							<cfloop from="1" to="#ArrayLen(SESSION.cart)#" index="i">
								<!-- this looops through the cart to first check and see if this item has already been selected -->
								<cfif SESSION.cart[i].golfer_id EQ #qExistingSquad.Golfer5ID#>  <!-- don't add to cart if you've already selected player-->
									<cfset bMatching = true />
								</cfif>
							</cfloop>
							<cfif NOT bMatching> <!--only add to cart if it's false -->
								<cfset stPlayer = StructNew() />
								<cfset stPlayer.golfer_id = qGolferNamesAndImage.GolferID />
								<cfset stPlayer.Last_Name = qGolferNamesAndImage.GolferLastName />
								<cfset stPlayer.First_Name = qGolferNamesAndImage.GolferFirstName />
								<cfset stPlayer.GolferImage = qGolferNamesAndImage.GolferImage />
								<cfset ArrayAppend(SESSION.cart, stPlayer) />
							</cfif>
						</cfif>
						<cfif #qExistingSquad.Golfer6ID# LT 1>
							<cfset nTotal = nTotal>
						<cfelse>
							<cfset stPlayer = StructNew() />
							<cfset stPlayer.golfer_id = #qExistingSquad.Golfer6ID# />
							<!-- look up golfer in the database to obtain his: last name, first name, and image -->
								<cfquery datasource="#sDSN#" name="qGolferNamesAndImage">
									SELECT GolferID, GolferFirstName, GolferLastName, GolferImage
									FROM golfer
									WHERE golfer.GolferID = #qExistingSquad.Golfer6ID#
								</cfquery>
							
							<cfif ArrayLen(SESSION.cart) GTE 6>
								<cfset bMatching = true />
							</cfif>
							<cfloop from="1" to="#ArrayLen(SESSION.cart)#" index="i">
								<!-- this looops through the cart to first check and see if this item has already been selected -->
								<cfif SESSION.cart[i].golfer_id EQ #qExistingSquad.Golfer6ID#>  <!-- don't add to cart if you've already selected player-->
									<cfset bMatching = true />
								</cfif>
							</cfloop>
							<cfif NOT bMatching> <!--only add to cart if it's false -->
								<cfset stPlayer = StructNew() />
								<cfset stPlayer.golfer_id = qGolferNamesAndImage.GolferID />
								<cfset stPlayer.Last_Name = qGolferNamesAndImage.GolferLastName />
								<cfset stPlayer.First_Name = qGolferNamesAndImage.GolferFirstName />
								<cfset stPlayer.GolferImage = qGolferNamesAndImage.GolferImage />
								<cfset ArrayAppend(SESSION.cart, stPlayer) />
							</cfif>
						</cfif> --->

<cfinclude template="header.cfm" />
<link rel="STYLESHEET" type="text/css" href="../EoM/styles.css">
<!-- 
AuthUser:<cfoutput>#GetAuthUser()#</cfoutput>
<cfoutput>cart qnty: #ArrayLen(SESSION.cart)#</cfoutput>
Golfer IDs selected:

<cfloop from="1" to="#ArrayLen(SESSION.cart)#" index="i">
	<cfoutput>#Session.cart[i].golfer_id#</cfoutput>
</cfloop> 
-->
<cfif 1 eq 0>
<table width="100%">
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
      <cfinclude template="existing_squad.cfm" />
	</td>
    <td><img src="../images/spacer.gif" width="25" /></td>
    </td>
  </tr>
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
      <cfinclude template="cart_list.cfm" />
	</td>
    <td><img src="../images/spacer.gif" width="25" /></td>
    </td>
  </tr>
  <tr>
    <td colspan="3">
	  <img src="../images/spacer.gif" height="25" />
	</td>
  </tr>
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
      <cfinclude template="products_list.cfm" />
	</td>
    <td><img src="../images/spacer.gif" width="25" /></td>
    </td>
  </tr>
  <tr>
    <td colspan="3">
	  <img src="../images/spacer.gif" height="25" />
	</td>
  </tr>
  
</table>
<cfelse>
<table><tr><td>The tourney has begun!  Team selection period is over!  Enjoy the week!</td></tr></table>
</cfif>
<cfinclude template="footer.cfm" />