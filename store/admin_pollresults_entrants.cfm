<a href="/store/admin_post_data.cfm">LINK to admin page</a><cfset nettotalscore = 0 />

<!-- for now I just want to show Question, Respondee, Answer-->

<!-- recordset of all questions -->
<cfquery datasource="eompolls" name="qPollAnswers">
	SELECT UserID, GroupID, QuestionID, AnswerID
	FROM pollanswer
	ORDER BY QuestionID ASC
</cfquery>
<cfoutput query="qPollAnswers">
	QuestionID: #qPollAnswers.QuestionID# 
	<cfquery datasource="eompolls" name="qQuestionText">
		SELECT PollQuestionText
		FROM pollquestion
		WHERE PollQuestionID = #qPollAnswers.QuestionID#
	</cfquery>
	#qQuestionText.PollQuestionText# :: 
	<cfquery datasource="eompolls" name="qIdentifyChoice">
		SELECT OptionText
		FROM optionanswer
		WHERE OptionNum = #qPollAnswers.AnswerID#
		AND PollQuestionID = #qPollAnswers.QuestionID#
	</cfquery>
	#qIdentifyChoice.OptionText# :: 
	<br>
	UserID #qPollAnswers.UserID# 
	<cfquery datasource="#sDSN#" name="qIdentifyPatron">
		SELECT EntrantFirstName, EntrantLastName
		FROM poolperson
		WHERE EntrantID = #qPollAnswers.UserID# 
	</cfquery>
	Patron: #qIdentifyPatron.EntrantFirstName# #qIdentifyPatron.EntrantLastName#<br>
	<br>
	<br>
</cfoutput>





  