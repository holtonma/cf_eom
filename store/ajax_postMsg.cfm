<!--- data passed from client --->
<cfsilent>
<cfset oParamsPar = FORM.oParams> <!--- fields are: "patronid": "groupid": "msg":  (should probably strip /r/n with RegEx from msg)--->

<cfset input_string = oParamsPar>

<cfinvoke component="json" method="decode" data="#input_string#" returnvariable="sMsg" />

<!--- 
1. count messages to group made by this patronid
2. post the message to the db.
3. check db / recount to make sure the record has been added
--->
<cfoutput>
	<cftransaction>
		<cfquery name="qInitCheck" datasource="#sDSN2#">
			SELECT Count(DISTINCT messageid) as nummsgs
			FROM tmessages
			WHERE patronid = #sMsg.patronid# AND groupid = #sMsg.groupid#
		</cfquery>
		<cfset num_msgs_init = qInitCheck.nummsgs>
		<cfquery name="qNextMsg" datasource="#sDSN2#">
		  SELECT messageid
		  FROM tmessages
		  ORDER BY messageid DESC
		  LIMIT 1
		</cfquery>
		<cfif qNextMsg.RecordCount eq 0>
			<cfset next_msg_id = 1>
		<cfelse>
			<cfset next_msg_id = qNextMsg.messageid + 1>
		</cfif>
		
		<cfquery name="qInsertMsg" datasource="#sDSN2#">
		  INSERT INTO tmessages(messageid, groupid, patronid, posterid, datetimeofmessage, parsedmessagetext, messagefragmentid)
		  VALUES(#next_msg_id#, #sMsg.groupid#, #sMsg.patronid#, #sMsg.patronid#, #CreateODBCDateTime(Now())#, '#Trim(sMsg.msg)#', 1)
		</cfquery>
		<cfquery name="qLastCheck" datasource="#sDSN2#">
			SELECT Count(DISTINCT messageid) as nummsgs
			FROM tmessages
			WHERE patronid = #sMsg.patronid# AND groupid = #sMsg.groupid#
		</cfquery>
		<cfset num_msgs_after = qLastCheck.nummsgs>
	</cftransaction>
	<cfif num_msgs_after eq (num_msgs_init + 1)> 
		<cfset returnval = 0> <!--- success --->
	<cfelse>
		<cfset returnval = 1> <!--- not inserted --->
	</cfif>

</cfoutput>
<cfset json_return = StructNew()>
<cfset json_return.returnval = returnval>
<cfset json_return.fname = #SESSION.patronfirstname#>
<cfset json_return.lname = #SESSION.patronlastname#>
<cfset json_return.posttime = #ToString(DateFormat(Now(), "mm/dd/yyyy"))# & " " & #ToString(TimeFormat(Now(), "hh:mm tt"))#>
<cfinvoke component="json" method="encode" data="#json_return#" returnvariable="jsonReturn" />
</cfsilent>
<cfoutput>#jsonReturn#</cfoutput> <!--- return encoded JSON --->

