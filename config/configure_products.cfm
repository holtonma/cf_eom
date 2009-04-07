<cfset sID1 = CreateUUID() />
<cfset sID2 = CreateUUID() />
<cfset sID3 = CreateUUID() />
<cfset sID4 = CreateUUID() />
<cfquery datasource="learningcoldfusion">
INSERT INTO lcf_product(product_id, product, description, price)
VALUES ('#sID1#', 't-shirt', 'A fancy t-shirt.', 15.95)
</cfquery>
<cfquery datasource="learningcoldfusion">
INSERT INTO lcf_product(product_id, product, description, price)
VALUES ('#sID2#', 'hat', 'A really nice hat.', 18.95)
</cfquery>
<cfquery datasource="learningcoldfusion">
INSERT INTO lcf_product(product_id, product, description, price)
VALUES ('#sID3#', 'crayons', 'Some crayons.', 5.95)
</cfquery>
<cfquery datasource="learningcoldfusion">
INSERT INTO lcf_product(product_id, product, description, price)
VALUES ('#sID4#', 'tire', 'A big tire.', 105.95)
</cfquery>
<cffile action="copy" source="#ExpandPath('../store/tshirt.jpg')#" destination="#ExpandPath('../store/' & sID1 & '.jpg')#" nameconflict="overwrite" />
<cffile action="copy" source="#ExpandPath('../store/hat.jpg')#" destination="#ExpandPath('../store/' & sID2 & '.jpg')#" nameconflict="overwrite" />
<cffile action="copy" source="#ExpandPath('../store/crayons.jpg')#" destination="#ExpandPath('../store/' & sID3 & '.jpg')#" nameconflict="overwrite" />
<cffile action="copy" source="#ExpandPath('../store/tire.jpg')#" destination="#ExpandPath('../store/' & sID4 & '.jpg')#" nameconflict="overwrite" />