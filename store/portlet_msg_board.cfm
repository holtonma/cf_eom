<!--- remove when placed into larger project --->
<!---
<script type="text/javascript" src="prototype.js"></script>
<script type="text/javascript" src="firebug.js"></script>
--->
<style type="text/css" media="screen">
#msg_board{
  border: 1px solid gray;
  float:left;
  padding:5px;
  margin-bottom:10px;
  font-family:Arial, Helvetica, sans-serif;
}

.smallgrey{
  font-size:10px;
  color:#999999;
  font-family:Arial, Helvetica, sans-serif;
}

/* duplicated to be removed when in larger part of app */
.section_head {
background-color:#BBDDAA;
color:#003300;
font-family:verdana,"Lucida Grande",arial,helvetica,sans-serif;
font-size:large;
line-height:21px;
margin-bottom:6px;
padding:3px;
text-align:center;
}
.right_col{
background-color:#DDFFCC;
border:thin dotted #004400;
float:left;
margin:3px;
min-width:200px;
padding:3px;
width:29%;
}
</style>

<cfoutput>
<cfquery name="qMsgs" datasource="#sDSN2#">
  SELECT tM.parsedmessagetext, tM.patronid, tM.datetimeofmessage, tE.fname, tE.lname, tM.id
  FROM tmessages tM LEFT OUTER JOIN tentrant tE ON tE.entrantid = tM.posterid
  WHERE tM.groupid = #SESSION.patrongroupid#
  ORDER BY tM.id DESC
  LIMIT 10
</cfquery>
</cfoutput>

<div id="msg_board" class="right_col">
	<div class="section_head">My Group's Messages:</div>
    <div>
    	<ul id="msgs">
        	<!--- loop thru messages :: qMsgs--->
            <cfoutput query="qMsgs">
            <li class="usermsg">
	            <img src="images/note20x20.gif" style="width:10px;height:10px;"><b style="text-transform: capitalize;">#fname# #lname#</b>: <i>"#parsedmessagetext#"</i> 
	            <span class="msg_time">#DateFormat(datetimeofmessage, "mm/dd/yyyy")# #TimeFormat(datetimeofmessage, "hh:mm tt")# EST</span>
	          </li>
            </cfoutput>
        </ul>
    </div>
<div style="font-size:10px;color:gray;" align="center">write your message here:</div>    
<div>
	  <cfoutput>
    	<input type="hidden" id="hdGroupID" value="#SESSION.patrongroupid#">
        <input type="hidden" id="hdPatronID" value="#SESSION.entrantid#">
    </cfoutput>
        <span><input id="msg" type="text" style="width:83%;" /></span>
        <span><button id="post_msg">Post</button></span>
    </div>
    <div class="smallgrey">Messages have a 140 character limit</div>
    <div id="msgPosting"></div>
		<div class="viewall"><a href="message.cfm">view all messages</a></div>
</div>


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
