<!--- after tourney starts : WHERE active = 1 --->
<cfquery datasource="#sDSN#" name="qAllGolfers">
SELECT *
FROM golfer
WHERE active IN(0,1)
ORDER BY GolferLastName ASC
</cfquery>
<link rel="STYLESHEET" type="text/css" href="../styles.css">



<script src="../js/prototype.js" type="text/javascript"></script>
<script src="../js/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript'>_ajaxConfig = {'_cfscriptLocation':'../components/eomajax.cfc', '_jsscriptFolder':'../js'};</script>
<script type='text/javascript' src='../js/ajax.js'></script>




<script type="text/javascript">

	// shows/hides the help buttons and any opened HELP divs
    function toggleshowhidehelp()    {
            Element.toggle('dragdrophelp');
                       
            hideallhelp();
            // the following hides the help contents if they were open
            //Effect.toggle('countryidhelpcontent', 'appear');
            //Effect.toggle('portsizehelpcontent', 'appear');
            //Effect.toggle('loopbandwidthhelpcontent', 'appear');
    }
   
    function hideallhelp() {
            Element.hide('dragdrophelp');
            
    }
   
    function toggleHelp(elem, methodstring) {
        // methodstring can be 'blind', 'appear', 'slide'
        // this will show/hide the help content
        elem.visibility = "visible"
        Effect.toggle(elem, methodstring);
       
    }
	
	function updateNewGolferTableJS()	{
		// send data to CF
		DWRUtil.useLoadingMessage();
		DWREngine._execute(_ajaxConfig._cfscriptLocation, null, 'updateNewGolferTablewithOld', updateNewGolferTableResultJS);
	}
	function updateNewGolferTableResultJS()	{
	}
	
	function updateScoreJS()	{
		// send data to CF
		DWRUtil.useLoadingMessage();
		DWREngine._execute(_ajaxConfig._cfscriptLocation, null, 'updateGolferScore', DWRUtil.getValue("golfer_id"), DWRUtil.getValue("golfer_score"), updateScoreResultJS);
	}
	// $('golfer_id').value,  $('golfer_score').value 
	
	// call back function
	function updateScoreResultJS (r) {
		
	}
	
	function updategolferscoreJS()	{
		// send data to CF
		DWRUtil.useLoadingMessage();
		DWREngine._execute(_ajaxConfig._cfscriptLocation, null, 'updateGolferScore', DWRUtil.getValue("selgolfers"), $('golfer_score2').value, updateScoreResultJS);
	}
	
	
	function getgolferscoreJS()	{
		// send data to CF
		DWRUtil.useLoadingMessage();
		DWREngine._execute(_ajaxConfig._cfscriptLocation, null, 'getGolferScoreCF', DWRUtil.getValue("selgolfers"), getGolferScoreResultJS);
	}
	// call back function
	function getGolferScoreResultJS (r) {
		// set port price on page (use regular expression for price)
        $('golfer_score2').innerHTML = r;
	}
	
	
	function getFriendsEmailJS()	{
		// send data to CF
		DWRUtil.useLoadingMessage();
		fremailelement = document.getElementById("txtGetFriendsEmail").value;
		DWREngine._execute(_ajaxConfig._cfscriptLocation, null, 'getFriendGroupCF', fremailelement, getFriendsEmailReturnJS);
	}
	// call back function
	function getFriendsEmailReturnJS (r) {
		// set port price on page (use regular expression for price)
        $('friendsemailreturn').innerHTML = r;
		// new Effect.Shake('friendsemailreturn');
		Element.setStyle('friendsemailreturn', {color:'red'} ); 
		new Effect.Opacity('friendsemailreturn', {duration:0.5, from:1.0, to:0.2});
	}
	
	
</script>

<!---
<a href="/store/admin__madecut_post.cfm">UPDATE CUT </a> <br>   
  hiding this because don't want to accidently update cut after cut has already been updated --->
  
