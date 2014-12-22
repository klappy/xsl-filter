<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [<!ENTITY nbsp "&#160;">]>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:cf="http://www.collegefactual.com" >

    <xsl:import href="../../../../_shared/bhArticleMaster.xsl" />

    <xsl:output method="html" indent="no" encoding="utf-8" />

    <xsl:template match="/college">
        <xsl:call-template name="bhArticleMaster">
            <xsl:with-param name="bhPageId" select="'#bhPageId_college-academic-life-distance-learning'" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="headHeaderContent">
        <xsl:param name="bhPageId" />

        <xsl:call-template name="articleHead">
            <xsl:with-param name="bhPageId" select="$bhPageId" />
            <xsl:with-param name="htmlTitle" select="concat('Distance learning at ', @nameDistinct)" />
            <xsl:with-param name="metaDesc" select="concat('Research how ', @nameDistinct, ' is embracing distance learning.')" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="headFooterContent">
        <style>
            .twofactorpieBehavior div {
                height: 50%;
                width: 50%;
                position: absolute;
                margin: auto;
                top: 0; left: 0; bottom: 0; right: 0;
                text-align: center;
                line-height: 40px;
                font-weight: bold;
            }

            .tabContainer .nav-tabs a {
                padding: 8px;
                margin-right: 8px;
                background: rgb(180, 213, 218);
            }

            .tabContainer .nav-tabs > .active > a {
                color: #4D4D4D;
                background: rgb(63, 179, 194);
            }

            .tabContainer .nav-tabs > .active > a:hover {
                color: #ffffff;
            }
        </style>
    </xsl:template>

    <xsl:template name="bodyContent">
        <xsl:param name="bhPageId" />

        <div class="container-academics">
            <!-- The Breadcrub ==================================================-->
            <xsl:call-template name="breadcrumb">
                <xsl:with-param name="content">
                    <map>
                        <entry><navName><xsl:value-of select="'All Colleges'"/></navName><navUrl><xsl:value-of select="$bhUriLookup/page[ @id = 'colleges-home' ]/@uri"/></navUrl></entry>
                        <entry><navName><xsl:value-of select="@name" /></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-home' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
                        <entry><navName><xsl:value-of select="$bhUriLookup/page[ @id = 'college-academic-life-home' ]/@navName"/></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-academic-life-home' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
                        <entry><navName><xsl:value-of select="$bhUriLookup/page[ @id = 'college-academic-life-distance-learning' ]/@navName"/></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-academic-life-distance-learning' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
                    </map>
                </xsl:with-param>
            </xsl:call-template>

            <!-- College Card (page title) ======================================-->
            <xsl:call-template name="cardCollegeLarge" >
                <xsl:with-param name="unc" select=" (.) " />
            </xsl:call-template>

            <!-- Secondary Nav ==================================================-->
            <xsl:call-template name="UndergraduateTabMenu">
                <xsl:with-param name="activationId" select="$bhPageId" />
            </xsl:call-template>

            <div class="row-fluid">
                <article class="span8">
                    <xsl:choose>
                        <xsl:when test=" count(onlineMajors/major) &gt; 0 ">
                            <h2>Graduations With Distance Learning Options At <xsl:value-of select=" @name " /></h2>
                            <p>
                                In <xsl:value-of select=" $currentYear" />, <xsl:value-of select=" @name " /> graduated <xsl:value-of select=" format-number( sum(onlineMajors/major/@grads), '#,##0') " />
                                undergraduate students across <xsl:value-of select=" format-number( count(onlineMajors/major), '#,##0') " /> majors with distance learning options.
                            </p>

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Major</th>
                                        <th>Graduates Offered Online Options</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:for-each select=" onlineMajors/major ">
                                        <xsl:sort select=" @name " />
                                        <tr>
                                            <td style="font-weight: bold;"><xsl:value-of select="@name" /></td>
                                            <td style="text-align:right;"><xsl:value-of select=" cf:DisplayIntegerOrNA( @grads ) " /></td>
                                        </tr>
                                    </xsl:for-each>
                                </tbody>
                            </table>
                        </xsl:when>
                        <xsl:otherwise>
                            <h2>Graduations With Distance Learning Options At <xsl:value-of select=" @name " /></h2>
                            <p>
                                We wanted to speak to you about the majors offering online options that graduated students from <xsl:value-of select=" @name " />, but that information was not available.
                            </p>
                        </xsl:otherwise>
                    </xsl:choose>

                    <!-- Ad Block -->
                    <xsl:call-template name="ad_inline" />

                    <xsl:choose>
                        <xsl:when test=" allStudents/@enrolled &gt; 0 ">
                            <h2>Distance Learning at <xsl:value-of select=" @name " /></h2>
                            <p>
                                Of the <xsl:value-of select=" format-number( allStudents/@enrolled, '#,##0' ) " /> students currently enrolled at <xsl:value-of select=" @name " />,
                                about <xsl:value-of select=" cf:DisplayPercentageOrNA( (allStudents/@enrolledSomeDistance + allStudents/@enrolledAllDistance) div allStudents/@enrolled ) " />
                                (<xsl:value-of select=" format-number( allStudents/@enrolledSomeDistance + allStudents/@enrolledAllDistance, '#,##0' ) " />) participate in some form of distance
                                or online learning, and <xsl:value-of select=" format-number( allStudents/@enrolledAllDistance, '#,##0' ) " /> students take classes exclusively online.
                            </p>

                            <xsl:if test=" allStudents/@enrolledAllDistance &gt; 0 ">
                                <p>
                                    Students who take all their classes online live in a variety of places.
                                    <xsl:value-of select=" format-number( allStudents/enrolledAllDistance/@inState, '#,##0' ) " /> live in <xsl:value-of select=" @stateName " />,
                                    <xsl:value-of select=" format-number( allStudents/enrolledAllDistance/@inCountry, '#,##0' ) " /> live in the U.S.A and
                                    <xsl:value-of select=" format-number( allStudents/enrolledAllDistance/@outCountry, '#,##0' ) " /> live outside of the U.S.A.

                                    <strong>Long live the Internet!</strong>
                                </p>
                            </xsl:if>

                            <p>
                                The following chart shows you how many students are involved in online classes depending on their degree. Non-Seekers are students who are not currently
                                enrolled in a degree program.
                            </p>

                            <div id="studentTable" class="tabContainer">
                                <ul id="myStudentTab" class="nav nav-tabs" style="margin-bottom: 1px;">
                                    <li class="active"><a href="#studentsGraduate" data-toggle="tab">Graduates</a></li>
                                    <li><a href="#studentsDegreeSeeker" data-toggle="tab">Undergrad Seekers</a></li>
                                    <li><a href="#studentsNondegreeSeeker" data-toggle="tab">Undergrad Non-seekers</a></li>
                                </ul>

                                <div id="myStudentTabContent" class="tab-content" style="clear: both;">
                                    <div id="studentsGraduate" class="tab-pane fade in active">
                                        <xsl:variable name="baseFactor" select=" graduates " />
                                        <table class="table">
                                            <tr class="valign: middle">
                                                <xsl:variable name="factorPct" select=" format-number( 100 * $baseFactor/@enrolled div allStudents/@enrolled, '#0' ) " />
                                                <td>
                                                    <div class="twofactorpieBehavior" style="height: 80px; width: 80px; position: relative;" data-graphData="[ [0, { $factorPct }], [{ $factorPct }, 100] ]" data-graphLabel="{$factorPct}%"></div>
                                                </td>
                                                <td style="vertical-align: middle;">
                                                    Graduate students represent <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> of <xsl:value-of select=" @name " /> the student body.
                                                </td>
                                            </tr>
                                            <tr class="valign: middle">
                                                <xsl:variable name="factorPct" select=" format-number( 100 * ($baseFactor/@enrolledSomeDistance + $baseFactor/@enrolledAllDistance) div $baseFactor/@enrolled, '#0' ) " />
                                                <td>
                                                    <div class="twofactorpieBehavior" style="height: 80px; width: 80px; position: relative;" data-graphData="[ [0, { $factorPct }], [{ $factorPct }, 100] ]" data-graphLabel="{$factorPct}%"></div>
                                                </td>
                                                <td style="vertical-align: middle;">
                                                    <p>
                                                        <xsl:choose>
                                                            <xsl:when test=" $factorPct &gt; 75 ">
                                                                The vast majority of graduate students ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:when test=" $factorPct &gt; 60 ">
                                                                The majority of graduate students ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:when test=" $factorPct &gt; 40 ">
                                                                About half of graduate students ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:when test=" $factorPct &gt; 20 ">
                                                                The minority of graduate students ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:when test=" $factorPct &gt; 0 ">
                                                                A small minority of graduate students ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                None of the current graduate students take classes online.
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </p>
                                                </td>
                                            </tr>

                                            <xsl:if test=" ($baseFactor/@enrolledSomeDistance + $baseFactor/@enrolledAllDistance) &gt; 0 ">
                                                <tr class="valign: middle">
                                                    <xsl:variable name="factorPct" select=" format-number( 100 * $baseFactor/@enrolledAllDistance div ($baseFactor/@enrolledSomeDistance + $baseFactor/@enrolledAllDistance), '#0' ) " />
                                                    <td>
                                                        <div class="twofactorpieBehavior" style="height: 80px; width: 80px; position: relative;" data-graphData="[ [0, { $factorPct }], [{ $factorPct }, 100] ]" data-graphLabel="{$factorPct}%"></div>
                                                    </td>
                                                    <td style="vertical-align: middle;">
                                                        <p>
                                                            Of the <xsl:value-of select=" format-number( $baseFactor/@enrolledSomeDistance + $baseFactor/@enrolledAllDistance, '#,##0' ) " /> who take at least one online course,
                                                            <xsl:choose>
                                                                <xsl:when test=" $factorPct &gt; 75 ">
                                                                    the vast majority ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:when test=" $factorPct &gt; 60 ">
                                                                    the majority ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:when test=" $factorPct &gt; 40 ">
                                                                    about half ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:when test=" $factorPct &gt; 20 ">
                                                                    the minority ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:when test=" $factorPct &gt; 0 ">
                                                                    a small minority ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    none  take all their courses online.
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </p>
                                                    </td>
                                                </tr>
                                            </xsl:if>

                                        </table>

                                        <xsl:if test=" $baseFactor/@enrolledAllDistance &gt; 0 ">
                                            <p>
                                                The <xsl:value-of select=" format-number( $baseFactor/@enrolledAllDistance, '#,##0' ) " /> graduate students who take all their classes online live in the following places.
                                            </p>

                                            <div id="graduatesDoughnut" style="text-align: center;"></div>
                                            <script>
                                                $(function(){
                                                    var data = [
                                                        {name: "<xsl:value-of select=" @stateName " />", data: <xsl:value-of select=" $baseFactor/enrolledAllDistance/@inState div $baseFactor/@enrolledAllDistance " />},
                                                        {name: "U.S.A not <xsl:value-of select=" @stateName " />", data: <xsl:value-of select=" ($baseFactor/enrolledAllDistance/@inCountry - $baseFactor/enrolledAllDistance/@inState) div $baseFactor/@enrolledAllDistance " />},
                                                        {name: "International", data: <xsl:value-of select=" $baseFactor/enrolledAllDistance/@outCountry div $baseFactor/@enrolledAllDistance " />},
                                                        {name: "Unknown", data: <xsl:value-of select=" $baseFactor/enrolledAllDistance/@unknownCountry div $baseFactor/@enrolledAllDistance " />}
                                                    ];

                                                    data.sort(function(a,b){ return b.data &gt;= a.data; });

                                                    d3.select("#graduatesDoughnut").append("div").attr("class","doughnutChart");
                                                    var func = cf.doughnutChart().width(300).height(300).thickness(60).colorCenter(false);
                                                    d3.select("#graduatesDoughnut .doughnutChart").datum(data).call(func);
                                                });
                                            </script>
                                        </xsl:if>

                                    </div>
                                    <div id="studentsDegreeSeeker" class="tab-pane">
                                        <xsl:variable name="baseFactor" select=" degreeSeekers " />
                                        <table class="table">
                                            <tr class="valign: middle">
                                                <xsl:variable name="factorPct" select=" format-number( 100 * $baseFactor/@enrolled div allStudents/@enrolled, '#0' ) " />
                                                <td>
                                                    <div class="twofactorpieBehavior" style="height: 80px; width: 80px; position: relative;" data-graphData="[ [0, { $factorPct }], [{ $factorPct }, 100] ]" data-graphLabel="{$factorPct}%"></div>
                                                </td>
                                                <td style="vertical-align: middle;">
                                                    Undergraduate degree seeking students represent <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> of <xsl:value-of select=" @name " /> the student body.
                                                </td>
                                            </tr>
                                            <tr class="valign: middle">
                                                <xsl:variable name="factorPct" select=" format-number( 100 * ($baseFactor/@enrolledSomeDistance + $baseFactor/@enrolledAllDistance) div $baseFactor/@enrolled, '#0' ) " />
                                                <td>
                                                    <div class="twofactorpieBehavior" style="height: 80px; width: 80px; position: relative;" data-graphData="[ [0, { $factorPct }], [{ $factorPct }, 100] ]" data-graphLabel="{$factorPct}%"></div>
                                                </td>
                                                <td style="vertical-align: middle;">
                                                    <p>
                                                        <xsl:choose>
                                                            <xsl:when test=" $factorPct &gt; 75 ">
                                                                The vast majority of undergraduate degree seekers ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:when test=" $factorPct &gt; 60 ">
                                                                The majority of undergraduate degree seekers ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:when test=" $factorPct &gt; 40 ">
                                                                About half of undergraduate degree seekers ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:when test=" $factorPct &gt; 20 ">
                                                                The minority of undergraduate degree seekers ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:when test=" $factorPct &gt; 0 ">
                                                                A small minority of undergraduate degree seekers ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                None of the current undergraduate degree seekers take classes online.
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </p>
                                                </td>
                                            </tr>

                                            <xsl:if test=" ($baseFactor/@enrolledSomeDistance + $baseFactor/@enrolledAllDistance) &gt; 0 ">
                                                <tr class="valign: middle">
                                                    <xsl:variable name="factorPct" select=" format-number( 100 * $baseFactor/@enrolledAllDistance div ($baseFactor/@enrolledSomeDistance + $baseFactor/@enrolledAllDistance), '#0' ) " />
                                                    <td>
                                                        <div class="twofactorpieBehavior" style="height: 80px; width: 80px; position: relative;" data-graphData="[ [0, { $factorPct }], [{ $factorPct }, 100] ]" data-graphLabel="{$factorPct}%"></div>
                                                    </td>
                                                    <td style="vertical-align: middle;">
                                                        <p>
                                                            Of the <xsl:value-of select=" format-number( $baseFactor/@enrolledSomeDistance + $baseFactor/@enrolledAllDistance, '#,##0' ) " /> who take at least one online course,
                                                            <xsl:choose>
                                                                <xsl:when test=" $factorPct &gt; 75 ">
                                                                    the vast majority ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:when test=" $factorPct &gt; 60 ">
                                                                    the majority ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:when test=" $factorPct &gt; 40 ">
                                                                    about half ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:when test=" $factorPct &gt; 20 ">
                                                                    the minority ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:when test=" $factorPct &gt; 0 ">
                                                                    a small minority ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    none  take all their courses online.
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </p>
                                                    </td>
                                                </tr>
                                            </xsl:if>

                                        </table>

                                        <xsl:if test=" $baseFactor/@enrolledAllDistance &gt; 0 ">
                                            <p>
                                                The <xsl:value-of select=" format-number( $baseFactor/@enrolledAllDistance, '#,##0' ) " /> undergraduate degree seekers who take all their courses online live in the following places.
                                            </p>

                                            <div id="degreeSeekerDoughnut" style="text-align: center;"></div>
                                            <script>
                                                $(function(){
                                                    var data = [
                                                        {name: "<xsl:value-of select=" @stateName " />", data: <xsl:value-of select=" $baseFactor/enrolledAllDistance/@inState div $baseFactor/@enrolledAllDistance " />},
                                                        {name: "U.S.A not <xsl:value-of select=" @stateName " />", data: <xsl:value-of select=" ($baseFactor/enrolledAllDistance/@inCountry - $baseFactor/enrolledAllDistance/@inState) div $baseFactor/@enrolledAllDistance " />},
                                                        {name: "International", data: <xsl:value-of select=" $baseFactor/enrolledAllDistance/@outCountry div $baseFactor/@enrolledAllDistance " />},
                                                        {name: "Unknown", data: <xsl:value-of select=" $baseFactor/enrolledAllDistance/@unknownCountry div $baseFactor/@enrolledAllDistance " />}
                                                    ];

                                                    data.sort(function(a,b){ return b.data &gt;= a.data; });

                                                    d3.select("#degreeSeekerDoughnut").append("div").attr("class","doughnutChart");
                                                    var func = cf.doughnutChart().width(300).height(300).thickness(60).colorCenter(false);
                                                    d3.select("#degreeSeekerDoughnut .doughnutChart").datum(data).call(func);
                                                });
                                            </script>
                                        </xsl:if>

                                    </div>
                                    <div id="studentsNondegreeSeeker" class="tab-pane">
                                        <xsl:variable name="baseFactor" select=" nonDegreeSeekers " />
                                        <table class="table">
                                            <tr class="valign: middle">
                                                <xsl:variable name="factorPct" select=" format-number( 100 * $baseFactor/@enrolled div allStudents/@enrolled, '#0' ) " />
                                                <td>
                                                    <div class="twofactorpieBehavior" style="height: 80px; width: 80px; position: relative;" data-graphData="[ [0, { $factorPct }], [{ $factorPct }, 100] ]" data-graphLabel="{$factorPct}%"></div>
                                                </td>
                                                <td style="vertical-align: middle;">
                                                    Undergraduate students who are not seeking a degree represent <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> of <xsl:value-of select=" @name " /> the student body.
                                                </td>
                                            </tr>
                                            <tr class="valign: middle">
                                                <xsl:variable name="factorPct" select=" format-number( 100 * ($baseFactor/@enrolledSomeDistance + $baseFactor/@enrolledAllDistance) div $baseFactor/@enrolled, '#0' ) " />
                                                <td>
                                                    <div class="twofactorpieBehavior" style="height: 80px; width: 80px; position: relative;" data-graphData="[ [0, { $factorPct }], [{ $factorPct }, 100] ]" data-graphLabel="{$factorPct}%"></div>
                                                </td>
                                                <td style="vertical-align: middle;">
                                                    <p>
                                                        <xsl:choose>
                                                            <xsl:when test=" $factorPct &gt; 75 ">
                                                                The vast majority of undergraduate non-degree seekers ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:when test=" $factorPct &gt; 60 ">
                                                                The majority of undergraduate non-degree seekers ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:when test=" $factorPct &gt; 40 ">
                                                                About half of undergraduate non-degree seekers ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:when test=" $factorPct &gt; 20 ">
                                                                The minority of undergraduate non-degree seekers ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:when test=" $factorPct &gt; 0 ">
                                                                A small minority of undergraduate non-degree seekers ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take at least one class online.
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                None of the current undergraduate non-degree seekers take classes online.
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </p>
                                                </td>
                                            </tr>

                                            <xsl:if test=" ($baseFactor/@enrolledSomeDistance + $baseFactor/@enrolledAllDistance) &gt; 0 ">
                                                <tr class="valign: middle">
                                                    <xsl:variable name="factorPct" select=" format-number( 100 * $baseFactor/@enrolledAllDistance div ($baseFactor/@enrolledSomeDistance + $baseFactor/@enrolledAllDistance), '#0' ) " />
                                                    <td>
                                                        <div class="twofactorpieBehavior" style="height: 80px; width: 80px; position: relative;" data-graphData="[ [0, { $factorPct }], [{ $factorPct }, 100] ]" data-graphLabel="{$factorPct}%"></div>
                                                    </td>
                                                    <td style="vertical-align: middle;">
                                                        <p>
                                                            Of the <xsl:value-of select=" format-number( $baseFactor/@enrolledSomeDistance + $baseFactor/@enrolledAllDistance, '#,##0' ) " /> who take at least one online course,
                                                            <xsl:choose>
                                                                <xsl:when test=" $factorPct &gt; 75 ">
                                                                    the vast majority ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:when test=" $factorPct &gt; 60 ">
                                                                    the majority ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:when test=" $factorPct &gt; 40 ">
                                                                    about half ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:when test=" $factorPct &gt; 20 ">
                                                                    the minority ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:when test=" $factorPct &gt; 0 ">
                                                                    a small minority ( <xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " /> ) take all their courses online.
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    none  take all their courses online.
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </p>
                                                    </td>
                                                </tr>
                                            </xsl:if>

                                        </table>

                                        <xsl:if test=" $baseFactor/@enrolledAllDistance &gt; 0 ">
                                            <p>
                                                The <xsl:value-of select=" format-number( $baseFactor/@enrolledAllDistance, '#,##0' ) " /> undergraduate non-seekers who take all their classes live in the following places.
                                            </p>

                                            <div id="nonDegreeSeekerDoughnut" style="text-align: center;"></div>
                                            <script>
                                                $(function(){
                                                    var data = [
                                                        {name: "<xsl:value-of select=" @stateName " />", data: <xsl:value-of select=" $baseFactor/enrolledAllDistance/@inState div $baseFactor/@enrolledAllDistance " />},
                                                        {name: "U.S.A not <xsl:value-of select=" @stateName " />", data: <xsl:value-of select=" ($baseFactor/enrolledAllDistance/@inCountry - $baseFactor/enrolledAllDistance/@inState) div $baseFactor/@enrolledAllDistance " />},
                                                        {name: "International", data: <xsl:value-of select=" $baseFactor/enrolledAllDistance/@outCountry div $baseFactor/@enrolledAllDistance " />},
                                                        {name: "Unknown", data: <xsl:value-of select=" $baseFactor/enrolledAllDistance/@unknownCountry div $baseFactor/@enrolledAllDistance " />}
                                                    ];

                                                    data.sort(function(a,b){ return b.data &gt;= a.data; });

                                                    d3.select("#nonDegreeSeekerDoughnut").append("div").attr("class","doughnutChart");
                                                    var func = cf.doughnutChart().width(300).height(300).thickness(60).colorCenter(false);
                                                    d3.select("#nonDegreeSeekerDoughnut .doughnutChart").datum(data).call(func);
                                                });
                                            </script>
                                        </xsl:if>

                                    </div>
                                </div>
                            </div>

                        </xsl:when>
                        <xsl:otherwise>
                            <h2>Distance Learning at <xsl:value-of select=" @name " /></h2>
                            <p>
                                We wanted to speak to you about how students at <xsl:value-of select=" @name " /> were adopting distance learning, but that information was not available.
                            </p>
                        </xsl:otherwise>
                    </xsl:choose>

                    <p>
                        For more information, chould out our section on <a href=" ../academic-majors ">Graduations at <xsl:value-of select=" @name " /></a>.
                    </p>
                </article>

                <aside class="span4">
                    <xsl:call-template name="editorComment" >
                        <xsl:with-param name="unitId" select=" @unitId " />
                        <xsl:with-param name="bhPageId" select=" $bhPageId " />
                    </xsl:call-template>

                    <div class="mmAddLetushelp" style="text-align: center;">
                        <a href="{ $bhUriLookup/page[ @id = 'pages-find-my-major' ]/@uri }"><img src="{ $staticUri }/img/300x250_letushelp.jpg" /></a>
                    </div>

                    <!-- Ad Block -->
                    <xsl:call-template name="ad_300x250_BTF" />
                </aside>
            </div>

            <div class="row-fluid">
                <div class="span8">
                    <h2>Questions You Should Ask About Online Learning Options</h2>
                    <ul>
                        <li>Is it possible to get a degree at this school completely online?</li>
                        <li>Are the online degrees accredited?</li>
                        <li>What are the success rates of online students at this school? Do they graduate on time?</li>
                        <li>Can you save money by taking classes online, or are the costs about the same?</li>
                    </ul>
                </div>
            </div>

            <div class="row" style="margin-bottom: 30px;">
                <div class="span8">
                    <xsl:call-template name="footerNavigation">
                        <xsl:with-param name="bhPageId" select="$bhPageId" />
                    </xsl:call-template>
                </div>
            </div>

        </div>

    </xsl:template>

    <xsl:template name="bodyFooterContent" >
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/d3/3.4.8/d3.min.js"></script>
        <script type="text/javascript" src="{ $staticUri }/js/d3/cf_v1.0.js"></script>
        <script type="text/javascript">
            $("h1").on("click", bhOnLinkClick());

            function drawTwoFactorDoughnut( selector ) {
                var data = JSON.parse($(selector).attr("data-graphData"));
                var label = $(selector).attr("data-graphLabel");

                $(selector)
                    .append( $('<svg style="width: 100%; height: 100%;" />' ) )
                    .append( $('<div />' ).text( label ) );

                var cScale = d3.scale.linear().domain([0, 100]).range([0, 2 * Math.PI]);

                var arc = d3.svg.arc()
                            .innerRadius(20)
                            .outerRadius(40)
                            .startAngle(function(d){ return cScale( d[0] ); })
                            .endAngle(function(d){ return cScale( d[1] ); });

                d3.select( $(selector).children("svg")[0] )
                    .selectAll("path")
                    .data( data )
                    .enter()
                    .append("path")
                    .attr("d", arc)
                    .style("fill", function(d, i) { return i == 0 ? "#2B3990" : "#cccccc"; })
                    .attr("transform", "translate(40,40)");

            }

            $(function(){
                $(".twofactorpieBehavior").each(function(){ drawTwoFactorDoughnut( $(this) ); });
            });
        </script>

    </xsl:template>

</xsl:stylesheet>
