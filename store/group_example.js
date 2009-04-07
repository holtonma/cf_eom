/*
upr_GroupLead.js

contains all objects, methods related to the Group Leader section of the application.
*/

var uprGroupMemberFns = Class.create();

uprGroupMemberFns.prototype = {
  initialize: function(buttonDOMelem){
    this.buttonDOMelem = buttonDOMelem; // this is the element of the button clicked, which corresponds to the ID
  },
  
  _obtainCUIDfrombutton: function(){
	  // if left three characters are 'rem', then it's remove; if left three characters are 'led' then its lead
	  var cuid = this.buttonDOMelem.id.slice(3);
	  console.log(cuid);
  },
  
  setNewLeader: function(){
    var cuidToCheck = this.buttonDOMelem.id.slice(3); //this._obtainCUIDfrombutton();
	var uprUtil = new uprUtil2(cuidToCheck); // initializes util functions with CUID string 
	// first check to see if CUID is valid:
    var oCheckCUID = uprUtil.cleanAndcheckCUID();
	/*
	oCheckCUID.validBool -- if 1 it is valid, if 0 invalid;
	oCheckCUID.processedCUID -- trimmed CUID (E.g. "mh3564")
	*/
	//console.log(oCheckCUID.validBool);
    strippedCUIDstr = encodeURIComponent(oCheckCUID.processedCUID.trim()); //cuid_to_add.trim()
	//var isValidCUID = uprUtil.clientCUIDValid(leaderCUID);
    //strippedCUIDstr = encodeURIComponent(leaderCUID.trim());
    GroupID = encodeURIComponent(parseInt($('selGroups').value)); // value of select box
  	
    if (oCheckCUID.validBool == 1) {
      //valid, therefore make call to db to add member
      // going to update 'groupinfo' div, which will contain
      var pars = "FORM.newLeaderCUID=" + strippedCUIDstr + "&FORM.GroupID=" + GroupID; //pass in trimmed CUID string
      var url = "/UPR/app/models/ajax_makeGroupLeader.cfm";
	  //div 'groupmembers' will be refreshed with new data from server
      new Ajax.Updater('groupmembers', url, {
        parameters: pars,
        method: 'post', //not idempotent, i.e. changing data
		onComplete: function(){
         $$(".btnMakeLead").each(function(s) {
	       //console.log(s.id);
		   var uprGroupMember = new uprGroupMemberFns($(s));
		   //var uprGroupMember2 = new uprGroupMemberFns(s);
	       Event.observe(s, 'click', uprGroupMember.setNewLeader.bindAsEventListener(uprGroupMember)); // uprGroupMember
         }); 
		 $$(".btnRemoveMember").each(function(s) {
	      //console.log(s.id);
		  var uprGroupMember = new uprGroupMemberFns($(s));
		  //var uprGroupMember2 = new uprGroupMemberFns(s);
	      Event.observe(s, 'click', uprGroupMember.removeMember.bindAsEventListener(uprGroupMember)); // uprGroupMember
         });
		 /*<[CDATA[*/
		   var dpck = new DatePicker({
		     relative : 'txtSPOCexp',
             language : 'en'
           });
         /*]]>*/
		 // attach events to SPOC
		 var uprGroupMember = new uprGroupMemberFns($('btnSPOC'));
         Event.observe('btnSPOC', 'click', uprGroupMember.addSPOC.bindAsEventListener(uprGroupMember)); // add button
         Event.observe('btnRemoveSPOC', 'click', uprGroupMember.removeSPOC.bindAsEventListener(uprGroupMember)); // remove SPOC button
	     $$(".spoc_radio").each(function(opt){
           Event.observe(opt, 'change', setSPOCescalate.bind(opt));
         });
		 new Ajax.Autocompleter(
          "txtSPOC", 
          "autocomplete_spocs", 
          "/UPR/app/models/SPOCCUIDfragment.cfm", 
          {
            paramName: "value", 
            minChars: 2, 
            indicator: 'indicator5'
          }
         );
		}
      });
    } else {
    	// invalid, show friendly error message 
    }
    
  },
  
  removeSPOC: function(){
    console.log("remove SPOC fn invoked 2...");
	var SPOC_CUIDwithName = $('txtSPOC').value;// this.cuidDomElem.value;
	var cuidToCheck = $('txtSPOC').value.split(" (")[1]
	console.log("valid cuid?: ", cuidToCheck)								 
	var expirydate_str = $('txtSPOCexp').value
	var uprUtil = new uprUtil2(SPOC_CUIDwithName); //this.cuidDomElem.value initializes util functions with CUID string 
	var oCheckCUID = uprUtil.cleanAndcheckCUID();
	
	console.log(oCheckCUID.validBool);
    strippedCUIDstr = encodeURIComponent(oCheckCUID.processedCUID.trim()); //cuid_to_add.trim()
  	GroupID = encodeURIComponent(parseInt($('selGroups').value)); // value of select box
  	userCUID = $('hdAMTAdminUserCUID').value
	
    if (oCheckCUID.validBool == 1) {
      //valid, therefore make call to db to add SPOC; create JSON of SPOC info:
	  var oSPOC = {"cuid": strippedCUIDstr, "groupid": GroupID};
	  var oSPOCjson = Object.toJSON(oSPOC);
	  var pars = "FORM.oSPOC=" + encodeURIComponent(oSPOCjson); //pass in trimmed CUID string
      var url = "/UPR/app/models/ajax_removeSPOC.cfm";
	  //div 'groupmembers' will be refreshed with new data from server
      console.log("about to run Updater...");
	  new Ajax.Updater('divSPOC', url, {
        parameters: pars,
        method: 'post', //not idempotent, i.e. changing data
		onSuccess: function(){
			console.log("inside onSuccess of updater...");
			//$$(".spoc_radio")[0].disabled = true;
			//console.log("disabled: ", $$(".spoc_radio")[0].disabled);
		},
		onComplete: function(){
			console.log("inside onComplete of updater...");
			console.log("blank?: ", $('txtSPOC').value == "");
			console.log("length?: ", $('txtSPOC').value.length);
			console.log("equal zero?: ", $('txtSPOC').value.length == 0);
			isblank = $('txtSPOC').value.length
			$$(".spoc_radio").each(function(opt){
              Event.observe(opt, 'change', setSPOCescalate.bind(opt));
			  //if txtSPOC is blank -- means successful removal, therefore disable radios:
			  if ($('txtSPOC').value.length == 0){ 
			    console.log("yo yo, spoc txt elem is blank...");
				opt.disabled = true;
			  }
            });
			// in order to activate date picker
			/*<[CDATA[*/
			var dpck = new DatePicker({
			relative : 'txtSPOCexp',
            language : 'en'
            });
            /*]]>*/
			var uprGroupMemberRem = new uprGroupMemberFns($('btnSPOCRemove'));
  			Event.observe('btnSPOCRemove', 'click', uprGroupMemberRem.addSPOC.bindAsEventListener(uprGroupMember)); // add button
			new Ajax.Autocompleter(
             "txtSPOC", 
             "autocomplete_spocs", 
             "/UPR/app/models/SPOCCUIDfragment.cfm", 
            {
              paramName: "value", 
              minChars: 2, 
              indicator: 'indicator5'
            }
           );
		}
      });
    } else {
    	// invalid, show friendly error message 
    }
  },
  
  addSPOC: function(){
    var SPOC_CUIDwithName = $('txtSPOC').value;// this.cuidDomElem.value;
	var expirydate_str = $('txtSPOCexp').value
	var uprUtil = new uprUtil2(SPOC_CUIDwithName); //this.cuidDomElem.value initializes util functions with CUID string 
	var oCheckCUID = uprUtil.cleanAndcheckCUID();
	
	console.log(oCheckCUID.validBool);
    strippedCUIDstr = encodeURIComponent(oCheckCUID.processedCUID.trim()); //cuid_to_add.trim()
  	GroupID = encodeURIComponent(parseInt($('selGroups').value)); // value of select box
  	userCUID = $('hdAMTAdminUserCUID').value
	
    if (oCheckCUID.validBool == 1) {
      //valid, therefore make call to db to add SPOC; create JSON of SPOC info:
	  var oSPOC = {"cuid": strippedCUIDstr, "expirydate": expirydate_str, "groupid": GroupID, "user_cuid": userCUID};
	  var oSPOCjson = Object.toJSON(oSPOC);
	  var pars = "FORM.oSPOC=" + encodeURIComponent(oSPOCjson); //pass in trimmed CUID string
      var url = "/UPR/app/models/ajax_setSPOC.cfm";
	  //div 'groupmembers' will be refreshed with new data from server
      new Ajax.Updater('divSPOC', url, {
        parameters: pars,
        method: 'post', //not idempotent, i.e. changing data
		onComplete: function(){
			var uprGroupMember = new uprGroupMemberFns($('btnSPOC'));
  			Event.observe('btnSPOC', 'click', uprGroupMember.addSPOC.bindAsEventListener(uprGroupMember)); // add button
			$$(".spoc_radio").each(function(opt){
     		  //if txtSPOC is blank -- means successful removal, therefore disable radios:
			  if ($('hdSPOCcuidmanage').value.length > 0){ 
			    console.log("spoc hd elem is not blank...");
				opt.disabled = false;
			  }
            });
			Event.observe($$(".spoc_radio")[0], 'change', setSPOCescalate.bind($$(".spoc_radio")[0]));
			Event.observe($$(".spoc_radio")[1], 'change', setSPOCescalate.bind($$(".spoc_radio")[1]));
			$$(".spoc_radio")[0].checked = true;
			$$(".spoc_radio")[1].checked = false;
			// in order to activate date picker
			/*<[CDATA[*/
			var dpck = new DatePicker({
			relative : 'txtSPOCexp',
            language : 'en'
            });
            /*]]>*/
			new Ajax.Autocompleter(
             "txtSPOC", 
             "autocomplete_spocs", 
             "/UPR/app/models/SPOCCUIDfragment.cfm", 
            {
              paramName: "value", 
              minChars: 2, 
              indicator: 'indicator5'
            }
           );
		}
      });
    } else {
    	// invalid, show friendly error message 
    }
  },
  
  removeMember: function(cuid_to_remove){
    var cuidToCheck = this.buttonDOMelem.id.slice(3); //this._obtainCUIDfrombutton();
	var uprUtil = new uprUtil2(cuidToCheck); // initializes util functions with CUID string 
	// first check to see if CUID is valid:
    var oCheckCUID = uprUtil.cleanAndcheckCUID();
	/*
	oCheckCUID.validBool -- if 1 it is valid, if 0 invalid;
	oCheckCUID.processedCUID -- trimmed CUID (E.g. "mh3564")
	*/
	//console.log(oCheckCUID.validBool);
    strippedCUIDstr = encodeURIComponent(oCheckCUID.processedCUID.trim()); //cuid_to_add.trim()
	//var isValidCUID = uprUtil.clientCUIDValid(leaderCUID);
    //strippedCUIDstr = encodeURIComponent(leaderCUID.trim());
    GroupID = encodeURIComponent(parseInt($('selGroups').value)); // value of select box
  	
    if (oCheckCUID.validBool == 1) {
      //valid, therefore make call to db to add member
      // going to update 'groupinfo' div, which will contain
      var pars = "FORM.removedMemberCUID=" + strippedCUIDstr + "&FORM.GroupID=" + GroupID; //pass in trimmed CUID string
      var url = "/UPR/app/models/ajax_removeMemberFromGroup.cfm";
	  //div 'groupmembers' will be refreshed with new data from server
      new Ajax.Updater('groupmembers', url, {
        parameters: pars,
        method: 'post', //not idempotent, i.e. changing data
		onComplete: function(){
         $$(".btnRemoveMember").each(function(s) {
	      //console.log(s.id);
		  var uprGroupMember = new uprGroupMemberFns($(s));
		  //var uprGroupMember2 = new uprGroupMemberFns(s);
	      Event.observe(s, 'click', uprGroupMember.removeMember.bindAsEventListener(uprGroupMember)); // uprGroupMember
         });
		 $$(".btnMakeLead").each(function(s) {
	      var uprGroupMember = new uprGroupMemberFns($(s));
		  Event.observe(s, 'click', uprGroupMember.setNewLeader.bindAsEventListener(uprGroupMember)); // uprGroupMember
         });
		 $$(".spoc_radio").each(function(opt){
           Event.observe(opt, 'change', setSPOCescalate.bind(opt));
         });
		 // in order to activate date picker
		 /*<[CDATA[*/
		  var dpck = new DatePicker({
		   relative : 'txtSPOCexp',
           language : 'en'
          });
         /*]]>*/
		 new Ajax.Autocompleter(
             "txtSPOC", 
             "autocomplete_spocs", 
             "/UPR/app/models/SPOCCUIDfragment.cfm", 
            {
              paramName: "value", 
              minChars: 2, 
              indicator: 'indicator5'
            }
           );
		 // attach events to SPOC
		 var uprGroupMember = new uprGroupMemberFns($('btnSPOC'));
         Event.observe('btnSPOC', 'click', uprGroupMember.addSPOC.bindAsEventListener(uprGroupMember)); // add button
         Event.observe('btnRemoveSPOC', 'click', uprGroupMember.removeSPOC.bindAsEventListener(uprGroupMember)); // remove SPOC button
	    }
      });
    } else {
    	// invalid, show friendly error message 
    }
  }
};

