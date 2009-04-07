<cfinclude template="../header.cfm" />
  <cfif IsDefined('FORM.configure_button')>
    <cfinclude template="create_table.cfm" />
	<cfinclude template="configure_user_types.cfm" />
	<cfinclude template="configure_users.cfm" />
	<cfinclude template="configure_add_1000_users.cfm" />
	<cfinclude template="create_table_event.cfm" />
	<cfinclude template="create_table_store.cfm" />
	<cfinclude template="configure_products.cfm" />
	Database configured.
  <cfelse>
    <cftry>
	  <cfquery datasource="learningcoldfusion" name="qTables">
	  SELECT *
	  FROM lcf_user_type
	  </cfquery>
	  The database appears to already have been configured. You can click the configure button to re-configure it. Any additional data you may have added (i.e. new users you signed up) will be deleted.
	  <cfcatch>The database does not appear to have yet been configured.</cfcatch>
	</cftry>
    <form action="<cfoutput>#CGI.SCRIPT_NAME#</cfoutput>" method="post">
	  <input type="submit" name="configure_button" value="Configure" />
	</form>
  </cfif>
<cfinclude template="../footer.cfm" />