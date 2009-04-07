<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Eye On Majors</title>
<script src="../js/prototype.js" type='text/javascript'> </script>
<script src="../js/scriptaculous.js" type="text/javascript"> </script>
<!--- <script src='../js/Tooltip.js' type='text/javascript'> </script> --->

<!---
<script type="text/javascript">
  new Ajax.PeriodicalUpdater($('updateheadline'),
        "qry_getHeadlines.cfm", {
              frequency: 20,
              onSuccess: function() {
                        Element.setOpacity('updateheadline', 0.0); 
                        Effect.Appear('updateheadline', { duration: 2.0 });
              }
        }
  );
</script>
--->

<!--- onLoad="MM_preloadImages('usopen_tiny_r1_c1_1_f2.gif', 'images/demsey_interview_r1_c1_1_f2.gif');" --->
</head>
<link rel="STYLESHEET" type="text/css" href="../styles.css">
<body bgcolor="#FFFFFF">
<div align="center">
<table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="White"> 
<tr>
  <td class="dkblue" colspan="5"><img src="../images/spacer.gif" width="200" height="15" alt="" border="0"></td>
</tr>
<tr>
  <td class="white" colspan="5"><img src="../images/spacer.gif" width="200" height="5" alt="" border="0"></td>
</tr>
<tr> 
  <td class="white" colspan="5"></td>
    
</tr>
<tr>
  <td class="dkblue" colspan="5"><img src="../images/spacer.gif" width="200" height="1" alt="" border="0"></td>
</tr>
<!---tr>
  <td class="ltturq" colspan="5"><img src="../EoM/images/spacer.gif" width="200" height="25" alt="" border="0"></td>
</tr--->
<tr>
  <td colspan="10" class="ltturq">
 
