<select name="<cfoutput>#ATTRIBUTES.name#</cfoutput>">
  <cfoutput>
	<cfloop from="1" to="31" index="i">
	  <option value="#i#"<cfif ATTRIBUTES.value EQ i> selected</cfif>>#i#</option>
	</cfloop>
  </cfoutput>
</select>