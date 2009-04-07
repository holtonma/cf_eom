<cfparam name="sHeaderMessage" default="Enter your email address and password" />
<cfset sFooterMessage = #Year(Now())# & " Eye on Majors :: The Most Enjoyable Golf Pool on the Planet" />
<!--- "Not already signed up with Eye on Majors? <a href='register/user_registration.cfm'>Register HERE</a>" /> --->
<cfset sHeaderMessage = GetAuthUser() />
<cfset currentUserID = #GetAuthUser()# />
<cfinclude template="header.cfm" />
<link rel="STYLESHEET" type="text/css" href="styles.css">
	
	<!--- this query checks returns a recordset containing info about whether or not the EyeOnMajors golf pool AuthUser has registered 
	with a team--->
	<cfquery datasource="#sDSN2#" name="qEntrantInfo">
		SELECT entrantid, lname, fname, emailaddy
		FROM tentrant
		WHERE tentrant.entrantid = #currentUserID#
	</cfquery>
	
	<cfset SESSION.entrantid = qEntrantInfo.entrantid>
	
	<!--- check to see that this patron has an entry in tEntrantGroup for this event --->
	<cfquery datasource="#sDSN2#" name="qUserRegWithTeam">
		SELECT entrantgroupuniqueid, groupid 
		FROM tentrantgroup tEG
		WHERE 
			tEG.entrantid = #SESSION.entrantid#
			AND
			tEG.eventid = #SESSION.eventid#
	</cfquery>
	
<cfif #qUserRegWithTeam.GroupID# LT 1 >
	<!--- only execut this part if Eye on Majors golf pool auth user has not registered with a pool group
	     recordcount will be 0 if group id is null --->

<body>

Your EyeOnMajors.com vitals:
EntrantID : <cfoutput>#SESSION.entrantid#</cfoutput> <br>
Name : <cfoutput>#qEntrantInfo.lname#</cfoutput>, <cfoutput>#qEntrantInfo.fname#</cfoutput> <br>
Email : <cfoutput>#qEntrantInfo.emailaddy#</cfoutput> <br>
GroupID : 
	<cfif #qUserRegWithTeam.GroupID# LT 1 >
		<a href="/register/register_with_existing_group.cfm">REGISTER WITH A GROUP!</a>
	<cfelse>
	</cfif>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <!-- row 1 -->
    <td>&nbsp;</td>
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
                                  <td width="190"><a href="/register/group_registration.cfm">Create group for friends to join?</a> </td>
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
                                  <td width="190"><a href="/register/register_with_existing_group.cfm">Sign-In to my already-existing group of friends?</a> </td>
                                  <td><p>I already have an Eye On Majors group that I'm with, and know my Group Name and Password. <br />
                                    I want to configure my team for this major, view current results, engage in competitive banter in my group, etc.! </p>
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
                                  <td width="191"><a href="/about_eyeonmajors.html">What is &quot;Eye On Majors&quot;? </a></td>
                                  <td width="471"><p>I would like to understand how this free, web-based pool works, how simple it is to play and manage, and see what fun it could be for my friends and officemates! </p>
                                  </td>
                                </tr>
								<tr>
                            <!-- row 4 -->
                            <td width="191" height="37">&nbsp;</td>
                          </tr>
								<tr>
                                  <!-- row 1 -->
                                  <td width="191">I forgot my password </td>
                                  <td><p>I forgot my password. Can you email it to me? </p>
                                  </td>
                                </tr>
                            </table></td>
                          </tr>
                      </table></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <!-- row 2 -->
                <td width="722" height="250">&nbsp;</td>
              </tr>
          </table></td>
          <td width="78" height="492">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
  
</table>


</body>
<cfelse>
	<!--- since the user has registered a group, proceed to group page: --->
	<cfset SESSION.patrongroupid = qUserRegWithTeam.GroupID>
	<cfset SESSION.patronfirstname = qEntrantInfo.fname>
	<cfset SESSION.patronlastname = qEntrantInfo.lname>
	<cfset SESSION.patronemail = qEntrantInfo.emailaddy>
	<cflocation url="../store/group.cfm" />
</cfif>	


                                    
</html>
