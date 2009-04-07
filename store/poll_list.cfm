
<!-- -********* important... this all relies upon no breaks in poll numbers 1, 2, 3, 4.... -->

<!-- person -->
<cfquery datasource="#sDSN#" name="qSpecPer" >
	SELECT poolperson.EntrantID, poolperson.GroupID
	FROM poolperson
	WHERE poolperson.EntrantID = #GetAuthUser()#
</cfquery>

<!---
<!-- this determines highest numbered question-->
<cfquery datasource="eompolls" name="qTotNumPollQuestions">
	SELECT MAX(PollQuestionID) as LastQuestion
	FROM pollquestion
</cfquery>

<!-- last pollanswered -->
<cfquery datasource="eompolls" name="qLastPollAnswered">
	SELECT QuestionID
	FROM pollanswer
	WHERE UserID = #qSpecPer.EntrantID#
	ORDER BY QuestionID DESC
	LIMIT 1
</cfquery>

<cfif qLastPollAnswered.RecordCount EQ 0> <!-- no polls answered, therefore start at 1 -->
	<cfset pollquestionnum = 8>
<cfelseif #qLastPollAnswered.QuestionID# LT #qTotNumPollQuestions.LastQuestion# >
	<cfset pollquestionnum = #qLastPollAnswered.QuestionID# + 1>
<cfelse> <!-- answered all questions, therefore don't show poll-->
	<cfset pollquestionnum = -1>
</cfif>

<!-- only serve question if not answered -->
<cfquery datasource="eompolls" name="qNewAnswersOnly">
SELECT PollAnswerID
FROM pollanswer
WHERE UserID = #qSpecPer.EntrantID#
AND QuestionID = #pollquestionnum#
</cfquery>

<cfif #qNewAnswersOnly.RecordCount# EQ 0>
	<cfif #pollquestionnum# GT 0>
		<!-- returns a recordset of all poll options for the question specified-->
		<cfquery datasource="eompolls" name="qPolloftheDay">
		SELECT pollquestion.PollQuestionText, pollquestion.pollquestionID, optionanswer.OptionAnswerID, optionanswer.OptionNum, optionanswer.OptionText, optionanswer.OptionLink
		FROM pollquestion, optionanswer
		WHERE pollquestion.pollquestionID = optionanswer.pollquestionID
		AND pollquestion.pollquestionID = #pollquestionnum#
		ORDER BY optionanswer.OptionNum ASC
		</cfquery>
	
		
		<link rel="STYLESHEET" type="text/css" href="../styles.css">
		<br> 
		EyeOnMajors.com Fun Poll!  ::  <cfoutput>#qPolloftheDay.PollQuestionText#</cfoutput>
		<br>
		<table width="50%" class="white" cellpadding="10">
		  <tr>
			<td width="21%" align="center" class="tblehead">Select this<br>
			answer</td>
			<td colspan="2" class="tblehead">Poll Answer Choice </td>
		  </tr>
		  <cfoutput query="qPolloftheDay">
			<!-- obtain the golferID of each golfer from this query being looped through, in order to see if that golfer has a handicap-->
			
			<!--- Form start :: user click causes vote to be recorded in polling database--->
			<form action="poll_manage.cfm" method="post">
			  <tr>
				<td class="ltturq" align="center">
				  <input type="hidden" name="option_num" value="#qPolloftheDay.OptionNum#" />
				  <input type="hidden" name="pollquestionid" value="#qPolloftheDay.pollquestionID#" />
				  <input type="hidden" name="userid" value="#qSpecPer.EntrantID#" />
				  <input type="hidden" name="groupid" value="#qSpecPer.GroupID#" />
				  <input type="image" name="vote_button" src="poll.gif" />
				<td width="80%" colspan="3" class="ltturq">#qPolloftheDay.OptionNum#.) #qPolloftheDay.OptionText#</td>
				
			  </tr>
			</form>
			<!--- Form close --->
		  </cfoutput>
		</table>
	<cfelse>
		<table width="50%" class="ltturq" align="center">
		<tr align="center">
			<td colspan="3">
				Another EyeOnMajors.com fun poll will be available soon.  <br>Answers and results will be posted tomorrow. <br>Thanks for your vote!
			</td>
		</tr>
	</table>
	</cfif>
<cfelse>
	<table width="50%" class="ltturq" align="center">
		<tr align="center">
			<td colspan="3">
				Another EyeOnMajors.com fun poll will be available soon.  <br>Answers and results will be posted tomorrow. <br>Thanks for your vote!
			</td>
		</tr>
	</table>
</cfif>
--->