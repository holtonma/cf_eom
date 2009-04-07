

<!--related to golfers selected:: add to 'cart', if already selected, don't add -->
<cfif IsDefined('FORM.add_button.y')>
	<cfset bMatching = false />
	
	<cfloop from="1" to="#ArrayLen(SESSION.golferscorecart)#" index="i">
		<cfif SESSION.golferscorecart[i].golfer_id EQ FORM.golfer_ID>  <!-- don't add to cart if you've already selected player-->
			<cfset bMatching = true />
		</cfif>
	</cfloop>
	
	<cfif NOT bMatching> <!--only add to cart if it's false -->
		<cfset stPlayer = StructNew() />
		<cfset stPlayer.golfer_id = FORM.golfer_id />
		<cfset stPlayer.Last_Name = FORM.Last_Name />
		<cfset stPlayer.First_Name = FORM.First_Name />
		<cfset stPlayer.CurrentScore = FORM.golfer_score />
		<cfset stPlayer.Memo = FORM.golfer_memo />
		<cfset stPlayer.GolferImage = FORM.GolferImage />
		<cfset ArrayAppend(SESSION.golferscorecart, stPlayer) />
	</cfif>
	<cflocation url="admin_post_data.cfm" />
<cfelseif IsDefined('FORM.delete_button.y')>
	<cfloop from="#ListLen(FORM.delete_index)#" to="1" index="i" step="-1">
		<cfset ArrayDeleteAt(SESSION.golferscorecart, ListGetAt(FORM.delete_index, i)) />
	</cfloop>
	<cflocation url="admin_post_data.cfm" />
<cfelseif IsDefined('FORM.checkout_button.y')>
	<!--- when tourney starts --->
	<cflocation url="admin_post_checkout.cfm" /> 
	
	
	<!-- after tourney start -->
	<!--- 
	setting active golfers 
	<cflocation url="admin_post_checkout_setGolferActive.cfm" />
	--->
	
</cfif>