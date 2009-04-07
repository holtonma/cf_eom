<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Eye On Majors</title>
</head>
<link rel="STYLESHEET" type="text/css" href="styles.css">
<body bgcolor="#FFFFFF">
<table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="White"> 
<tr>
  <td class="dkblue" colspan="5"><img src="/images/spacer.gif" width="200" height="15" alt="" border="0"></td>
</tr>
<tr>
  <td class="white" colspan="5"><img src="/images/spacer.gif" width="200" height="5" alt="" border="0"></td>
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
		    <img src="/images/spacer.gif" width="25" height="5" alt="" border="0">
		  </td>
          <td> 
		    
          </td>
          <td class="white">
		    <img src="/images/spacer.gif" width="25" height="5" alt="" border="0">
		  </td>
          <td>
		    
          </td>
          <td class="white">
		    <img src="/images/spacer.gif" width="10" height="5" alt="" border="0">
		  </td>
          <td>
		    
          </td>
          <td class="white">
		    <img src="/images/spacer.gif" width="20" height="5" alt="" border="0">
		  </td>
          <td>
		    
          </td>
	      <td class="white">
		    <img src="/images/spacer.gif" width="20" height="5" alt="" border="0">
		  </td>
          <td> 
		    <a href="logout.cfm"><b class="header">Logout</b></a> 
          </td>
		  <td class="white"><img src="/images/spacer.gif" width="20" height="5" alt="" border="0"></td>
          <td>
		  	<cfif IsUserInRole('admin')>
		    	<a href="../admin/index.cfm"><b class="header">Admin</b></a> 
            </cfif>
		  </td>
		 
      </tr>
      <tr>
        <td class="white" colspan="5"><img src="/images/spacer.gif" width="200" height="30" alt="" border="0"></td>
      </tr>
      <tr>
        <td class="white" colspan="5">
		  
		</td>
      </tr>
      <tr>
        <td class="white" colspan="5"><img src="/images/spacer.gif" width="200" height="3" alt="" border="0"></td>
      </tr>
    </table></td>
</tr>
<tr>
  <td class="dkblue" colspan="5"><img src="/images/spacer.gif" width="200" height="1" alt="" border="0"></td>
</tr>
<!---tr>
  <td class="ltturq" colspan="5"><img src="../EoM/images/spacer.gif" width="200" height="25" alt="" border="0"></td>
</tr--->
<tr>
  <td colspan="10" class="ltturq">
  
    <!--- Add the administrative subnavigation. --->
	
	<table>
	  <tr>
		<td>&nbsp;
		</td>
	  </tr>
	</table>