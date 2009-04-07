


<!--selecting poll answers -->
<cfif IsDefined('FORM.vote_button.y')>
	<cfset bMatching = false />  <!-- false means ready to add:-->
	<!-- save answer to database :: polls only show up if user hasn't answered them-->
	<cfquery datasource="eompolls" name="qPostPollResult">
		INSERT INTO pollanswer (UserID, GroupID, QuestionID, AnswerID)
		VALUES (#FORM.userid#, #FORM.groupid#, #FORM.pollquestionid#, #FORM.option_num#)
	</cfquery>	
	
	<cfif NOT bMatching> <!--only add to cart if it's false (meaning golfer doesn't already exist, and team doesn't have more than 6 players)-->
		
	</cfif>
	<cflocation url="groupleaderboard_present.cfm" />		
</cfif>