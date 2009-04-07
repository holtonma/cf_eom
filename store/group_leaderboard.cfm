<cfset nTotal = 0 />

<form action="groupleaderboard_manage.cfm" method="post">
  <div class="headerTeam">My Team :: 6 Players - all must make cut</div>
  <table width="100%">
    <tr valign="top">
	  <td>
	    <table width="100%" class="white">
          <tr>
			<td class="tblehead">Current Place</td>
			<td class="tblehead">Last Name </td>
	        <td class="tblehead">First Name </td>
            <td class="tblehead">Player 1</td>
			<td class="tblehead">Player 2</td>
			<td class="tblehead">Player 3</td>
			<td class="tblehead">Player 4</td>
			<td class="tblehead">Player 5</td>
			<td class="tblehead">Player 6</td>
	        <td class="tblehead">EoM <br> Handicaps</td> 
			<td class="tblehead">Team <br> Total </td>
          </tr>
		  <cfoutput>
          <!--- Start loop --->
		  	<cfloop from="1" to="#ArrayLen(SESSION.cart)#" index="i">
              <tr>
		        <td height="40" width="40" align="center" class="ltturq">
				  Place
				</td>
				<td height="40" class="ltturq">
				  #SESSION.cart[i].First_Name#
				</td>
	            <td height="40" class="ltturq">
				  #SESSION.cart[i].Last_Name#
				</td>
	            <td height="40" class="ltturq">
				  <img src="#SESSION.cart[i].GolferImage#.gif" />
				  <cfset nTotal = nTotal + 1 />
				</td>
				<td height="40" class="ltturq">
				  <img src="#SESSION.cart[i].GolferImage#.gif" />
				  <cfset nTotal = nTotal + 1 />
				</td>
				<td height="40" class="ltturq">
				  <img src="#SESSION.cart[i].GolferImage#.gif" />
				  <cfset nTotal = nTotal + 1 />
				</td>
				<td height="40" class="ltturq">
				  <img src="#SESSION.cart[i].GolferImage#.gif" />
				  <cfset nTotal = nTotal + 1 />
				</td>
				<td height="40" class="ltturq">
				  <img src="#SESSION.cart[i].GolferImage#.gif" />
				  <cfset nTotal = nTotal + 1 />
				</td>
				<td height="40" class="ltturq">
				  <img src="#SESSION.cart[i].GolferImage#.gif" />
				  <cfset nTotal = nTotal + 1 />
				</td>
	            <td height="40" class="ltturq">
  				  Handicap
				</td>
				<td height="40" class="ltturq">
  				  Sum Total
				</td>
	          </tr>
            <!--- Loop end --->
			</cfloop>
		  </cfoutput>
        </table>
	  </td>
	  <td><img src="../images/spacer.gif" width="25" /></td>
	  <td>
	    
	  </td>
	</tr>
  </table>
</form>
