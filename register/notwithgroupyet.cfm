<cfparam name=sHeaderMessage default="Enter your email address and password" />
<cfset sFooterMessage = "Eye on the Majors 2005 :: The most enjoyable and competitive golf pool on the planet!" />
<!-- "Not already signed up with Eye on Majors? <a href='register/user_registration.cfm'>Register HERE</a>" /> -->
<cfset sHeaderMessage = "" />
<cfinclude template="header.cfm" />
<link rel="STYLESHEET" type="text/css" href="styles.css">

<body>
	<!--- GetAuthUser:<cfdump var="#GetAuthUser()#"> --->
	GetAuthUser: <cfdump var="#GetAuthUser()#"> </br>
	SESSION.entrantid: <cfdump var="#SESSION.entrantid#"> </br>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <!-- row 1 -->
    <td>Since you have not registered with a group yet, simply sign-in to an existing group, or create a group! It's that simple.</td>
  </tr>
  <tr>
    <!-- row 2 -->
    <td width="800" height="20">&nbsp;</td>
  </tr>
  <tr>
    <!-- row 3 -->
    <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="800">
        <tr>
          <!-- row 1 -->
          <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="722">
              <tr>
                <!-- row 1 -->
                <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="722">
                    <tr>
                      <!-- row 1 -->
                      <td width="60" height="242">&nbsp;</td>
                      <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="662">
                          <tr>
                            <!-- row 1 -->
                            <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="662">
                                <tr>
                                  <!-- row 1 -->
                                  <td width="190"><a href="/register/group_registration.cfm">Create Group for friends and office mates to join?</a> </td>
                                  <td>Create a Group Name and Group Password, and easily distribute  to friends, office-mates, fellow golf fans that you want in your pool group. </td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <!-- row 2 -->
                            <td width="662" height="44">&nbsp;</td>
                          </tr>
                          <tr>
                            <!-- row 3 -->
                            <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="662">
                                <tr>
                                  <!-- row 1 -->
                                  <td width="190"><a href="/register/register_with_existing_group.cfm">Sign-In to my existing group of friends &amp; office mates? </a></td>
                                  <td>
									<p>
									I already have an Eye On Majors group that I'm with, and know my Group Name and Password. </br></br>
                                    I want to set my team for this major! (you will enter the Group Name and Password when you click this link), 
									</p>
                                  </td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <!-- row 4 -->
                            <td width="662" height="37">&nbsp;</td>
                          </tr>
                          <tr>
                            <!-- row 5 -->
                            <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="662">
                                <tr>
                                  <!-- row 1 -->
                                  <td width="191">&nbsp;</td>
                                  <td width="471">&nbsp;</td>
                                </tr>
								<tr>
                            <!-- row 4 -->
                            <td width="191" height="37">&nbsp;</td>
                          </tr>
								<tr>
                                  <!-- row 1 -->
                                  <td width="191">&nbsp;</td>
                                  <td>&nbsp;</td>
								</tr>
                            </table></td>
                          </tr>
                      </table></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <!-- row 2 -->
                <td width="722" height="250"><div align="center">
				<!-- Google Code for Signup Conversion Page -->
				<script language="JavaScript" type="text/javascript">
				<!--
				var google_conversion_id = 1071791845;
				var google_conversion_language = "en_US";
				var google_conversion_format = "1";
				var google_conversion_color = "DDFFCC";
				if (1) {
				  var google_conversion_value = 1;
				}
				var google_conversion_label = "Signup";
				//-->
				</script>
				<script language="JavaScript" src="http://www.googleadservices.com/pagead/conversion.js">
				</script>
				<noscript>
				<img height=1 width=1 border=0 src="http://www.googleadservices.com/pagead/conversion/1071791845/?value=1&label=Signup&script=0">
				</noscript>
				<br>
				<SCRIPT LANGUAGE="JavaScript">
				<!-- Overture Services Inc. 07/15/2003
				var cc_tagVersion = "1.0";
				var cc_accountID = "3323984280";
				var cc_marketID =  "0";
				var cc_protocol="http";
				var cc_subdomain = "convctr";
				if(location.protocol == "https:")
				{
					cc_protocol="https";
					 cc_subdomain="convctrs";
				}
				var cc_queryStr = "?" + "ver=" + cc_tagVersion + "&aID=" + cc_accountID + "&mkt=" + cc_marketID +"&ref=" + escape(document.referrer);
				var cc_imageUrl = cc_protocol + "://" + cc_subdomain + ".overture.com/images/cc/cc.gif" + cc_queryStr;
				var cc_imageObject = new Image();
				cc_imageObject.src = cc_imageUrl;
				// -->
				</SCRIPT>
				</div></td>
              </tr>
          </table></td>
          <td width="78" height="492">
		  		
		  </td>
        </tr>
    </table></td>
  </tr>
  	
</table>
</body>
</html>