var uprGroupLead2 = Class.create();

uprGroupLead2.prototype = {
  initialize: function(groupIdElem, cuidDomElem) {
    this.groupIdElem  = groupIdElem;
    this.cuidDomElem = cuidDomElem;
  },

  getGroup: function() {
  	//$('divAddGrpMember').innerHTML = "";
	$('divAddGrpMember').show();
	var groupID = this.groupIdElem.value;
  	var pars = "FORM.GroupID=" + encodeURIComponent(parseInt(groupID));
  	var url = "/UPR/app/models/ajax_Group.cfm";
	//console.log(groupID);
  	//pass groupID value
    new Ajax.Updater('groupinfo', url, {
      parameters: pars,
      method: 'post', //would use GET here, but IE6 throws up and caches the first GET request
      onComplete: function(){
        $$(".btnMakeLead").each(function(s) {
	      
		  var uprGroupMember = new uprGroupMemberFns($(s));
		  //var uprGroupMember2 = new uprGroupMemberFns(s);
	      Event.observe(s, 'click', uprGroupMember.setNewLeader.bindAsEventListener(uprGroupMember)); // uprGroupMember
        }); 
		$$(".btnRemoveMember").each(function(s) {
	      //console.log(s.id);
		  var uprGroupMember = new uprGroupMemberFns($(s));
		  //var uprGroupMember2 = new uprGroupMemberFns(s);
	      Event.observe(s, 'click', uprGroupMember.removeMember.bindAsEventListener(uprGroupMember)); // uprGroupMember
        });
		$$(".spoc_radio").each(function(opt){
          Event.observe(opt, 'change', setSPOCescalate.bind(opt));
        });
		new Ajax.Autocompleter(
             "txtSPOC", 
             "autocomplete_spocs", 
             "/UPR/app/models/SPOCCUIDfragment.cfm", 
            {
              paramName: "value", 
              minChars: 2, 
              indicator: 'indicator5'
            }
           );
		// in order to activate date picker
		/*<[CDATA[*/
		var dpck = new DatePicker({
		relative : 'txtSPOCexp',
        language : 'en'
        });
        /*]]>*/
		// attach events to SPOC
		var uprGroupMember = new uprGroupMemberFns($('btnSPOC'));
        Event.observe('btnSPOC', 'click', uprGroupMember.addSPOC.bindAsEventListener(uprGroupMember)); // add button
        Event.observe('btnRemoveSPOC', 'click', uprGroupMember.removeSPOC.bindAsEventListener(uprGroupMember)); // remove SPOC button
      }
	  //onSuccess: 
    });
  },
  
  addMember: function(){
    var CUIDwithName = $('txtAMTGroupCUID').value;// this.cuidDomElem.value;
	var uprUtil = new uprUtil2(CUIDwithName); //this.cuidDomElem.value initializes util functions with CUID string 
	var oCheckCUID = uprUtil.cleanAndcheckCUID();
	/*
	oCheckCUID.validBool -- if 1 it is valid, if 0 invalid;
	oCheckCUID.processedCUID -- trimmed CUID (E.g. "mh3564")
	*/
	console.log(oCheckCUID.validBool);
    strippedCUIDstr = encodeURIComponent(oCheckCUID.processedCUID.trim()); //cuid_to_add.trim()
  	GroupID = encodeURIComponent(parseInt(this.groupIdElem.value)); // value of select box
  	
    if (oCheckCUID.validBool == 1) {
      //valid, therefore make call to db to add member
      // going to update 'groupinfo' div, which will contain
      var pars = "FORM.newMemberCUID=" + strippedCUIDstr + "&FORM.GroupID=" + GroupID; //pass in trimmed CUID string
      var url = "/UPR/app/models/ajax_addMemberToGroup.cfm";
	  //div 'groupmembers' will be refreshed with new data from server
      new Ajax.Updater('groupmembers', url, {
        parameters: pars,
        method: 'post', //not idempotent, i.e. changing data
		onComplete: function(){
		   $$(".btnRemoveMember").each(function(s) {
	         //console.log(s.id);
		     var uprGroupMember = new uprGroupMemberFns($(s));
		     //var uprGroupMember2 = new uprGroupMemberFns(s);
	         Event.observe(s, 'click', uprGroupMember.removeMember.bindAsEventListener(uprGroupMember)); // uprGroupMember
           });
		   $$(".btnMakeLead").each(function(s) {
	         var uprGroupMember = new uprGroupMemberFns($(s));
		     Event.observe(s, 'click', uprGroupMember.setNewLeader.bindAsEventListener(uprGroupMember)); // uprGroupMember
           }); 
		   $$(".spoc_radio").each(function(opt){
             Event.observe(opt, 'change', setSPOCescalate.bind(opt));
           });
		   new Ajax.Autocompleter(
             "txtSPOC", 
             "autocomplete_spocs", 
             "/UPR/app/models/SPOCCUIDfragment.cfm", 
            {
              paramName: "value", 
              minChars: 2, 
              indicator: 'indicator5'
            }
           );
		   /*<[CDATA[*/
		   var dpck = new DatePicker({
		     relative : 'txtSPOCexp',
             language : 'en'
           });
           /*]]>*/
		   // attach events to SPOC
		   var uprGroupMember = new uprGroupMemberFns($('btnSPOC'));
           Event.observe('btnSPOC', 'click', uprGroupMember.addSPOC.bindAsEventListener(uprGroupMember)); // add button
           Event.observe('btnRemoveSPOC', 'click', uprGroupMember.removeSPOC.bindAsEventListener(uprGroupMember)); // remove SPOC button
		}
      });
    } else {
    	// invalid, show friendly error message 
    }
  }

  
};


