
<!--
Building a Drag-and-Drop Shopping Cart with AJAX
Creating an interactive shopping experience
By: Joe Danziger
Jan. 27, 2006 01:15 PM
 
Keeping up with the latest Web technologies is tough nowadays. Every week it seems new sites are launched that push the envelope further and further in terms of what can be accomplished using just a Web browser.

The rise of AJAX over the past several months has taken over the development world and breathed new life into the Web. Although these techniques have been possible for many years now, the maturity of Web standards like XHTML and CSS now make it a viable alternative that will be viewable by all but the oldest browsers.

It's also been possible to accomplish many of the same things using Flex or Flash, but the development cycle with those applications is typically more involved and the overhead often not justified.

We're going to harness the power of the Scipt.aculo.us JavaScript library to provide our interaction. As their Web site states, this library "provides you with easy-to-use, compatible and, ultimately, totally cool JavaScript libraries to make your web sites and web applications fly, Web 2.0 style." We're also going to utilize the <CF_SRS> library to handle the actual AJAX data piping to our application. Both of these libraries are free for all to use, and they're easier to integrate than you would think.

For this article, we'll create an interactive shopping experience allowing us to add items to our shopping basket by dragging and dropping them onto an icon of a shopping cart. We'll add AJAX functionality, allowing us to update our shopping cart without redrawing the entire screen. To save the trouble of setting up a product database, we'll use Amazon Web Services to search for DVDs and use those to shop from.

Start with a blank index.cfm in your root directory. You'll need to visit http://script.aculo.us/downloads to download the latest distribution (they're nearing a final release for version 1.5 as of this writing). Copy the "lib" and "src" directories into your empty directory. You'll need all of the .js files so just copy over the entire directory in each case. Next, type the following lines into the <head></head> section of your page:

<script src="./lib/prototype.js" type="text/javascript"></script>
<script src="./src/scriptaculous.js" type="text/javascript"></script>

We'll need a search box to submit our query to Amazon:

<form action="index.cfm" method="post">
Search: <input type="text" name="keywords" size="20" />
<input type="submit" name="search" value="Go" />
</form>

The page will look for a form.search variable and run an Amazon search when it is defined. Each item returned will be placed in its own styled div that will be able to be picked up and dragged.

The Scriptaculous library makes it easy to create "draggables" (the only required argument is the ID of the object that you want draggable). Listing 1 contains the code to search Amazon and return the results as draggable divs.

At this point, all of the items returned from the search will be in their own box and should be draggable around the screen. When we created each draggable, we set "revert=true", which will snap each object back to its original location if not placed directly on a drop zone.

Next, we'll add a graphic of a shopping cart to our page, which will become a drop target on which to drag items. The Scriptaculous library also makes it easy to create these "droppables". The syntax is simply:

Droppables.add('id_of_element',[options]);

The code below creates a droppable zone of id "cart1" and also runs a function onDrop() that pops up an alert box letting the user know an item has being added. We then hide the element from view, which allows the other divs to slide over and adjust accordingly.

<img src="shopcart.jpg" id="cart1" style="float:left;">
<script language="javascript" type="text/javascript">
Droppables.add('cart1', { onDrop:function(element) {
alert('Added UPC ' + element.id + ' to your shopping cart.');
Element.hide(element.id);}})
</script>

The items should now be disappearing when dropped onto the shopping cart, but there's nothing going on behind the scenes yet. Now it's time to add some AJAX to process our shopping cart.

Although there are several AJAX libraries to choose from, we're going to use the ColdFusion Simple Remote Scripting <CF_SRS> library made available free of charge by Matthew Walker of ESWsoftware in New Zealand. <CF_SRS> uses an IFRAME for communication and encapsulates all of the dirty work for you. This library was chosen for its ability to handle HTML tables well and for its ability to interact directly with the browser's Document Object Model (DOM) to output our shopping cart rows.

We'll start with an empty cart by including the following code:

<fieldset style="width:400px;">
<legend>Your shopping cart</legend>
<table border="0" cellspacing="0" cellpadding="5" id="tableCart">
<thead></thead><tbody></tbody></table>
<button onclick="emptyCartButton_onClick()" id="emptyCartButton">
Clear Shopping Cart</button>
</fieldset>

(Don't worry about the fact that our table body (<tbody></tbody>) is empty right now - we'll be populating it in just a second through AJAX.)

Next, you'll need to download the <CF_SRS> package from www.eswsoftware.com/products/download/. Copy the srs.cfm file into your Webroot (or you can add it to your CustomTags directory if you plan to do more AJAXing). You'll also need to create a subdirectory to hold the gateway pages that handle our AJAX data passing. Name the directory "SRS" and copy the Application.cfm and OnRequestEnd.cfm files into there from the "serverpages" directory in the zip file. You can use either regular CFM files or CFCs for these gateway pages (the download provides examples of each). The main thing to remember is that these pages should always return their results to "request.response".

