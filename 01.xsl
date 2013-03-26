<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
  <xsl:template match="/">
    <h1>Выбрать людей, у которых есть телефон.</h1>
    <xsl:apply-templates select="persons/person/phone/../login"/> 
    <h1>Выбрать людей, у которых есть мобильный телефон.</h1>
    <xsl:apply-templates select="persons/person/phone[@type = 'mobile']/../login"/>
    <h1>Выбрать людей, у которых есть и рабочий, и мобильный телефон.</h1>
    <xsl:apply-templates select="persons/person/phone[@type='work']/../phone[@type='mobile']/../login"/>
    <h1>Выбрать людей, у которых email начинается с `login@`.</h1>
    <xsl:apply-templates select="persons/person[starts-with(./email,./login)]/login"/>
    <h1>Выбрать людей, принадлежащих к группе html.</h1>
    <xsl:apply-templates select="persons/person/group[text() = 'html']/../login"/>
    <h1>Выбрать людей, у которых "длинный" логин (длиннее трех символов).</h1>
    <xsl:apply-templates select="persons/person/login[string-length(text()) &gt; 3]"/>
    <h1>Выбрать для каждого человека по одному его контакту - мобильный телефон, рабочий телефон или email </h1>
    <xsl:apply-templates select="persons/child::person/node()[name() != 'login' and name()!='group']" mode="QName"/>
  </xsl:template>



</xsl:stylesheet>
