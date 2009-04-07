<!---
	Name         : ajax
	Author       : Rob Gonda
	Created      : December 8, 2005
	Last Updated : Sept 06 , 2006
	History      : Initial Alpha release (rg 12/8/05)
				 : Added error trapping for easier debugging (rg 12/9/05)
				 : Disabled debug output for ajax calls (rg 12/13/05)
				 : Added the ability to restrict to post, get, or both verbs (rg 12/18/05)
				 : Added debug mode methods (rg 12/18/05)
				 : Added http referer enforcement policy (rg 12/18/05)
				 : Reset content to remove application.cfm/cfc html code (rg 01/13/06)
				 : aborted immediately after request is complete to remove onRequestEnd html code (rg 01/13/06)
				 : abort after request is now optional --thru getters and setters-- and defaulted not to. (rg 01/16/06)
				 : added request debug mode  (rg 01/23/06)
				 : added StripCR() to the JS Return to fix bug in cfwddx (rg 01/31/06)
				 : modified invoking method to pass an argumentcollection on named vars (rg 3/5/06)
				 : fix in MetaData call for Blue Dragon (rg 5/22/06)
				 : urlDecode arguments only for Safari. Fixes error when & signs are sent (rg 6/25/06)
				 : if single object is passed as argument, is it passed to the invoked function as a collection (rg 6/25/06)
				 : fixed wrong var name for Safari conditional. (rg 7/16/06)
				 : replace CGI.SERVER_NAME with CGI.HTTP_HOST for referral checking. (rg 7/16/06)
				 : added flag to support the complexInputStruct new functionality (nathanael waite 7/24/06/)
				 : replace not isSimpleValue() with IsStruct() to recognize single objects as arguments (rg 9/6/06)
				 
	Purpose		 : extendable component for cf+ajax framework
