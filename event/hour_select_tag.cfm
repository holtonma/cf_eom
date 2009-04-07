<select name="<cfoutput>#ATTRIBUTES.name#</cfoutput>">
  <cfoutput>
	<cfloop from="0" to="23" index="i">
	  <cfif i EQ 0>
		<cfset sHour = "12 AM" />
	  <cfelseif i EQ 12>
		<cfset sHour = "12 PM" />
	  <cfelseif i GTE 12>
		<cfset sHour = NumberFormat((i - 12), "00") & " PM"/>
	  <cfelse>
		<cfset sHour = NumberFormat(i, "00") & " AM" />
	  </cfif>
	  <option value="#i#"<cfif ATTRIBUTES.value EQ i> selected</cfif>>#sHour#</option>
	</cfloop>
  </cfoutput>
</select>