Event.observe(window, 'load', function(){
  //alert("hello groupinfo hath been loaded");  
  // attach events on page load
  // var uprUtil = new uprUtil2($('txtCUID').value);
  // var uprGroupLead = new uprGroupLead2($('selGroups'), $('txtCUID'), uprUtil);
  var uprGroupLead = new uprGroupLead2($('selGroups'), $('txtCUID'));
  //var uprGroupMember = new uprGroupMemberFns($('ledmh3564'));
  
  uprGroupLead.bfx = uprGroupLead.addMember.bindAsEventListener(uprGroupLead)
  Event.observe('btnAddMember', 'click', uprGroupLead.bfx); // bindAsEventListener Add Member button
  Event.observe('selGroups', 'change', uprGroupLead.getGroup.bindAsEventListener(uprGroupLead)); // add button
  var uprGroupMember = new uprGroupMemberFns($('btnSPOC'));
  Event.observe('btnSPOC', 'click', uprGroupMember.addSPOC.bindAsEventListener(uprGroupMember)); // add button
  // var uprGroupMember2 = new uprGroupMemberFns($('btnRemoveSPOC'));
  Event.observe('btnRemoveSPOC', 'click', uprGroupMember.removeSPOC.bind(uprGroupMember)); // remove SPOC button
  
  // for all buttons of class 'btnMakeLead' add the appropriate event listener:
  $$(".btnMakeLead").each(function(s) {
    var uprGroupMember = new uprGroupMemberFns($(s));
    Event.observe(s, 'click', uprGroupMember.setNewLeader.bindAsEventListener(uprGroupMember)); // uprGroupMember
  });
  $$(".btnRemoveMember").each(function(s) {
	var uprGroupMember = new uprGroupMemberFns($(s));
	Event.observe(s, 'click', uprGroupMember.removeMember.bindAsEventListener(uprGroupMember)); // uprGroupMember
  });
  
  //txtCUID 
  new Ajax.Autocompleter(
   "txtAMTGroupCUID", 
   "autocomplete_choices", 
   "/UPR/app/models/CUIDfragment.cfm", 
   {
	paramName: "value", 
	minChars: 2, 
	indicator: 'indicator1'
   }
  )

});

