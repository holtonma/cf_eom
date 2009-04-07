<cfinclude template="../header.cfm" />

<table>
  <tr>
    <td><img src="../EoM/images/spacer.gif" width="25" height="20" alt="" border="0"></td>
    <td>
	  <table width="100%" height="40">
			<tr>
			  <td colspan="1">
				<a href="<!--- Link to same page - previous month --->">
				  <img src="../EoM/images/bigArrowLeft.gif" border="0" />
				</a>
			  </td>
			  <td class="calhead" colspan="5" align="center">
				<!--- Month and Year --->
			  </td>
			  <td colspan="1" align="right">
				<a href="<!--- Link to same page - next month --->">
				  <img src="../EoM/images/bigArrowRight.gif" border="0" />
				</a>
			  </td>
			</tr>
		</table>
		<table class="white">
			<tr>
			  <!--- Loop start --->
				<td class="tblehead" width="100" height="20">
				  <!--- Day of week --->
				</td>
			  <!--- Loop close --->
			</tr>
			<!--- Loop start (while)--->
			  <tr valign="top">
				<!--- Loop start (i)--->
				  <td class="ltturq" height="100" width="100">
					<!--- Make conditional (0)--->
					  <table height="100" width="100" border="0">
						<tr valign="top">
						  <td height="22" class="calhead">
						    <!--- Day of month --->
						  </td>
						</tr>
						<tr valign="top">
						  <td class="ltturq" height="56">
							<!--- Loop start (j) --->
							  <!--- Make conditional (1) --->
								<!--- Link to event details ---><br />
							  <!--- Make conditional close (1) --->
							<!--- Loop close (j) --->
						  </td>
						</tr>
						<tr valign="bottom" align="right">
						  <td width="100" height="22">
							<!--- Make conditional (2) --->
							  <!--- Link to add event form --->
							<!--- Make conditional close (2) --->
						  </td>
						</tr>
					  </table>
					<!--- Make conditional close (0) --->
				  
				  </td>
				<!--- Loop close (i) --->
			  </tr>
			<!--- Loop close (while) --->
		</table>
	</td>
    <td><img src="../EoM/images/spacer.gif" width="25" height="20" alt="" border="0"></td>
  </tr>
</table>
</body>
</html>

<cfinclude template="../footer.cfm" />