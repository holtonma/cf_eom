<cfif NOT IsDefined('SESSION.cart')>
	<cfset SESSION.cart = ArrayNew(1) />
</cfif>

<cfinclude template="header.cfm" />
<link rel="STYLESHEET" type="text/css" href="../EoM/styles.css">
<cfoutput>#GetAuthUser()#</cfoutput>
<cfoutput>cart qnty: #ArrayLen(SESSION.cart)#</cfoutput>
<cfloop from="1" to="#ArrayLen(SESSION.cart)#" index="i">
	<cfoutput>#Session.cart[i].golfer_id#</cfoutput>
</cfloop>
<table width="100%">
  <tr>
    <td colspan="3">
	  <img src="../images/spacer.gif" height="25" />
	</td>
  </tr>
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
      <cfinclude template="products_list.cfm" />
	</td>
    <td><img src="../images/spacer.gif" width="25" /></td>
    </td>
  </tr>
  <tr>
    <td colspan="3">
	  <img src="../images/spacer.gif" height="25" />
	</td>
  </tr>
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
      <cfinclude template="cart_list.cfm" />
	</td>
    <td><img src="../images/spacer.gif" width="25" /></td>
    </td>
  </tr>
</table>
<cfinclude template="footer.cfm" />