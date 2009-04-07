<cfinclude template="../header.cfm" />
<table width="100%">
  <tr>
    <td><img src="../EoM/images/spacer.gif" width="25" /></td>
	<td>
      <table>
	    <tr>
          <td><img src="../EoM/images/spacer.gif" height="20" width="25" /></td>
        </tr>
	  </table>
      <table width="100%" bgcolor="#FFFFFF" cellspacing="1">
	    <tr>
		  <td>
		    <table cellpadding="5" width="100%" bgcolor="#B5E2F9">
			  <tr valign="top">
                <td>
	              <a href="#" onClick="window.open('user_list_color_panel.cfm', 'colorPanel', 'width=200,height=307');">
	                <img src="../EoM/images/colorPanel.gif" border="0" />
	              </a>
	            </td>
                <td align="right">
	              <table>
	                <!--- Form start --->
	                  <tr align="right">
		                <td width="75%" valign="top">
		    
				          <!--- Select input --->
			            </td>
			            <td>
				          <!--- Hidden input --->
						  <!--- Hidden input --->
						  <!--- Hidden input --->
						  <!--- Submit button --->
		                </td>
		              </tr>
		            <!--- Form close --->
		            
		              <!---- Form start --->
                        <tr align="right" valign="top">
                          <td>
				            <!--- Text input --->
                          </td>
			              <td>
				            <!--- Hidden input --->
							<!--- Hidden input --->
							<!--- Hidden input --->
							<!--- Hidden input --->
							<!--- Submit button --->
			              </td>
		                </tr>
		              <!--- Form close --->
					  
	              </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <table>
	    <tr>
           <td><img src="../EoM/images/spacer.gif" height="20" width="25" /></td>
        </tr>
	  </table>
      <table width="100%">
        
          <tr>
            <td>
	          <!--- Form start --->
	            Number of records per page:
	            <!--- Select input --->
				<!--- Hidden input --->
				<!--- Hidden input --->
				<!--- Hidden input --->
				<!--- Hidden input --->
			  <!--- Form close --->
			  </td>
			  <td>
			    Showing <!--- Tell user which records are displaying --->
			  </td>
			  <td colspan="2">
			    <!--- Link to previous set of records --->
			  </td>
			  <td colspan="2" align="right">
				<!--- Link to next set of records --->
			  </td>
			</tr>

	    </table>
        <table width="100%" class="white" cellpadding="10">

          <tr>
            <td class="tblehead" height="20" valign="bottom"></td>
	        <td class="tblehead" height="20" valign="bottom">
	          Last Name 
			  <!--- Link to sorted records --->
			</td>
			<td class="tblehead" height="20" valign="bottom">
			  Forst Name 
			  <!--- Link to sorted records --->
			</td>
			<td class="tblehead" height="20" valign="bottom">
			  Type 
			  <!--- Link to sorted records --->
			</td>
			<td class="tblehead" height="20" valign="bottom">
			  Sign Up Date  
			  <!--- Link to sorted records --->
			</td>
		  </tr>


		<!--- Display records --->
		  <tr>
			<td class="tablerow" height="45">
			  <!--- Current row --->
			</td>
			<td class="tablerow" height="45">
			  <!--- Last name linked to details --->
			</td>
			<td class="tablerow" height="45">
			  <!--- First name linked to details --->
			</td>
			<td class="tablerow" height="45">
			  <!--- Type --->
			</td>
			<td class="tablerow" height="45">
			  <!--- Sign up date --->
			</td>
		  </tr>
		<!--- Display records close --->
	  </table>
	</td>
    <td><img src="../EoM/images/spacer.gif" width="25" /></td>
  </td></tr>
</table>
<cfinclude template="../footer.cfm" />