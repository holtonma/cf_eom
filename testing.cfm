<!-- loads prior to every .cfm page on site -->
<!-- 8 hour sessions -->


<!-- sets database name to 'eyeonmajors' -->




<link rel="STYLESHEET" type="text/css" href="../EoM/styles.css">
<!-- anything placed in between will run when the user is not logged in


-->





<link rel="STYLESHEET" type="text/css" href="../EoM/styles.css">
admin user ID: 1 <br>
updating 0 player data for EoM database


<table width="100%">
  
		
      
	  
	  
	  
	
	
  <tr>
    <td><img src="../images/spacer.gif" width="25" /></td>
	<td>
		
		
      	

<link rel="STYLESHEET" type="text/css" href="../styles.css">




<script type='text/javascript'>_ajaxConfig = {'_cfscriptLocation':'../components/eomajax.cfc', '_jsscriptFolder':'../js'};</script>
<script type='text/javascript' src='../js/ajax.js'></script>
<script type='text/javascript' src='../js/prototype.js'></script>
<script type='text/javascript' src='../js/scriptaculous.js'></script>


<script type="text/javascript">
	function updateScoreJS()	{
		// send data to CF
		DWRUtil.useLoadingMessage();
		DWREngine._execute(_ajaxConfig._cfscriptLocation, null, 'updateGolferScore', DWRUtil.getValue("golfer_id"), DWRUtil.getValue("golfer_score"), updateScoreResultJS);
	}
	// $('golfer_id').value,  $('golfer_score').value 
	
	// call back function
	function updateScoreResultJS (r) {
		
	}
	
	function updategolferscoreJS()	{
		// send data to CF
		DWRUtil.useLoadingMessage();
		DWREngine._execute(_ajaxConfig._cfscriptLocation, null, 'updateGolferScore', DWRUtil.getValue("selgolfers"), $('golfer_score2').value, updateScoreResultJS);
	}
	
	
	function getgolferscoreJS()	{
		// send data to CF
		DWRUtil.useLoadingMessage();
		DWREngine._execute(_ajaxConfig._cfscriptLocation, null, 'getGolferScoreCF', DWRUtil.getValue("selgolfers"), getGolferScoreResultJS);
	}
	// call back function
	function getGolferScoreResultJS (r) {
		// set port price on page (use regular expression for price)
        $('golfer_score2').innerHTML = r;
	}
	
	
	function getFriendsEmailJS()	{
		// send data to CF
		DWRUtil.useLoadingMessage();
		fremailelement = document.getElementById("txtGetFriendsEmail").value;
		DWREngine._execute(_ajaxConfig._cfscriptLocation, null, 'getFriendGroupCF', fremailelement, getFriendsEmailReturnJS);
	}
	// call back function
	function getFriendsEmailReturnJS (r) {
		// set port price on page (use regular expression for price)
        $('friendsemailreturn').innerHTML = r;
	}
	
	
</script>


  

	<ul id="examplelist">
		<li>Tiger Woods</li>
		<li>Greg Norman</li>
		<li>Curtis Strange</li>
		<li>Jim Furyk</li>
		<li>Tom Watson</li>
		<li>Jack Nicklaus</li>
		<li>Gary Player</li>
		<li>John Cook</li>
	</ul>
		
		<!---
		<script type="text/javascript" language="javascript">
		  Sortable.create('examplelist',{ghosting:true,constraint:false})
		</script>
		--->
