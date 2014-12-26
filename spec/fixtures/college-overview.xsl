<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [<!ENTITY nbsp "&#160;">]>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:cf="http://www.collegefactual.com">

    <xsl:import href="../../../_shared/bhArticleMaster.xsl" />

    <xsl:output method="html" indent="no" encoding="utf-8" />

    <xsl:template match="/college">
        <xsl:call-template name="bhArticleMaster">
            <xsl:with-param name="bhPageId" select="'#bhPageId_college-home'" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="headHeaderContent">
        <xsl:param name="bhPageId" />

        <xsl:call-template name="articleHead">
            <xsl:with-param name="bhPageId" select="$bhPageId" />
            <xsl:with-param name="htmlTitle" select ="concat(@nameDistinct, ' Statistics, Costs &amp; Information at CollegeFactual.com')" />
            <xsl:with-param name="metaDesc" select ="concat('Discover if ', @nameDistinct, ' is right for you. Find college costs, statistics and information on ', @alias, ' at CollegeFactual.com.')" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="headFooterContent">
        <xsl:param name="bhPageId" />

        <style type="text/css">
            .clickable { cursor: pointer; }
            a { text-decoration: none !important; }

            .type-blue {
                -webkit-transition: 0.25s;
                   -moz-transition: 0.25s;
                     -o-transition: 0.25s;
                        transition: 0.25s;
            }

            .type-blue:hover {
                background-color: #c5e6e6;
            }
        </style>

        <script type="text/javascript">
            var bhLoadDisqus = false;
        </script>
    </xsl:template>

    <xsl:template name="bodyContent">
        <xsl:param name="bhPageId" />

        <!-- Body Overview Container ==================================================-->
        <div class="container-overview">

            <!-- The Breadcrub ==================================================-->
            <xsl:call-template name="breadcrumb">
                <xsl:with-param name="content">
                    <map>
                        <entry><navName><xsl:value-of select="'All Colleges'"/></navName><navUrl><xsl:value-of select="$bhUriLookup/page[ @id = 'colleges-home' ]/@uri"/></navUrl></entry>
                        <entry><navName><xsl:value-of select="@name" /></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-home' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
                    </map>
                </xsl:with-param>
            </xsl:call-template>

            <!-- College Card (page title) ======================================-->
            <xsl:call-template name="cardCollegeLarge" >
                <xsl:with-param name="unc" select=" (.) " />
            </xsl:call-template>

            <!-- Secondary Nav ==================================================-->
            <xsl:call-template name="UndergraduateTabMenu">
                <xsl:with-param name="activationId" select=" 'overview' " />
            </xsl:call-template>

            <!--
            <xsl:if test=" description != '' ">
                <div class="well well-small" style="margin-top: -8px;">
                    <xsl:value-of select=" description " disable-output-escaping="yes" />
                </div>
            </xsl:if>
            -->

            <!-- Overview Info Boxes ==================================================-->
            <xsl:variable name="inState" select=" costInStateNoAid/@value &lt; costNonResidentNoAid/@value " />

            <div class="color-grid row" style="margin-top: 24px;">

                <div class="span8 block type-blue">
                    <div class="row-fluid">

                        <div id="netPriceOverviewBox" data-bhTrackRegion="netPriceOverviewBox" class="span6 clickable" data-cfTarget="{ replace( $bhUriLookup/page[ @id = 'college-paying-for-college-net-price' ]/@uri, '~collegeSlug~', @slug ) }">
                            <div class="block-spacing">

                                <xsl:choose>
                                    <xsl:when test=" $inState " >
                                        <h3>Annual Net Price In-State</h3>
                                        <div class="contents number large">
                                            <xsl:value-of select=" cf:DisplayMoneyOrNA( costInStateOverall/@value ) " />
                                        </div>
                                        <!--MOUSEOVER: After average grants and scholarships of $?????, the total cost of $????? for <xsl:value-of select="contact/state/@name" /> students is reduced to <xsl:value-of select=" if ( costInStateOverall/@value castable as xs:decimal ) then format-number( costInStateOverall/@value, '$##,###' ) else 'N/A' " /> for the ??% that received them.-->
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <h3>Annual Net Price</h3>
                                        <div class="contents number large">
                                            <xsl:value-of select=" cf:DisplayMoneyOrNA( costNonResidentOverall/@value ) " />
                                        </div>
                                        <!--MOUSEOVER: After average grants and scholarships of $?????, the total cost of $????? is reduced to <xsl:value-of select=" if ( costInStateOverall/@value castable as xs:decimal ) then format-number( costInStateOverall/@value, '$##,###' ) else 'N/A' " /> for the ??% that received them.-->
                                    </xsl:otherwise>
                                </xsl:choose>

                            </div>
                        </div>

                        <div id="valueOverviewBox" data-bhTrackRegion="valueOverviewBox" class="span6 clickable" data-cfTarget="{ replace( $bhUriLookup/page[ @id = 'college-paying-for-college-value-for-your-money' ]/@uri, '~collegeSlug~', @slug ) }">
                            <div class="block-spacing">

                                <xsl:choose>
                                    <xsl:when test=" $inState " >

                                        <h3>Value For Your Money In-State</h3>
                                        <div class="contents large">
                                            <div class="thumbs-list contents number large">
                                                <xsl:variable name="valueGrade" select=" ceiling( 5.0 * valueScoreInStateOverallDegree_QRFCFF/@standingPct ) " />
                                                <xsl:choose>
                                                    <xsl:when test=" $valueGrade = 1 "><span class="thumb-holder activeBest" ></span>Best</xsl:when>
                                                    <xsl:when test=" $valueGrade = 2 "><span class="thumb-holder activeBest" ></span>Good</xsl:when>
                                                    <xsl:when test=" $valueGrade = 3 "><span class="thumb-holder activeAverage" ></span>Fair</xsl:when>
                                                    <xsl:when test=" $valueGrade = 4 "><span class="thumb-holder activeLowest" ></span>Low</xsl:when>
                                                    <xsl:when test=" $valueGrade = 5 "><span class="thumb-holder activeLowest" ></span>Poor</xsl:when>
                                                    <xsl:otherwise>N/A</xsl:otherwise>
                                                </xsl:choose>
                                            </div>
                                            <!--MOUSEOVER: The average student living in <xsl:value-of select="contact/state/@name" /> receives an [excellent] quality education for the amount they pay.  -->
                                        </div>

                                    </xsl:when>
                                    <xsl:otherwise>

                                        <h3>Value For Your Money</h3>
                                        <div class="contents large">
                                            <div class="thumbs-list contents number large">
                                                <xsl:variable name="valueGrade" select=" ceiling( 5.0 * valueScoreNonResidentOverallDegree_QRFCFF/@standingPct ) " />
                                                <xsl:choose>
                                                    <xsl:when test=" $valueGrade = 1 "><span class="thumb-holder activeBest" ></span>Best</xsl:when>
                                                    <xsl:when test=" $valueGrade = 2 "><span class="thumb-holder activeBest" ></span>Good</xsl:when>
                                                    <xsl:when test=" $valueGrade = 3 "><span class="thumb-holder activeAverage" ></span>Fair</xsl:when>
                                                    <xsl:when test=" $valueGrade = 4 "><span class="thumb-holder activeLowest" ></span>Low</xsl:when>
                                                    <xsl:when test=" $valueGrade = 5 "><span class="thumb-holder activeLowest" ></span>Poor</xsl:when>
                                                    <xsl:otherwise>N/A</xsl:otherwise>
                                                </xsl:choose>
                                            </div>
                                            <!--MOUSEOVER: The average student receives an [excellent] quality education for the amount they pay.  -->
                                        </div>

                                    </xsl:otherwise>
                                </xsl:choose>

                            </div>
                        </div>

                    </div>
                </div>

                <div class="span4 block type-gray contact-box">
                    <div class="block-spacing">

                        <h3><a href="{ $baseUri }/colleges/{ @slug }/overview/location/{ $indexFile }"><xsl:value-of select=" contact/city " />, <xsl:value-of select=" contact/state/@id " /></a></h3>
                        <div class="contents">
                            <xsl:if test=" normalize-space(contact/homePage) != '' ">
                                <xsl:variable name="schoolHomepageUrl" select=" if ( starts-with(lower-case(contact/homePage), 'http' ) ) then contact/homePage else concat( 'http://', contact/homePage ) " />
                                <xsl:variable name="schoolHomepageName" select=" if ( string-length( contact/homePage ) &gt; 14 ) then 'Website' else contact/homePage " />
                                <div class="homepage"><a href="{ $schoolHomepageUrl }" target="_blank" ><xsl:value-of select=" $schoolHomepageName " /></a></div>
                            </xsl:if>
                            <div class="phone"><xsl:value-of select=" replace( contact/phone, '(\d{3})(\d{3})(\d{4})', '($1) $2-$3' ) " /></div>
                            <div class="location"><a href="{ $baseUri }/colleges/{ @slug }/overview/location/{ $indexFile }">Map</a></div>
                        </div>

                    </div>
                </div>

            </div>

            <div class="color-grid row">

                <div id="loanOverviewBox" data-bhTrackRegion="loanOverviewBox" class="span4 block type-blue clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-paying-for-college-financial-aid' ]/@uri, '~collegeSlug~', @slug ), '#FreshmenLoans' ) }" >
                    <div class="block-spacing">

                        <h3>Average Total Student Loans</h3>
                        <div class="contents number large">
                            <xsl:value-of select=" cf:DisplayMoneyOrNA( freshmenLoansAllSourcesDegree/@value ) " />
                        </div>
                        <!--MOUSEOVER: ??% of incoming students took out loans, averaging $?,??? per year ($???? over 4 years).  -->

                    </div>
                </div>

                <div id="defaultRateOverviewBox" data-bhTrackRegion="defaultRateOverviewBox" class="span4 block type-blue clickable" data-cfTarget="{ replace( $bhUriLookup/page[ @id = 'college-paying-for-college-student-loan-debt' ]/@uri, '~collegeSlug~', @slug ) }" >
                    <div class="block-spacing">

                        <h3>Loan Default Rate</h3>
                        <xsl:variable name="defaultRateGrade" select=" ceiling( 3.0 * defaultPct3yr/@standingPct ) " />
                        <xsl:choose>
                            <xsl:when test=" $defaultRateGrade = ( 1,2,3 ) ">
                                <div class="selectivity fixed-slider">
                                    <div class="row-fluid">
                                        <div class="span4 value { if ( $defaultRateGrade = 1 ) then 'active' else '' } ">Low</div>
                                        <div class="span4 value { if ( $defaultRateGrade = 2 ) then 'active' else '' } ">Average</div>
                                        <div class="span4 value { if ( $defaultRateGrade = 3 ) then 'active' else '' } ">High</div>
                                    </div>
                                </div>
                                <!--MOUSEOVER: <xsl:value-of select="format-number( defaultPct3yr/@value, '##0.0%' )" /> of students default on their loans within 3 years of graduating.-->
                            </xsl:when>
                            <xsl:otherwise>
                                <div class="contents number large">N/A</div>
                            </xsl:otherwise>
                        </xsl:choose>

                    </div>
                </div>

                <div id="expectedCostOverviewBox" data-bhTrackRegion="expectedCostOverviewBox" class="span4 block type-blue clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-paying-for-college-home' ]/@uri, '~collegeSlug~', @slug ), '#4YearCost' ) }" >
                    <div class="block-spacing">

                        <xsl:choose>
                            <xsl:when test=" $inState " >
                                <h3>Annual Price Increase In-State</h3>
                                <div class="contents number large">
                                    <xsl:value-of select=" if ( costInStateNoAidCompounder/@value castable as xs:decimal ) then format-number( costInStateNoAidCompounder/@value, '##0.0%' ) else 'N/A' " />
                                </div>
                            </xsl:when>
                            <xsl:otherwise>
                                <h3>Annual Price Increase</h3>
                                <div class="contents number large">
                                    <xsl:value-of select=" if ( costNonResidentNoAidCompounder/@value castable as xs:decimal ) then format-number( costNonResidentNoAidCompounder/@value, '##0.0%' ) else 'N/A' " />
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!--MOUSEOVER: We estimate that prices will continue to [increase] by ??.?% per year, resulting in an average net price in [2016] of $??,??? -->

                    </div>
                </div>

            </div>


            <div class="color-grid row">
                <div class="span12 block type-blue">
                    <div class="row-fluid">

                        <!-- TODO: Figure out where this box should link to-->
                        <div class="span4 block">
                            <div class="block-spacing">

                                <h3>Public vs Private</h3>
                                <div class="contents large">
                                    <xsl:value-of select="
                                        if ( school/@sector = ( '1', '4', '7' ) ) then 'Public'
                                        else if ( school/@sector = ( '2', '3', '5', '6', '8', '9' ) ) then 'Private' else 'N/A' " />
                                </div>
                                <!-- MOUSEOVER: [CollegeAlias] is one of [16] [public] and one of [84] total colleges in the stat of [New York].  -->

                            </div>
                        </div>

                        <xsl:variable name="selectivityGrade" select=" ceiling( 3.0 * selectivityPct/@standingPct ) " />
                        <xsl:choose>
                            <xsl:when test=" combinedSat/@value castable as xs:decimal ">
                                <div id="satScoreOverviewBox" data-bhTrackRegion="satScoreOverviewBox" class="span4 clickable center" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-applying-entering-class-stats' ]/@uri, '~collegeSlug~', @slug ), '#TestScores' ) }" >
                                    <div class="block-spacing">

                                        <h3>Average SAT Score</h3>
                                        <div class="contents large number"><xsl:value-of select=" format-number( combinedSat/@value, '####' ) " /></div>
                                        <!-- MOUSEOVER: Half of students received a combined math and reading SAT score between [1100] and [1430] (25th to 75th percentiles). -->

                                    </div>
                                </div>
                            </xsl:when>

                            <xsl:when test=" $selectivityGrade = ( 1,2,3 ) ">
                                <div id="selectivityOverviewBox" data-bhTrackRegion="selectivityOverviewBox" class="span4 clickable center" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-applying-entering-class-stats' ]/@uri, '~collegeSlug~', @slug ), '#Selectivity' ) }" >
                                    <div class="block-spacing">

                                        <h3>Admissions Selectivity</h3>
                                        <xsl:choose>
                                            <xsl:when test=" selectivityPct/@value = 1.0 " >
                                                <div class="contents large">
                                                    Open
                                                </div>
                                                <!--MOUSEOVER: This school has an open admission policy and accepts most students that meet basic minimum requirements. -->
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <div class="selectivity fixed-slider">
                                                    <div class="row-fluid">
                                                        <div class="span4 value { if ( $selectivityGrade = 3 ) then 'active' else '' } ">Low</div>
                                                        <div class="span4 value { if ( $selectivityGrade = 2 ) then 'active' else '' } ">Average</div>
                                                        <div class="span4 value { if ( $selectivityGrade = 1 ) then 'active' else '' } ">High</div>
                                                    </div>
                                                </div>
                                                <!--MOUSEOVER: [??.?%] of the applicants in the fall of [2011] where accepted and of those [??.?%] enrolled.  -->
                                            </xsl:otherwise>
                                        </xsl:choose>

                                    </div>
                                </div>
                            </xsl:when>

                            <xsl:otherwise>
                                <div id="selectivityOverviewBox" data-bhTrackRegion="selectivityOverviewBox" class="span4 clickable center" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-applying-entering-class-stats' ]/@uri, '~collegeSlug~', @slug ), '#Selectivity' ) }" >
                                    <div class="block-spacing">

                                        <h3>Admissions Selectivity</h3>
                                        <div class="contents large number">N/A</div>

                                    </div>
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>

                        <div id="highestDegreeOverviewBox" class="span4" >
                            <div class="block-spacing">

                                <h3>Highest Degree Offered</h3>
                                <div class="contents large">
                                    <xsl:value-of select="
                                        if ( school/@highestDegree = '3' ) then 'Associate' else
                                        if ( school/@highestDegree = '4' ) then 'Associate' else
                                        if ( school/@highestDegree = '5' ) then 'Bachelor' else
                                        if ( school/@highestDegree = '6' ) then 'Bachelor' else
                                        if ( school/@highestDegree = '7' ) then 'Master' else
                                        if ( school/@highestDegree = '8' ) then 'Master' else
                                        if ( school/@highestDegree = '9' ) then 'Ph.D.' else 'N/A'
                                    " />
                                </div>
                                <!--MOUSEOVER: [Computer Science] is the most popular among [21] different majors offered. -->

                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <div class="color-grid row">

                <div id="retentionOverviewBox" data-bhTrackRegion="retentionOverviewBox" class="span4 block type-blue clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-academic-life-graduation-and-retention' ]/@uri, '~collegeSlug~', @slug ), '#FreshmenRetention' ) }" >
                    <div class="block-spacing">

                        <xsl:variable name="retentionGrade" select=" ceiling( 3.0 * retentionPct/@standingPct ) " />
                        <h3>Freshmen Retention</h3>
                        <div class="selectivity fixed-slider">
                            <div class="row-fluid">
                                <div class="span4 value { if ( $retentionGrade = 3 ) then 'active' else '' } ">Low</div>
                                <div class="span4 value { if ( $retentionGrade = 2 ) then 'active' else '' } ">Average</div>
                                <div class="span4 value { if ( $retentionGrade = 1 ) then 'active' else '' } ">High</div>
                            </div>
                        </div>
                        <!--MOUSEOVER: [Only] [??.?%] of students make it past their freshmen year and continue on as a sophomore. -->

                    </div>
                </div>


                <div class="span8 block type-blue">
                    <div class="row-fluid">

                        <div id="studentFacultyRatioOverviewBox" data-bhTrackRegion="studentFacultyRatioOverviewBox" class="span6 clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-academic-life-faculty-composition-home' ]/@uri, '~collegeSlug~', @slug ), '#StudentFacultyRatio' ) }" >
                            <div class="block-spacing">

                                <h3>Student to Faculty Ratio</h3>
                                <div class="contents number large" align="center">
                                    <xsl:value-of select=" if ( studentsPerFaculty/@value castable as xs:decimal ) then format-number( round( studentsPerFaculty/@value ), '##0' ) else 'N/A' " /> : 1
                                </div>

                            </div>
                        </div>
                        <!-- MOUSEOVER: [12] students for every one instructional faculty member is considered [above average] when compared nationally.  -->

                        <div id="fullTimeTeachersOverviewBox" data-bhTrackRegion="fullTimeTeachersOverviewBox" class="span6 clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-academic-life-faculty-composition-home' ]/@uri, '~collegeSlug~', @slug ), '#FullTimeTeachers' ) }" >
                            <div class="block-spacing">

                                <h3>Full-Time Teachers</h3>
                                <div class="contents number large">
                                    <xsl:value-of select=" if ( instructorsFulltimePct/@value castable as xs:decimal ) then format-number( instructorsFulltimePct/@value, '##0%' ) else 'N/A' " />
                                </div>

                            </div>
                        </div>
                        <!--MOUSEOVER: [??.?%] of teachers being full-time is considered [below average] when compared nationally.  -->

                    </div>
                </div>

            </div>

            <div class="color-grid row">

                <div id="gradRateOverviewBox" data-bhTrackRegion="gradRateOverviewBox" class="span4 block type-blue clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-academic-life-graduation-and-retention' ]/@uri, '~collegeSlug~', @slug ), '#GraduationRate' ) }" >
                    <div class="block-spacing">

                        <h3>On-Time Graduation Rate</h3>
                        <div class="contents large number">
                            <xsl:value-of select=" if( grad100Pct/@value castable as xs:decimal ) then format-number( grad100Pct/@value, '##0%') else 'N/A' "/>
                        </div>
                        <!--MOUSEOVER: [??.?%] graduate within 6 years while [??.?%] transfer and [??.?%] dropout. -->

                    </div>
                </div>

                <!-- TODO: Link this somewhere once we have somewhere to link it-->
                <div id="startingSalaryOverviewBox" data-bhTrackRegion="startingSalaryOverviewBox" class="span4 block type-blue clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-academic-life-academic-majors-home' ]/@uri, '~collegeSlug~', @slug ), '#ProgramListing' ) }" >
                    <div class="block-spacing">

                        <h3>Average Starting Salary</h3>
                        <div class="contents number large">
                            <xsl:value-of select=" cf:DisplaySalaryOrNA( incomeStarting/@value ) " />
                        </div>
                        <!--MOUSEOVER: [Electicial Engineering] majors earned the most, making [$??,???] while [African Drumming] majors made the least, making only [$??,???]. -->

                    </div>
                </div>

                <!-- TODO: Link this somewhere once we have somewhere to link it-->
                <div id="earningsBoostOverviewBox" data-bhTrackRegion="earningsBoostOverviewBox" class="span4 block type-blue clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-academic-life-academic-majors-home' ]/@uri, '~collegeSlug~', @slug ), '#ProgramListing' ) }" >
                    <div class="block-spacing">

                        <h3>Earnings Boost</h3>
                        <div class="thumbs-list contents number large">
                            <xsl:variable name="valueGrade" select=" ceiling( 5.0 * incomeStartingBoost/@standingPct ) " />
                            <xsl:choose>
                                <xsl:when test=" $valueGrade = 1 "><span class="thumb-holder activeBest" ></span>Best</xsl:when>
                                <xsl:when test=" $valueGrade = 2 "><span class="thumb-holder activeBest" ></span>Good</xsl:when>
                                <xsl:when test=" $valueGrade = 3 "><span class="thumb-holder activeAverage" ></span>Fair</xsl:when>
                                <xsl:when test=" $valueGrade = 4 "><span class="thumb-holder activeLowest" ></span>Low</xsl:when>
                                <xsl:when test=" $valueGrade = 5 "><span class="thumb-holder activeLowest" ></span>Poor</xsl:when>
                                <xsl:otherwise>N/A</xsl:otherwise>
                            </xsl:choose>
                        </div>
                        <!--MOUSEOVER: Students made [21.4% more] starting out and [34.9% more] by mid-career than students graduating with similar majors at other colleges. -->

                    </div>
                </div>

            </div>

            <div class="color-grid row">
                <div class="span12 block type-blue">
                    <div class="row-fluid">

                        <div id="genderOverviewBox" data-bhTrackRegion="genderOverviewBox" class="span4 gender-box clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-student-life-diversity' ]/@uri, '~collegeSlug~', @slug ), '#GenderDiversity' ) }" >
                            <div class="block-spacing">

                                <h3>Male To Female %</h3>
                                <xsl:choose>
                                    <xsl:when test=" genderMalePct/@value castable as xs:decimal or genderFemalePct/@value castable as xs:decimal ">
                                        <div class="contents large number">
                                            <xsl:if test=" genderMalePct/@value > 0 "><span class="male"><xsl:value-of select=" format-number( round( 100.0 * genderMalePct/@value ), '##0' ) "/></span></xsl:if>
                                            <xsl:if test=" genderFemalePct/@value > 0 "><span class="female"><xsl:value-of select=" format-number( round( 100.0 * genderFemalePct/@value ), '##0' ) "/></span></xsl:if>
                                        </div>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <div class="contents large number">N/A</div>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!--MOUSEOVER: [CollegeAlias] ranks [#??] out of [?,???] schools in our nationwide gender diversity rankings. -->
                                <!--MOUSEOVER (If mostly one gender): This school is [97.3%] male. -->

                            </div>
                        </div>

                        <div id="inStateStudentsOverviewBox" data-bhTrackRegion="inStateStudentsOverviewBox" class="span4 clickable center" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-student-life-diversity' ]/@uri, '~collegeSlug~', @slug ), '#GeographicDiversity' ) }" >
                            <div class="block-spacing">

                                <h3>Students From <xsl:value-of select=" contact/state/@name " /></h3>
                                <div class="contents number large">
                                    <xsl:value-of select=" if ( fromInStatePct/@value castable as xs:decimal ) then format-number( fromInStatePct/@value, '##0%' ) else 'N/A' " />
                                </div>
                                <!--MOUSEOVER: [??%] of students come from [??] different states and [??%] come from outside the U.S. -->

                            </div>
                        </div>

                        <div id="ethnicDiversityOverviewBox" data-bhTrackRegion="ethnicDiversityOverviewBox" class="span4 clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-student-life-diversity' ]/@uri, '~collegeSlug~', @slug ), '#EthnicDiversity' ) }" >
                            <div class="block-spacing">

                                <h3>Ethnic Diversity</h3>
                                <xsl:choose>
                                    <xsl:when test=" @eth_category = ( 'Low', 'Medium', 'High' ) ">
                                        <div class="ethnicity heart-scale">
                                            <div class="row-fluid">
                                                <div class="span4 value { if ( @eth_category = 'Low' ) then 'active' else '' } ">Low</div>
                                                <div class="span4 value { if ( @eth_category = 'Medium' ) then 'active' else '' } ">Medium</div>
                                                <div class="span4 value { if ( @eth_category = 'High' ) then 'active' else '' } ">High</div>
                                            </div>
                                        </div>
                                        <!--MOUSEOVER: [CollegeAlias] ranks [#??] out of [?,???] total schools in our ethnic diversity rankings. -->
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <div class="contents large number">N/A</div>
                                    </xsl:otherwise>
                                </xsl:choose>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="color-grid row-fluid">

                <div id="sizeOverviewBox" data-bhTrackRegion="sizeOverviewBox" class="span6 block type-blue clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-student-life-home' ]/@uri, '~collegeSlug~', @slug ), '#UndergradCount' ) }" >
                    <div class="block-spacing">

                        <h3>School Size</h3>
                        <xsl:choose>
                            <xsl:when test=" school/@size = ( 1, 2, 3, 4, 5 ) ">
                                <div class="school-size fixed-slider">
                                    <div class="row-fluid">
                                        <div class="span1-5 value { if ( school/@size = '1' ) then 'active' else '' } ">&lt;&nbsp;1k</div>
                                        <div class="span1-5 value { if ( school/@size = '2' ) then 'active' else '' } ">1-5k</div>
                                        <div class="span1-5 value { if ( school/@size = '3' ) then 'active' else '' } ">5-10k</div>
                                        <div class="span1-5 value { if ( school/@size = '4' ) then 'active' else '' } ">10-20k</div>
                                        <div class="span1-5 value { if ( school/@size = '5' ) then 'active' else '' } ">&gt;&nbsp;20k</div>
                                    </div>
                                </div>
                                <!--MOUSEOVER: [??,???] undergrads attend [CollegeAlias], as do [?,???] grad students. -->
                            </xsl:when>
                            <xsl:otherwise>
                                <div class="contents large number">N/A</div>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                </div>

                <div id="campusSettingOverviewBox" data-bhTrackRegion="campusSettingOverviewBox" class="span6 block type-blue clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-overview-location' ]/@uri, '~collegeSlug~', @slug ), '#UndergradCount' ) }" >
                    <div class="block-spacing">

                        <h3>Campus Setting</h3>
                        <div class="contents large">
                            <xsl:value-of select="
                                if (school/@setting = '11') then 'Large City' else
                                if (school/@setting = '12') then 'Midsize City' else
                                if (school/@setting = '13') then 'Small City' else
                                if (school/@setting = '21') then 'Large Suburb' else
                                if (school/@setting = '22') then 'Midsize Suburb' else
                                if (school/@setting = '23') then 'Small Suburb' else
                                if (school/@setting = '31') then 'Small Town' else
                                if (school/@setting = '32') then 'Small Town' else
                                if (school/@setting = '33') then 'Small Town' else
                                if (school/@setting = '41') then 'Rural' else
                                if (school/@setting = '42') then 'Rural' else
                                if (school/@setting = '43') then 'Rural' else 'N/A' " />
                        </div>
                        <!--MOUSEOVER: ??????? I'm not sure what to say here.......maybe steal what was written on the map/location page? -->

                    </div>
                </div>

            </div>

            <div class="color-grid row">

                <div id="giBillOverviewBox" data-bhTrackRegion="giBillOverviewBox" class="span4 block type-blue clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-student-life-veterans' ]/@uri, '~collegeSlug~', @slug ), '' ) }" >
                    <div class="block-spacing">
                        <h3>GI Bill Recipients</h3>
                        <div class="contents large number">
                            <xsl:value-of select=" if( giBillRecipients castable as xs:decimal ) then format-number( giBillRecipients, '#,##0') else 'N/A' "/>
                        </div>
                    </div>
                </div>

                <div id="crimeRatingOverviewBox" data-bhTrackRegion="crimeRatingOverviewBox" class="span4 block type-blue clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-student-life-crime' ]/@uri, '~collegeSlug~', @slug ), '' ) }" >
                    <div class="block-spacing">
                        <h3>Crime</h3>

                        <xsl:choose>
                            <xsl:when test=" crimeGrade != '' ">
                                <div class="selectivity fixed-slider">
                                    <div class="row-fluid">
                                        <div class="span4 value { if ( crimeGrade = ('A+','A','A-','B+','B') ) then 'active' else '' } ">Low</div>
                                        <div class="span4 value { if ( crimeGrade = ('B-','C+','C','C-','D+') ) then 'active' else '' } ">Average</div>
                                        <div class="span4 value { if ( crimeGrade = ('D','D-','F+','F','F-') ) then 'active' else '' } ">High</div>
                                    </div>
                                </div>
                            </xsl:when>
                            <xsl:otherwise>
                                <div class="contents number large">N/A</div>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                </div>

                <div id="distanceLearnersOverviewBox" data-bhTrackRegion="distanceLearnersOverviewBox" class="span4 block type-blue clickable" data-cfTarget="{ concat( replace( $bhUriLookup/page[ @id = 'college-academic-life-distance-learning' ]/@uri, '~collegeSlug~', @slug ), '#ProgramListing' ) }" >
                    <div class="block-spacing">
                        <h3>Distance Learners</h3>
                        <div class="contents number large">
                            <xsl:value-of select=" if ( distanceLearners castable as xs:decimal ) then format-number( distanceLearners, '##0%' ) else 'N/A' " />
                        </div>
                    </div>
                </div>

            </div>

            <div class="color-grid row-fluid" data-bhTrackRegion="redRankingBlock">
                <div class="span12 block type-red">
                    <div class="row-fluid">

                        <div class="span4 ranking-box">
                            <div class="block-spacing">

                                <h3>Overall Ranking</h3>
                                <div class="contents">

                                    <xsl:choose>
                                        <xsl:when test=" qualityScore/@value castable as xs:decimal ">
                                            <div class="large number clearfix">
                                                <a data-bhTrackRegion="qualityStandingNW" href="{ $baseUri }/rankings/best-colleges/{ $indexFile }#{ qualityScore/@standing }" >
                                                    <span class="pound">#</span><span class="ranking"><xsl:value-of select=" qualityScore/@standing " /></span>
                                                </a>
                                            </div>
                                            <div style="min-height: 4.0em;">out of <xsl:value-of select=" format-number(qualityScore/@standingCount, '#,###') " /><br /> Best Nationwide Colleges </div>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <div class="large number clearfix">
                                                <span class="ranking">N/A</span>
                                            </div>
                                            <div style="min-height: 4.0em;">&nbsp;</div>
                                        </xsl:otherwise>
                                    </xsl:choose>

                                    <a data-bhTrackRegion="qualityStandingNW-All" class="btn btn-white" href="{ $baseUri }/rankings/best-colleges/{ $indexFile }">U.S. Rankings</a>
                                </div>

                            </div>
                        </div>

                        <div class="span4 ranking-box">
                            <div class="block-spacing">

                                <h3>State Ranking</h3>
                                <div class="contents">
                                    <xsl:choose>
                                        <xsl:when test=" qualityScore/@value castable as xs:decimal ">
                                            <div class="large number clearfix">
                                                <a data-bhTrackRegion="qualityStandingSW" href="{ $baseUri }/rankings/best-colleges/state/{ contact/state/@slug }/{ $indexFile }#{ qualityScore/@standingIS }" >
                                                    <span class="pound">#</span><span class="ranking"><xsl:value-of select=" qualityScore/@standingIS " /></span>
                                                </a>
                                            </div>
                                            <div style="min-height: 4.0em;">out of <xsl:value-of select=" format-number(qualityScore/@standingISCount, '#,###') " /><br /> Best <xsl:value-of select="contact/state/@name" /> Colleges</div>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <div class="large number clearfix">
                                                <span class="ranking">N/A</span>
                                            </div>
                                            <div style="min-height: 4.0em;">&nbsp;</div>
                                        </xsl:otherwise>
                                    </xsl:choose>

                                    <a data-bhTrackRegion="qualityStandingSW-All" class="btn btn-white" href="{ $baseUri }/rankings/best-colleges/state/{ contact/state/@slug }/{ $indexFile }"><xsl:value-of select="contact/state/@name" /> Rankings</a>
                                </div>

                            </div>
                        </div>

                        <div class="span4 ranking-box">
                            <div class="block-spacing">

                                <h3>Value Ranking</h3>
                                <div class="contents">
                                    <xsl:choose>
                                        <xsl:when test=" valueScoreNonResidentOverallDegree_QRFCFF/@standing castable as xs:decimal ">
                                            <div class="large number clearfix">
                                                <a data-bhTrackRegion="valueStandingNW" href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >
                                                    <span class="pound">#</span><span class="ranking"><xsl:value-of select=" valueScoreNonResidentOverallDegree_QRFCFF/@standing " /></span>
                                                </a>
                                            </div>
                                            <div style="min-height: 4.0em;">out of <xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standingCount, '#,###') " /><br />Best Nationwide Colleges For Your Money</div>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <div class="large number clearfix">
                                                <span class="ranking">N/A</span>
                                            </div>
                                            <div style="min-height: 4.0em;">&nbsp;</div>
                                        </xsl:otherwise>
                                    </xsl:choose>

                                    <a data-bhTrackRegion="valueStandingNW-All" class="btn btn-white" href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }">Compare Value</a>
                                </div>

                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <xsl:call-template name="payscaleDisclaimer" />
        </div>
    </xsl:template>

    <xsl:template name="bodyFooterContent" >
        <script type="text/javascript">
            $("h1" ).on("click", bhOnLinkClick());

            //$( "[data-cfTarget]" )
            //  .on( "click", bhOnLinkClick() )
            //  .on( "click", function() { location.href = $(this).attr("data-cfTarget"); } );

            $( "[data-cfTarget]" ).on( "click", function(event){
                cfTracker.trackClick( event, $(this).attr("data-cfTarget") );
            });
        </script>
    </xsl:template>

</xsl:stylesheet>