<table width="751" border="0" cellpadding="0" cellspacing="0" bgcolor="White">
<!-- fwtable fwsrc="MastersHeader.png" fwbase="mastersheader.gif" fwstyle="Dreamweaver" fwdocid = "736000091" fwnested="1" -->
  <tr><!-- row 1 -->
   <td colspan="3"><img name="mastersheader_r1_c1" src="../images/mastersheader_r1_c1.gif" width="751" height="12" border="0" alt=""></td>
  </tr>
  <cfif GetAuthUser() NEQ "">
  <tr><!-- row 2 -->
   <td colspan="3"><table align="left" border="0" cellpadding="0" cellspacing="0" width="751">
	  <tr><!-- row 1 -->
	   <td><img name="mastersheader_r2_c1" src="../images/mastersheader_r2_c1.gif" width="30" height="39" border="0" alt=""></td>
	   <td><a href="../index.html"> <img name="eomhome" src="../images/eomhome.gif" width="104" height="39" border="0" alt=""></a></td>
	   <td><img name="mastersheader_r2_c3" src="../images/mastersheader_r2_c3.gif" width="18" height="39" border="0" alt=""></td>
	   <td><a href="../store/major_leaderboard.cfm"><img name="majorleaderboard" src="../images/majorleaderboard.gif" width="94" height="39" border="0" alt=""></a></td>
	   <td><img name="mastersheader_r2_c5" src="../images/mastersheader_r2_c5.gif" width="18" height="39" border="0" alt=""></td>
	   <td><a href="../store/groupleaderboard_present.cfm"><img name="poolleaderboard" src="../images/poolleaderboard.gif" width="92" height="39" border="0" alt=""></a></td>
	   <td><img name="mastersheader_r2_c7" src="../images/mastersheader_r2_c7.gif" width="18" height="39" border="0" alt=""></td>
	   <td><a href="../store/messageboard.cfm"><img name="messageboard" src="../images/messageboard.gif" width="72" height="39" border="0" alt=""></a></td>
	   <td><img name="mastersheader_r2_c9" src="../images/mastersheader_r2_c9.gif" width="18" height="39" border="0" alt=""></td>
	   <td><a href="../logout.cfm"><img name="logout" src="../images/logout.gif" width="62" height="39" border="0" alt=""></a></td>
	   <td><img name="mastersheader_r2_c11" src="../images/mastersheader_r2_c11.gif" width="18" height="39" border="0" alt=""></td>
	   <td><img name="mastersheader_r2_c12" src="../images/mastersheader_r2_c12.gif" width="123" height="39" border="0" alt=""></td>
	   <td>
		   <!--- IsUserInRole('admin') --->
		   <cfif (SESSION.entrantid eq 1 OR SESSION.entrantid eq 62 OR SESSION.entrantid eq 29)><a href="../store/admin_post_data.cfm"><img name="admin" src="../images/admin.gif" width="52" height="39" border="0" alt=""></a>
	       <cfelse><img name="admin" src="../images/mastersheadernoadmin.gif" width="52" height="39" border="0" alt=""></cfif></td>
	   <td><img name="mastersheader_r2_c14" src="../images/mastersheader_r2_c14.gif" width="32" height="39" border="0" alt=""></td>
	  </tr>
	</table></td>
  </tr>
  <tr><!-- row 3 -->
   <td colspan="3"><img name="mastersheader_r3_c1" src="/images/mastersheader_r3_c1.gif" width="751" height="49" border="0" alt=""></td>
  </tr>
  <tr>
  </tr>
  
  <tr>
  	<!--- <td colspan="2" align="center"> --->
		<!--- <cfinclude template="../googleadinclude.html"> --->
		<!--- <script type="text/javascript"><!--
		google_ad_client = "pub-3488777663690401";
		google_alternate_color = "0000FF";
		google_ad_width = 468;
		google_ad_height = 60;
		google_ad_format = "468x60_as";
		google_ad_type = "text_image";
		//2007-04-04: eom inside header
		google_ad_channel = "0950415895";
		google_color_border = "E6E6E6";
		google_color_bg = "FFFFFF";
		google_color_link = "11593C";
		google_color_text = "000000";
		google_color_url = "008000";
		//-->
		</script>
		<script type="text/javascript"
		  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
		</script>	 --->
	<!--- </td> --->
	<td align="center" class="white" width="30%">
	  <p align="center">
	  	<div style="padding:8px;">
		  	<a href="/store/picjournal/Masters_2005_photojournal.cfm">
			  	<span class="picclick" title="...images courtesy of Mike 'Sandbaggolfer' Giato, EoM's man on the scene. Thanks, Mike!!">
				  View Images from 2005 Masters
				</span>
			</a>
		</div>
		<div style="padding:8px;">
		  	<a href="http://community.webshots.com/user/jaredelliot" target="_blank">
			  	<span class="picclick" title="...images courtesy of Mike 'Sandbaggolfer' Giato, EoM's man on the scene. Thanks, Mike!!">
				  View Images from 2005 US Open
				</span>
			</a>
		</div> 
		<div style="padding:8px;">
		  	<a href="US Open 2006 (Wednesday)/index.html" target="_blank">
			  	<span class="picclick" title="...images courtesy of Mike 'Sandbaggolfer' Giato, EoM's man on the scene. Thanks, Mike!!">
				  View Images from 2006 US Open
				</span>
			</a>
		</div>
		<div style="padding:6px;">
		  	<a href="US Open 2006 (Wednesday)/index.html" target="_blank">
			  	Sandbagger Photography
			</a>
		</div>   
		<div style="padding:6px;"><div>Images courtesy of</div><div>Mike "Sandbagger" Inguagiato</div><div>Professional Golf Photographer</div> </div>
	  <!--- </span>
	  <a href="http://community.webshots.com/user/jaredelliot" target="_blank"><span class="picclick" title="...images courtesy of Sandbagger, Jared Elliot, and Richard Elliot, EoM's men on the scene. Thanks, Mike!!">View Images from 2005 US Open</a>
	  </span>
	  <a href="US Open 2006 (Wednesday)/index.html" target="_blank"><span class="picclick" title="...images courtesy of Sandbagger, EoM's man on the scene. Thanks for the great photos, Mike!">View Images from 2006 US Open</span></a> 
	  </br> --->
	  
	  
	  
	  <!---<br>
	  <a href="funpolls.cfm"><span class="picclick" title="...vote on various golf topics!">EyeOnMajors Fun Polls HERE!</span> </a> <a href="/Big_Wie-sy_Michelle_Wie.html"><span class="picclickpink" title="...history in the making!">Michelle Wie Update HERE! </span></a>
		--->
	</td>

	  <td align="center" class="white">
		
		<div id="printable" style="width:100%;" align="center"><a href="group_leaderboard_pdf.cfm"><img src="50x50paper.gif" border="0"><div style="padding:2px;">Click to Print</div><div style="padding:2px;">Your Group's Standings</div></a></div></div>
		<!--- <div id="updateheadline">
			<!---
			<p>
			Loading...
			</p>
			--->
		</div> --->
		  <!---
		  Who will take your group's prize?<br>
		  Who will join the prestigious<br> 
		  CHAMPIONS LOCKER ROOM? 
		  --->
	</td> 
	<cfquery name="qGetEventInfo" datasource="#sDSN2#">
		SELECT 
			tE.eventid, tE.eventnameid, tE.eventyear,
			tEN.eventname
		FROM tevents tE INNER JOIN teventname tEN ON tE.eventnameid = tEN.eventnameid
		WHERE tE.eventid = #SESSION.eventid#
	</cfquery>
    <td align="center" class="mastersgreen" width="30%"><a href="/store/global_leaderboard_present.cfm"><img src="/images/global_leaderboard_r2_c2_3.gif" width="121" height="98" border="0"></a><br>
	<cfoutput>
		Click icon above for Global Pool Leaderboard<br>
		<span class="mastersbigbold" title="#qGetEventInfo.eventname#">#qGetEventInfo.eventname# #qGetEventInfo.eventyear#</span>
	</cfoutput>	
	</td>
  </tr>
  <tr>
	<td colspan="3">
		<!-- ++Begin News Bar Wizard Generated Code++ -->
  <!--
  // Created with a Google AJAX Search Wizard
  // http://code.google.com/apis/ajaxsearch/wizards.html
  -->

  <!--
  // The Following div element will end up holding the actual newsbar.
  // You can place this anywhere on your page.
  -->
  <div id="newsBar-bar" style="padding:12px;">
    <span style="color:#676767;font-size:11px;margin:10px;padding:4px;">Loading...</span>
  </div>

  <!-- Ajax Search Api and Stylesheet
  // Note: If you are already using the AJAX Search API, then do not include it
  //       or its stylesheet again
  //
  // The Key Embedded in the following script tag is designed to work with
  // the following site:
  // http://www.eyeonmajors.com
  -->
  <script src="http://www.google.com/uds/api?file=uds.js&v=1.0&source=uds-nbw&key=ABQIAAAAitvfAQtSnPArbi5EOc_YWRRW1X_Z3TD5t5Vr7_V0G4MfTI56ehRiV9t8lQNqXLCGX2M3KWHoDnRb_w"
    type="text/javascript"></script>
  <style type="text/css">
    @import url("http://www.google.com/uds/css/gsearch.css");
  </style>

  <!-- News Bar Code and Stylesheet -->
  <script type="text/javascript">
    window._uds_nbw_donotrepair = true;
  </script>
  <script src="http://www.google.com/uds/solutions/newsbar/gsnewsbar.js?mode=new"
    type="text/javascript"></script>
  <style type="text/css">
    @import url("http://www.google.com/uds/solutions/newsbar/gsnewsbar.css");
  </style>

  <script type="text/javascript">
    function LoadNewsBar() {
      var newsBar;
      var options = {
        largeResultSet : false,
        title : "EyeOnMajors.com News",
        horizontal : true,
        autoExecuteList : {
          executeList : ["PGA", "PGA Championship" "Tiger Woods", "Southern Hills", "golf", "Adam Scott", "Sergio Garcia", "Phil Mickelson", "Charles Howell", "Chris DiMarco", "Ernie Els", "Angel Cabrera", "Padraig Harrington"]
        }
      }

      newsBar = new GSnewsBar(document.getElementById("newsBar-bar"), options);
    }
    // arrange for this function to be called during body.onload
    // event processing
    GSearch.setOnLoadCallback(LoadNewsBar);
  </script>
