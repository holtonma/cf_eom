
<cfset eventid = Val(FORM.eventid)>
<cfset on_off = Val(FORM.switch)>

<!--- --->
<cfquery datasource="#sDSN2#" name="qEvent">
  SELECT eventnameid FROM tevents WHERE eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#">
</cfquery>


<cfif qEvent.RecordCount eq 1> <!---  qEvent.RecordCount --->
	<cfset eid = #qEvent.eventnameid#> <!--- #qEvent.eventnameid# --->
	<cfif on_off eq 0>
	  <!--- return nothing in the innerhtml but the indicator text --->
	  <b style="font-size:16px;color:#990000;text-decoration:line-through;">&#9835;</b></span>
	<cfelse>
	  <!--- return swf for music--->
	  <cfif eid eq 1>
	    <span>
		  dave loggins :
		  <b style="font-size:16px;">&#9835;</b>
		  <i>Augusta, you're on my mind</i>
		  <b style="font-size:16px;">&#9835;</b>
		  <cfinclude template="music_swf_masters.cfm">
		</span>
	  <cfelseif eid eq 2>
	    <span><b style="font-size:16px;">&#9835;</b> us</span>
	  <cfelseif eid eq 3>
	    <span><b style="font-size:16px;">&#9835;</b> br</span>
	  <cfelseif eid eq 4>
	    <span><b style="font-size:16px;">&#9835;</b> pga</span>
	  </cfif>
	  
	</cfif>
<cfelse>
  <span style="font-size:11px;">Music Not Available</span>
</cfif>
