<!--- Holton, 02/17/08, Ajax-enabled form for inviting friends to your group--->

<cfinclude template="eom_header.cfm">

<body id="bInvite">
  <cfinclude template="eom_tabs.cfm">      
  
  <div id="invitation" align="center">
	  <div>Simply enter your friends' email addresses here, separated by commas, just as you would do in your email!  The GroupName and GroupPassword for your group will automatically be sent to them below your message.</div>
	  <cfset num_cols = 80>
	  <cfoutput>  
	  <div><textarea id="my_friends_emails" rows="4" cols="#num_cols#"></textarea></div>
	  <div>Message to my pals:</div>
	  <div><textarea id="my_invite_message" rows="6" cols="#num_cols#">I found this site, EyeOnMajors.com, which enables a free golf pool for us to compete in.  It's easy, just pick 6 players and the low total wins. The prizes if you win the whole thing are a dozen Pro V1's (or another dozen of your choice) and a $70 golf software program. In order to win all your guys have to make the cut, and there are a couple handicaps to make it challenging.  It takes about 30 seconds to sign up and another minute to pick your team.  Cheers, buddy, hope you can join us!  -<cfoutput>#SESSION.patronfirstname# #SESSION.patronlastname#</cfoutput>
</textarea></div>
    <input type="hidden" id="hdPatronID" value="#SESSION.entrantid#">
	  </cfoutput>
	  <div><button id="send_invite">Send Invitation</button></div>
	</div>
	<div id="msg_loading"></div>
</body>


<script>
// fn in global namespace for now...
function send_invites(){
  loading_message = "processing list and attempting to send message..."
  cdl = $('my_friends_emails').value;
  console.log("my_friends_emails list: ", cdl);
  // make Ajax.Updater call:
  var oParams = {"pals": cdl, "entrantid": $('hdPatronID').value, "msg": $('my_invite_message').value};
  var oParamsJSON = Object.toJSON(oParams);
  console.log("oParamsJSON: ", oParamsJSON);
  var url = "ajax_invitePals.cfm";
  var pars = "FORM.oParams=" + encodeURIComponent(oParamsJSON);
  
  new Ajax.Request(url, 
   {
	 method: 'Post',
	 onCreate: function(){$('msg_loading').show(); $('msg_loading').innerHTML = loading_message},
	 asynchronous: true,
	 parameters: pars,
	 onComplete: function(transport){
	  console.log("responseText: ", transport.responseText);
	  console.log(transport.responseText.returnval);
		if (transport.responseText.evalJSON(true)){
	   var json = transport.responseText.evalJSON(true);   
	   console.log("json.pals: ", json.PALS);
	   console.log("json.VALIDEMAILS: ", json.VALIDEMAILS);
		} // if (transport...)
	  // when update is complete: 
	  $('msg_loading').innerHTML = "<b style='color:green;'>Request completed!</b>";
	 } //onComplete
	 });//Ajax.Request
	}//fn 
	
</script>

<script type="text/javascript">
  Event.observe(window, 'load', function(){
	  Event.observe('send_invite', 'click', send_invites.bind('send_invite'));
	});
</script>