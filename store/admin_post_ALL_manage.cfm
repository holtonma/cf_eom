
<!--updates all data in admin page (one click instead of 98 -->
<cfif IsDefined('FORM.updateall_button.y')>
	<cfset bMatching = false />
	
	<!--don't add items that have been added already -->
	<cfloop from="1" to="#ArrayLen(SESSION.cart)#" index="i">
		<cfif SESSION.golferscorecart[i].golfer_id EQ FORM.golfer_ID>  <!-- don't add to cart if you've already selected player-->
			<cfset bMatching = true />
		</cfif>
	</cfloop>
	<cfset ArrayClear(SESSION.golferscorecart) />
	<cfif NOT bMatching> <!--only add to cart if it's false -->
		<cfloop from="1" to="#ArrayLen(SESSION.contestantlist)#" index="i">
			<cfset stPlayer = StructNew() />
			<cfset stPlayer.golfer_id = FORM.golfer_id />
			<cfset stPlayer.Last_Name = FORM.Last_Name />
			<cfset stPlayer.First_Name = FORM.First_Name />
			<cfset stPlayer.CurrentScore = FORM.golfer_score />
			<cfset stPlayer.Memo = FORM.golfer_memo />
			<cfset stPlayer.GolferImage = FORM.GolferImage />
			<cfset ArrayAppend(SESSION.golferscorecart, stPlayer) />
			<cfset ArrayAppend(SESSION.golferscorecart, stPlayer) />
		</cfloop>
	</cfif>
	<cflocation url="index_future.cfm" />
</cfif>