--->
<cfcomponent displayname="ajax">
	<cfsetting showdebugoutput="false">

	<cfscript>
		// note: script has to reside outside of the init function because instance variables can be overridden.
	
		// create structure to hold instance variables
		variables.instance = structNew();
		
		// set allowed verbs to support both get and post
		setAllowedVerbs('get,post');
		// set debug mode to disabled
		setDebugMode('');
		// set http referer check to disabled
		setCheckHTTPReferer(false);
		// do not abort after request
		setAbortAfterRequest(false);
		// allow sending single argumentCollection object
		setComplexInputStruct(true);
	</cfscript>

	<!--- 
		function: init
		in: void
		out: outputs return to screen
		notes: automatically called by engine.js
	 --->
	<cffunction name="init" access="remote" output="yes" returntype="void">
		<cfscript>
			var result = '';
			var methodArgumentCollection = structNew();
			var methodParameters = '';
			var methodParametersLength = 0;
			var methodParameterName = '';
			var i = 0;
			if ( getDebugMode() eq 'init' ) {
				debug();
			}
			
			// check is http referer policy is enabled
			if (getCheckHTTPReferer() eq true) {
				if (CGI.HTTP_HOST neq GetHostFromURL(CGI.HTTP_REFERER)) {
					throw('ajaxCFC','http referer policy violated');
				}
			}
			
			// check if ajax request was submitted with post verb
			if (CGI.REQUEST_METHOD eq "POST") {
				// check if verb is allowed
				if (isVerbAllowed(CGI.REQUEST_METHOD) eq true) {
					variables.ajax = parseURL(FORM);
				} else {
					throw('ajaxCFC','POST method not allowed');
				}
				
			// check if ajax request was submitted with get verb
			} else if (CGI.REQUEST_METHOD eq "GET") {
				// check if verb is allowed
				if (isVerbAllowed(CGI.REQUEST_METHOD) eq true) {
					variables.ajax = parseURL(URL);
				} else {
					throw('ajaxCFC','GET method not allowed');
				}
			
			// this should never happen
			} else {
				return;
			}

			if ( getDebugMode() eq 'request' ) {
				debug(ajax);
			}
		</cfscript>
		
		<cftry>
			<cfif arrayLen(ajax.params) eq 1 and IsStruct(ajax.params[1]) and getComplexInputStruct() EQ true>
				<cfinvoke method="#ajax.method#" returnvariable="result" argumentcollection="#ajax.params[1]#" />	
			<cfelse>
				<cfscript>
				// Gets the parameters from the function that will be invoked
				methodMetaDataDump = getMetaData(this).FUNCTIONS;
				for (i=1; i LTE arraylen(methodMetaDataDump); i = i + 1) {
					if (methodMetaDataDump[i].NAME eq ajax.method) {
						methodParameters = methodMetaDataDump[i].PARAMETERS;
					}
				}
				methodParametersLength = arraylen(methodParameters);
				//Build the arguments collection
				for (i = 1; i LTE arraylen(ajax.params); i = i + 1) {
					//When passing more arguments than are defined in the function we will give them a unique name
					if(i LTE methodParametersLength) {
						methodParameterName = methodParameters[i].name;
					}
					else {
						methodParameterName = 'unknown' & i;
					}
					structInsert(methodArgumentCollection, methodParameterName, ajax.params[i]);
				}
				</cfscript>
				<cfinvoke method="#ajax.method#" returnvariable="result" argumentcollection="#methodArgumentCollection#" />	
			</cfif>
		<cfcatch type="Any">
			<cfset alertError(cfcatch, ajax.id) /><cfabort />
		</cfcatch>
		</cftry>
		
		<cfset result = StripCR(convertResult(result, ajax.id))>
		
		<cfscript>
			returnAjax(result, ajax.id);

			if ( getDebugMode() eq 'result' ) {
				debug(result);
			}
		</cfscript>		
		<!--- if specifically requested to abort --->
		<cfif getAbortAfterRequest()><cfabort /></cfif>
	</cffunction>
	

	<!--- 
		function: parseURL
		in: ajax url with 'get' verb
		out: void
	 --->
	<cffunction name="parseURL" access="private" output="No">
		<cfargument name="objURL" required="Yes" type="struct" />
			
			<cfset var params = arrayNew(1) />
			<cfset var paramsArray = StructKeyArray(objURL) />
			<cfset var i = "" />
			<cfset var result = structNew() />
			
			<cfset arraySort(paramsArray, 'textnocase') />
			
			<cfloop from="1" to="#arrayLen(paramsArray)#" index="i">
				<cfif left(paramsArray[i], 8) eq "C0-PARAM">
					<cfset arrayAppend(params, parseParam( objURL[paramsArray[i]] ) ) />
				</cfif>
			</cfloop>
			
			<cfset result.method = duplicate(objURL['C0-METHODNAME']) />
			<cfset result.id = duplicate(objURL['C0-ID']) />
			<cfset result.params = params />

		<cfreturn result />
	</cffunction>
	
	<!--- 
		function: parseParam
		in: wddx encoded parameter 
		out: decoded parameter
	 --->
	<cffunction name="parseParam" access="private" output="No">
		<cfargument name="param" required="Yes" type="string" />
		
			<cfscript>
				param = removeChars(param, 1, 7);
				if (findNoCase(cgi.HTTP_USER_AGENT,"safari")) {
					param = urlDecode(param);
				}
				param = wddx('WDDX2CFML',param);
				
				return param;
			</cfscript>
			
	</cffunction>
	
	<!--- 
		function: debug
		in: optionally takes an input to dump
		out: void
	 --->
	<cffunction name="debug" access="private" output="No" returntype="void">
		<cfargument name="input" required="No" default="" />
		
		<cfset var debugFile = expandpath('debug.html') />
		<cfset var debungInfo = "" />

		<cfsavecontent variable="debungInfo">
			<cfdump var="#arguments.input#" label="custom">
			<cfdump var="#form#" label="form">
			<cfdump var="#url#" label="url">
			<cfdump var="#cgi#" label="cgi">
		</cfsavecontent>
		<cffile action="WRITE" file="#debugFile#" output="#debungInfo#" />
	</cffunction>
	
	<!--- 
		function: wddx
		in: action, input (wddx encoded)
		out: decoded
	 --->
	<cffunction name="wddx" access="private" output="No" hint="udf version of cfwddx">
		<cfargument name="action" required="Yes" />
		<cfargument name="input" required="Yes" />
		
		<cfset var r = "" />
		<cfwddx action="#arguments.action#" input="#arguments.input#" output="r" />
		<cfreturn r />		
	</cffunction>
	
	
	<!--- 
		function: returnAjax
		in: result and id
		out: void
		note: outputs result back to the screen
	 --->
	<cffunction name="returnAjax" access="private" output="Yes" returntype="void">
		<cfargument name="result" required="Yes" />
		<cfargument name="id" required="Yes" />

		<cfoutput><cfcontent reset="Yes">
			#result#
			DWREngine._handleResponse('#id#', _#id#);
		</cfoutput>
		
	</cffunction>
	
	<!--- 
		function: alertError
		in: error and id
		out: void
		note: alerts cferror trapped by cfcatch to user
	 --->
	<cffunction name="alertError" access="private" output="Yes" returntype="void">
		<cfargument name="objError" required="Yes" />
		<cfargument name="id" required="Yes" />
		<cfoutput>
			alert('An error has occurred:\nMessage:#jsStringFormat(arguments.objError.message)#');
			var _#id# = null;
			DWREngine._handleResponse('#id#', _#id#);
		</cfoutput>
		
	</cffunction>

	<!--- 
		function: convertResult
		in: result and id
		out: string: wddx javascript with wddx encoded values
		note: helper function, converts results to javascript wddx
	 --->
	<cffunction name="convertResult" returntype="string" output="No" >
		<cfargument name="result" required="yes">
		<cfargument name="id" required="yes">
		<cfset var returnVar = "" />
		<cfwddx action="CFML2JS" input="#result#" toplevelvariable="_#id#" output="returnVar">
		<cfreturn returnVar />
	</cffunction>
	
	<!--- 
		function: getAllowedVerbs
		in: 
		out: string: get, post, or both
		note: 
	 --->
	<cffunction name="getAllowedVerbs" returntype="string" output="No">
		<cfreturn variables.instance.allowedVerbs />
	</cffunction>
	
	<!--- 
		function: setAllowedVerbs
		in: string: get, post, or both
		out: void
		note: 
	 --->
	<cffunction name="setAllowedVerbs" output="No" returntype="void">
		<cfargument name="verbs" default="" required="Yes" type="string" />
		
		<cfif arguments.verbs neq 'get' and arguments.verbs neq 'post' and arguments.verbs neq 'get,post' and arguments.verbs neq 'post,get'>
			<cfthrow type="ajaxCFC" message="setAllowedVerbs: verbs can only be a combination of get and post" />
		</cfif>
		
		<cfset variables.instance.allowedVerbs = arguments.verbs />
	</cffunction>
	
	<!--- 
		function: getDebugMode
		in: 
		out: string: ...
		note: 
	 --->
	<cffunction name="getDebugMode" returntype="string" output="No">
		<cfreturn variables.instance.debugMode />
	</cffunction>
	
	<!--- 
		function: setDebugMode
		in: string: get, post, or both
		out: void
		note: 
	 --->
	<cffunction name="setDebugMode" output="No" returntype="void">
		<cfargument name="mode" default="" required="Yes" type="string" />
		
		<cfif len(arguments.mode) and listFind('init,result,request',arguments.mode) eq 0>
			<cfthrow type="ajaxCFC" message="setDebugMode: invalid mode" />
		</cfif>
		
		<cfset variables.instance.debugMode = arguments.mode />
	</cffunction>

	<!--- 
		function: getCheckHTTPReferer
		in: 
		out: boolean
		note: 
	 --->
	<cffunction name="getCheckHTTPReferer" returntype="boolean" output="No">
		<cfreturn variables.instance.checkHTTPReferer />
	</cffunction>
	
	<!--- 
		function: setCheckHTTPReferer
		in: boolean
		out: void
		note: 
	 --->
	<cffunction name="setCheckHTTPReferer" output="No" returntype="void">
		<cfargument name="check" default="false" required="Yes" type="boolean" />
		
		<cfif isBoolean(arguments.check) eq false>
			<cfthrow type="ajaxCFC" message="setCheckHTTPReferer: invalid argument" />
		</cfif>
		
		<cfset variables.instance.checkHTTPReferer = arguments.check />
	</cffunction>

	<!--- 
		function: setAbortAfterRequest
		in: boolean
		out: void
		note: 
	 --->
	<cffunction name="setAbortAfterRequest" output="No" returntype="void">
		<cfargument name="abortAfterRequest" default="false" required="Yes" type="boolean" />
		
		<cfif isBoolean(arguments.abortAfterRequest) eq false>
			<cfthrow type="ajaxCFC" message="setAbortAfterRequest: invalid argument" />
		</cfif>
		
		<cfset variables.instance.abortAfterRequest = arguments.abortAfterRequest />
	</cffunction>

	<!--- 
		function: getAbortAfterRequest
		in: 
		out: boolean
		note: returns abortAfterRequest
	 --->
	<cffunction name="getAbortAfterRequest" output="No" returntype="boolean">
		<cfreturn variables.instance.abortAfterRequest />
	</cffunction>

	<!--- 
		function: isVerbAllowed
		in: verb
		out: boolean
		note: 
	 --->
	<cffunction name="isVerbAllowed" output="No" returntype="boolean">
		<cfargument name="verb" default="" required="Yes" type="string" />
		
		<cfif arguments.verb neq 'get' and arguments.verb neq 'post'>
			<cfthrow type="ajaxCFC" message="isVerbAllowed: invalid verb" />
		</cfif>
		
		<cfreturn ListFindNoCase(getAllowedVerbs(),arguments.verb) gt 0 />
	</cffunction>

	<!---
	 Mimics the CFTHROW tag.
	 
	 @param Type 	 Type for exception. (Optional)
	 @param Message 	 Message for exception. (Optional)
	 @param Detail 	 Detail for exception. (Optional)
	 @param ErrorCode 	 Error code for exception. (Optional)
	 @param ExtendedInfo 	 Extended Information for exception. (Optional)
	 @param Object 	 Object to throw. (Optional)
	 @return Does not return a value. 
	 @author Raymond Camden (ray@camdenfamily.com) 
	 @version 1, October 15, 2002 
	--->
	<cffunction name="throw" output="No" returnType="void" hint="CFML Throw wrapper">
		<cfargument name="type" type="string" required="false" default="Application" hint="Type for Exception">
		<cfargument name="message" type="string" required="false" default="" hint="Message for Exception">
		<cfargument name="detail" type="string" required="false" default="" hint="Detail for Exception">
		<cfargument name="errorCode" type="string" required="false" default="" hint="Error Code for Exception">
		<cfargument name="extendedInfo" type="string" required="false" default="" hint="Extended Info for Exception">
		<cfargument name="object" type="any" hint="Object for Exception">
		
		<cfif not isDefined("object")>
			<cfthrow type="#type#" message="#message#" detail="#detail#" errorCode="#errorCode#" extendedInfo="#extendedInfo#">
		<cfelse>
			<cfthrow object="#object#">
		</cfif>
		
	</cffunction>
	
	<!--- 
		function: GetHostFromURL
		in: URL
		out: host name
		note: 
	 --->
	<cffunction name="GetHostFromURL" output="No" returntype="string">
		<cfargument name="url" required="Yes" type="string" >
		
		<cfscript>
			var returnHost = arguments.url;
			if (left(returnHost, 7) eq 'http://') {
				returnHost = removeChars(returnHost, 1, 7);
			}
			if (left(returnHost, 8) eq 'https://') {
				returnHost = removeChars(returnHost, 1, 8);
			}
			if (find('/',returnHost)) {
				returnHost = left(returnHost, find('/',returnHost)-1);
			}
			return returnHost;
		</cfscript>
		
	</cffunction>

	<!--- 
		function: getComplexInputStruct
		in: 
		out: boolean
		note: returns abortAfterRequest
	 --->
	<cffunction name="getComplexInputStruct">
		<cfreturn variables.instance.ComplexInputStruct>
	</cffunction>

	<!--- 
		function: setComplexInputStruct
		in: boolean
		out: void
		note: 
	 --->
	<cffunction name="setComplexInputStruct" output="No" returntype="void">
		<cfargument name="ComplexInputStruct" type="any" required="yes" hint="">
		<cfset variables.instance.ComplexInputStruct = ComplexInputStruct>
	</cffunction>

</cfcomponent>
