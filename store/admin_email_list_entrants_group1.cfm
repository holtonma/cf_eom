<a href="/store/admin_post_data.cfm">LINK to admin page</a><cfset nettotalscore = 0 />

<!-- -->
<cfquery datasource="#sDSN#" name="qEmailList">
	SELECT poolperson.EmailAddy, poolperson.EntrantID
	FROM poolperson, selectedteams
	WHERE poolperson.EntrantID = selectedteams.poolpersonID
	AND selectedteams.fullsquad = 1
	AND poolperson.GroupID = 1
</cfquery>

<cfoutput query="qEmailList">GOLFER ID: #qEmailList.EntrantID# #qEmailList.EmailAddy#<br></cfoutput>
<!-- show  array as a list -->
<cfoutput>#ValueList(qEmailList.EmailAddy)#</cfoutput>



  