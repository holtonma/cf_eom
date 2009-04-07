<style type="text/css">
<!--
.greenunpw {
	color: #006600;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
</style>

<cflogout />
<cfset sHeaderMessage = "You are logged out of the Eye On Majors application." />
<cfinclude template="login_form.cfm" />

<cflocation url="index.html" />

<br>

<cfoutput> 
  <div align="left">#sHeaderMessage# </div>
</cfoutput> 