Simply adding a <cf_srs> call to your page will handle the creation of the hidden IFRAME for you. Another great feature of the CF_SRS library is the ability to view an inline debugging window right inside the page you are working on. This allows you to see all of the data being passed back and forth through the gateway. You can enable this debugging by calling the tag as <cf_srs trace>. This line can be placed anywhere but we'll add it at the very end of the file.

Next, we'll need to create some JavaScript functions to handle the AJAX interactions. Add an onLoad function to your body tag as such: <body onload="body_onLoad()">. This will execute body_onLoad() when the page loads and we'll use this function to set up our gateway. The function should read as follows:

function body_onLoad() {
// create an SRS gateway to the cart.cfm page
objGateway = new gateway("srs/cart.cfm?");
// update cart in case of return visit
// code for this function is below
updateCart();
}

Once you have created your gateway, you can invoke the methods below to send requests to the server:

    * objGateway.setListener( str ): Use this method to specify the name of the function in your Web page that will handle the server's response. str is a string representing the function's name. The listener defaults to "alert", which will pop up a JavaScript alert() box containing the server's response. Note that while ColdFusion is a case-insensitive language, JavaScript is case-sensitive. If you return a structure to your listener function, all the structure keys will be rendered in JavaScript as lowercase.
    * objGateway.setArguments( obj ): Set the arguments and values to pass to the server. obj is an object literal, which is basically just a set of one or more attribute/value pairs wrapped in curly braces. Here's an example: { name:'Joe', age:30, country:'US' }. You can see that string values need to be wrapped in quotation marks, and colons (:) are used in place of equals signs (=).
    * objGateway.resetArguments(): Remove all the arguments previously set.
    * objGateway.request(): Send the request to the server. 

 Note that you can chain these methods together. For example, it is perfectly acceptable to write:

objGateway.resetArguments().setArguments( { state:'NY' } ).request()

Using what we know now, let's take another look at our updateCart() function that we're calling onLoad.

function updateCart() { objGateway.setListener('cartPacket_onReceive').setArguments(
{action:'getCart'} ).request(); }

The function chains together several commands. It sets the listener to "cartPacket_onReceive". That means that we'll execute this JavaScript function whenever data is returned from our gateway. This function handles the generation of our table body that contains our cart rows (see Listing 2).

In our updateCart() function, we're also passing in an argument: action=getCart. This is going to be passed through to our cart.cfm gateway page. The full text of the gateway page is displayed in Listing 3.

We're passing in the action variable with a value of "getCart". This gets passed to our cart.cfm gateway page and causes the user's session cart to be returned as a query object. Whenever we need to update our cart to add or delete rows, we'll set our listener to 'cartPacket_onReceive' and then redraw the table body.

When we created our shopping cart on screen, we added the following button to clear our cart:

<button onclick="emptyCartButton_onClick()" id="emptyCartButton">
Clear Shopping Cart</button>

We'll add two JavaScript functions to go along with that button. The first will confirm the delete and the second will issue a call to remove the items and redraw the cart:

function emptyCartButton_onClick() {
   if ( confirm('Are you sure you want to empty your cart?') ) clearCart();
}

function clearCart() {
   objGateway.setListener('cartPacket_onReceive').setArguments( {action:'clearCart'}
).request();
}

Finally one more JavaScript function to be called when adding items to our cart:

function addToCart(upc) {
   objGateway.setListener('cartPacket_onReceive').setArguments( { action:'addToCart',upc:upc }
).request();
}

Now that we have our addToCart() function coded, add the line "addToCart(element.id);" right before the Element.hide call in the shopping cart droppable. This will execute our addToCart() function and redraw the shopping cart when an item is dropped onto it.

And that's all there is to it! With just 150 lines of code, we were able to create an interactive, drag-and-drop shopping experience that many did not think was possible using just the browser.
-->

<cfif isDefined("form.search")>
<!--- Submit REST query --->
<cfhttp url="http://webservices.amazon.com/onca/xml?Service=AWSECommerceService&
AWSAccessKeyId=#REPLACE_WITH_YOUR_KEY#&Operation=ItemSearch&Keywords=#form.keywords#
&SearchIndex=DVD&Sort=relevancerank&ResponseGroup=Small,ItemAttributes,Images,Offers"
throwOnError="yes" charset="UTF-8"></cfhttp>
<!--- parse XML document --->
<cfset myXMLdoc = XmlParse(cfhttp.filecontent)>
<CFSET xnSearch = myXMLdoc.xmlRoot>

<cfoutput>
<!--- if results LT 10, loop through those, otherwise show first 10 --->
<cfloop index="i" from="1" to="#IIF(xnSearch.Items.TotalResults.XMLText gt
 10,'10',xnSearch.Items.TotalResults.XMLText)#">

<!--- add cftry/cfcatch in case no image or other error // we'll use UPC as div id --->
<cfif xnSearch.Items.Item[i].Offers.TotalOffers.XmlText gt 0>
<div style="font-size:10px;font-family:Arial;text-align:center;
 background-color:##eee;float:left;margin:10px; border:1px solid ##666; padding:5px;"
 id="#xnSearch.Items.Item[i].ItemAttributes.UPC.XmlText#">
