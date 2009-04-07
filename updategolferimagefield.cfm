<cfset aImageName = ArrayNew(1) />

<cfquery datasource="#sDSN#" name="qGolfers">
		SELECT * 
		FROM golfer
		WHERE GolferID = 
</cfquery>


<!-- build array of strings composing picture strings -->
<cfloop from="1" to="#qGolfers.RecordCount#" index="i">
	<cfset aImageName[i] = #qGolfers.GolferLastName# & '_' & #qGolfers.GolferFirstName# />
	<cfoutput>#i#:  '#aImageName[i]#' <br></cfoutput>
</cfloop>

