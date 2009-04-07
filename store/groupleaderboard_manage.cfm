<cfif NOT IsDefined('SESSION.board')>
	<cfset SESSION.board = ArrayNew(1) />
</cfif>

	
	<cfset stPlayer = StructNew() />
	<cfset stPlayer.golfer_id = FORM.golfer_id />
	<cfset stPlayer.Last_Name = FORM.Last_Name />
	<cfset stPlayer.First_Name = FORM.First_Name />
	<cfset stPlayer.GolferImage = FORM.GolferImage />
	<cfset ArrayAppend(SESSION.board, stPlayer) />
	
	