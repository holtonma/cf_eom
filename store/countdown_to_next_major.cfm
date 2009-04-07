<link rel="STYLESHEET" type="text/css" href="../styles.css">
<!-- countdown to next major -->
<cfset majorstart = CreateDateTime(2006, 7, 19, 4, 0, 0)>

<style type="text/css">
<!--
.style1 {color: #CBCCDA}
-->
</style>
<div align="center"><span class="subpartextongreen">The Masters, EyeOnMajors.com-style, will commence at 11:59 US PST (West Coast) on Wednesday, April 5, 2006.  
   
  Entries will close in approximately</span> <cfoutput><span class="picclick">#DateDiff("h", Now(), majorstart)#</span></cfoutput> <span class="subpartextongreen">hours (<cfoutput>#DateDiff("n", Now(), majorstart)#</cfoutput> minutes). <br>
                </span>  <br>
</div>
