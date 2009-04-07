<cfset nTotal = 0 />

<form action="admin_post_manage_activegolfer.cfm" method="post">
  <div class="headerTeam">Players about to update:</div>
  <table width="100%">
    <tr valign="top">
	  <td>
	    <table width="100%" class="white">
          <tr>
			<td class="tblehead">&nbsp;</td>
            <td class="tblehead">Player </td>
			<td class="tblehead">Last Name </td>
	        <td class="tblehead">First Name </td>
	        <td class="tblehead">Golfer <br> MEMO</td> 
			<td class="tblehead">Active? (1=yes, 0=no)</td> 
          </tr>
		  <cfoutput>
          <!--- Start loop --->
		  	<cfloop from="1" to="#ArrayLen(SESSION.golferscorecart)#" index="i">
              <tr>
		        <td height="40" width="40" align="center" class="ltturq">
				  <input type="checkbox" name="delete_index" value="#i#" />
				</td>
				<td height="40" class="ltturq">
				  <img src="#SESSION.golferscorecart[i].GolferImage#.gif" />
				</td>
	            <td height="40" class="ltturq">
				  #SESSION.golferscorecart[i].Last_Name#
				</td>
	            <td height="40" class="ltturq">
				  #SESSION.golferscorecart[i].First_Name#
				  <cfset nTotal = nTotal + 1 />
				</td>
	            <td height="40" class="ltturq">
  				  #SESSION.golferscorecart[i].memo#
				</td>
				<td height="40" class="ltturq">
				  #SESSION.golferscorecart[i].Active#
  				</td>
	          </tr>
            <!--- Loop end --->
			</cfloop>
		  </cfoutput>
        </table>
	  </td>
	  <td><img src="../images/spacer.gif" width="25" /></td>
	  <td>
	    <table width="100%" height="100%" class="white">
		  <tr>
		    <td class="tblehead">
			  Team Summary
			</td>
		  </tr>
	  	  <tr>
	        <td class="ltturq">
			  <cfoutput>#nTotal# </cfoutput> Players to &quot;check out&quot; (save) <br>
			  <br />
			  <br /><br /><br />
  	            <input type="hidden" name="item_count" value="<!--- Total items --->" />
	            <input type="image" name="update_button" src="../images/update.gif" />
		        <input type="image" name="delete_button" src="../images/deleteChecked.gif" /><br />
		        <input type="image" name="checkout_button" src="../images/checkout.gif" />
	        </td>
	      </tr>
        </table>
	  </td>
	</tr>
  </table>
</form>
