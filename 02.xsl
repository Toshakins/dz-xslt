<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
	<h1>Выбрать все ноды, "глубина залегания" которых является четным числом</h1>
	 <!-- root node omitted -->
	<xsl:apply-templates select="//item[(count(ancestor::node()) mod 2) = 1]"/>
	<h1>Выбрать все ноды, у которых есть "старший брат" и "младший брат".</h1>
	<xsl:apply-templates select="//*[(count(following-sibling::node()) &gt; 1) and (count(preceding-sibling::node()) &gt; 1)]"/>
	<h1>Выбрать все ноды, у "деда" которых ровно 6 потомков</h1>
	<xsl:apply-templates select="//*[count(descendant::node()[text()]) = 6]"/>
	<h1>Выбрать все ноды, у которых есть предок и потомок с одинаковым классом.</h1>
	<xsl:apply-templates select="//*[../@class = ./item/@class]"/>
</xsl:template>

<xsl:template match="item">
	<xsl:value-of select="@id"/>
	<br/>
</xsl:template>

</xsl:stylesheet>