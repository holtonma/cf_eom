<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Eye On Majors</title>
</head>
<link rel="STYLESHEET" type="text/css" href="../styles.css">
<body bgcolor="#FFFFFF">
<table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="White"> 
<tr>
  <td class="dkblue" colspan="5"><img src="../images/spacer.gif" width="200" height="15" alt="" border="0"></td>
</tr>
<tr>
  <td class="white" colspan="5"><img src="../images/spacer.gif" width="200" height="5" alt="" border="0"></td>
</tr>
<tr> 
  <td class="white" colspan="5"> 
    <table border="0" cellspacing="0" cellpadding="0">
      <tr> 
        		<!--- Make this part of the code conditional, so only users that have logged in can
		      	see the navigation items. --->
		<cfif GetAuthUser() NEQ "">
		
          <td> 
		    <a href="../index.html"><b class="header">EoM Home</b></a> 
          </td>
          <td class="white">
		    <img src="../images/spacer.gif" width="25" height="5" alt="" border="0">
		  </td>
          <td> 
		     <a href="../store/major_leaderboard.cfm"><b class="header">Major <br>Leaderboard</b></a> 
          </td>
          <td class="white">
		    <img src="../images/spacer.gif" width="25" height="5" alt="" border="0">
		  </td>
          <td>
		     <a href="../store/groupleaderboard_present.cfm"><b class="header">Pool <br>Leaderboard</b></a> 
          </td>
          <td class="white">
		    <img src="../images/spacer.gif" width="10" height="5" alt="" border="0">
		  </td>
          <td>
		     
          </td>
          <td class="white">
		    <img src="../images/spacer.gif" width="20" height="5" alt="" border="0">
		  </td>
          <td>
		    <a href="../store/messageboard.cfm"><b class="header">Message <br>Board</b></a> 
          </td>
	      <td class="white">
		    <img src="../images/spacer.gif" width="20" height="5" alt="" border="0">
		  </td>
          <td> 
		    <a href="../logout.cfm"><b class="header">Logout</b></a> 
          </td>
		  <td class="white"><img src="../images/spacer.gif" width="20" height="5" alt="" border="0"></td>
          <td>
		  	<cfif IsUserInRole('admin')>
		    	<a href="../store/admin_post_data.cfm"><b class="header">Admin</b></a> 
            </cfif>
		  </td>
		 <cfelse>
		  <td colspan="5"><b class="header">Eye On Majors :: Login or Register </b></td> 
		 </cfif>
      </tr>
      <tr>
        <td class="white" colspan="5"><img src="../images/spacer.gif" width="200" height="30" alt="" border="0"></td>
      </tr>
      <tr>
        <td class="white" colspan="5">
		  <cfoutput>
		  #sHeaderMessage#
		  </cfoutput>
		</td>
      </tr>
      <tr>
        <td class="white" colspan="5"><img src="../images/spacer.gif" width="200" height="3" alt="" border="0"></td>
      </tr>
    </table></td>
</tr>
<tr>
  <td class="dkblue" colspan="5"><img src="../images/spacer.gif" width="200" height="1" alt="" border="0"></td>
</tr>
<!---tr>
  <td class="ltturq" colspan="5"><img src="../EoM/images/spacer.gif" width="200" height="25" alt="" border="0"></td>
</tr--->
<tr>
  <td colspan="10" class="ltturq">
  
    <table border="0" cellpadding="0" cellspacing="0" width="751">
<!-- fwtable fwsrc="MastersHeader.png" fwbase="mastersheader.gif" fwstyle="Dreamweaver" fwdocid = "736000091" fwnested="1" -->
  <tr><!-- row 1 -->
   <td><img name="mastersheader_r1_c1" src="../images/mastersheader_r1_c1.gif" width="751" height="12" border="0" alt=""></td>
  </tr>
  <cfif GetAuthUser() NEQ "">
  <tr><!-- row 2 -->
   <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="751">
	  <tr><!-- row 1 -->
	   <td><img name="mastersheader_r2_c1" src="../images/mastersheader_r2_c1.gif" width="30" height="39" border="0" alt=""></td>
	   <td><a href="../index.html"> <img name="eomhome" src="../images/eomhome.gif" width="104" height="39" border="0" alt=""></a></td>
	   <td><img name="mastersheader_r2_c3" src="../images/mastersheader_r2_c3.gif" width="18" height="39" border="0" alt=""></td>
	   <td><a href="../store/major_leaderboard.cfm"><img name="majorleaderboard" src="../images/majorleaderboard.gif" width="94" height="39" border="0" alt=""></a> </td>
	   <td><img name="mastersheader_r2_c5" src="../images/mastersheader_r2_c5.gif" width="18" height="39" border="0" alt=""></td>
	   <td><a href="../store/groupleaderboard_present.cfm"><img name="poolleaderboard" src="../images/poolleaderboard.gif" width="92" height="39" border="0" alt=""></a> </td>
	   <td><img name="mastersheader_r2_c7" src="../images/mastersheader_r2_c7.gif" width="18" height="39" border="0" alt=""></td>
	   <td><a href="../store/messageboard.cfm"><img name="messageboard" src="../images/messageboard.gif" width="72" height="39" border="0" alt=""></a> </td>
	   <td><img name="mastersheader_r2_c9" src="../images/mastersheader_r2_c9.gif" width="18" height="39" border="0" alt=""></td>
	   <td><a href="../logout.cfm"><img name="logout" src="../images/logout.gif" width="62" height="39" border="0" alt=""></a> </td>
	   <td><img name="mastersheader_r2_c11" src="../images/mastersheader_r2_c11.gif" width="18" height="39" border="0" alt=""></td>
	   <td><img name="mastersheader_r2_c12" src="../images/mastersheader_r2_c12.gif" width="123" height="39" border="0" alt=""></td>
	   <td>
			<cfif IsUserInRole('admin')>
				<a href="../store/admin_post_data.cfm"><img name="admin" src="../images/admin.gif" width="52" height="39" border="0" alt=""></a> 
			<cfelse>
				<img name="admin" src="../images/mastersheadernoadmin.gif" width="52" height="39" border="0" alt="">
			</cfif>
	   </td>
	   <td><img name="mastersheader_r2_c14" src="../images/mastersheader_r2_c14.gif" width="32" height="39" border="0" alt=""></td>
	  </tr>
	</table></td>
  </tr>
  <tr><!-- row 3 -->
   <td><img name="mastersheader_r3_c1" src="../images/mastersheader_r3_c1.gif" width="751" height="49" border="0" alt=""></td>
  </tr>
  <cfelse>
  </cfif>
  <tr>
        <td class="white" colspan="5">
		  <cfoutput>
		  #sHeaderMessage#
		  </cfoutput>
		</td>
      </tr>
</table>