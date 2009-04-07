<cfinclude template="header.cfm" />

<cfoutput>#GetAuthUser()#</cfoutput>
<cfoutput>cart qnty: #ArrayLen(SESSION.golferscorecart)# :: </cfoutput>
<cfloop from="1" to="#ArrayLen(SESSION.golferscorecart)#" index="i">
	<cfoutput>#Session.golferscorecart[i].golfer_id# (#Session.golferscorecart[i].Active#) ;</cfoutput>
</cfloop>

<cfif IsDefined('FORM.confirm_button.y')>
	<cfloop from="1" to="#ArrayLen(SESSION.golferscorecart)#" index="i">
		<cfquery datasource="#sDSN#">
			UPDATE golfer
			SET Active = '#Session.golferscorecart[i].Active#' 
			WHERE GolferID = '#Session.golferscorecart[i].golfer_id#'
		</cfquery>
	</cfloop>
	<cfset ArrayClear(SESSION.golferscorecart) />
	
	
<cfelse>
	<cfoutput>
		<form action="#CGI.SCRIPT_NAME#" method="post">
		If you are ready to save these changes to the database, click on the CHECKOUT button.  <br>
		Otherwise click your browser's BACK button to review and/or modify your changes.
		<br />
		<input type="image" name="confirm_button" src="../images/checkout.gif" />
		</form>
	</Cfoutput>
</cfif>

<cfinclude template="footer.cfm" />