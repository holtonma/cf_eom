<cfparam name="URL.Image" default="ButlerCabin800" />

<cfinclude template="header.cfm" />

<cfquery datasource="#sDSN#" name="qImages" >
SELECT image_id, image_name, image_caption
FROM majorimages
</cfquery>

<cfquery datasource="#sDSN#" name="qDisplayImage" >
SELECT image_name, image_caption
FROM majorimages
WHERE image_name = '#URL.Image#'
</cfquery>

<link rel="STYLESHEET" type="text/css" href="../EoM/styles.css">

<table width="100%" class="white">
	<tr>
		<td colspan="2" class="grossevenpartextongreen">	      
		  <p align="center"><br>
		    The 2005 Masters :: a photojournal<br>
		    <br>
	      All images are courtesy of EyeOnMajors.com's official photographer at Augusta, Mike 'Sandbaggolfer' Giato.<br>
	      Many thanks for providing such great images of the tournament, Mike!	        <br><br>
          </p>
      </td>
	</tr>
	<tr>
		<td colspan="2">
		
		</td>
	</tr>
	
	  	 
		 
		<form action="<cfoutput>#CGI.SCRIPT_NAME#</cfoutput>" method="get">
		<tr>
	  		<td width="32%" class="white">
				<br>Hover mouse over name to view description <br>
				Click to view picture <br> <br>
				<cfset imagepass = '#qImages.image_name#' />
                <cfoutput query="qImages">
				
                  <a href="#CGI.SCRIPT_NAME#?Image=#qImages.image_name#"><span class="picclick" title="#qImages.image_caption#">#qImages.image_name#</span></a><br><br>
				</cfoutput>

			</td>
			<td width="68%" align="right" valign="top" class="tablerow">
							<!-- these hidden inputs will pass clauses to SQL to update the "output_list.cfm" page:
							DUTs Selected, Testnames selected, DatesTested...-->
			<br><br>
			<cfoutput>#qDisplayImage.image_caption#<br><img src="/store/picjournal/#qDisplayImage.image_name#.JPG" /></cfoutput>		      <div align="center"  ></div></td>
		    
			<input type="hidden" name="Image" value="#URL.Image#" />
		</tr>
		<form/>
		
		 
	            
						
		   
	<tr>
		<td width="0%"></td>
	</tr>
</table>
<cfinclude template="footer.cfm" />