<cfquery datasource="#sDSN2#" name="qTop10Golfers">
SELECT tG.GolferFirstName, tG.GolferLastName, tG.CurrentScoreRelPar, tG.thru, tG.position, tH.numstrokes as handicap
FROM tgolfer tG LEFT OUTER JOIN thandicaps tH ON tG.golferid = tH.golferid AND tH.eventID = #SESSION.eventid#
WHERE tG.active = 1 AND tG.eventid = #SESSION.eventid#
ORDER BY tG.CurrentScoreRelPar ASC, tG.thru DESC, tG.GolferLastName ASC
LIMIT 10
</cfquery>

<div class="section_head" align="center">2010 Masters</div>
<table class="sidebarlb">
	<tbody>
		<tr>
			<th>POS</th>
			<th>PLAYER</th>
			<th>TOTAL</th>
			<th>THRU</th>
			<th>EoM NET</th>
		</tr>
		<!--- loop goes here --->
		<cfset counter = 0>
		<cfoutput query="qTop10Golfers">
		<cfset counter = counter + 1>
		<cfif (counter MOD 2) eq 1><cfset row_class=""><cfelse><cfset row_class="alt"></cfif>
		<tr class="#row_class#">
			<td>#position#</td>
			<td class="nameleft"><div align="left">#GolferFirstName# #GolferLastName#</div></td>
			<td>
				<cfif CurrentScoreRelPar lt 0><span class="subpar">#CurrentScoreRelPar#</span>
				<cfelseif CurrentScoreRelPar eq 0><span class="evenpar">E</span>
				<cfelse><span class="over">+#CurrentScoreRelPar#</span>
				</cfif>
			</td>
			<td>
				<cfif thru eq 18>F<cfelse>#thru#</cfif>
			</td>
			<cfset net_score = #Val(CurrentScoreRelPar)# + #Val(handicap)#>
			<td>
				<cfif net_score eq 0><span class="evenpar">E</span><cfelseif net_score lt 0><span class="subpar">#net_score#</span>
				<cfelse><span class="over">+#net_score#</span>
				</cfif>
			</td>
		</tr>
		</cfoutput>
	</tbody>
</table>
<div class="viewall"><a href="major.cfm">view all</a></div>