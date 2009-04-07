<!--- <cfparam name="SESSION.eventid" default="13"> --->

<span id="music">Music:
	<button id="music_on" class="tunecontrol unclicked">ON</button> 
	<button id="music_off" class="tunecontrol clicked" disabled>OFF</button>
	<span id="music_load"></span><span id="music_container"><b style="font-size:16px;color:#990000;text-decoration:line-through;">&#9835;</b></span>
</span>
<cfoutput>
<input type="hidden" id="hdEventid" value="#SESSION.eventid#">
</cfoutput>

<script type="text/javascript" src="prototype.js"></script>
<script type="text/javascript" src="firebug.js"></script>
<script type="text/javascript">
function on_music(){
  //grab eventid 
  $('music_off').disabled = true;
  $('music_on').disabled = true;
  console.log("on_music() function called via music_on button...");
  // grab music
  var url = "ajax_music.cfm";
  var pars = "FORM.eventid=" + encodeURIComponent($('hdEventid').value) + "&FORM.switch=1";
  //div 'groupmembers' will be refreshed with new data from server
  $('music_load').innerHTML = "turning ON music...";
  new Ajax.Updater('music_container', url, {
	parameters: pars,
	method: 'post', //not idempotent, i.e. changing data
	onComplete: function(){
	 // if successfully turned music on, then disable on button and style it...
	 // and enable off button and style it
	 $('music_off').disabled = false;
	 //Event.observe($('music_off'), 'click', off_music.bind($('music_off'))); // 
	 $('music_off').removeClassName('clicked');
	 $('music_off').addClassName('unclicked');
	 $('music_on').removeClassName('unclicked');
	 $('music_on').addClassName('clicked');
	 $('music_load').innerHTML = "";
	 //Please use Element#addClassName, Element#removeClassName and Element#hasClassName instead.
	} //onComplete callback ended	 
  });
}

function off_music(){
  //grab eventid
  //grab eventid 
  $('music_off').disabled = true;
  $('music_on').disabled = true;
  console.log("off_music() function called via music_off button...");
  // grab music
  var url = "ajax_music.cfm";
  var pars = "FORM.eventid=" + encodeURIComponent($('hdEventid').value) + "&FORM.switch=0";
  //div 'groupmembers' will be refreshed with new data from server
  $('music_load').innerHTML = "turning OFF music...";
  new Ajax.Updater('music_container', url, {
	parameters: pars,
	method: 'post', //not idempotent, should use get... but IE6 caches get requests
	onComplete: function(){
	 // if successfully turned music on, then disable on button and style it...
	 // and enable off button and style it
	 $('music_on').disabled = false;
	 //Event.observe($('music_on'), 'click', off_music.bind($('music_on'))); // 
	 $('music_off').removeClassName('unclicked');
	 $('music_off').addClassName('clicked');
	 $('music_on').removeClassName('clicked');
	 $('music_on').addClassName('unclicked');
	 $('music_load').innerHTML = "";
	 //Please use Element#addClassName, Element#removeClassName and Element#hasClassName instead.
	} //onComplete callback ended		 
  });
}

Event.observe(window, 'load', function(){
  Event.observe($('music_on'), 'click', on_music.bind($('music_on')));
  Event.observe($('music_off'), 'click', off_music.bind($('music_off'))); // 
})
</script>