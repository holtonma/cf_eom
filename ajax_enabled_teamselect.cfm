<style type="text/css">
	.golferselect{
		float:left;
		padding: 0px;
		margin: 0px;
		border: 1px dotted silver;
		text-align: center;
	}
	.golferselectnewrow{
		float:left;
		clear:left;
		padding: 0px;
		margin: 0px;
		border: 1px dotted silver;
		text-align: center;
	}
	.filterGolfers{
		font-size: 20px;
		font-weight:bold;
		color: green;
		
	}
	.myteam{
		border: 3px dashed green;
		background-color: #DDEEDD;
		color: #006600;
		font-size: 16px;
		padding: 5px;
	}
	.myteamplayer{
		border: 1px dotted #88AA88;
		background-color: #CCCCCC;
		padding: 2px;
		width:50px;
		color:black;
		font-size: 12px;
	}
</style>
<!---  grab all names and faces [in grid pattern] --->
<cfquery datasource="eyeon2" name="qAllGolfers">
SELECT *
FROM tgolfer
WHERE active = 1
ORDER BY CurrentScoreRelPar ASC, GolferLastName ASC
</cfquery>
<html>
<head>
	<script type="text/javascript" src="prototype.js"></script>
</head>

<body style="text-align:center;margin:0;">
<div align="center">
	<!--- ><div style="width:960px"> --->
	<div class="myteam">
		<span>My Team:</span>
		<span class="myteamplayer">[select below]</span>
		<span class="myteamplayer">[select below]</span>
		<span class="myteamplayer">[select below]</span>
		<span class="myteamplayer">[select below]</span>
		<span class="myteamplayer">[select below]</span>
		<span class="myteamplayer">[select below]</span>
	</div>
	<!--- a row has 13 in  --->
	<div style="width:850px;" align="center">Start typing golfer's first name or last name, then hit &lt;enter&gt; or click to choose:</div>
	<div style="width:850px;" align="center"><input type="text" id="txtname" class="filterGolfers"  onKeyUp="javascript:checkPlayer();"></div>
	<hr width="850px;" style="width:850px;">
	<div style="width:850px;">
	<cfset counter = -1>
	<cfoutput query="qAllGolfers">
			<cfset counter = counter + 1>
			<cfset iMod9 = counter MOD 13>
			<cfif iMod9 eq 0><cfset classname = "golferselectnewrow"><cfelse><cfset classname = "golferselect"></cfif>
			<div class="player #classname#" id="#qAllGolfers.GolferLastName##qAllGolfers.GolferFirstName#">
				<img src="store/#qAllGolfers.GolferImage#.gif" alt="#qAllGolfers.GolferLastName#, #qAllGolfers.GolferFirstName#">
				<cfset truncatedLName = #Left(GolferLastName, 7)#>
				<cfset truncatedFName = #Left(GolferFirstName, 7)#>
				<div><cfif LEN(GolferLastName) lte 7>#qAllGolfers.GolferLastName#<cfelse>#truncatedLName#..</cfif></div>
				<div><cfif LEN(GolferFirstName) lte 7>#qAllGolfers.GolferFirstName#<cfelse>#truncatedFName#..</cfif></div>
			</div>
			<cfsilent>
			<!--->
			--->
			</cfsilent>
	</cfoutput>
	</div>
	<!--- </div> --->
</div>
</body>
</html>

<script type="text/javascript">
function checkPlayer(){
  //console.log("key was pressed");
  var testarray = $$('.player'); // array of elements (we want an array of the id's)
  //var newarray = [];
  //testarray.each(function(m){
  //	newarray.push(m.id);
  //});
  //console.log(testarray);
  //newarray.grep();
  
  testarray.each(function(s){
    // trim white space, and convert to lower case
	var idofelem = s.id.strip().toLowerCase();
	// elminate white space between characters: E.g. "Mark Holton" would become "MarkHolton"
	  // [not implemented yet]
	// check to see if that string is contained inside of the string
	/*
	'Prototype framework'.include('frame');
	//-> true
	*/
	var matchstring = $('txtname').value.toLowerCase().strip();
	//console.log("idofelem: ", idofelem);
	//console.log("matchstring: ", matchstring);
	var userTypeMatch = idofelem.include(matchstring);
	//var userTypeMatch = s.id.indexOf($('txtname').value);
	//console.log("userTypeMatch: ", userTypeMatch);
	// check that length of string is at least 2 characters:
	var lengthoftypedstr = matchstring.length;
	if (lengthoftypedstr > 1){
		if (userTypeMatch === false){
		 //console.log("no match :(");
		 s.setStyle({opacity: 0.3, color:'#333333', fontSize:'12px', fontWeight:'normal', fontFamily:'Arial', borderColor:'#333333'});
		}else{
		 //console.log("match!!!");
		 s.setStyle({opacity: 1.0, color:'#006600', fontSize:'14px', fontWeight:'bold', fontFamily:'Arial', borderColor:'#006600'});
		};
	} else {
		s.setStyle({opacity: 0.3, color:'#333333', fontSize:'12px', fontWeight:'normal', fontFamily:'Arial', borderColor:'#333333'});
	};
  });
  
  
}
</script>



