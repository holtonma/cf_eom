<cfinclude template="eom_header.cfm">

<body id="bMyNews">
  <cfinclude template="eom_tabs.cfm">      
  <!--- <h1>Golf News Daily</h1> --->
  <div id="byline">A customizable source for daily updated golf news and scores from across the globe.</div>
  <div id="googleads">[ads will go here]</div>
  <div id="page">
      <div id="widget_col_0"></div>
      <div id="widget_col_1"></div>
      <div id="widget_col_2"></div>
 </div>    
 <div id="control_buttons" style="display:none">
   <a href="#" id="edit_button"></a>
   <a href="#" id="delete_button"></a> <!--- onclick="removeWidget(this); return false;"  --->
 </div>
 <script type="text/javascript" src="gnd.js"></script>
</body>
</html>
