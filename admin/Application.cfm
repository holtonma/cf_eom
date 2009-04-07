<!-- for admin directory only -->
<cfif NOT IsUserInRole('admin')>
	<cflocation url="../poolpersonpage.cfm" />
</cfif>

<cfset sDSN = "eyeonmajors" />