<table width="500" class="white" cellpadding="0">

 



	
	
		
		<tr>
			<td><div id="Allenby2"><img src="Allenby_Robert.gif" /><br />Allenby</div></td>
			
	

	
	
			<td><div id="Ames3"><img src="Ames_Steven.gif" /><br />Ames</div></td>
			
	

	
	
			<td><div id="Appleby4"><img src="Appleby_Stuart.gif" /><br />Appleby</div></td>
			
	

	
	
			<td><div id="Austin247"><img src="austin_woody.gif" /><br />Austin</div></td>
			
	

	
	
			<td><div id="Azinger248"><img src="azinger_paul.gif" /><br />Azinger</div></td>
			
	

	
	
			<td><div id="Baddeley291"><img src="qualifier.gif" /><br />Baddeley</div></td>
			
	

	
	
			<td><div id="Barlow126"><img src="barlow_craig.gif" /><br />Barlow</div></td>
			
	

	
	
			<td><div id="Beem7"><img src="Beem_Rich.gif" /><br />Beem</div></td>
			
	

	
	
			<td><div id="Bickerton187"><img src="qualifier.gif" /><br />Bickerton</div></td>
			
	

	
	
			<td><div id="Bjorn8"><img src="Bjorn_Thomas.gif" /><br />Bjorn</div></td>
			
	

	
	
			<td><div id="Bohn284"><img src="qualifier.gif" /><br />Bohn</div></td>
			
	

	
	
			<td><div id="Broadhurst251"><img src="broadhurst_paul.gif" /><br />Broadhurst</div></td>
			
	

	
	
			<td><div id="Brooks252"><img src="brooks_mark.gif" /><br />Brooks</div></td>
			
	

	
	
			<td><div id="Browne125"><img src="browne_olin.gif" /><br />Browne</div></td>
			
	

	
	
		<td><div id="Bryant241"><img src="bryant_bart.gif" /><br />Bryant</div></td></tr>
			
		
	

	
	
		
		<tr>
			<td><div id="Cabrera11"><img src="Cabrera_Angel.gif" /><br />Cabrera</div></td>
			
	

	
	
			<td><div id="Calcavecchia188"><img src="calcavecchia_mark.gif" /><br />Calcavecchia</div></td>
			
	

	
	
			<td><div id="Campbell12"><img src="Campbell_Chad.gif" /><br />Campbell</div></td>
			
	

	
	
			<td><div id="Campbell109"><img src="campbell_michael.gif" /><br />Campbell</div></td>
			
	

	
	
			<td><div id="Casey13"><img src="Casey_Paul.gif" /><br />Casey</div></td>
			
	

	
	
			<td><div id="Choi15"><img src="Choi_KJ.gif" /><br />Choi</div></td>
			
	

	
	
			<td><div id="Chopra191"><img src="chopra_daniel.gif" /><br />Chopra</div></td>
			
	

	
	
			<td><div id="Cink16"><img src="Cink_Stewart.gif" /><br />Cink</div></td>
			
	

	
	
			<td><div id="Clark192"><img src="clark_tim.gif" /><br />Clark</div></td>
			
	

	
	
			<td><div id="Couples19"><img src="Couples_Fred.gif" /><br />Couples</div></td>
			
	

	
	
			<td><div id="Crane255"><img src="crane_ben.gif" /><br />Crane</div></td>
			
	

	
	
			<td><div id="Curtis21"><img src="Curtis_Ben.gif" /><br />Curtis</div></td>
			
	

	
	
			<td><div id="Daly22"><img src="Daly_John.gif" /><br />Daly</div></td>
			
	

	
	
			<td><div id="DiMarco23"><img src="DiMarco_Chris.gif" /><br />DiMarco</div></td>
			
	

	
	
		<td><div id="Dodd195"><img src="qualifier.gif" /><br />Dodd</div></td></tr>
			
		
	

	
	
		
		<tr>
			<td><div id="Donald24"><img src="Donald_Luke.gif" /><br />Donald</div></td>
			
	

	
	
			<td><div id="Dougherty111"><img src="qualifier.gif" /><br />Dougherty</div></td>
			
	

	
	
			<td><div id="Duval25"><img src="Duval_David.gif" /><br />Duval</div></td>
			
	

	
	
			<td><div id="Edfors302"><img src="qualifier.gif" /><br />Edfors</div></td>
			
	

	
	
			<td><div id="Elkington134"><img src="elkington_steve.gif" /><br />Elkington</div></td>
			
	

	
	
			<td><div id="Els27"><img src="Els_Ernie.gif" /><br />Els</div></td>
			
	

	
	
			<td><div id="Fasth257"><img src="fasth_niclas.gif" /><br />Fasth</div></td>
			
	

	
	
			<td><div id="Faxon258"><img src="faxon_brad.gif" /><br />Faxon</div></td>
			
	

	
	
			<td><div id="Ferrie198"><img src="qualifier.gif" /><br />Ferrie</div></td>
			
	

	
	
			<td><div id="Flesch29"><img src="Flesch_Steve.gif" /><br />Flesch</div></td>
			
	

	
	
			<td><div id="Funk33"><img src="Funk_Fred.gif" /><br />Funk</div></td>
			
	

	
	
			<td><div id="Furyk34"><img src="Furyk_Jim.gif" /><br />Furyk</div></td>
			
	

	
	
			<td><div id="Gamez162"><img src="gamez_robert.gif" /><br />Gamez</div></td>
			
	

	
	
			<td><div id="Garcia35"><img src="Garcia_Sergio.gif" /><br />Garcia</div></td>
			
	

	
	
		<td><div id="Glover262"><img src="glover_lucas.gif" /><br />Glover</div></td></tr>
			
		
	

	
	
		
		<tr>
			<td><div id="Goosen37"><img src="Goosen_Retief.gif" /><br />Goosen</div></td>
			
	

	
	
			<td><div id="Gore115"><img src="gore_jason.gif" /><br />Gore</div></td>
			
	

	
	
			<td><div id="Grady263"><img src="grady_wayne.gif" /><br />Grady</div></td>
			
	

	
	
			<td><div id="Green205"><img src="qualifier.gif" /><br />Green</div></td>
			
	

	
	
			<td><div id="Green309"><img src="qualifier.gif" /><br />Green</div></td>
			
	

	
	
			<td><div id="Haas38"><img src="Haas_Jay.gif" /><br />Haas</div></td>
			
	

	
	
			<td><div id="Hamilton78"><img src="Hamilton_Todd.gif" /><br />Hamilton</div></td>
			
	

	
	
			<td><div id="Harrington79"><img src="Harrington_Padraig.gif" /><br />Harrington</div></td>
			
	

	
	
			<td><div id="Hart264"><img src="hart_dudley.gif" /><br />Hart</div></td>
			
	

	
	
			<td><div id="Hedblom113"><img src="hedblom_peter.gif" /><br />Hedblom</div></td>
			
	

	
	
			<td><div id="Henry149"><img src="henry_jj.gif" /><br />Henry</div></td>
			
	

	
	
			<td><div id="Hensby80"><img src="Hensby_Mark.gif" /><br />Hensby</div></td>
			
	

	
	
			<td><div id="Herron81"><img src="Herron_Tim.gif" /><br />Herron</div></td>
			
	

	
	
			<td><div id="Ho207"><img src="qualifier.gif" /><br />Ho</div></td>
			
	

	
	
		<td><div id="Holmes292"><img src="qualifier.gif" /><br />Holmes</div></td></tr>
			
		
	

	
	
		
		<tr>
			<td><div id="Howell83"><img src="Howell_David.gif" /><br />Howell</div></td>
			
	

	
	
			<td><div id="Howell III82"><img src="Howell_CharlesIII.gif" /><br />Howell III</div></td>
			
	

	
	
			<td><div id="Immelman84"><img src="Immelman_Trevor.gif" /><br />Immelman</div></td>
			
	

	
	
			<td><div id="Jimenez86"><img src="Jimenez_MiguelAngel.gif" /><br />Jimenez</div></td>
			
	

	
	
			<td><div id="Jobe165"><img src="jobe_brandt.gif" /><br />Jobe</div></td>
			
	

	
	
			<td><div id="Johnson39"><img src="Johnson_Zach.gif" /><br />Johnson</div></td>
			
	

	
	
			<td><div id="Kahn210"><img src="qualifier.gif" /><br />Kahn</div></td>
			
	

	
	
			<td><div id="Kelly42"><img src="Kelly_Jerry.gif" /><br />Kelly</div></td>
			
	

	
	
			<td><div id="Langer43"><img src="Langer_Bernhard.gif" /><br />Langer</div></td>
			
	

	
	
			<td><div id="Lehman99"><img src="lehman_tom.gif" /><br />Lehman</div></td>
			
	

	
	
			<td><div id="Leonard44"><img src="Leonard_Justin.gif" /><br />Leonard</div></td>
			
	

	
	
			<td><div id="Lonard47"><img src="Lonard_Peter.gif" /><br />Lonard</div></td>
			
	

	
	
			<td><div id="Love III48"><img src="Love_DavisIII.gif" /><br />Love III</div></td>
			
	

	
	
			<td><div id="Lowery169"><img src="lowery_steve.gif" /><br />Lowery</div></td>
			
	

	
	
		<td><div id="Maggert50"><img src="Maggert_Jeff.gif" /><br />Maggert</div></td></tr>
			
		
	

	
	
		
		<tr>
			<td><div id="Maruyama51"><img src="Maruyama_Shigeki.gif" /><br />Maruyama</div></td>
			
	

	
	
			<td><div id="Mayfair272"><img src="mayfair_billy.gif" /><br />Mayfair</div></td>
			
	

	
	
			<td><div id="McDowell97"><img src="mcdowell_graeme.gif" /><br />McDowell</div></td>
			
	

	
	
			<td><div id="Micheel52"><img src="Micheel_Shaun.gif" /><br />Micheel</div></td>
			
	

	
	
			<td><div id="Mickelson53"><img src="Mickelson_Phil.gif" /><br />Mickelson</div></td>
			
	

	
	
			<td><div id="Mitchum276"><img src="qualifier.gif" /><br />Mitchum</div></td>
			
	

	
	
			<td><div id="Montgomerie182"><img src="montgomerie_colin.gif" /><br />Montgomerie</div></td>
			
	

	
	
			<td><div id="Moore55"><img src="Moore_Ryan.gif" /><br />Moore</div></td>
			
	

	
	
			<td><div id="Nelson280"><img src="nelson_larry.gif" /><br />Nelson</div></td>
			
	

	
	
			<td><div id="O'Hair281"><img src="ohair_sean.gif" /><br />O'Hair</div></td>
			
	

	
	
			<td><div id="O'Hern58"><img src="OHern_Nick.gif" /><br />O'Hern</div></td>
			
	

	
	
			<td><div id="Oberholser155"><img src="oberholser_aaron.gif" /><br />Oberholser</div></td>
			
	

	
	
			<td><div id="Ogilvy151"><img src="ogilvy_geoff.gif" /><br />Ogilvy</div></td>
			
	

	
	
			<td><div id="Olazabal59"><img src="Olazabal_JoseMaria.gif" /><br />Olazabal</div></td>
			
	

	
	
		<td><div id="Owen282"><img src="qualifier.gif" /><br />Owen</div></td></tr>
			
		
	

	
	
		
		<tr>
			<td><div id="Palmer62"><img src="Palmer_Ryan.gif" /><br />Palmer</div></td>
			
	

	
	
			<td><div id="Pampling63"><img src="Pampling_Rod.gif" /><br />Pampling</div></td>
			
	

	
	
			<td><div id="Parnevik64"><img src="Parnevik_Jesper.gif" /><br />Parnevik</div></td>
			
	

	
	
			<td><div id="Pavin174"><img src="pavin_corey.gif" /><br />Pavin</div></td>
			
	

	
	
			<td><div id="Perez232"><img src="perez_pat.gif" /><br />Perez</div></td>
			
	

	
	
			<td><div id="Pernice219"><img src="pernice_tom.gif" /><br />Pernice</div></td>
			
	

	
	
			<td><div id="Perry65"><img src="Perry_Kenny.gif" /><br />Perry</div></td>
			
	

	
	
			<td><div id="Pettersson158"><img src="pettersson_carl.gif" /><br />Pettersson</div></td>
			
	

	
	
			<td><div id="Philo283"><img src="qualifier.gif" /><br />Philo</div></td>
			
	

	
	
			<td><div id="Poulter67"><img src="Poulter_Ian.gif" /><br />Poulter</div></td>
			
	

	
	
			<td><div id="Price68"><img src="Price_Nick.gif" /><br />Price</div></td>
			
	

	
	
			<td><div id="Purdy69"><img src="Purdy_Ted.gif" /><br />Purdy</div></td>
			
	

	
	
			<td><div id="Quigley295"><img src="qualifier.gif" /><br />Quigley</div></td>
			
	

	
	
			<td><div id="Riley70"><img src="Riley_Chris.gif" /><br />Riley</div></td>
			
	

	
	
		<td><div id="Rollins152"><img src="rollins_john.gif" /><br />Rollins</div></td></tr>
			
		
	

	
	
		
		<tr>
			<td><div id="Rose303"><img src="qualifier.gif" /><br />Rose</div></td>
			
	

	
	
			<td><div id="Sabbatini71"><img src="Sabbatini_Rory.gif" /><br />Sabbatini</div></td>
			
	

	
	
			<td><div id="Schwartzel236"><img src="qualifier.gif" /><br />Schwartzel</div></td>
			
	

	
	
			<td><div id="Scott72"><img src="Scott_Adam.gif" /><br />Scott</div></td>
			
	

	
	
			<td><div id="Sindelar304"><img src="qualifier.gif" /><br />Sindelar</div></td>
			
	

	
	
			<td><div id="Singh73"><img src="Singh_Vijay.gif" /><br />Singh</div></td>
			
	

	
	
			<td><div id="Sluman297"><img src="qualifier.gif" /><br />Sluman</div></td>
			
	

	
	
			<td><div id="Small307"><img src="qualifier.gif" /><br />Small</div></td>
			
	

	
	
			<td><div id="Stenson244"><img src="qualifier.gif" /><br />Stenson</div></td>
			
	

	
	
			<td><div id="Stricker305"><img src="qualifier.gif" /><br />Stricker</div></td>
			
	

	
	
			<td><div id="Taylor298"><img src="qualifier.gif" /><br />Taylor</div></td>
			
	

	
	
			<td><div id="Toms75"><img src="Toms_David.gif" /><br />Toms</div></td>
			
	

	
	
			<td><div id="Triplett76"><img src="Triplett_Kirk.gif" /><br />Triplett</div></td>
			
	

	
	
			<td><div id="Tway157"><img src="tway_bob.gif" /><br />Tway</div></td>
			
	

	
	
		<td><div id="Van Pelt87"><img src="VanPelt_Bo.gif" /><br />Van Pelt</div></td></tr>
			
		
	

	
	
		
		<tr>
			<td><div id="Verplank88"><img src="Verplank_Scott.gif" /><br />Verplank</div></td>
			
	

	
	
			<td><div id="Villegas306"><img src="qualifier.gif" /><br />Villegas</div></td>
			
	

	
	
			<td><div id="Weir90"><img src="Weir_Mike.gif" /><br />Weir</div></td>
			
	

	
	
			<td><div id="Westwood91"><img src="Westwood_Lee.gif" /><br />Westwood</div></td>
			
	

	
	
			<td><div id="Wetterich293"><img src="qualifier.gif" /><br />Wetterich</div></td>
			
	

	
	
			<td><div id="Wilson308"><img src="qualifier.gif" /><br />Wilson</div></td>
			
	

	
	
			<td><div id="Woods94"><img src="Woods_Tiger.gif" /><br />Woods</div></td>
			
	

