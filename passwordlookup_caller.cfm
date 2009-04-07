<cfset emailpar = FORM.email>

<!--- invoke component to obtain next sports item info from CFC --->
<cfobject name="oLookupPass" component="CFCpatronInfo">
<cfset passwordlookupresult = #oLookupPass.getandsendPatronPassword(emailpar)#> <!--- need to pass in value from form!!! --->

<cfif passwordlookupresult eq 1>
	<cfsavecontent variable="returnmarkup">
		<cfoutput>
			<div style="padding: 8px;">
			<div class="successfulpassretrieve">Your password has been sent to #emailpar#</div>
			</div>
		</cfoutput>
	</cfsavecontent>
<cfelse>
	<cfsavecontent variable="returnmarkup">
		<cfoutput>
			<div style="padding: 8px;">
			<div class="unsuccessfulpassretrieve">
				We have no entry in our system for the email address #emailpar#.  
				Please check the spelling of your email address and try again, or sign up for EyeOnMajors.com!
			</div>
			</div>
		</cfoutput>
	</cfsavecontent>
</cfif>

<cfoutput>#returnmarkup#</cfoutput>




		
