<cfparam name="sHeaderMessage" default="Enter your email address and password" />
<cfset sFooterMessage = '#Year(now())#' & " Eye on Majors :: The Most Enjoyable and Competitive Golf Pool on the Planet!" />
<!-- -->
<cfset sHeaderMessage = "" />
<cfinclude template="header.cfm" />

<!--- 
used for testing to my email
<cfquery datasource="#sDSN2#" name="qGetAllEmailAddresses">
	SELECT emailaddy, fname, lname, entrantpassword
	FROM tentrant
	WHERE emailaddy LIKE '%@%'
	AND emailaddy LIKE '%.com'
	AND entrantid = 1
</cfquery> --->

<cfquery datasource="#sDSN2#" name="qGetAllEmailAddresses">
	SELECT entrantid, emailaddy, fname, lname, entrantpassword
	FROM tentrant
	WHERE emailaddy LIKE '%@%'
	AND emailaddy LIKE '%.com'
	AND emailaddy NOT LIKE '% %'
	ORDER BY entrantid ASC
</cfquery>

<!--- <cfquery datasource="#sDSN2#" name="qGetAllEmailAddressesCheck">
	SELECT entrantid, emailaddy, fname, lname, entrantpassword
	FROM tentrant
	WHERE emailaddy LIKE '%@%'
	AND emailaddy LIKE '%.com'
	AND emailaddy LIKE '% %'
</cfquery> --->
<!--- <cfdump var="#qGetAllEmailAddresses#">
<cfabort> --->
<!--- <style type="text/css">
	
</style>

<link rel="STYLESHEET" type="text/css" href="styles.css"> --->
 
    <!--- <table>
	  <tr>
	    <td>
		  <cfdump var="#qGetAllEmailAddresses#">
		  
		</td>
	  </tr>
	  
	  </table> --->
<cfoutput query="qGetAllEmailAddresses">
	<cfquery datasource="#sDSN2#" name="qGetGroup">
		SELECT tG.groupname, tG.grouppassword
		FROM tentrantgroup tEG LEFT OUTER JOIN tgroup tG ON tEG.groupid = tG.groupid
		WHERE
			tEG.entrantid = #qGetAllEmailAddresses.entrantid#
			AND
			tEG.eventid = 9 
	</cfquery>
	<cfmail from="EyeOnMajors@eyeonmajors.com" to="#qGetAllEmailAddresses.emailaddy#" replyto="eyeonmajors@gmail.com" subject="EyeOnMajors.com 2007 Masters -- Off and Running!" type="HTML">
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

       	<title>EyeOnMajors.com - Enjoy near RealTime scoring during the 2007 Masters!</title>
		<link rel="STYLESHEET" type="text/css" href="styles.css">
       	<style>
			.trborder {
				border-color: ##003300;
				background-color: ##DDFFCC;
			}
		</style>

</head>

<body>

<div>Dear #qGetAllEmailAddresses.fname# #qGetAllEmailAddresses.lname#,</div>
<div align="center" style="padding:10px;">
	<span style="font-size:18px;color:green;">EyeOnMajors.com Masters 2007 is off and running!</span></br></br>
</div>
<div style="padding:10px;">
	Good luck to you in your group matches, and also versus the thousand or so competitors vying for the global prizes -- enjoy the week.  
</div>
<div style="padding:10px;">  
	<span style="font-weight:bold;color:green;">
	Login and catch the action on EyeOnMajors.com, with our near real time pool scoring, courtesy of our advanced scoring system, known as "Wally".</br></br>
	</span>	
</div>
<div style="font-size:16px;" align="center">
		<div align="center" style="font-size:22px;color:green;">
		<a href="www.eyeonmajors.com" target="_blank">www.eyeonmajors.com</a>
		</div>
		<div>login: <strong style="font-size:20px; color:blue;">#emailaddy#</strong></div>
		<div>password: <strong style="font-size:20px; color:blue;">#entrantpassword#</strong></div>
</div>
<div style="padding:10px;"></div>

		<table width="800px">    
    	<tr>
	      <td colspan="3" bgcolor="black"><div align="center">
		  </td>
	    </tr>
	    <tr>
		  <td colspan="3">
		  </td>
		</tr>
		<tr>
	      <td colspan="3"><div align="center" style="font-size:12px;padding:10px;">
	      At EyeOnMajors.com, all services are 100% free.  That's almost as reasonable as the price of a Pimento Cheese sandwich at Augusta. <br>
	      Chances are, you, your office, and your friends will enjoy.
	      
	</div></td>
	    </tr>
	  </table>
	  <table width="800px" border="1" bordercolor="999999">
	    <tr>
	      <td width="500">
		      <img src="www.eyeonmajors.com/EyeOnMajors_Masters.jpg" alt="EyeOnMajors.com :: The Most Enjoyable Golf Pool on the Planet!" width="500" height="300"></td>
	      <td width="290" style="font-size:14px;">
			<p align="left">Enjoy this year's Masters,</br>friends and patrons!</br>
	          </br>Best of luck! </p>
	      	<p align="center" class="style13">- EyeOnMajors.com</p>
	      </td></tr>
	     </table>
	     <table width="800px" border="0">
	      <tr style="border: 0px;"><td colspan="2" style="color:silver; font-size:small;" align="center">
		      If you have any questions, you can always email us at: eyeonmajors@gmail.com!  Thanks for playing and good luck!
		      <div style="font-size:x-small;">To unsubscribe from these mailings, reply to this message with "UNSUBSCRIBE" in the subject line.</div>
			</td></tr>
	  	<tr style="border: 0px;"><td colspan="2" style="color:gray;  font-size:small;" align="center"><i>EyeOnMajors : Striving to Be Most Challenging and Enjoyable Golf Pool on the Planet!</i></td></tr>
		<tr>
			<td colspan="2" align="center" style="color:gray;">
				</td>
		</tr>
		</table>
		<div align="center" style="font-size: small; color:silver;">Brought to you by:</div>
		<div align="center" style="">Albatross Software - Software for the Serious Golfer</div>
		<div align="center"><a href="www.atross.com"><img src="www.eyeonmajors.com/albatrosslogo.gif" alt="Atross.com :: Software for the Serious Golfer" width="145" height="40"></a></div>
</body>

</html>
		
		
		 
	  
	</cfmail>
</cfoutput>
	
	
<cfinclude template="footer.cfm" />