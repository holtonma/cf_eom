<style type="text/css">
<!--

.greenunpw {
	color: #006600;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}

</style>
<body>
        <table width="700" align="center" border="0">
          <tr>
            <td width="100" class="greenunpw"><div align="right">Email:
			</div>
			</td>
			<td width="80" class="greenunpw">
			<form action="<cfoutput>#CGI.SCRIPT_NAME#</cfoutput>"; method=post>   
			<input type="text" name="EmailAddress" class="field" /> 
			</td>
			<td width="70" class="greenunpw"><div align="right">Password:</div>
			</td>
			<td width="100" class="greenunpw">
			<input type="password" name="Password" class="field" /><br />
			</td>		
			<td width="110" class="greenunpw"><div align="center">
			<input type="image" name="login_button" src="images/login.gif" />
			</div></td>
			</form>
          </tr>
		  <br>
          
		  
        </table>
</body>