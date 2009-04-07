<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>EyeOnMajors Community News : Brought to you by GolfNewsDaily.com</title>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <style type="text/css" media="all">@import "styles.css";</style>
 <link rel="alternate" type="application/rss+xml" title="&quot;Technology&quot; stories in rss" href="/rss/containertechnology.xml"/>
 <link rel="icon" href="/favicon.ico" type="image/x-icon" />


<script src="../js/prototype.js" type="text/javascript"></script>
<script src="../js/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript'>_ajaxConfig = {'_cfscriptLocation':'../components/eomajax.cfc', '_jsscriptFolder':'../js'};</script>
<script type='text/javascript' src='../js/ajax.js'></script>


<script type="text/javascript">
	function updateEyeItJS()	{
		// send data to CF
		DWRUtil.useLoadingMessage();
		storyid = 1; //read this from the page
		userid = 1; //read this from a div on the page 
		DWREngine._execute(_ajaxConfig._cfscriptLocation, null, 'updateEyeItStory', storyid, userid, updateEyeItReturnJS);
	}
	// call back function
	function updateEyeItReturnJS (r) {
		// set port price on page (use regular expression for price)
        $('numeyes').innerHTML = r;
		// new Effect.Shake('friendsemailreturn');
		Element.setStyle('numeyes', {color:'green'} ); 
		new Effect.Opacity('numeyes', {duration:0.5, from:1.0, to:0.2});
	}
</script>
</head>

<body>
<div id="container">
<div id="header">
  <h1><a href="/"><span>EyeOnMajors.com and GolfNewsDaily.com : Community News</span></a></h1>
  <form action="/" method="get" name="thisform" id="search" onsubmit="topsearch()">  <input type="radio" name="search-toggle" id="search-all" /><label for="search-all">All GolfNewsDaily.com</label>

  <input type="radio" name="search-toggle" id="search-specific" checked="checked"/><label for="search-specific">Technology</label>  <label for="top-keywords" accesskey="2" class="inside">search</label>
  <input type="text" name="s" id="top-keywords" value="" />
  <input type="image" id="top-submit" src="/img/search.gif" alt="Submit" />
  </form><a href="/logout" class="sign-out">Sign Out</a>
</div>

<script type="text/javascript"></script>
<div id="contents">
	<div class="extra-nav">
		<h2>All Golf Stories(need to feed from db)</h2>
		<ul>
		<li><a href="/view/technology/upcoming">Upcoming Stories (1,464(pop-from-db))</a></li>
		<li class="active"><span>Popular Stories</span></li>
		</ul>
		<br />
	</div>

	<div class="sub-menu">
		<span class="tool"><strong>Recently Popular</strong></span>
		<a href="/view/technology/popular/today" class="tool">Top Today</a>
		<a href="/view/technology/popular/yesterday" class="tool">Yesterday</a>
		<a href="/view/technology/popular/thisweek" class="tool">This Week</a>
		<a href="/view/technology/popular/thismonth" class="tool">This Month</a>
		<a href="/view/technology/popular/thisyear" class="tool">This Year</a>
		<a href="/rss/containertechnology.xml" class="tool"><img src="/img/rss-icon.gif" width="13" height="13" alt="RSS Feed" title="RSS Feed" /></a>
		<span class="tool set-off">EyeOnMajors Home!</span>
	</div>
	
	<script>mydiffref = '/users/holtonma';</script>
<!--- need to call this from component --->
<cfquery name="qry_getStories" datasource="eyeon2" dbtype="query">
		SELECT storyid, hreflink, usercaption, usertitle, numeyes, postedbyUserID, subjectid
		FROM tStory