<!-- ++End News Bar Wizard Generated Code++ -->
	</td>
  </tr>
  <!--- <tr>
    <td width="323" align="center" class="white"><div align="left"><span class="mastersgreen">
	<!-- Golf's Last Major Champion: Tiger Woods, British, -14</span><br></div>
      <div align="left">
	  	<span class="mastersgreen">Last EyeOnMajors.com Champion: Kevin Kelly, British, -26</span> 
		<span class="cut"> --> </span>
	  </div>
	 
	</td>
    <td width="287" align="center" class="mastersgreen">
	<!--- Todd Demsey, <a href="http://www.atross.com/" target="_blank">Aviary User</a>, opens with <span class="grosssubpartextonwhite">67</span>-<span class="grosssubpartextonwhite">71-69-72</span> (<span class="grosssubpartextonwhite">-9</span>) in Nationwide Tour event this week! ---></td>
    <td width="209" align="center" class="white"><div align="right"></div></td>
  </tr> 
<p><a href="../store/PimentoCheese.cfm"> </a><br>--->
	
  <tr>
    <td colspan="3" align="center" class="white">
		<div align="center">
      	Thursday through Sunday Afternoon Near-Real-Time Scoring Courtesy of &quot;Wally&quot;</p>
      	</div>
		<cfquery name="qGetHandicaps" datasource="#sDSN2#">
			SELECT
				tH.golferid, tH.numstrokes, tG.GolferFirstName, tG.GolferLastName
			FROM thandicaps tH INNER JOIN tgolfer tG ON tH.golferid = tG.golferid
			WHERE tH.numstrokes NOT IN(0) 
			AND tH.groupid = 1
			AND tH.eventid = #SESSION.eventid#
			AND tG.active = 1
			ORDER BY tH.numstrokes DESC
		</cfquery>
		<div id="divhandicaps" style="display:none;" align="center">
		<cfoutput>
		<div align="center">
		<strong style="color:green;">
		#qGetEventInfo.eventname# #qGetEventInfo.eventyear# Handicaps:
		</strong>
		<div>
		</cfoutput>
		<cfset counter = 0>
		<cfoutput query="qGetHandicaps">
			<cfset counter = counter + 1>
			<cfif counter eq qGetHandicaps.RecordCount>
				#GolferFirstName# #GolferLastName# = #numstrokes# shots 
			<cfelse>
				#GolferFirstName# #GolferLastName# = #numstrokes# shots :
			</cfif>
			
		</cfoutput>
		
		<p>
		Tiger is too easy of a selection otherwise.... it's  the &quot;most challenging golf pool on the planet&quot; for good reason. <br>
        </p>
      </div></td>
  </tr>
	<!--- <tr>
		<td colspan="7" align="center">
			<script type="text/javascript"><!--
			google_ad_client = "pub-3488777663690401";
			google_ad_width = 728;
			google_ad_height = 90;
			google_ad_format = "728x90_as";
			google_ad_type = "text_image";
			//2007-04-04: eom inside header
			google_ad_channel = "0950415895";
			google_color_border = "E6E6E6";
			google_color_bg = "FFFFFF";
			google_color_link = "11593C";
			google_color_text = "000000";
			google_color_url = "008000";
			//-->
			</script>
			<script type="text/javascript"
			  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
		</td>
	</tr> --->
  <cfelse>
  	<td colspan="7"><b class="header">Eye On Majors :: Login or Register </b></td> 
  </cfif>
  <tr>
        <td class="white" colspan="7">
		  <cfoutput>
		  #sHeaderMessage#
		  </cfoutput>
		</td>
   </tr>
</table>
</div>
