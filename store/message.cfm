<cfif IsDefined("SESSION.patrongroupid")>

<cfinclude template="eom_header.cfm">

<cfoutput>
<cfquery name="qMsgs" datasource="#sDSN2#">
	SELECT tM.parsedmessagetext, tM.patronid, tM.datetimeofmessage, tE.fname, tE.lname
	FROM tmessages tM LEFT OUTER JOIN tentrant tE ON tE.entrantid = tM.posterid
	WHERE tM.groupid = #SESSION.patrongroupid#
	ORDER BY ID DESC
	LIMIT 50
</cfquery>
</cfoutput>
	
<body id="bMessage">
  <cfinclude template="eom_tabs.cfm">      
  <div id="byline">Post messages to your group.  Group's govern their own conduct.  Please be responsible if kids are in your group.</div>
  <div id="mygroupsmessages">
    <div class="section_head">My Group's Messages:</div>
	    <div>
	    	<ul id="msgs">
	        	<!--- loop thru messages :: qMsgs--->
	            <cfoutput query="qMsgs">
	            <li><img src="images/note20x20.gif" style="width:10px;height:10px;"><b>#fname# #lname#</b>: <i>"#parsedmessagetext#"</i> 
		            <span class="msg_time">#DateFormat(datetimeofmessage, "mm/dd/yyyy")# #TimeFormat(datetimeofmessage, "hh:mm tt")# EST</span>
		          </li>
	            </cfoutput>
	        </ul>
	    </div>
	    <div>
		    <cfoutput>
	    	<input type="hidden" id="hdGroupID" value="#SESSION.patrongroupid#">
	        <input type="hidden" id="hdPatronID" value="#SESSION.entrantid#"></cfoutput>
	        <span><input id="msg" type="text" style="width:83%;" /></span>
	        <span><button id="post_msg">Post</button></span>
	    </div>
	    <div class="smallgrey">Messages have a 140 character limit</div>
	    <div id="msgPosting"></div>
  </div>
  <div id="majortop10" class="right_col" align="center">
    <cfinclude template="portlet_major_top10.cfm">
  </div>
  <div id="committeemsg" class="right_col" align="center">
    <div class="section_head">From Our Sponsors:</div>
    <cfinclude template="../ad_group_right.htm">
  </div>  
  
</body>
</html>

<script type="text/javascript">
// for now function in global namespace... but before release, turn this into a Module Pattern:
function post_message(){
  var msg = $('msg').value.strip();
  console.log(msg);//grab value in the text box (along with patrongroupid, patronid
  var loading_message = "Posting message...";
  var oParams = {"patronid": $F('hdPatronID'), "groupid": $F('hdGroupID'), "msg": msg};
  var oParamsJSON = Object.toJSON(oParams);
  console.log(oParamsJSON);
  var url = "ajax_postMsg.cfm";
  var pars = "FORM.oParams=" + encodeURIComponent(oParamsJSON);
  $('msgPosting').show();
  new Ajax.Request(url, 
   {
	 method: 'Post',
	 onCreate: function(){$('msgPosting').show(); $('msgPosting').innerHTML = loading_message},
	 asynchronous: true,
	 parameters: pars,
	 onComplete: function(transport){
	  console.log("responseText: ", transport.responseText);
	  console.log(transport.responseText.returnval);
		if (transport.responseText.evalJSON(true)){
	   var json = transport.responseText.evalJSON(true);   
	   //$('msgPosting').innerHTML = transport.responseText.returnval;
	   $('msgPosting').hide();
	   //return success (message box, fade away)
		 //update list
		 //var rObj = transport.responseText.toObject();
		 console.log("json.FNAME: ", json.FNAME);
		 var t = new Template("<li class='usermsg'><img src='images/note20x20.gif' style='width:10px;height:10px;'><b>#{fname} #{lname}</b>:<i>&quot;#{msg}&quot;</i><span class='msg_time'> #{posttime} EST</span></li>");
		 
		 ht_text = t.evaluate( {fname: json.FNAME, lname: json.LNAME, msg: oParams.msg, posttime: json.POSTTIME} );
		 console.log("html text to insert: ", ht_text);
		 new Insertion.Top($('msgs'), ht_text);
		 $('msg').value = "";
		}
	 }
   });//Ajax.Request
  
}


</script>

<script type="text/javascript">
Event.observe(window, 'load', function(){
  Event.observe('post_msg', 'click', post_message.bind('post_msg'));
});
</script>

<cfelse>
	<cflocation url="../login_form.cfm">
</cfif>
