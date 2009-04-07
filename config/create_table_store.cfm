<cftry>
  <cfquery datasource="learningcoldfusion">
  DROP TABLE lcf_product
  </cfquery>
<cfcatch></cfcatch>
</cftry>
<cftry>
  <cfquery datasource="learningcoldfusion">
  DROP TABLE lcf_purchase
  </cfquery>
<cfcatch></cfcatch>
</cftry>
<cftry>
  <cfquery datasource="learningcoldfusion">
  DROP TABLE lcf_order
  </cfquery>
<cfcatch></cfcatch>
</cftry>
<cfquery datasource="learningcoldfusion">
CREATE TABLE lcf_product (
product_id VARCHAR(50) NOT NULL,
product VARCHAR(50) NOT NULL,
description VARCHAR(255) NOT NULL,
price FLOAT NOT NULL,
PRIMARY KEY (product_id)
)
</cfquery>
<cfquery datasource="learningcoldfusion">
CREATE TABLE lcf_order (
order_id VARCHAR(50) NOT NULL,
user_id VARCHAR(50) NOT NULL,
order_date_time DATETIME NOT NULL,
PRIMARY KEY (order_id)
)
</cfquery>
<cfquery datasource="learningcoldfusion">
CREATE TABLE lcf_purchase (
purchase_id VARCHAR(50) NOT NULL,
order_id VARCHAR(50) NOT NULL,
product_id VARCHAR(50) NOT NULL,
quantity INTEGER NOT NULL,
PRIMARY KEY (purchase_id)
)
</cfquery>