<cfif IsDefined("SESSION.entrantid")>

<cfinclude template="eom_header.cfm">

<body id="bHome">
  <cfinclude template="eom_tabs.cfm">      
  	<div id="byline">
			Post messages to your group.  Group's govern their own conduct.  Please be responsible if kids are in your group.
	  </div>
	  <div id="myhome">
	    <div class="section_head">My Settings:</div>
		    <div>
		    	<ul id="msgs">
		            <!---  <cfoutput><cfdump var="#SESSION#"> --->         
								<cfoutput>
									 
										<cfif IsDefined("SESSION.patronfirstname")>
										<li>Name: <b>#SESSION.patronfirstname# #SESSION.patronlastname#</b></li>
			            	<li>Email: <b>#SESSION.patronemail# </b></li>
										<cfelse>
											<li><i>You will be able to modify your settings the next time you login.</i></li>
										</cfif>
									
								</cfoutput>
					</ul>
					<div style="border: 1px dotted green;font-size:11px;">
					<div align="center"><b style="font-size:12px;color:#888;">Change password:</b></div>
					<form id="settings" name="settings">
					<ul style="list-style:none;">
						<li><input type="password" id="old_pass" size="25">: Old password</li>
						<li><input type="password" id="new_pass1" size="25">: New password</li>
						<li><input type="password" id="new_pass2" size="25">: New password confirm (type again)</li>
					</ul>
					<cfoutput>
					<input type="hidden" id="hdPatronID" value="#SESSION.entrantid#">
					</cfoutput>
					</form>
					<div align="center"><button id="post_mysettings">Update Password</button></div>
					</div>
					
		    </div>
		    <div id="msgPosting" style="padding-top:4px;" align="center"></div>
	  </div>
	  <div id="majortop10" class="right_col" align="center">
	    <cfinclude template="portlet_major_top10.cfm">
	  </div>
	  
	  
	
</body>

<script type="text/javascript">
	function update_settings(){
	  var old = $F('old_pass')
	  var new1 = $F('new_pass1')
		var new2 = $F('new_pass2')
		//console.log("old and new: ", old + " " + new1 + " "+ new2);//grab value in the text box (along with patrongroupid, patronid
		var old = old.strip();
		var new1 = new1.strip();
		var new2 = new2.strip();
		//console.log("new1.strip: ", new1);
		//console.log("new1.length ", new1.length)
		if ( (new1 == new2 ) && (new1.length > 4) ){
			//console.log("inside of first if");
	    var loading_message = "Posting updates...";
		  var oParams = {"patronid": $F('hdPatronID'), "old": old, "new1": new1, "new2": new2};
		  var oParamsJSON = Object.toJSON(oParams);
		  //console.log(oParamsJSON);
		  var url = "ajax_changeSettings.cfm";
		  var pars = "FORM.oParams=" + encodeURIComponent(oParamsJSON);
		  $('msgPosting').show();
		  new Ajax.Request(url, 
		   {
			 method: 'Post',
			 onCreate: function(){$('msgPosting').show(); $('msgPosting').innerHTML = loading_message},
			 asynchronous: true,
			 parameters: pars,
			 onComplete: function(transport){
			  //console.log("responseText: ", transport.responseText);
			  //console.log(transport.responseText.returnval);
				if (transport.responseText.evalJSON(true)){
			   var json = transport.responseText.evalJSON(true);   
			   //$('msgPosting').innerHTML = transport.responseText.returnval;
			   $('msgPosting').hide();
			   //return success (message box, fade away)
				//console.log("json.RETURNVAL: ", json.RETURNVAL);
				if (json.RETURNVAL == 0){
					msg = "<b style='color:green;'>Password successfully changed!</b>";
				  $('msgPosting').show(); $('msgPosting').innerHTML = msg;
				  $('old_pass').value = "";
					$('new_pass1').value = "";
					$('new_pass2').value = "";
				} else if (json.RETURNVAL == 1){
					msg = "<b style='color:red;'>old password did not match password in database.  Try again.</b>";
				  $('msgPosting').show(); $('msgPosting').innerHTML = msg;
				} else if (json.RETURNVAL == 2){
					msg = "<b style='color:red;'>new password did not match new password confirm on the server side.  Please try again.</b>";
				  $('msgPosting').show(); $('msgPosting').innerHTML = msg;
				} else {
					msg = "<b style='color:red;'>Unknown password save error.  Contact: holton@albatross-software.com</b>";
				  $('msgPosting').show(); $('msgPosting').innerHTML = msg;
				} //if
				} // if(transport...)
			 }
		   });//Ajax.Request
		} else if (new1.strip().length < 5){
			//console.log("inside of else if");
			error_msg = "<b style='color:red;'>Passwords must be at least 5 characters in length.  Please try again.</b>";
		  $('msgPosting').show(); $('msgPosting').innerHTML = error_msg;
		} else {
			//console.log("inside of else...");
		  error_msg = "<b style='color:red;'>Password confirmation box does not match Password entry.  Please try again.</b>";
		  $('msgPosting').show(); $('msgPosting').innerHTML = error_msg;
		}
	};
</script> 
<script type="text/javascript">
  Event.observe(window, 'load', function(){
	  Event.observe('post_mysettings', 'click', update_settings.bind('post_mysettings'));
	});
</script>
</html>

<cfelse>
	<cflocation url="../login_form.cfm">
</cfif>