<img src="#xnSearch.Items.Item[i].MediumImage.URL.XmlText#"><br />
#xnSearch.Items.Item[i].ItemAttributes.Title.XmlText#<br />
#xnSearch.Items.Item[i].ItemAttributes.UPC.XmlText#     
#xnSearch.Items.Item[i].ItemAttributes.ListPrice.FormattedPrice.XmlText#
</div>

	<!--- make this item draggable // reference by UPC as div id --->
<script type="text/javascript">
new Draggable('#xnSearch.Items.Item[i].ItemAttributes.UPC.XmlText#', {revert:true});
</script>
</cfif>
</cfloop>
</cfoutput>
<br clear="all" />
</cfif>

<!-- Listing 2: -->

function cartPacket_onReceive(packet) { // generates an HTML table of cart items

	var theTable = document.getElementById('tableCart');
	var tbody = document.createElement("tbody");
	var tr, td;

	if ( packet.upc.length == 0 ) { // if no results just send back empty cart
		tr = document.createElement("tr");
		td = document.createElement("td");
		td.colSpan = 4;
		td.innerHTML = "Your cart is empty.";
		tr.appendChild(td);
		tbody.appendChild(tr);
	}
	else
		for ( var i = 0 ; i < packet.upc.length; i++ ) { // loop and create new row
			tr = document.createElement("tr");
			td = document.createElement("td");
			td.innerHTML = packet.qty[i];
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerHTML = '<img src="' + packet.image[i] + '">';
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerHTML = packet.title[i];
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerHTML = packet.price[i];
			tr.appendChild(td);
			tbody.appendChild(tr);
		}

	theTable.replaceChild(tbody, theTable.childNodes[1]);
}

<!-- Listing 3: cart.cfm gateway page: -->

<cfswitch expression="#action#">

<cfcase value="getCart">
	<cfparam name="session.cart" default="#ArrayNew(1)#">
	<cfset cartQuery = QueryNew("qty,upc,title,image,price")>
	<cfloop from="1" to="#ArrayLen(session.cart)#" index="i">
		<cfset queryAddRow(cartQuery)>
		<cfset querySetCell(cartQuery, "qty", session.cart[i].qty, i)>
		<cfset querySetCell(cartQuery, "upc", session.cart[i].upc, i)>
		<cfset querySetCell(cartQuery, "title", session.cart[i].title, i)>
		<cfset querySetCell(cartQuery, "image", session.cart[i].image, i)>
		<cfset querySetCell(cartQuery, "price", session.cart[i].price, i)>
	</cfloop>
<cfset request.response = cartQuery>
</cfcase>

<cfcase value="addToCart">
	<cfparam name="session.cart" default="#ArrayNew(1)#">
	<!--- get items from Amazon Web Services --->
	<cfhttp url="http://webservices.amazon.com/onca/xml?Service=AWSECommerceService&
	AWSAccessKeyId=1MEQ9VMKAJS5A8DSHER2&Operation=ItemLookup&IdType=UPC&SearchIndex=DVD
	&ItemId=#url.upc#&ResponseGroup=Small,ItemAttributes,Images" throwOnError="yes"
	 charset="UTF-8"></cfhttp>
	 
	<cfset myXMLdoc = XmlParse(cfhttp.filecontent)>
	<CFSET xnProduct = myXMLdoc.xmlRoot>
	
	<cfscript>
		addItem = StructNew();
		addItem.qty = 1;
		addItem.upc = xnProduct.Items.Item.ItemAttributes.UPC.XmlText;
		addItem.title = xnProduct.Items.Item.ItemAttributes.Title.XmlText;
			addItem.image = xnProduct.Items.Item.SmallImage.URL.XmlText;
			addItem.price = xnProduct.Items.Item.ItemAttributes.ListPrice.FormattedPrice.XmlText;
	</cfscript>
	
	<cfset ArrayAppend(session.cart,addItem)>
	
	<!--- return cart --->
	<cfset cartQuery = QueryNew("qty,upc,title,image,price")>
	<cfloop from="1" to="#ArrayLen(session.cart)#" index="i">
			<cfset queryAddRow(cartQuery)>
			<cfset querySetCell(cartQuery, "qty", session.cart[i].qty, i)>
			<cfset querySetCell(cartQuery, "upc", session.cart[i].upc, i)>
			<cfset querySetCell(cartQuery, "title", session.cart[i].title, i)>
			<cfset querySetCell(cartQuery, "image", session.cart[i].image, i)>
			<cfset querySetCell(cartQuery, "price", session.cart[i].price, i)>
	</cfloop>
	<cfset request.response = cartQuery>
	</cfcase>
	
	<cfcase value="clearCart">
		<cfset ArrayClear(session.cart)>
		<cfset cartQuery = QueryNew("qty,upc,title,image,price")>
		<cfset request.response = cartQuery>
</cfcase>

</cfswitch>
