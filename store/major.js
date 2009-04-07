var portal;     
     
	 function processFeeds(feed_data, categoryID){
	   // creates output HTML based on structure of JSON feed_data
	   feed_html = "";
	   feed_data.each(function(feed){ 
	     if (feed.CATEGORY == categoryID){
		   var articleTemplate = new Template("<div class='article_title'><a href='#{LINK}'>#{TITLE}</a><div class='rating'>rate this article!:</div></div><div>#{DESCRIP}</div><div class='comments'><a href=''>comments...</a></div>"); 
		   //rating: <div id='rating_one' class='rating_container'><a class='rating_on' href='' style='cursor: default;'></a><a class='rating_off' href='' style='cursor: default;'/></a></div>
		   feed_html += articleTemplate.evaluate(feed)
		 }
	   });
	   
	   return feed_html;
	 }
	 
	 function onOverWidget(portal, widget) {
       widget.getElement().insertBefore($('control_buttons'), widget.getElement().firstChild);
       $('control_buttons').show(); 
     } 
   
     function onOutWidget(portal, widget) {
       $('control_buttons').hide();      
     } 
   
     function removeWidget(element) {
       var widget = $(element).up(".widget").widget;
     
       if (confirm('Are sure to remove this widget?')) { 
         document.body.appendChild($('control_buttons').hide())
         portal.remove(widget);
       }
     }                                
                                                                                                                                                           
     function onChange() {
     }
	
     function init() {             
       // ************************** data
       var url = "getNews_mock.cfm";
       var pars = "";
       new Ajax.Request(url, 
       {
         method: 'Post',
         asynchronous: true,
         parameters: pars,
         onComplete: function(transport){
           console.log(transport);
		   var json_news = transport.responseText.evalJSON(true);
		   console.log("json_news ", json_news);
		   var feed_data = json_news; //should be array of feed data
		   portal = new Xilinus.Portal("#page div", {onOverWidget: onOverWidget, onOutWidget: onOutWidget, onChange: onChange, removeEffect: Effect.SwitchOff}); 
           // widgets
           var category = 1; 
	       portal.add(new Xilinus.Widget().setTitle("Group Leaderboard").setContent(processFeeds(feed_data, category)), 0);
           var category = 3;   
           portal.add(new Xilinus.Widget().setTitle("Major Leaderboard").setContent(processFeeds(feed_data, category)), 1);      
           var category = 4;   
           portal.add(new Xilinus.Widget().setTitle("Messages").setContent(processFeeds(feed_data, category)), 1);
		   portal.add(new Xilinus.Widget().setTitle("From 'The Committee'").setContent(processFeeds(feed_data, category)), 1);
		   portal.add(new Xilinus.Widget().setTitle("Sponsored Links").setContent(processFeeds(feed_data, category)), 1); 
           // Add controls buttons
           portal.addWidgetControls("control_buttons");
		 }
        });
     }; // init fn
     Event.observe(window, "load", init);