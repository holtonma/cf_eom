<!---
name: forgotpassword.cfm
author: Mark A Holton
date: 1/15/2007
description: 
	when clicked, reveals an input box and a button, when an email address is submitted, it looks up that email address in the database,
	and if found, displays a confirmation, and sends the password to that email address.  If not found, displays an 'error' type message
--->
<style type="text/css">
	#invisemailform {
		color: #666666;
		background: #FFEBDD;
		border: 1px solid #FF6600;
		padding: 2px;
	}
</style>

<script type="text/javascript">
	function toggleEmailPass() {
		// methodstring can be 'blind', 'appear', 'slide'
		// this will show/hide the help content 
		var elem = $('invisemailform')
		elem.visibility = "visible"
		Effect.toggle(elem, 'appear');
	}
	
</script>



<div id="forgotpassword" align="center" style="padding: 5px;"><a id="aforgotpassword" href="javascript:toggleEmailPass();">Forgot Password?  Click here!</a></div>

<div id="invisemailform" style="display:none;">
	Your email address: 
	<input type="text" size="25" id="email">
	<input type="submit" value="Email Password to me" onclick="javascript:getEmailPass($('email').value);">
	<div id="emailpassreturn"></div>
</div>

<script type="text/javascript">
		
	function getEmailPass(emailAddy) {
			
			var pars = 'FORM.email=' + emailAddy;
			new Ajax.Updater('emailpassreturn', 'passwordlookup_caller.cfm', 
			{
			asynchronous:true,
			parameters: pars,
			onSuccess:function(){ Element.setOpacity('emailpassreturn', 0.0); Effect.Appear('emailpassreturn', { duration: 1.0 }); }
			}
		);
	}
</script>