</cfquery>
<!--- start looping thru news stories --->
<cfoutput query="qry_getStories">
<!-- One Story -->
<div class="news-summary" id="enclosure0" style="z-index:1000">
	 	<div class="news-body">
		<h3 id="title0"><a href="#hreflink#" target="_blank">#usertitle#</a></h3>
		<p class="news-submitted"><a href="/users/curtissthompson"><img src="/userimages/curtissthompson/small.gif" alt="#postedbyUserID#" width="16" height="16" /></a> submitted by <a href="/users/username">#postedbyUserID#</a> [timefromdb] ago (<a href="#hreflink#" class="simple tight" target="_blank">via [www.theinquirer.net[getthisfrompost]]?</a>)</p>
		<p>#usercaption#&nbsp;<a href="http://eyeonmajors.com/news?storyid=#storyid#" class="more">More...</a></p>
		<div class="news-details">
			<a href="/tech_news/AMD_CPU_Shortage_Looms" class="tool comments">18 comments</a>
			<a href="http://eyeonmajors.com/news?storyid=#storyid#" class="tool">Email This</a>
			<span class="tool">Topic: <a href="/tech_news">Tech Industry News</a></span>
			<ul class="probdrop" id="ul0" style="z-index:1000;">
				<li><a href="javascript://" onclick="HideandUNhideObj('0');" class="toplinep">No Shanks</a>
					<div style="display: none;" id="div0">
					<ul>
					<li class="d-item"><a href="javascript://" onclick="javascript:rjp(775744,8,0)">Duplicate Story</a></li>
					<li class="d-item"><a href="javascript://" onclick="javascript:rjp(775744,9,0)">Spam</a></li>
					<li class="d-item"><a href="javascript://" onclick="javascript:rjp(775744,15,0)">Change Topic</a></li>
					<li class="d-item"><a href="javascript://" onclick="javascript:rjp(775744,14,0)">Inaccurate</a></li>
					</ul>
					</div>
				</li>
			</ul>
		</div>
		</div>

	<ul class="news-digg">
	  	<li class="digg-count shade-5" id="main0">
	   		<a href="http://eyeonmajors.com/news?storyid=#storyid#"><strong id="diggs-strong-0"><span id="numeyes">#numeyes#</span></strong> eyes</a>
		</li>
	  	<li class="digg-it" id="diglink0">
			<a href="##" onclick="updateEyeItJS(); return false;">eye it</a>
			<!--- <div onclick="updateEyeItJS();return false;">eye it</div> --->
		</li>
	</ul>
</div>
<!--- End One Story --->
</cfoutput>


<div class="pages"><span class="nextprev">Previous</span><span class="current">1</span><a href="/view/technology/page2" title="Go to page 2">2</a><a href="/view/technology/page3" title="Go to page 3">3</a><a href="/view/technology/page4" title="Go to page 4">4</a><a href="/view/technology/page5" title="Go to page 5">5</a><a href="/view/technology/page6" title="Go to page 6">6</a><a href="/view/technology/page7" title="Go to page 7">7</a><a href="/view/technology/page8" title="Go to page 8">8</a><a href="/view/technology/page9" title="Go to page 9">9</a><a href="/view/technology/page10" title="Go to page 10">10</a> <span>...</span>

 <a href="/view/technology/page1465" title="Go to page [POP-from-query]">[page num POP-from-query]</a>
 <a href="/view/technology/page1466" title="Go to page [POP-from-query]">[page num POP-from-query]</a><a href="/view/technology/page2" class="nextprev" title="Go to Next Page">Next 187;</a></div></div>