</tr>
</table>

<table width="500" class="white" cellpadding="10">
  	<tr>
		<td>Test eomajax component :: 'getFriendGroupCF' method
		</td>
		<td><a href="testeomajaxcomponent.cfm">test component</a>
		</td>
	</tr>
  	<tr>
	  	<td>
		<select id="selgolfers" name="selgolfers" onchange="getgolferscoreJS();return false;" tabindex="2">
                        
                            <option value="2">Allenby, Robert</option>
                        
                            <option value="3">Ames, Stephen</option>
                        
                            <option value="4">Appleby, Stuart</option>
                        
                            <option value="247">Austin, Woody</option>
                        
                            <option value="248">Azinger, Paul</option>
                        
                            <option value="291">Baddeley, Aaron</option>
                        
                            <option value="126">Barlow, Craig</option>
                        
                            <option value="7">Beem, Rich</option>
                        
                            <option value="187">Bickerton, John</option>
                        
                            <option value="8">Bjorn, Thomas</option>
                        
                            <option value="284">Bohn, Jason</option>
                        
                            <option value="251">Broadhurst, Paul</option>
                        
                            <option value="252">Brooks, Mark</option>
                        
                            <option value="125">Browne, Olin</option>
                        
                            <option value="241">Bryant, Bart</option>
                        
                            <option value="11">Cabrera, Angel</option>
                        
                            <option value="188">Calcavecchia, Mark</option>
                        
                            <option value="12">Campbell, Chad</option>
                        
                            <option value="109">Campbell, Michael</option>
                        
                            <option value="13">Casey, Paul</option>
                        
                            <option value="15">Choi, K.J.</option>
                        
                            <option value="191">Chopra, Daniel</option>
                        
                            <option value="16">Cink, Stewart</option>
                        
                            <option value="192">Clark, Tim</option>
                        
                            <option value="19">Couples, Fred</option>
                        
                            <option value="255">Crane, Ben</option>
                        
                            <option value="21">Curtis, Ben</option>
                        
                            <option value="22">Daly, John</option>
                        
                            <option value="23">DiMarco, Chris</option>
                        
                            <option value="195">Dodd, Stephen</option>
                        
                            <option value="24">Donald, Luke</option>
                        
                            <option value="111">Dougherty, Nick</option>
                        
                            <option value="25">Duval, David</option>
                        
                            <option value="302">Edfors, Johann</option>
                        
                            <option value="134">Elkington, Steve</option>
                        
                            <option value="27">Els, Ernie</option>
                        
                            <option value="257">Fasth, Niclas</option>
                        
                            <option value="258">Faxon, Brad</option>
                        
                            <option value="198">Ferrie, Kenneth</option>
                        
                            <option value="29">Flesch, Steve</option>
                        
                            <option value="33">Funk, Fred</option>
                        
                            <option value="34">Furyk, Jim</option>
                        
                            <option value="162">Gamez, Robert</option>
                        
                            <option value="35">Garcia, Sergio</option>
                        
                            <option value="262">Glover, Lucas</option>
                        
                            <option value="37">Goosen, Retief</option>
                        
                            <option value="115">Gore, Jason</option>
                        

                            <option value="263">Grady, Wayne</option>
                        
                            <option value="205">Green, Richard</option>
                        
                            <option value="309">Green, Nathan</option>
                        
                            <option value="38">Haas, Jay</option>
                        
                            <option value="78">Hamilton, Todd</option>
                        
                            <option value="79">Harrington, Padraig</option>
                        
                            <option value="264">Hart, Dudley</option>
                        
                            <option value="113">Hedblom, Peter</option>
                        
                            <option value="149">Henry, JJ</option>
                        
                            <option value="80">Hensby, Mark</option>
                        
                            <option value="81">Herron, Tim</option>
                        
                            <option value="207">Ho, S K</option>
                        
                            <option value="292">Holmes, JB</option>
                        
                            <option value="83">Howell, David</option>
                        
                            <option value="82">Howell III, Charles</option>
                        
                            <option value="84">Immelman, Trevor</option>
                        
                            <option value="86">Jimenez, Miguel Angel</option>
                        
                            <option value="165">Jobe, Brandt</option>
                        
                            <option value="39">Johnson, Zach</option>
                        
                            <option value="210">Kahn, Simon</option>
                        
                            <option value="42">Kelly, Jerry</option>
                        
                            <option value="43">Langer, Bernhard</option>
                        
                            <option value="99">Lehman, Tom</option>
                        
                            <option value="44">Leonard, Justin</option>
                        
                            <option value="47">Lonard, Peter</option>
                        
                            <option value="48">Love III, Davis</option>
                        
                            <option value="169">Lowery, Steve</option>
                        
                            <option value="50">Maggert, Jeff</option>
                        
                            <option value="51">Maruyama, Shigeki</option>
                        
                            <option value="272">Mayfair, Billy</option>
                        
                            <option value="97">McDowell, Graeme</option>
                        
                            <option value="52">Micheel, Shaun</option>
                        
                            <option value="53">Mickelson, Phil</option>
                        
                            <option value="276">Mitchum, Kelly</option>
                        
                            <option value="182">Montgomerie, Colin</option>
                        
                            <option value="55">Moore, Ryan</option>
                        
                            <option value="280">Nelson, Larry</option>
                        
                            <option value="281">O'Hair, Sean</option>
                        
                            <option value="58">O'Hern, Nick</option>
                        
                            <option value="155">Oberholser, Aaron</option>
                        
                            <option value="151">Ogilvy, Geoff</option>
                        
                            <option value="59">Olazabal, Jose Maria</option>
                        
                            <option value="282">Owen, Greg</option>
                        
                            <option value="62">Palmer, Ryan</option>
                        
                            <option value="63">Pampling, Rod</option>
                        
                            <option value="64">Parnevik, Jesper</option>
                        
                            <option value="174">Pavin, Corey</option>
                        
                            <option value="232">Perez, Pat</option>
                        
                            <option value="219">Pernice, Tom</option>
                        
                            <option value="65">Perry, Kenny</option>
                        
                            <option value="158">Pettersson, Carl</option>
                        
                            <option value="283">Philo, Ron</option>
                        
                            <option value="67">Poulter, Ian</option>
                        
                            <option value="68">Price, Nick</option>
                        
                            <option value="69">Purdy, Ted</option>
                        
                            <option value="295">Quigley, Brett</option>
                        
                            <option value="70">Riley, Chris</option>
                        
                            <option value="152">Rollins, John</option>
                        
                            <option value="303">Rose, Justin</option>
                        
                            <option value="71">Sabbatini, Rory</option>
                        
                            <option value="236">Schwartzel, Charl</option>
                        
                            <option value="72">Scott, Adam</option>
                        
                            <option value="304">Sindelar, Joey</option>
                        
                            <option value="73">Singh, Vijay</option>
                        
                            <option value="297">Sluman, Jeff</option>
                        
                            <option value="307">Small, Mike</option>
                        
                            <option value="244">Stenson, Henrik</option>
                        
                            <option value="305">Stricker, Steve</option>
                        
                            <option value="298">Taylor, Vaughn</option>
                        
                            <option value="75">Toms, David</option>
                        
                            <option value="76">Triplett, Kirk</option>
                        
                            <option value="157">Tway, Bob</option>
                        
                            <option value="87">Van Pelt, Bo</option>
                        
                            <option value="88">Verplank, Scott</option>
                        
                            <option value="306">Villegas, Camilo</option>
                        
                            <option value="90">Weir, Mike</option>
                        
                            <option value="91">Westwood, Lee</option>
                        
                            <option value="293">Wetterich, Brett</option>
                        
                            <option value="308">Wilson, Dean</option>
                        
                            <option value="94">Woods, Tiger</option>
                        
         </select>
		</td>
		<td><input type="text" size="4" maxlength="3" width="" name="golfer_score2" id="golfer_score2" value="" onblur="updategolferscoreJS();return false;" tabindex="1" />
		</td>
	  </tr>
	  <tr>
	  	<td><input type="text" name="txtGetFriendsEmail" id="txtGetFriendsEmail" value="" onblur="getFriendsEmailJS();return false;" />
		</td>
		<td><span id="friendsemailreturn"></span>
		</td>
	  </tr>
	  <tr>
		
		<td class="tblehead">Name</td>
		
		
		<td class="tblehead">Current Score <br> Rel to Par</td>   
		
	  </tr>
	  <tr>
	  	<td>
		



		</td>
	  </tr>
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">2</span>
		
		Allenby, Robert</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-7" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">3</span>
		
		Ames, Stephen</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-89" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">4</span>
		
		Appleby, Stuart</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-22" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">247</span>
		
		Austin, Woody</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-24" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">248</span>
		
		Azinger, Paul</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-22" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">291</span>
		
		Baddeley, Aaron</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-22" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">126</span>
		
		Barlow, Craig</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-89" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">7</span>
		
		Beem, Rich</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-22" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">187</span>
		
		Bickerton, John</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-20" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">8</span>
		
		Bjorn, Thomas</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="6" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">284</span>
		
		Bohn, Jason</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="6" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">251</span>
		
		Broadhurst, Paul</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="6" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">252</span>
		
		Brooks, Mark</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-22" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">125</span>
		
		Browne, Olin</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">241</span>
		
		Bryant, Bart</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">11</span>
		
		Cabrera, Angel</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">188</span>
		
		Calcavecchia, Mark</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="11" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">12</span>
		
		Campbell, Chad</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">109</span>
		
		Campbell, Michael</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">13</span>
		
		Casey, Paul</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="3" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">15</span>
		
		Choi, K.J.</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-10" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">191</span>
		
		Chopra, Daniel</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="0" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">16</span>
		
		Cink, Stewart</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">192</span>
		
		Clark, Tim</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">19</span>
		
		Couples, Fred</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="3" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">255</span>
		
		Crane, Ben</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="5" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">21</span>
		
		Curtis, Ben</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="5" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">22</span>
		
		Daly, John</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">23</span>
		
		DiMarco, Chris</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-8" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">195</span>
		
		Dodd, Stephen</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">24</span>
		
		Donald, Luke</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-12" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">111</span>
		
		Dougherty, Nick</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="8" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">25</span>
		
		Duval, David</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">302</span>
		
		Edfors, Johann</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="5" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">134</span>
		
		Elkington, Steve</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="99" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">27</span>
		
		Els, Ernie</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-6" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">257</span>
		
		Fasth, Niclas</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">258</span>
		
		Faxon, Brad</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">198</span>
		
		Ferrie, Kenneth</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">29</span>
		
		Flesch, Steve</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">33</span>
		
		Funk, Fred</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-5" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">34</span>
		
		Furyk, Jim</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-3" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">162</span>
		
		Gamez, Robert</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">35</span>
		
		Garcia, Sergio</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-12" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">262</span>
		
		Glover, Lucas</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">37</span>
		
		Goosen, Retief</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">115</span>
		
		Gore, Jason</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="7" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">263</span>
		
		Grady, Wayne</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="99" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">205</span>
		
		Green, Richard</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">309</span>
		
		Green, Nathan</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="3" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">38</span>
		
		Haas, Jay</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="12" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">78</span>
		
		Hamilton, Todd</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="9" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">79</span>
		
		Harrington, Padraig</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="5" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">264</span>
		
		Hart, Dudley</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="99" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">113</span>
		
		Hedblom, Peter</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="99" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">149</span>
		
		Henry, JJ</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="0" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">80</span>
		
		Hensby, Mark</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="99" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">81</span>
		
		Herron, Tim</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-7" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">207</span>
		
		Ho, S K</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="9" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">292</span>
		
		Holmes, JB</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">83</span>
		
		Howell, David</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="9" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">82</span>
		
		Howell III, Charles</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">84</span>
		
		Immelman, Trevor</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">86</span>
		
		Jimenez, Miguel Angel</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="8" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">165</span>
		
		Jobe, Brandt</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">39</span>
		
		Johnson, Zach</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">210</span>
		
		Kahn, Simon</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="7" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">42</span>
		
		Kelly, Jerry</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">43</span>
		
		Langer, Bernhard</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="7" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">99</span>
		
		Lehman, Tom</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">44</span>
		
		Leonard, Justin</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="2" onblur="updateScoreJS();return false;"/> 
		</td>

		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">47</span>
		
		Lonard, Peter</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">48</span>
		
		Love III, Davis</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">169</span>
		
		Lowery, Steve</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="5" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">50</span>
		
		Maggert, Jeff</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="7" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">51</span>
		
		Maruyama, Shigeki</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">272</span>
		
		Mayfair, Billy</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">97</span>
		
		McDowell, Graeme</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">52</span>
		
		Micheel, Shaun</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-13" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">53</span>
		
		Mickelson, Phil</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-6" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">276</span>
		
		Mitchum, Kelly</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="6" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">182</span>
		
		Montgomerie, Colin</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">55</span>
		
		Moore, Ryan</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-9" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">280</span>
		
		Nelson, Larry</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="8" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">281</span>
		
		O'Hair, Sean</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-8" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">58</span>
		
		O'Hern, Nick</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="3" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">155</span>
		
		Oberholser, Aaron</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">151</span>
		
		Ogilvy, Geoff</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-9" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">59</span>
		
		Olazabal, Jose Maria</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">282</span>
		
		Owen, Greg</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">62</span>
		
		Palmer, Ryan</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="3" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">63</span>
		
		Pampling, Rod</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="3" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">64</span>
		
		Parnevik, Jesper</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">174</span>
		
		Pavin, Corey</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="3" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">232</span>
		
		Perez, Pat</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">219</span>
		
		Pernice, Tom</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="9" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">65</span>
		
		Perry, Kenny</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="3" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">158</span>
		
		Pettersson, Carl</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">283</span>
		
		Philo, Ron</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="11" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">67</span>
		
		Poulter, Ian</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-9" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">68</span>
		
		Price, Nick</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">69</span>
		
		Purdy, Ted</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">295</span>
		
		Quigley, Brett</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">70</span>
		
		Riley, Chris</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="0" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">152</span>
		
		Rollins, John</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">303</span>
		
		Rose, Justin</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="0" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">71</span>
		
		Sabbatini, Rory</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">236</span>
		
		Schwartzel, Charl</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">72</span>
		
		Scott, Adam</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-12" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">304</span>
		
		Sindelar, Joey</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="3" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">73</span>
		
		Singh, Vijay</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">297</span>
		
		Sluman, Jeff</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="3" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">307</span>
		
		Small, Mike</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="1" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">244</span>
		
		Stenson, Henrik</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-7" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">305</span>
		
		Stricker, Steve</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-10" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">298</span>
		
		Taylor, Vaughn</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="5" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">75</span>
		
		Toms, David</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-6" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">76</span>
		
		Triplett, Kirk</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="9" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">157</span>
		
		Tway, Bob</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="8" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">87</span>
		
		Van Pelt, Bo</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="99" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">88</span>
		
		Verplank, Scott</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="4" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">306</span>
		
		Villegas, Camilo</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="2" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  

    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">90</span>
		
		Weir, Mike</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-11" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">91</span>
		
		Westwood, Lee</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-3" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">293</span>
		
		Wetterich, Brett</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="9" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">308</span>
		
		Wilson, Dean</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-3" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
	
	<form onsubmit="updateScoreJS();return false;"> 
	  
	  <tr>
		
		<td class="ltturq">
		<span id="golfer_id" style="width:10px">94</span>
		
		Woods, Tiger</td>
		
		
		<td class="ltturq">
			  <input type="text" size="4" maxlength="3" width="" name="golfer_score" id="golfer_score" value="-22" onblur="updateScoreJS();return false;"/> 
		</td>
		
	  </tr>
	  
    </form>
	
  
</table>
<br>


<br>

	    
		
	</td>
    <td><img src="../images/spacer.gif" width="25" /></td>
    </td>
  </tr>
</table>
 
  </td>
    </tr>
	<tr>
	  <td class="ltturq" colspan="5">
	    <img src="../images/spacer.gif" width="200" height="20" alt="" border="0">
	  </td>
	</tr> 
	<tr>
	  <td class="dkblue" colspan="5">
	    <img src="../images/spacer.gif" width="200" height="1" alt="" border="0">
	  </td>
	</tr>
	<tr>
  	  <td class="white" colspan="5" align="left">
		<br><br>
		  
		  
		  powered by <a href="http://www.golfaviary.com">ALBATROSS</a> -- feel free to give feedback: holton@albatross-software.com
		<br><br>
	  <a href="http://www.golfaviary.com"><img src="../images/albatrosslogo.gif" width="145" height="40" border="0"></a>	  </td>
	</tr>
	<tr>
	  <td class="ltturq" colspan="5">
	  	<img src="../images/spacer.gif" width="200" height="15" alt="" border="0">
	  </td>
	</tr>
  </table>
</body>
</html>