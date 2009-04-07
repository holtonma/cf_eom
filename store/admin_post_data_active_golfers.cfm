<cfquery datasource="#sDSN#" name="qAllGolfers">
SELECT *
FROM golfer
ORDER BY GolferLastName ASC
</cfquery>

<!-- WHERE active = 1 -->

<link rel="STYLESHEET" type="text/css" href="../styles.css">

<!-- <a href="/store/admin__madecut_post.cfm">UPDATE CUT LINK</a> <br>   hiding this because don't want to accidently update cut after cut has already been updated-->

<p>Instructions: <br>
Active golfers get set to 1, then hit plus sign to add to cart... click checkout to save all active golfers in cart
</p>
<table width="100%" class="white" cellpadding="10">
  <tr>
  	<td class="tblehead">Active?</td>
	<td class="tblehead">Contestant</td>
	<td class="tblehead">Last Name</td>
	<td class="tblehead">First Name</td>
	<td class="tblehead">Golfer <br>MEMO</td>
	<td class="tblehead">Active=1<br />Inactive=0</td>
	<td class="tblehead">Update</td>
  </tr>
  <cfoutput query="qAllGolfers">
	<!--- Form start :: user click causes golfer to be added to Temporary Team/"cart"--->
	<form action="admin_post_manage_activegolfer.cfm" method="post">
	  <tr>
	  	<td class="ltturq"><input type="checkbox" <cfif #qAllGolfers.active# EQ 1>checked</cfif>  /></td>
		<td class="ltturq"><img src="qualifier.gif" /></td>
		<td class="ltturq">#qAllGolfers.GolferLastName#</td>
		<td class="ltturq">#qAllGolfers.GolferFirstName#</td>
		<td class="ltturq">
			  <input type="text" name="golfer_memo" value="#qAllGolfers.GolferMemo#" />
		</td>
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="activegolfer" value="#qAllGolfers.Active#" />
		</td>
		<td class="ltturq" align="center">
			  <input type="hidden" name="golfer_id" value="#qAllGolfers.GolferID#" />
			  <input type="hidden" name="Last_Name" value="#qAllGolfers.GolferLastName#" />
			  <input type="hidden" name="First_Name" value="#qAllGolfers.GolferFirstName#" />
			  <input type="hidden" name="GolferImage" value="#qAllGolfers.GolferImage#" />
			  <input type="image" name="add_button" src="../images/plusSign.gif" />
			  
		</td>
	  </tr>
	  
    </form>
	<!--- Form close --->
  </cfoutput>
</table>
<br>

<br>
