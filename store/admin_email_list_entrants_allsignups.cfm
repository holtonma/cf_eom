<a href="/store/admin_post_data.cfm">LINK to admin page</a><cfset nettotalscore = 0 /> <br><br>

<cfquery datasource="#sDSN#" name="qEmailListall">
	SELECT poolperson.EmailAddy, poolperson.EntrantID
	FROM poolperson
	WHERE poolperson.EntrantID > 0
	ORDER BY poolperson.EntrantID ASC
</cfquery>

<cfoutput query="qEmailListall">GOLFER ID: #qEmailListall.EntrantID# #qEmailListall.EmailAddy#<br></cfoutput>

<cfoutput query="qEmailListall">#qEmailListall.EmailAddy#, </cfoutput>
<!-- show  array as a list -->
<cfoutput>#ValueList(qEmailListall.EmailAddy)#</cfoutput>



  