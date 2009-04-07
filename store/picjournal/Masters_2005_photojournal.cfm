<head>
<title>EyeOnMajors.com :: 2005 Masters Photojournal :: Provided by Professional Photographer Mike 'Sandbagger' Inguagiato</title>
</head>

<!-- download images into string that image viewer likes-->
<cfquery datasource="#sDSN#" name="qMasters2005Images">
SELECT *
FROM majorimages
WHERE major_name_year = 'Masters2005'
</cfquery>
<cfset picArray = ArrayNew(1)>
<cfset picCaptionArray = ArrayNew(1)>
<cfset picLinkArray = ArrayNew(1)>

<cfset rootImagepath = "">
<!-- loop through query; append these names successively to the last element   "http://www.eyeonmajors.com/store/picjournal/" &  -->
<cfloop query = "qMasters2005Images">
	<cfset temp = ArrayAppend(picArray, "#image_name#" & ".JPG") >
	<cfset temp2 = ArrayAppend(picCaptionArray, "#image_caption#") >
	<cfset temp3 = ArrayAppend(picLinkArray, "http://www.eyeonmajors.com/store/groupleaderboard_present.cfm") >
</cfloop>

<!-- show  array as a list -->
<cfset finalpicArray = ArrayToList(picArray, ",")>
<cfset finalpicCaptionArray = ArrayToList(picCaptionArray, ",")>
<cfset finalLinkArray = ArrayToList(picLinkArray, ",")>

<!-- put quotes around each pic name in list -->
<cfset qualifiedpiclist = ListQualify(finalpicArray, "'", ",", "CHAR")>
<cfset qualifiedpiclinks = ListQualify(finalLinkArray, "'", ",", "CHAR")>
<cfset qualifiedCaptionArray = ListQualify(finalpicCaptionArray, "'", ",", "CHAR")>
<!--<cfoutput>#qualifiedpiclist#</cfoutput>-->



<link rel="STYLESHEET" type="text/css" href="../../styles.css">
<body>
<table width="810" height="610" align="center" class="mastersgreen">
	<tr>
		<td class="mastersgreen" align="center">
			<a href="/store/groupleaderboard_present.cfm"><< Back to Leaderboard </a><br>
			EyeOnMajors.com :: Masters 2005 Photojournal :: All Images Provided by Professional Photographer Mike 'Sandbagger' Inguagiato
			<br>
	  </td>
	</tr>
	<tr align="center">
		<td align="center">
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" name="Masters 2005" width="800" height="650" hspace="0" vspace="0" border="0" id="Masters 2005" dir="ltr" lang="en">
		  <param name="flash_component" value="ImageViewer.swc">
		  <param name="movie" value="final_Masters2005.swf">
		  <param name="quality" value="high">
		  <param name="FlashVars" value="flashlet={imageLinkTarget:'_blank',captionFont:'Georgia',titleFont:'Georgia',showControls:true,frameShow:true,slideDelay:5,captionSize:12,captionColor:#006600,titleSize:13,transitionsType:'Random',titleColor:#006600,slideAutoPlay:true,imageURLs:[<cfoutput>#qualifiedpiclist#</cfoutput>],slideLoop:true,frameThickness:2,frameColor:#CCCCCC,bgColor:#FFFFFF,imageCaptions:[<cfoutput>#qualifiedCaptionArray#</cfoutput>],title:'EyeOnMajors.com',imageLinks:[<cfoutput>#qualifiedpiclinks#</cfoutput>]}"><param name="BGCOLOR" value="#FFFFFF">
		  <embed src="final_Masters2005.swf" width="800" height="650" hspace="0" vspace="0" align="top" quality="high" flashvars="flashlet={imageLinkTarget:'_blank',captionFont:'Georgia',titleFont:'Georgia',showControls:true,frameShow:true,slideDelay:5,captionSize:12,captionColor:#006600,titleSize:13,transitionsType:'Random',titleColor:#006600,slideAutoPlay:true,imageURLs:[<cfoutput>#qualifiedpiclist#</cfoutput>],slideLoop:true,frameThickness:2,frameColor:#CCCCCC,bgColor:#FFFFFF,imageCaptions:[<cfoutput>#qualifiedCaptionArray#</cfoutput>],title:'EyeOnMajors.com',imageLinks:[<cfoutput>#qualifiedpiclinks#</cfoutput>]}" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" name="Masters 2005" bgcolor="#FFFFFF" flash_component="ImageViewer.swc"></embed>
		</object>
		</td>
	</tr>
</table>
<br>
</body>
</html>