<div id="sidebar"><h3>Mark Holton(user-pop-from-db-component</h3>
<ul>
<li class="menu-special">
	<a href="/users/holtonma"><img src="/img/user-small/user-default.png" alt="holtonma" width="16" height="16" /> <strong>Profile + History</strong></a>
</li>
<li class="menu-special">
	<a href="/eyestory/submit.cfm"><img src="/img/add.gif" alt="submit a story" width="16" height="16" /> <strong>Submit a New Story</strong></a></li>
</ul>

<h3>Topics to Eye</h3>
<ul>
 <li class="view-all"><a href="/view/all" class="current">View All</a></li>
 <li class="view-all"><a href="/view/technology">Tours</a>
 <li class="view-all"><a href="/view/science">Majors</a></li>
 <li class="view-all"><a href="/view/science">Equipment/ Tech</a></li>
 <li class="view-all"><a href="/view/world_business">Golf Business</a></li>
 <li class="view-all"><a href="/view/sports">Amateur Golf</a></li>
 <li class="view-all"><a href="/view/sports">College Golf</a></li>
 <li class="view-all"><a href="/view/videos">High School Golf</a></li>
 <li class="menu-controls"><a href="/profileedit/holtonma/topics" class="button-add">Add or Remove Topics</a></li>
</ul>
<h3>More GolfNewsDaily.com</h3>

<ul>
<li><a href="/topusers">Top GolfNewsDaily Users</a></li>
</ul>
</div>

<br style="clear: both;" /><!--IE6-->
<div id="footer">
<div class="footer-contents"><div class="footer-contents2">
<dl>
<dt>Site Links</dt>

<dd><a href="/">Home</a></dd>
<dd><a href="/tos">Terms of Use</a>, <a href="/privacy">Privacy</a></dd>
<dd><a href="/bugreport" class="menu-link">Report a Website Bug</a></dd>
</dl>


<dl>
<dt>All About GolfNewsDaily.com</dt>

<dd><a href="/about">About Us</a>, <a href="/faq">FAQ</a>, <a href="/about">Contact</a></dd>

</dl>

<dl>
<dt>Advertise on EyeOnMajors.com</dt>
<dd>You can buy advertising on EyeOnMajors.com through our site.  Contact: holtonma@gmail.com <!---<a href="http://www.federatedmedia.net/">Federated Media</a>.---></dd>

</dl>

<dl>
<dt>Score Tracking Tools &nbsp;<span class="new">NEW!</span></dt>
<dd>Check out <a href="http://www.atross.com">ATROSS Scoring Tools</a> : Analytical Tracking Objective Statistical Software</dd>
<dd>Also: <a href="http://www.golfaviary.com">The Aviary Statistical Software</a> : Recommended by Top Teachers, Trusted by Tour Pros</dd>
</dl>

<dl class="last">
<dt>Drive Traffic to your Site</dt>
<dd>[Coming Soon!]</dd>

</dl>

</div></div>
</div>
<div class="copyright">&copy; EyeOnMajors.com and GolfNewsDaily.com 2006 &8212; User-posted content, unless source quoted, <!--Creative Commons License--> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/publicdomain/">Creative Commons Public Domain License</a>.<!--/Creative Commons License--><!-- <rdf:RDF xmlns="http://web.resource.org/cc/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns">
<Work rdf:about="">
<license rdf:resource="http://creativecommons.org/licenses/publicdomain/" />
<dc:title>digg.com user contributed content</dc:title>
<dc:rights><Agent><dc:title>digg users</dc:title></Agent></dc:rights>
</Work>
<License rdf:about="http://creativecommons.org/licenses/publicdomain/"><permits rdf:resource="http://web.resource.org/cc/Reproduction"/><permits rdf:resource="http://web.resource.org/cc/Distribution"/><subClassOf xmlns="" rdf:resource="http://web.resource.org/cc/PublicDomain"/><permits rdf:resource="http://web.resource.org/cc/DerivativeWorks"/></License></rdf:RDF> -->
</div>

</div>
<script language="JavaScript" type="text/javascript" src="/js/tooltip.js"></script>

<!-- digg is done serving you. 2.01355321270u 137.03599911 6.6742x10-11m3kg-1s-2 6.6742x10-11m3kg-1s-2 -->

<script type="text/javascript"><!---
g_adcounts = new Object;
g_adcounts['top_ad'] = 3;


//---></script>

<script type="text/javascript" language="JavaScript" src="/js/adformatter.js"></script>
<script type="text/javascript" language="JavaScript"><!--
// Final configuration work:
var count = 0;
for (var ad in g_adcounts) {
    if ($(ad)) {
        count += g_adcounts[ad];
    } else {
        delete g_adcounts[ad];
    }
}
google_ad_client = "pub-7489042062340760";
saved_output = google_ad_output = "js";
saved_type = google_ad_type = "text";
saved_channel = google_ad_channel;
if (typeof(google_kw) != "undefined") {
    saved_kw_type = google_kw_type;
    saved_kw = google_kw;
}
adstage = 1;
fullads = new Array();

// First time, request 1
google_max_num_ads = count ? 1 : 0;
//--></script>
<script type="text/javascript" language="JavaScript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
<script type="text/javascript" language="JavaScript"><!--
// Figure out how many we need now
google_max_num_ads = count - 1;
google_max_num_ads = google_max_num_ads > 0 ? google_max_num_ads : 0;
adstage = 2;
google_bid = "CPC";
google_ad_output = saved_output;
google_ad_type = saved_type;
google_ad_channel = saved_channel;
if (typeof(saved_kw) != "undefined") {
    google_kw_type = saved_kw_type;
    google_kw = saved_kw;
}

//--></script>
<!---
<script type="text/javascript" language="JavaScript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>--->
</body>
</html>
