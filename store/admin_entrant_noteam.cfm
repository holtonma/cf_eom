<style type="text/css">
<!--
.style1 {color: #000000}
-->
</style>
<a href="/store/admin_post_data.cfm">LINK to admin page</a><cfset nettotalscore = 0 />

<!-- query that selects all patrons who have not yet configured a group -->
<cfquery datasource="#sDSN#" name="qAlertNoGroupPatrons">
	SELECT poolperson.EntrantID, poolperson.emailaddy
	FROM poolperson
	WHERE GroupID = 0 
</cfquery>

<cfquery datasource="#sDSN#" name="qNumNoGroupPatrons">
	SELECT COUNT(poolperson.EntrantID) as NumWithoutGroup
	FROM poolperson
	WHERE GroupID = 0 
</cfquery>

<cfoutput><span class="style1">#qNumNoGroupPatrons.NumWithoutGroup#</span></cfoutput>
<cfoutput><span class="style1">#ValueList(qAlertNoGroupPatrons.EmailAddy)#</span></cfoutput>



  