

<!--- defaults to last groupid, eventually will allow more than 1 group  --->

<cfif IsDefined("SESSION.eventid")>
	<cfparam name="pagegroupid" default="#SESSION.patrongroupid#">  
		<cfquery datasource="#sDSN2#" name="qYourGroup" >
			SELECT 
				groupname as PoolGroupName
			FROM 
				tgroup
			WHERE 
				groupid = #SESSION.patrongroupid#
		</cfquery>
<cfinclude template="eom_header.cfm">

<body id="bGroup">
  <cfinclude template="eom_tabs.cfm">      
  
  <div id="group_leaderboard" align="center">
  <div class="subtle">Welcome
	  <cfif IsDefined("SESSION.patronfirstname")><cfoutput><b>#SESSION.patronfirstname# #SESSION.patronlastname#</b></cfoutput></cfif>!
	  We're glad you're back.  Golfer and Group scores are updated every 4 minutes...
	</div>
    <div id="mygroupsboard" align="center" style="padding-bottom:50px;">
      <div class="section_head">OFFICIAL Group Leaderboard - Group "<b><cfoutput>#qYourGroup.PoolGroupName#</cfoutput></b>"</div>
			<cfinclude template="portlet_group_leaderboard.cfm">
			<div style="padding:15px;"><cfinclude template="music_on_off.cfm"></div>
			<hr>
			
			<!---  --->
			<cfinclude template="group_leaderboard_core_MC2.cfm"> 
			
			
    </div>
    <div id="majortop10" class="right_col">
	    <cfinclude template="portlet_major_top10.cfm">
    </div>
    <cfinclude template="portlet_msg_board.cfm">
		<div id="committeemsg" class="right_col">
	    <div class="section_head">From 'The Committee':</div>
      <p>
	      <cfif SESSION.patrongroupid eq 1>
		       Group 'Magical' send $10 Masters entry fee to: 
		       <div style="font-weight:bold;font-size: 14px;">Mr. Eye | P.O. Box 2398 | Glenview, IL 60025</div>
					 <div align="center" style="font-weight:normal;font-size:11px;">(as always, in lieu of snail-mail you can PayPal $10 to: holtonma@gmail.com)</div>
		    <cfelse>
			     Caveat Emptor and Enjoy
		    </cfif>
		    <hr>
		    <div>Good luck this week!</div>
				<div>
					Thanks for playing, one and all!  Suggestions or feedback? <a href="http://eyeonmajors.com/feedback.cfm">
				</div>
		    <hr>
		    <div style="font-weight:bold; font-size: 12px;padding: 3px;">All Patrons</div>
		    <div style="font-weight:normal;font-size:10px;padding: 4px;margin: 3px;text-align:left;">
			  Did you and your group enjoy the event?  If so, you can say 'thanks' by donating a pint of Guinness to The Committee.  Donations are completely optional and voluntary, but help us add new features to the site for you.  Appreciate your patronage!
			  <div style="padding:3px;" align="center"><a href='http://www.pledgie.com/campaigns/1265'><img alt='Click here to lend your support to: EyeOnMajors and make a donation at www.pledgie.com !' src='http://www.pledgie.com/campaigns/1265.png?skin_name=chrome' border='0' /></a></div>
			  </div>
	    </p>
    </div>
    <div id="committeemsg" class="right_col" align="center">
      <div class="section_head">Fast &amp; Secure Browsing:</div>
      <cfinclude template="../ad_group_right2.htm">
    </div>
  </div>
  
  <div id="bottom_section">
    <script type="text/javascript"><!--
		google_ad_client = "pub-3488777663690401";
		/* 728x90, created 3/15/08, group leaderboard bottom */
		google_ad_slot = "0561673053";
		google_ad_width = 728;
		google_ad_height = 90;
		//-->
		</script>
		<script type="text/javascript"
		src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
		</script>
  </div>
  
  <div class="subtle">
    We strive to continue to improve your experience. Enjoy and thank you for playing our game and using our site to interact with your friends and family.
  </div>
	<cfif SESSION.entrantid eq 1>
		<div>
		    <cfdump var="#SESSION#">
		    <!---
			  <cfdump var="#fullsquadlist#">
			  <cfdump var="#fullsquadlist#">
				<cfdump var="#qAllTeamsInGroup#">--->
		</div>
  </cfif>

  
  