<!---
<p><a href="/store/admin_email_list_entrants.cfm">Email List Active <br>
</a></p>
<p><a href="/store/admin_email_list_entrants_allsignups.cfm">    Email List ALL<br>
</a></p>
<p><a href="/store/admin_email_list_entrants_group1.cfm">Email List Group Magical</a></p>
<p><a href="admin_pollresults_entrants.cfm">Poll Answers</a></p>
<p><a href="/store/admin_numbers_in_group.cfm">Numbers in Group </a></p>
<p><a href="/store/admin_player_WD.cfm">Players whose team have a WD member </a></p>
<p><a href="/store/admin_entrant_noteam.cfm">Players without a group</a> </p>
<p>  <a href="/store/admin_test_PPC.cfm">Test PPC</a></p>
<p><a href="/store/admin_fullsquads.cfm">Full Squads</a></p>
<p><!------>   <a href="/store/admin__madecut_post.cfm">SetCutLine</a> </p>
<p>Instructions: <br>
Just enter the score you want to update, and any memo (joking or otherwise, current or long term) about the golfer, and click the 'update' plus sign 
This will pre-update the scores you have changed.  (you will see the scores at bottom that you are about to update).  Click the "checkout" button 
at the bottom and you will have updated the database. <br> 
<br>
</p>
--->
	<ul id="examplelist">
		<li>Tiger Woods</li>
		<li>Greg Norman</li>
		<li>Curtis Strange</li>
		<li>Jim Furyk</li>
		<li>Tom Watson</li>
		<li>Jack Nicklaus</li>
		<li>Gary Player</li>
		<li>John Cook</li>
	</ul>
		<!------>
		<script type="text/javascript" language="javascript">
		  Sortable.create('examplelist',{ghosting:true,constraint:false})
		</script>
		
<table width="500" class="white" cellpadding="0">

<cfset numinrow = 15>
<tr>
	<!--- <td colspan="#numinrow#" width="800px" style="border:medium; border:dotted"><div id="shopping_cart" style="border:medium; border:dotted">DROP YOUR TEAM HERE</div></td> --->
	<div id="shopping_cart" style="border:medium; border:dotted; text-align:center; height:40px" align="center">DROP YOUR TEAM HERE</div>
	<br />
	<div id="countryidhelp" style="" align="left"><a href="#" onclick="toggleHelp(dragdrophelpcontent, 'blind');return false;" class="linkopacity">Show me how to use this</a></div> 
</tr>
<tr >
		<td colspan="13">
			<div id="dragdrophelpcontent" style="display: none; border-style: solid; border-color:#660099; border-width:2px;">
			<a href="#" onclick="toggleHelp(dragdrophelpcontent, 'blind');return false;">expand</a>:
			<strong>Drag and Drop Your Team!</strong><br/><br/>
			 Click and drag the player you want to select and drag him into your cart.
			 <br/><br/>
			 Hovering your mouse over the player will show you the golfer and his handicap.  Players with a RED border have a handicap.
			 Good luck!<br/><br/>
			 </div>
		</td>
</tr>
<tr>
	<td><span id="shopping_cart_text"></span></td>
</tr>
	<script type="text/javascript" language="javascript">
		Droppables.add('shopping_cart', 
			{onDrop: function(element) 
				{ $('shopping_cart_text').innerHTML = 'Dropped the ' + element.id + ' on me.'; }
			} 
		);
	</script> 
<!---<tr>  start the row ---> 

<cfset counter = 0>
<cfoutput query="qAllGolfers">
	<cfset counter = counter + 1>
	<cfif counter eq 1>
		<cfset counter = 1>
		<tr>
			<td><!---
			<a href="" onclick="Element.toggle('#qAllGolfers.GolferLastName##qAllGolfers.GolferID#','blind'); return false">toggle</a>
			---><div id="#qAllGolfers.GolferLastName##qAllGolfers.GolferID#"><img src="#qAllGolfers.GolferImage#.gif" alt="#qAllGolfers.GolferLastName#, #qAllGolfers.GolferFirstName#" /><br />#qAllGolfers.GolferLastName#</div></td>
			<!--- --->
			<script type="text/javascript">
				new Draggable('#qAllGolfers.GolferLastName##qAllGolfers.GolferID#',{revert:true});
			</script> 
	<cfelseif counter lt numinrow>
			<td><!--- <a href="" onclick="Element.toggle('#qAllGolfers.GolferLastName##qAllGolfers.GolferID#','blind'); return false">toggle</a> ---><div id="#qAllGolfers.GolferLastName##qAllGolfers.GolferID#"><img src="#qAllGolfers.GolferImage#.gif" /><br />#qAllGolfers.GolferLastName#</div></td>
			<script type="text/javascript">
				new Draggable('#qAllGolfers.GolferLastName##qAllGolfers.GolferID#',{revert:true});
			</script> 
	<cfelseif counter eq numinrow>
		<td><!--- <a href="" onclick="Element.toggle('#qAllGolfers.GolferLastName##qAllGolfers.GolferID#','blind'); return false">toggle</a> ---><div id="#qAllGolfers.GolferLastName##qAllGolfers.GolferID#"><img src="#qAllGolfers.GolferImage#.gif" /><br />#qAllGolfers.GolferLastName#</div></td></tr>
			<script type="text/javascript">
				new Draggable('#qAllGolfers.GolferLastName##qAllGolfers.GolferID#',{revert:true});
			</script> 
		<cfset counter = 0>
	</cfif>
