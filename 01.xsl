<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>
  <xsl:template match="/">
    <h1>Выбрать людей, у которых есть телефон.</h1>
    <xsl:apply-templates select="persons/person/phone/../login"/> 
    <h1>Выбрать людей, у которых есть мобильный телефон.</h1>
    <xsl:apply-templates select="persons/person/phone[@type = 'mobile']/../login"/>
    <h1>Выбрать людей, у которых есть и рабочий, и мобильный телефон.</h1>
    <xsl:apply-templates select="persons/person/phone[@type='work']/../phone[@type='mobile']/../login"/>
    <h1>Выбрать людей, у которых email начинается с `login@`.</h1>
    <xsl:apply-templates select="persons/person[starts-with(./email,concat(./login,'@'))]/login"/>
    <h1>Выбрать людей, принадлежащих к группе html.</h1>
    <xsl:apply-templates select="persons/person/group[text() = 'html']/../login"/>
    <h1>Выбрать людей, у которых "длинный" логин (длиннее трех символов).</h1>
    <xsl:apply-templates select="persons/person/login[string-length(text()) &gt; 3]"/>
    <h1>Выбрать для каждого человека по одному его контакту - мобильный телефон, рабочий телефон или email (что-нибудь одно, все равно что)</h1>
    <h1>Выбрать для каждого контакта его рабочий телефон, если нет рабочего, то мобильный, если нет никакого телефона, то email.</h1>
    <xsl:apply-templates select="persons/person[phone/@type='work' or phone/@type='mobile' or email]"/>
  </xsl:template>

  <xsl:template match="//login">
    <xsl:value-of select="."/>
    <xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="persons/person">
    <xsl:value-of select="./login"/>
    <xsl:text> - </xsl:text>
    <xsl:choose>
      <xsl:when test="./phone[@type = 'work']">
        <xsl:value-of select="./phone[@type = 'work']"/>
      </xsl:when>
      <xsl:when test="./phone[@type = 'mobile']">
        <xsl:value-of select="./phone[@type = 'mobile']"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="./email"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text> </xsl:text>
  </xsl:template>

</xsl:stylesheet>