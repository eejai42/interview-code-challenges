<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:param name="output-filename" select="'output.txt'" />
    <xsl:include href="../CommonXsltTemplates.xslt"/>
    <xsl:variable name="inline-data" select="document('TestInputData.csv.xml')" />

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/*">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>
                        <xsl:text>README.md</xsl:text>
                    </RelativePath>
                    <xsl:element name="FileContents" xml:space="preserve"># <xsl:value-of select="count(/InterviewTests/InterviewTest)" /> Interview Code Challenges
Repository for interviewing / programming tests. 

<xsl:for-each select="/InterviewTests/InterviewTest" xml:space="preserve"><xsl:variable name="testName" select="Name" /><xsl:variable name="function" select="Function" /><xsl:variable name="testValues" select="$inline-data/*/*[InterviewTest = $testName]" />
## <xsl:value-of select="Name"/>
<xsl:value-of select="Description"/><xsl:if test="count($testValues) > 0">
### Results Verified...<xsl:for-each select="$testValues">
    - <xsl:value-of select="$function"/>( <xsl:value-of select="InputParameter1" /> ) == <xsl:value-of select="ExpectedResult"/></xsl:for-each>
</xsl:if>
    
</xsl:for-each>
                        
### **/interview-tests** is Based on a *Single Source of Truth* (SSoT.me)
**Please Note** - This `README.md`, as well as most of the infrastructure for this repository are based on a Single Source of Truth, and the SSoT.me CLI.

The interview tests described below are Authoritatively Defined in `/SSoT/InterviewTests.csv`.  Additionally, the list of XUnit Tests which are performed on eaech function is authoritatively defined in `/SSoT/TestInputData.csv`.  

After making changes to either of these two files, simply run `> ssotme -build` to Update the README, Generate projects, Unit Test code and a Stub function which throws a `NotImplementedException()` for any new Interview Test added to the CSV.

You can install ssot.me with npm using `> npm install ssotme/cli -g`.  

</xsl:element>
                </FileSetFile>
                <xsl:for-each select="/InterviewTests/InterviewTest">
                    <xsl:variable name="testName" select="Name" />
                    <xsl:variable name="lowerName" select="translate($testName, $ucletters, $lcletters)" />
                    <xsl:variable name="testValues" select="$inline-data/*/*[InterviewTest = $testName]" />
                    <FileSetFile>
                        <RelativePath>
                            <xsl:value-of select="$lowerName" />
                            <xsl:text>/</xsl:text>
                            <xsl:value-of select="$lowerName" />
                            <xsl:text>.csproj</xsl:text>
                        </RelativePath>
                        <OverwriteMode>Never</OverwriteMode>
                        <FileContents xml:space="preserve"><Project Sdk="Microsoft.NET.Sdk">
    <PropertyGroup>
        <TargetFramework>netcoreapp2.0</TargetFramework>
        <IsPackable>false</IsPackable>
    </PropertyGroup>
    <ItemGroup>
        <PackageReference Include="Microsoft.NET.Test.Sdk" Version="15.3.0-preview-20170628-02" />
        <PackageReference Include="xunit" Version="2.3.0-beta4-build3742" />
        <PackageReference Include="xunit.runner.visualstudio" Version="2.2.0" />
        <DotNetCliToolReference Include="dotnet-xunit" Version="2.3.0-beta4-build3742" />
    </ItemGroup>
</Project></FileContents></FileSetFile>
                    <xsl:if test="count($testValues) > 0">
                    <FileSetFile>
                        <RelativePath>
                            <xsl:value-of select="$lowerName" />
                            <xsl:text>/run.bat</xsl:text>                            
                        </RelativePath>
                        <OverwriteMode>Never</OverwriteMode>
                        <FileContents>dotnet xunit</FileContents>
                    </FileSetFile>
                    <FileSetFile>
                        <RelativePath>
                            <xsl:value-of select="$lowerName" />
                            <xsl:text>/run.sh</xsl:text>
                        </RelativePath>
                        <OverwriteMode>Never</OverwriteMode>
                        <FileContents>dotnet xunit</FileContents>
                    </FileSetFile>
                    <FileSetFile>
                        <RelativePath>
                            <xsl:value-of select="$lowerName" />
                            <xsl:text>/</xsl:text>
                            <xsl:value-of select="$lowerName" />
                            <xsl:text>-tests.cs</xsl:text>
                        </RelativePath>
                        <OverwriteMode>Never</OverwriteMode>
                        <FileContents>using System;
using System.Linq;
using Xunit;

namespace <xsl:value-of select="$lowerName" />
{
    public class Tests
    {
        [Theory] // <xsl:value-of select="count($testValues)" />  test values provided<xsl:for-each select="$testValues">
        [InlineData(<xsl:value-of select="InputParameter1" />, <xsl:apply-templates select="ExpectedResult" />)]</xsl:for-each>
        public void Test(<xsl:value-of select="InputParameter1"/> input, <xsl:value-of select="ReturnType"/> expected)
        {
            Assert.Equal(expected, input.<xsl:value-of select="Function"/>());
        }

    }
}
</FileContents>
                    </FileSetFile>
                    </xsl:if>
                     <FileSetFile>
                        <RelativePath>
                            <xsl:value-of select="$lowerName" />
                            <xsl:text>/</xsl:text>
                            <xsl:value-of select="$lowerName" />
                            <xsl:text>.cs</xsl:text>
                        </RelativePath>
                        <OverwriteMode>Never</OverwriteMode>
                        <FileContents>using System;
using System.Collections.Generic;                        
using System.Linq;
using Xunit;


namespace <xsl:value-of select="$lowerName" />
{
    static class Implementation
    {
        /// &lt;summary>
        /// <xsl:value-of select="normalize-space(Description)" />
        /// &lt;/summary>
        /// &lt;param name="inputValue">The input value(s) to operate on&lt;/param>
        /// &lt;returns>The result of the function&lt;/returns>
        
        public static <xsl:value-of select="ReturnType"  />&#32;<xsl:value-of select="Function" />(this <xsl:value-of select="InputParameter1"  /> inputValue)
        {
            // TODO: Implement
            throw new NotImplementedException("Your job is to implement this function");
        }
    }
}

</FileContents>
                    </FileSetFile>
                </xsl:for-each>
            </FileSetFiles>
        </FileSet>
    </xsl:template>
    <xsl:template match="ExpectedResult">
        <xsl:choose>
            <xsl:when test="normalize-space(.)='TRUE'">true</xsl:when>
            <xsl:when test="normalize-space(.)='FALSE'">false</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="." />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