</cfoutput>

<!--- the following works!!!!
<ul id="examplelist2">
<cfoutput query="qAllGolfers">
		<li>
		<img src="#GolferImage#.gif" alt=""><br />#GolferLastName#
      	</li>
</cfoutput>
</ul>

		
	
		<!------>
		<script type="text/javascript" language="javascript">
		  Sortable.create('examplelist2',{ghosting:true,constraint:false})
		</script>
	--->
</tr>
</table>

<table width="500" class="white" cellpadding="10">
  	<tr>
		<td>Test eomajax component :: 'getFriendGroupCF' method
		</td>
		<td><a href="testeomajaxcomponent.cfm">test component</a><a href="#" onclick="updateNewGolferTableJS();return false;">Click to Update Golfers</a>
		</td>
	</tr>
  	<tr>
	  	<td>
		<select id="selgolfers" name="selgolfers" onchange="getgolferscoreJS();return false;" tabindex="2">
                        <cfoutput query="qAllGolfers">
                            <option value="#qAllGolfers.GolferID#">#qAllGolfers.GolferLastName#, #qAllGolfers.GolferFirstName#</option>
                        </cfoutput>
         </select>
		</td>
		<td><input type="text" size="4" maxlength="3" width="" name="golfer_score2" id="golfer_score2" value="" onblur="updategolferscoreJS();return false;" tabindex="1" />
		</td>
	  </tr>
	  <tr>
	  	<td><input type="text" name="txtGetFriendsEmail" id="txtGetFriendsEmail" value="" onblur="getFriendsEmailJS();return false;" />
		</td>
		<td><span id="friendsemailreturn"></span>
		</td>
	  </tr>
	  <tr>
			<td colspan="9" align="center"><a href="" onclick="Effect.Shake('testingscript');">test fade</a>
			<div style="" id="demo-effect-appear" onclick="Effect.Shake(this)">
				<img src="http://script.aculo.us/images/demo-logo.gif" alt="">
				<span>Click for Effect.Shake demo</span>
			  </div>
			<span id="testingscript">ZXc</span></td>
		</tr>
	  <tr>
		<!--- <td class="tblehead">Contestant</td> --->
		<td class="tblehead">Name</td>
		<!--- <td class="tblehead">First Name</td> --->
		<!---<td class="tblehead">Golfer <br>MEMO</td> --->
		<td class="tblehead">Current Score <br> Rel to Par</td>  <!--- Current Score <br> Rel to Par ---> <!--- ACTIVE?? --->
		<!--- <td class="tblehead">Update</td> --->
	  </tr>
	  <tr>
	  	<td>
		



		</td>
	  </tr>
  <cfoutput query="qAllGolfers">
	<!--- Form start :: user click causes golfer to be added to Temporary Team/"cart"--->
	<form onsubmit="updateScoreJS();return false;"> <!---action="admin_post_manage.cfm" method="post"--->
	  
	  <tr>
		<!--- <td class="ltturq"><img src="qualifier.gif" /></td> --->
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">#qAllGolfers.GolferID#</span>
		<!---<input type="text" name="golfer_id" id="golfer_id" value="#qAllGolfers.GolferID#" size="4" />--->
		#qAllGolfers.GolferLastName#, #qAllGolfers.GolferFirstName#</td>
		<!--- <td class="ltturq"></td> --->
		<!--- <td class="ltturq">
			  <!--- <input type="text" name="golfer_memo" value="#qAllGolfers.GolferMemo#" /> --->
		</td>
		--->
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="#qAllGolfers.CurrentScoreRelPar#" onblur="updateScoreJS();return false;"/> <!--- #qAllGolfers.CurrentScoreRelPar# #qAllGolfers.Active# --->
		</td>
		<!---
		<td class="ltturq" align="center">
			  
			  <!--- <input type="hidden" name="golfer_id" id="golfer_id" value="#qAllGolfers.GolferID#" /> --->
			  <!---
			  <input type="hidden" name="Last_Name" value="#qAllGolfers.GolferLastName#" />
			  <input type="hidden" name="First_Name" value="#qAllGolfers.GolferFirstName#" />
			  <input type="hidden" name="GolferImage" value="#qAllGolfers.GolferImage#" />
			  --->
			  <input type="image" name="add_button" src="../images/plusSign.gif" />
			  
		</td>
		--->
	  </tr>
	  
    </form>
	<!--- Form close --->
  </cfoutput>
</table>
<br>
<!--- 
<a href="/store/are_you_sure_you_want_to_clear_db.cfm">Clear database for new pool</a>
--->

<br>
