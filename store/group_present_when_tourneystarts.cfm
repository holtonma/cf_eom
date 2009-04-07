<!-- WHERE fullsquad = 1 AND when tourney starts-->
	<cfquery datasource="#sDSN#" name="qUsersNet">
		SELECT latest_teamnetscore
		FROM selectedteams
		WHERE poolpersonID = #qPatronInfo.EntrantID#
	</cfquery>
	
	<!-- when tourney starts
	<cfquery datasource="#sDSN#" name="qWorldRanking">
		SELECT Count(latest_teamnetscore) as NumAheadofMe
		FROM selectedteams
		WHERE fullsquad = 1
		AND madecut = 1
		AND latest_teamnetscore < #qUsersNet.latest_teamnetscore#
	</cfquery> -->
	
	<cfquery datasource="#sDSN#" name="qMadeOrMissedCut">
		SELECT MadeCut
		FROM selectedteams
		WHERE poolpersonID = #qPatronInfo.EntrantID#
	</cfquery>
	
	<!-- after tourney has concluded
	<cfquery datasource="#sDSN#" name="qGroupChampion">
		SELECT poolpersonID, latest_teamnetscore
		FROM selectedteams
		WHERE fullsquad = 1
		AND madecut = 1
		AND PoolGroupID = #qPatronInfo.GroupID#
		ORDER BY latest_teamnetscore ASC
		LIMIT 1
	</cfquery>  -->
	
	<!-- after tourney has concluded 
	<cfquery datasource="#sDSN#" name="qNameofGroupChamp">
		SELECT EntrantFirstName, EntrantLastName
		FROM poolperson
		
	<cfset SESSION.patronID = #GetAuthUser()#/>
	<cfset SESSION.patronLastName = '#qPatronInfo.EntrantLastName#' />
	<cfset SESSION.patronFirstName = '#qPatronInfo.EntrantFirstName#' />
	<cfset SESSION.patronEmail = '#qPatronInfo.EmailAddy#' />
	<cfset SESSION.patronGroupID = #qPatronInfo.GroupID# />
	
	<cfif #qMadeOrMissedCut.MadeCut# EQ 0>
		<cfset currentRanking = "[Missed Cut]">
	<cfelse>
		<cfset currentRanking = #qWorldRanking.NumAheadofMe# + 1>
	</cfif>
	
	<div align="center">Welcome, #qPatronInfo.EntrantFirstName# #qPatronInfo.EntrantLastName#!  (#qPatronInfo.EmailAddy#)<br>
	  <span class="worldrankingblack">You are currently ranked number <span class="worldranking">[Open has not started]</span> in the world on EyeOnMajors.com</span>	  <br>
	  <!--#currentRanking#-->
	  <br>
	  <br>
	  
	  <!-- add this -->
	  <div class="groupchampion" align="center">Our Group's Champion: <cfoutput>#qNameofGroupChamp.EntrantFirstName# #qNameofGroupChamp.EntrantLastName#</cfoutput> with a winning total of +<cfoutput>#qGroupChampion.latest_teamnetscore#</cfoutput>.  Congrats, <cfoutput>#qNameofGroupChamp.EntrantFirstName#</cfoutput>! </div> <br>
	  
		
	</cfquery> WHERE EntrantID = #qGroupChampion.poolpersonID# -->