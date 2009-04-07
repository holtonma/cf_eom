<!--- 1. look in database to see how many players this person has on his or her team.
     2. update the SESSION.cart to include the players already selected.
	 3. if no players are selected, do nothing and run form as below --->


<form action="cart_manage.cfm" method="post">
  <div class="headerTeam">My Team:</div>
  <table width="100%">
    <tr valign="top">
	  <td>
	    <table width="100%" class="white">
          <tr>
			<td class="tblehead" align="center">Check<br>to<br>Remove<br>Player </td>
            <td class="tblehead" align="center">Team<br>Member</td>
			<td class="tblehead">Last Name </td>
	        <td class="tblehead">First Name </td>
	        <!--- <td class="tblehead" align="center">EoM <br> Handicap</td>  --->
          </tr>
		
		<!--- <tr>
			<td colspan="4">
				line 20 cart_list.cfm:
				<cfdump var="#SESSION.cart#">
			</td></br>
		</tr> --->
		  <cfoutput>
		  
		  <cfset nTotal = 0 />
          <!--- Start loop --->
		  	<cfloop from="1" to="#ArrayLen(SESSION.cart)#" index="i">
			<!--- adds rows containing selections --->
              <tr>
		        <td height="40" width="40" align="center" class="ltturq">
				  <input type="checkbox" name="delete_index" value="#i#" />
				</td>
				<td height="40" class="ltturq" align="center">
				  <img src="#SESSION.cart[i].GolferImage#.gif" />
				</td>
	            <td height="40" class="ltturq">
				  #SESSION.cart[i].Last_Name#
				</td>
	            <td height="40" class="ltturq">
				  #SESSION.cart[i].First_Name#
				  <cfset nTotal = nTotal + 1 />
				</td>
	            
  				   <!--- HANDICAP GOES HERE --->
				   
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
			  <cfoutput>#nTotal# </cfoutput> Players selected <br>
			  	<cfset golfersleft = 6-#nTotal#>
			  	<cfif golfersleft gt 0>
			  		<span style="font-size:12px;color:red;font-weight:bold;">Select <cfoutput>#6-nTotal# </cfoutput> more 
			  		player<cfif golfersleft gt 1>s</cfif></span>
            	<cfelse>
					Ready for to save/checkout
				</cfif>  
			<br /><br /><br /><br />
  	            <input type="hidden" name="item_count" value="#nTotal#" />
		        <input type="image" name="delete_button" src="../images/deleteChecked.gif" /><br />
				<cfif #ArrayLen(SESSION.cart)# EQ 6>
		        	<input type="image" name="checkout_button" src="../images/checkout.gif" />
				<cfelse>
					6 Players <br>
					Required
				</cfif>
	        </td>
	      </tr>
        </table>
	  </td>
	</tr>
  </table>
</form>