</body>

<!--- <script type="text/javascript" src="eomjson.js"></script> --->
<!--- 
<script type="text/javascript">
	//$('JSONorig').innerHTML = returnGroupTeams.GroupTeams.Teams;
	//console.log(returnGroupTeams.GroupTeams.GROUPID);
	//console.log(returnGroupTeams.GroupTeams.EVENTID);
	//console.log(returnGroupTeams.GroupTeams.TEAMS);
	// let's start parsing
	var cGroupID = returnGroupTeams.GroupTeams.GROUPID;
	var cEventID = returnGroupTeams.GroupTeams.EVENTID;
	var aTeams = returnGroupTeams.GroupTeams.TEAMS;
	var lb_id = 'mygroupsboard';
	$(lb_id).innerHTML = "";
	// 2. build HTML table for group, along with "Add Group Member" auto-complete pieces
	new Insertion.Bottom(lb_id, "<div class='section_head'>Group Leaderboard - Group [Group Name]</div><table id='tblEoMGroup'><caption id='tblCaption'>Group: " + cGroupID + "</caption><tbody id='tblEoMGroupbody'><tr><td></td></tr></tbody></table>");
	// add row related to who created the table and when
	new Insertion.Top('tblEoMGroupbody', "<tr class='groupinfo'><td colspan='9'><strong>EventID:</strong> " + cEventID +  " <strong></strong></td></tr>");
	new Insertion.Bottom('tblEoMGroupbody', "<tr class='glb_header'><td>Name</td><td>Golfer 1</td><td>Golfer 2</td><td>Golfer 3</td><td>Golfer 4</td><td>Golfer 5</td><td>Golfer 6</td><td>Total Gross</td><td>Total Net</td></tr>");
	
	var i = 0
	aTeams.each(function(aElem){
		i++; //increment i
		var cTeamID = aElem.TEAMID;
		var cEntrantID = aElem.ENTRANTID;
		var cEFName = aElem.ENTRANTFNAME;
		var cELName = aElem.ENTRANTLNAME;
		var cEGross = aElem.TOTALGROSSRELPAR;
		var cENet = aElem.TOTALNETRELPAR;
		var aGolfers = aElem.GOLFERS;
		var tr_id = 'elemGolfer' + i;
		//console.log(aGolfers);
		//console.log(tr_id);
		new Insertion.Bottom('tblEoMGroupbody', "<tr class='eomTeamRow' id='" + tr_id + "'><td class='ltturq'>" + cEFName + ", " + cELName + "</td></tr>");
			// so now we have an array of aGolfers.  Enumerate thru this and output that info
			aGolfers.each(function(aGElem){
				var golferID = aGElem;
				
				active_golfers.GOLFERS.each(function(g){
					if (g.GOLFERID == golferID){
						new Insertion.Bottom(tr_id, "<td class='eomGolfer' id='elemGolfer'><div id='divElemGolfer'><div id='elemGimg' class='gimage'><img src='http://s3.amazonaws.com/eomgimages/" + g.IMG_PATH + "?AWSAccessKeyId=1KPNG3WA9272379AQN02'></div><div id='elemGname' class='cElemGname'>" + g.GOLFERLNAME + "</div><div class='Gscore' id='elemGscore' align='center'>" + g.CURRENTSCORERELPAR + "</div></div></td>");
					}
				})
			});
			new Insertion.Bottom(tr_id, "<td class='ltturq' id='elemGolfer' class='score_gross'>" + cEGross + "</td>");
			new Insertion.Bottom(tr_id, "<td class='ltturq' id='elemGolfer' class='score_net'>" + cENet + "</td>");
			// for now just make all score DIVs green with white lettering
			$$('.Gscore').each(function(el){if(el){el.setStyle({backgroundColor: '#006600', color: 'white'})}})  
	})
	
</script> --->
<script type="text/javascript">
Event.observe(window, 'load', function(){
  Event.observe('post_msg', 'click', post_message.bind('post_msg'));
});
</script>

</html>
<cfelse>
	<cflocation url="../login_form.cfm">
</cfif>

