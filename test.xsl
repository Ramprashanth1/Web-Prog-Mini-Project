<?xml version = "1.0" encodeing = "UTF-8"?>

<xsl:stylesheet version = "1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match = "/">

<html>
<body>
	<h2>Details</h2>
	<table border = "1">
		<tr>
		<th>To</th>
		<th>	<xsl:value-of select = "to"/></th>
		</tr>
		<tr>
		<th>From</th>
		<th>	<xsl:value-of select = "from"/></th>
		</tr>
		<tr>
		<th>Body</th>
		<th>	<xsl:value-of select = "body"/></th>
		</tr>

</body>
</html>