<cfif NOT IsDefined('SESSION.groupselstats')>
	<cfset SESSION.groupselstats = ArrayNew(1) />
</cfif>

<cfquery datasource="#sDSN#" name="qAllGolfers" username="eyeonmajors" password="pgachamp">
	SELECT GolferID, golferfirstname, golferlastname
	FROM golfer
</cfquery>

<cfset stSEL = StructNew() />

<!-- for all golfers, loop through and see how many times they were selected for GROUP 1 -->
<CFLOOP query="qAllGolfers">
			<cfquery datasource="#sDSN#" name="qGolfer1selcount" username="eyeonmajors" password="pgachamp">
				SELECT COUNT(golfer1ID) as tot1
				FROM selectedteams
				WHERE golfer1ID = #qAllGolfers.GolferID# AND PoolGroupID = 1
			</cfquery>
			<cfquery datasource="#sDSN#" name="qGolfer2selcount" username="eyeonmajors" password="pgachamp">
				SELECT COUNT(golfer2ID) as tot2
				FROM selectedteams
				WHERE golfer2ID = #qAllGolfers.GolferID# AND PoolGroupID = 1
			</cfquery>
			<cfquery datasource="#sDSN#" name="qGolfer3selcount" username="eyeonmajors" password="pgachamp">
				SELECT COUNT(golfer3ID) as tot3
				FROM selectedteams
				WHERE golfer3ID = #qAllGolfers.GolferID# AND PoolGroupID = 1
			</cfquery>
			<cfquery datasource="#sDSN#" name="qGolfer4selcount" username="eyeonmajors" password="pgachamp">
				SELECT COUNT(golfer4ID) as tot4
				FROM selectedteams
				WHERE golfer4ID = #qAllGolfers.GolferID# AND PoolGroupID = 1
			</cfquery>
			<cfquery datasource="#sDSN#" name="qGolfer5selcount" username="eyeonmajors" password="pgachamp">
				SELECT COUNT(golfer5ID) as tot5
				FROM selectedteams
				WHERE golfer5ID = #qAllGolfers.GolferID# AND PoolGroupID = 1
			</cfquery>
			<cfquery datasource="#sDSN#" name="qGolfer6selcount" username="eyeonmajors" password="pgachamp">
				SELECT COUNT(golfer6ID) as tot6
				FROM selectedteams
				WHERE golfer6ID = #qAllGolfers.GolferID# AND PoolGroupID = 1
			</cfquery>
			<cfset golferselgroup_tot = #qGolfer1selcount.tot1# + #qGolfer2selcount.tot2# + #qGolfer3selcount.tot3# + #qGolfer4selcount.tot4# + #qGolfer5selcount.tot5# + #qGolfer6selcount.tot6#/>
			
			<cfset stSEL.golfer_id = #qAllGolfers.GolferID# />
			<cfset stSEL.Last_Name = #qAllGolfers.golferlastname# />
			<cfset stSEL.First_Name = #qAllGolfers.golferfirstname# />
			<cfset stSEL.selcount = #golferselgroup_tot# />
			<cfset ArrayAppend(SESSION.groupselstats, stSEL) />
</CFLOOP> 





<table width="100%" class="white">
	<tr>
		<td >	      <div align="center" class="largegrntxt">Your Group's Selections :: Breakdown <br>
            <br>
          </div></td>
	</tr>
	<tr>
	  <td >
	   <cfoutput>
		  <cfloop from="1" to="#ArrayLen(SESSION.groupselstats)#" index="i">
				'#Session.groupselstats[i].golfer_id#' : '#Session.groupselstats[i].Last_Name#' : '#Session.groupselstats[i].First_Name#' : '#Session.groupselstats[i].selcount#' <br>
		  </cfloop>
		</cfoutput>
	  </td>
    </tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>