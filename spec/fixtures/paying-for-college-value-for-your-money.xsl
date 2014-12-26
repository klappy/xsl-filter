<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [<!ENTITY nbsp "&#160;">]>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" >

	<xsl:import href="../../../../_shared/bhArticleMaster.xsl" />

	<xsl:output method="html" indent="no" encoding="utf-8" />

	<xsl:template match="/college">
		<xsl:call-template name="bhArticleMaster">
			<xsl:with-param name="bhPageId" select="'#bhPageId_college-paying-for-college-value-for-your-money'" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="headHeaderContent">
		<xsl:param name="bhPageId" />

		<xsl:call-template name="articleHead">
			<xsl:with-param name="bhPageId" select="$bhPageId" />
			<xsl:with-param name="htmlTitle" select ="concat('Is ', @nameDistinct, ' a Good Educational Value for the Money? Find Out at CollegeFactual.com')" />
			<xsl:with-param name="metaDesc" select ="concat('Review College Factual''s unique analysis of ', @nameDistinct, ' educational value and discover if you would be over- or under-paying for the quality of the education you will receive at ', @alias, '.')" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="headFooterContent">
		<style>
			#similarValueTable td {
				border-top: none;
			}

			#similarValueTable ul {
				list-style-type: none;
				margin: 0px;
				padding: 0px;
			}

			#similarValueTable li {
				padding: 5px;
				padding-left: 24px;
				margin-left: -1px;
				font-size: 0.9em;
			}

			.absCent {
				font-weight: bold;
				border: 1px solid #dddddd !important;
				vertical-align: middle !important;
				text-align: center !important;
			}

			.thisCollege{
				border: solid 1px #dddddd;
				border-left: solid 1px #ffffff;
				font-weight: bold;
			}
		</style>
	</xsl:template>

	<xsl:template name="bodyContent">
		<xsl:param name="bhPageId" />

		<xsl:variable name="showInState" select=" costInStateNoAid/@value &lt; costNonResidentNoAid/@value " />

		<div class="container-paying">
			<!-- The Breadcrumb ==================================================-->
            <xsl:call-template name="breadcrumb">
                <xsl:with-param name="content">
                    <map>
                        <entry><navName><xsl:value-of select="'All Colleges'"/></navName>
															 <navUrl><xsl:value-of select="$bhUriLookup/page[ @id = 'colleges-home' ]/@uri"/></navUrl></entry>
                        <entry><navName><xsl:value-of select="@name" /></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-home' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
                        <entry><navName><xsl:value-of select="$bhUriLookup/page[ @id = 'college-paying-for-college-home' ]/@navName"/></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-paying-for-college-home' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
                        <entry><navName><xsl:value-of select="$bhUriLookup/page[ @id = 'college-paying-for-college-value-for-your-money' ]/@navName"/></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-paying-for-college-value-for-your-money' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
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

			<div class="row">
				<article class="span8">

					<!--
						Summary:
						Give an overview based on the overall, nationwide ranking.
						Introduce them to how it relates to the ranking of the school and give a hint as to how value is calculated
						(factoring in percent and amount of aid) and some of the factors that will be involved further down the page
					-->

					<xsl:variable name="qualvalSection">
						<item qualStanding="1" valStanding="1" title="One Stat You'll be Eager to Show Your Parents: This School's is an Excellent Value" >
							<inStateOverrideText>
								<xsl:value-of select=" @name " />'s overall low net price combined with its high quality education, results in a great value for the money when compared to other colleges and universities in <xsl:value-of select=" state/@name " />. <xsl:value-of select=" @alias " />'s in-state discounts earned the school a <a href="{ $baseUri }/rankings/best-colleges-for-money/state/{ state/@slug }/{ $indexFile }#{ valueScoreInStateOverallDegree_QRFCFF/@standingIS }" >#<xsl:value-of select=" format-number(valueScoreInStateOverallDegree_QRFCFF/@standingIS, '#,###') " /></a> ranking on the <xsl:value-of select=" state/@name " /> Best Colleges for the Money list, while its overall value for the average student earned it a respectable <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking among nationwide schools.
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s emphasis on high quality education, combined with its overall low net price, delivers students a great value for the money.  This earned <xsl:value-of select=" @alias " /> a <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Best Colleges for the Money list, when compared to other colleges and universities nationwide.
							</defaultText>
						</item>
						<item qualStanding="1" valStanding="2" title="Wall Street Says: Go Long, it's a Good Price for a Great College." >
							<inStateOverrideText>
								<xsl:value-of select=" @name " /> provides a high quality education at an overall net price that is lower than other colleges and universities delivering similar educational quality, in <xsl:value-of select=" state/@name " />.  This combination of high quality at a lower cost results in a good value for the educational dollar, and earns <xsl:value-of select=" @alias " /> a <a href="{ $baseUri }/rankings/best-colleges-for-money/state/{ state/@slug }/{ $indexFile }#{ valueScoreInStateOverallDegree_QRFCFF/@standingIS }" >#<xsl:value-of select=" format-number(valueScoreInStateOverallDegree_QRFCFF/@standingIS, '#,###') " /></a> ranking on the <xsl:value-of select=" state/@name " /> Best Colleges for the Money list and a <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the nationwide list.
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " /> provides a high quality education at an overall net price that is lower than other nationwide colleges and universities delivering a comparable education. This results in a good value for the educational dollar, and earns <xsl:value-of select=" @alias " /> a <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Overall Best Colleges for the Money list.
							</defaultText>
						</item>
						<item qualStanding="1" valStanding="3" title="Hey, It's a Good School and Surprisingly Affordable!" >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it among the top 20% best colleges and universities nationwide. The school's overall net price reflects that quality, earning it a middle-of-the-pack <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Best Colleges for the Money list. While you won't be paying considerably less than you would at colleges comparable to <xsl:value-of select=" @alias " /> in quality, you won't be overpaying either, making this school a fairly priced option.
							</defaultText>
						</item>
						<item qualStanding="1" valStanding="4" title="This is a Great School, and They Know It. So Pay Up." >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								The quality of education you will receive at <xsl:value-of select=" @name " /> places it among the best in the country. However, when compared to other colleges and universities nationwide that deliver the same caliber of education, the net price to attend <xsl:value-of select=" @alias " /> is higher than it should be. This has earned it a low <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Best Colleges for the Money list. While this school earns high marks for quality, you can receive a comparable education elsewhere at a better price.
							</defaultText>
						</item>
						<item qualStanding="1" valStanding="5" title="This Place is Great and All, but It's Kind of Overpriced" >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " /> is one of the best schools in the country, however, it's also one of the most expensive. In a nationwide comparison, other colleges and universities delivering the same caliber of education as <xsl:value-of select=" @alias " /> cost much less. This has earned it a very low ranking of <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> on the Best Colleges for the Money list. The school earns high marks for quality, but is considerably overpriced. You can receive a comparable education elsewhere and spend much less.
							</defaultText>
						</item>
						<item qualStanding="2" valStanding="1" title="Good School + Low Cost = Smiling Parents (And Great Value)" >
							<inStateOverrideText>
								<xsl:value-of select=" @name " />'s overall low net price combined with its educational quality provides students with good value for the money when compared to other colleges and universities in <xsl:value-of select=" state/@name " />. <xsl:value-of select=" @alias " />'s in-state discounts earned the school a <a href="{ $baseUri }/rankings/best-colleges-for-money/state/{ state/@slug }/{ $indexFile }#{ valueScoreInStateOverallDegree_QRFCFF/@standingIS }" >#<xsl:value-of select=" format-number(valueScoreInStateOverallDegree_QRFCFF/@standingIS, '#,###') " /></a> ranking on the <xsl:value-of select=" state/@name " /> Best Colleges for the Money list, while its overall value placed it in the top 20% among nationwide schools, with a ranking of  <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a>.
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s quality of education, combined with its overall low net price, delivers students a good value for the money when compared to other colleges and universities nationwide of similar quality.  This earned <xsl:value-of select=" @alias " /> a ranking of <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> on the Best Colleges for the Money list, placing it in the top 20% overall.
							</defaultText>
						</item>
						<item qualStanding="2" valStanding="2" title="You'll Want a Car That Drives Like This School: Good Quality and Underpriced" >
							<inStateOverrideText>
								<xsl:value-of select=" @name " /> provides good, quality education at an overall net price that is lower than other colleges and universities of similar educational quality in <xsl:value-of select=" state/@name " />.  This combination of educational quality at a lower cost results in a good value for the educational dollar, and earns <xsl:value-of select=" @alias " /> a <a href="{ $baseUri }/rankings/best-colleges-for-money/state/{ state/@slug }/{ $indexFile }#{ valueScoreInStateOverallDegree_QRFCFF/@standingIS }" >#<xsl:value-of select=" format-number(valueScoreInStateOverallDegree_QRFCFF/@standingIS, '#,###') " /></a> ranking on the <xsl:value-of select=" state/@name " /> Best Colleges for the Money list and a <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the nationwide list.
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " /> provides a good, quality education at an overall net price that is lower than other nationwide colleges and universities delivering a comparable education. This results in a good value for the educational dollar, and earns <xsl:value-of select=" @alias " /> a <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Overall Best Colleges for the Money list.
							</defaultText>
						</item>
						<item qualStanding="2" valStanding="3" title="No Tricks Here: Above Average School That is Fairly Priced" >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it among the top 40% of colleges and universities nationwide. The school's overall net price reflects that quality, earning it a middle-of-the-pack <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Best Colleges for the Money list. While you won't be paying any less to attend <xsl:value-of select=" @alias " /> than you would other comparable colleges, you won't be overpaying either, making this school a fairly priced option.
							</defaultText>
						</item>
						<item qualStanding="2" valStanding="4" title="Good School, Bad Price" >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								The quality of education you will receive at <xsl:value-of select=" @name " /> places it in the top 40% of all colleges and universities nationwide. However, when compared to other schools that deliver the same caliber of education, the net price to attend <xsl:value-of select=" @alias " /> is higher than it should be. This has earned it a low <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Best Colleges for the Money list. While this school earns good marks for quality, you can receive a comparable education elsewhere at a better price.
							</defaultText>
						</item>
						<item qualStanding="2" valStanding="5" title="You'll Have to Pay a Pretty Penny to Say You Went to This School" >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " /> ranks in the top 40% nationwide for overall educational quality, however, it's also one of the most expensive. In a nationwide comparison, other colleges and universities delivering the same caliber of education as <xsl:value-of select=" @alias " /> cost much less. This has earned it a very low ranking of <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> on the Best Colleges for the Money list. The school earns good marks for quality, but is considerably overpriced. You can receive a comparable education elsewhere for a much better price.
							</defaultText>
						</item>
						<item qualStanding="3" valStanding="1" title="Not Often You See Such a Great Education For Such a Bargain" >
							<inStateOverrideText>
								<xsl:value-of select=" @name " />'s educational quality places it squarely in the middle tier of our nationwide Overall Best Colleges ranking. However, its low net price provides students with good value for the money when compared to other colleges and universities in <xsl:value-of select=" state/@name " /> that deliver a comparable education. <xsl:value-of select=" @alias " />'s in-state discounts earned the school a <a href="{ $baseUri }/rankings/best-colleges-for-money/state/{ state/@slug }/{ $indexFile }#{ valueScoreInStateOverallDegree_QRFCFF/@standingIS }" >#<xsl:value-of select=" format-number(valueScoreInStateOverallDegree_QRFCFF/@standingIS, '#,###') " /></a> ranking on the <xsl:value-of select=" state/@name " /> Best Colleges for the Money list, while its overall value placed it in the top 20% among nationwide schools, with a ranking of  <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a>.
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it squarely in the middle of our nationwide Best Colleges ranking. However, the school's overall net price is low when compared to other colleges and universities that deliver comparable educational quality. This has earned <xsl:value-of select=" @alias " /> a ranking of <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> on the Best Colleges for the Money list, placing it in the top 20% of college values across the country.
							</defaultText>
						</item>
						<item qualStanding="3" valStanding="2" title="Not a Memorial Day Sale or Anything. This School is Just a Great Bargain." >
							<inStateOverrideText>
								<xsl:value-of select=" @name " />'s educational quality places it squarely in the middle tier of our nationwide Overall Best Colleges ranking. However, students benefit from a below-average net price when compared to other colleges and universities in <xsl:value-of select=" state/@name " /> delivering similar educational quality.  This combination of educational quality at a lower cost results in a good value for the educational dollar, and earns <xsl:value-of select=" @alias " /> a <a href="{ $baseUri }/rankings/best-colleges-for-money/state/{ state/@slug }/{ $indexFile }#{ valueScoreInStateOverallDegree_QRFCFF/@standingIS }" >#<xsl:value-of select=" format-number(valueScoreInStateOverallDegree_QRFCFF/@standingIS, '#,###') " /></a> ranking on the <xsl:value-of select=" state/@name " /> Best Colleges for the Money list and a <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the nationwide list.
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it squarely in the middle tier of our nationwide Overall Best Colleges ranking. However, students benefit from a below-average net price when compared to other colleges and universities delivering similar educational quality nationwide.  This combination of educational quality at a lower cost results in a good value for the educational dollar, and earns <xsl:value-of select=" @alias " /> a <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Best Colleges for the Money list.
							</defaultText>
						</item>
						<item qualStanding="3" valStanding="3" title="Life's Not Fair, But Sometimes the Price of Your Education Is." >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it squarely in the middle tier of our nationwide Best Colleges ranking. The school's overall net price reflects that quality, earning it an average ranking of <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> on the Best Colleges for the Money list. While you won't be paying considerably less than you would at colleges comparable to <xsl:value-of select=" @alias " /> in quality, you won't be overpaying either, making this school a fairly priced option.
							</defaultText>
						</item>
						<item qualStanding="3" valStanding="4" title="I'm Sure the Business Classes Here Will Explain Why This School is So Overpriced" >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it squarely in the middle tier of our nationwide Overall Best Colleges ranking. However, when compared to other schools that deliver the same caliber of education, the net price to attend <xsl:value-of select=" @alias " /> is higher than it should be. This has earned it a low <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Best Colleges for the Money list. While this school earns average marks for quality, you can receive a comparable education elsewhere at a better price.
							</defaultText>
						</item>
						<item qualStanding="3" valStanding="5" title="You May Not Be Much Smarter by the Time You Graduate, But at Least You'll Be Way Poorer" >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it squarely in the middle tier of our nationwide Overall Best Colleges ranking. However, when compared to other schools that deliver the same caliber of education, the net price to attend <xsl:value-of select=" @alias " /> is much higher than it should be. This has earned it a very poor <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Best Colleges for the Money list. While this school earns average marks for quality, you can receive a comparable education elsewhere at a much better price.
							</defaultText>
						</item>
						<item qualStanding="4" valStanding="1" title="With All the Money You Save Here, You Could Almost Go to a Much Better School" >
							<inStateOverrideText>
								<xsl:value-of select=" @name " />'s educational quality places it below average on our nationwide Overall Best Colleges ranking. However, its very low net price provides students with an inexpensive option when compared to other colleges and universities delivering a comparable education in <xsl:value-of select=" state/@name " />. <xsl:value-of select=" @alias " />'s in-state discounts earned the school a <a href="{ $baseUri }/rankings/best-colleges-for-money/state/{ state/@slug }/{ $indexFile }#{ valueScoreInStateOverallDegree_QRFCFF/@standingIS }" >#<xsl:value-of select=" format-number(valueScoreInStateOverallDegree_QRFCFF/@standingIS, '#,###') " /></a> ranking on the <xsl:value-of select=" state/@name " /> Best Colleges for the Money list, while its low overall price placed it in the top 20% among nationwide values, with a ranking of  <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a>.
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it below average on our nationwide Overall Best Colleges ranking. However, its very low net price provides students with an inexpensive option when compared to other colleges and universities delivering a comparable education. This earned <xsl:value-of select=" @alias " /> a ranking of <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> on the Best Colleges for the Money list, placing it among the top 20% across the country.
							</defaultText>
						</item>
						<item qualStanding="4" valStanding="2" title="What do You Get for This Low Price? Low Quality..." >
							<inStateOverrideText>
								<xsl:value-of select=" @name " />'s educational quality places it below average on our nationwide Overall Best Colleges ranking. However, students benefit from its below average net price when compared to other colleges and universities delivering similar educational quality in <xsl:value-of select=" state/@name " />.  This combination of educational quality at a below average cost provides students with an inexpensive college option, and earns <xsl:value-of select=" @alias " /> a <a href="{ $baseUri }/rankings/best-colleges-for-money/state/{ state/@slug }/{ $indexFile }#{ valueScoreInStateOverallDegree_QRFCFF/@standingIS }" >#<xsl:value-of select=" format-number(valueScoreInStateOverallDegree_QRFCFF/@standingIS, '#,###') " /></a> ranking on the <xsl:value-of select=" state/@name " /> Best Colleges for the Money list and a <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the nationwide list.
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it below average on our nationwide Overall Best Colleges ranking. However, students benefit from a below-average net price when compared to other colleges and universities delivering similar educational quality nationwide.  This combination of educational quality at a below average cost provides students with an inexpensive college option, and earns <xsl:value-of select=" @alias " /> a <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Best Colleges for the Money list.
							</defaultText>
						</item>
						<item qualStanding="4" valStanding="3" title="You Can't Be Too Upset About the Below Average Quality Score, Their Price is Also Below Average" >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it below average on our nationwide Best Colleges ranking. The school's net price reflects the overall quality, earning it an average ranking of <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> on the Best Colleges for the Money list. While you won't be paying less to attend <xsl:value-of select=" @alias " /> than you would to attend other schools that are comparable in quality, you won't be overpaying either, making this a fairly priced option.
							</defaultText>
						</item>
						<item qualStanding="4" valStanding="4" title="Above Average Debt for a Below Average Education" >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it below average on our nationwide Overall Best Colleges ranking. However, when compared to other colleges and universities that deliver the same caliber of education, the net price to attend <xsl:value-of select=" @alias " /> is higher than it should be. This has earned it a very low <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Best Colleges for the Money list. While this school earns below average marks for quality, its pricing is more in-line with an above average school.
							</defaultText>
						</item>
						<item qualStanding="4" valStanding="5" title="You May Not Get a Great Education, So At Least Try to Have Fun With No Money" >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it below average on our nationwide Overall Best Colleges ranking. However, when compared to other colleges and universities that deliver the same caliber of education, the net price to attend <xsl:value-of select=" @alias " /> is much higher than it should be. This has earned it a very poor <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Best Colleges for the Money list. While this school earns below average marks for quality, its pricing is more in-line with an above average school, making this an overpriced option for the education it delivers.
							</defaultText>
						</item>
						<item qualStanding="5" valStanding="1" title="Why is This School So Cheap? Because it Deserves to Be." >
							<inStateOverrideText>
								<xsl:value-of select=" @name " />'s educational quality places it in the bottom tier of our nationwide Overall Best Colleges ranking. However, its very low net price provides students with an inexpensive option when compared to other colleges and universities delivering an education that is comparable in quality in <xsl:value-of select=" state/@name " />. <xsl:value-of select=" @alias " />'s in-state discounts earned the school a <a href="{ $baseUri }/rankings/best-colleges-for-money/state/{ state/@slug }/{ $indexFile }#{ valueScoreInStateOverallDegree_QRFCFF/@standingIS }" >#<xsl:value-of select=" format-number(valueScoreInStateOverallDegree_QRFCFF/@standingIS, '#,###') " /></a> ranking on the <xsl:value-of select=" state/@name " /> Best Colleges for the Money list, while its low overall price placed it in the top 20% among nationwide values, with a ranking of  <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a>.
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it in the bottom tier of our nationwide Overall Best Colleges ranking. However, its very low net price provides students with an inexpensive option when compared to other colleges and universities delivering a comparable education. This earned <xsl:value-of select=" @alias " /> a ranking of <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> on the Best Colleges for the Money list, placing it among the top 20% across the country.
							</defaultText>
						</item>
						<item qualStanding="5" valStanding="2" title="Sure, It's a Low Quality School, But at Least They Don't Make You Pay a Lot For It" >
							<inStateOverrideText>
								<xsl:value-of select=" @name " />'s educational quality places it in the bottom tier of our nationwide Overall Best Colleges ranking. However, students benefit from its below-average net price when compared to other colleges and universities delivering similar educational quality, in <xsl:value-of select=" state/@name " />.  This combination of educational quality at a below average cost provides students with an inexpensive college option, and earns <xsl:value-of select=" @alias " /> a <a href="{ $baseUri }/rankings/best-colleges-for-money/state/{ state/@slug }/{ $indexFile }#{ valueScoreInStateOverallDegree_QRFCFF/@standingIS }" >#<xsl:value-of select=" format-number(valueScoreInStateOverallDegree_QRFCFF/@standingIS, '#,###') " /></a> ranking on the <xsl:value-of select=" state/@name " /> Best Colleges for the Money list and a <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the nationwide list.
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it in the bottom tier of our nationwide Overall Best Colleges ranking. However, students benefit from its below-average net price when compared to other colleges and universities delivering similar educational quality.  This combination provides students with an inexpensive college option, and earns <xsl:value-of select=" @alias " /> a <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Best Colleges for the Money list.
							</defaultText>
						</item>
						<item qualStanding="5" valStanding="3" title="Low Quality School, but Priced Fairly" >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it in the bottom tier of our nationwide Best Colleges ranking. The school's net price reflects the overall quality, earning it an average ranking of <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> on the Best Colleges for the Money list. While you won't be paying less to attend <xsl:value-of select=" @alias " /> than you would to attend comparably rated colleges and universities, you won't be overpaying either, making this a fairly priced option.
							</defaultText>
						</item>
						<item qualStanding="5" valStanding="4" title="Economics 101: Don't Over-Pay to Go to This School" >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it in the bottom tier of our nationwide Overall Best Colleges ranking. However, when compared to other colleges and universities that deliver the same caliber of education, the net price to attend <xsl:value-of select=" @alias " /> is higher than it should be. This has earned it a very low <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Best Colleges for the Money list. This school earns poor marks for educational quality while its pricing is in-line with a higher quality school, making it a poor educational value.
							</defaultText>
						</item>
						<item qualStanding="5" valStanding="5" title="Buyer Beware: Bad Quality Score at a Bad Price" >
							<inStateOverrideText>
							</inStateOverrideText>
							<defaultText>
								<xsl:value-of select=" @name " />'s educational quality places it among the worst-ranked colleges and universities on our Overall Best Colleges list. However, when compared to these other schools that deliver the same caliber of education, the net price to attend <xsl:value-of select=" @alias " /> is much, much higher than it should be. This has earned it a very poor <a href="{ $baseUri }/rankings/best-colleges-for-money/{ $indexFile }#{ valueScoreNonResidentOverallDegree_QRFCFF/@standing }" >#<xsl:value-of select=" format-number(valueScoreNonResidentOverallDegree_QRFCFF/@standing, '#,###') " /></a> ranking on the Best Colleges for the Money list, and makes it an overpriced option. Students should carefully consider what their financial obligations will be should they wish to attend this school, and look closely at other educational options that offer similar benefits at a much better price.
							</defaultText>
						</item>
					</xsl:variable>

					<xsl:choose>
						<xsl:when test=" valueScoreNonResidentOverallDegree_QRFCFF/@value castable as xs:decimal " >

							<xsl:variable name="valStandingNR" select=" if ( valueScoreNonResidentOverallDegree_QRFCFF/@standingPct castable as xs:decimal ) then ceiling( 5.0 * valueScoreNonResidentOverallDegree_QRFCFF/@standingPct ) else 6 " />
							<xsl:variable name="qualStandingNR" select=" if ( qualityScore/@standingPct castable as xs:decimal ) then ceiling( 5.0 * qualityScore/@standingPct ) else 6 " />
							<xsl:variable name="valStandingIS" select=" if ( valueScoreInStateOverallDegree_QRFCFF/@standingISPct castable as xs:decimal ) then ceiling( 5.0 * valueScoreInStateOverallDegree_QRFCFF/@standingISPct ) else 6 " />
							<xsl:variable name="qualStandingIS" select=" if ( qualityScore/@standingISPct castable as xs:decimal ) then ceiling( 5.0 * qualityScore/@standingISPct ) else 6 " />
							<xsl:variable name="matchIS" select=" $qualvalSection/item[ @qualStanding = $qualStandingIS and @valStanding = $valStandingIS ] " />
							<xsl:variable name="matchNR" select=" $qualvalSection/item[ @qualStanding = $qualStandingNR and @valStanding = $valStandingNR ] " />
							<xsl:variable name="matchUseIS" select=" $showInState and $matchIS/inStateOverrideText != '' " />

							<h2><xsl:value-of select=" if ( $matchUseIS ) then $matchIS/@title else $matchNR/@title " /></h2>
							<p>
								<xsl:copy-of select=" if ( $matchUseIS ) then $matchIS/inStateOverrideText else $matchNR/defaultText " />
							</p>

							<p>
								The following graphic shows how the cost of obtaining a degree at <xsl:value-of select=" @name " /> compares to other similar quality colleges nationwide.
							</p>

							<xsl:variable name="thisUnitId" select=" @unitId " />
							<xsl:variable name="urlTemplate" select=" $bhUriLookup/page[ @id = replace( $bhPageId, '#bhPageId_', '' ) ]/@uri " />
							<table id="similarValueTable" data-bhtrackregion="similarValueTable" class="table table-condensed">
								<tr>
									<td style="text-align: center; vertical-align: top; color:green; font-size: 0.9em; font-weight: bold;" >Underpriced</td>
									<td class="absCent">Best</td>
									<td style="padding-left: 0px;">
										<ul>
											<xsl:for-each select=" compareTo/college[ @valueStandingPct &lt;= 0.20 ] ">
												<xsl:sort select=" @valueStanding " data-type="number" order="ascending" />
												<li class="{ if( @unitId = $thisUnitId ) then 'thisCollege' else '' }">
													<xsl:value-of select=" format-number(@cost,'$#,###') "/> -
													<a href="{ replace($urlTemplate, '~collegeSlug~', @slug) }"><xsl:value-of select=" @nameDistinct "/></a>
												</li>
											</xsl:for-each>
										</ul>
									</td>
								</tr>
								<tr>
									<td></td>
									<td class="absCent">Good</td>
									<td style="padding-left: 0px;">
										<ul>
											<xsl:for-each select=" compareTo/college[ @valueStandingPct &gt; 0.20 and @valueStandingPct &lt;= 0.40 ] ">
												<xsl:sort select=" @valueStanding " data-type="number" order="ascending" />
												<li class="{ if( @unitId = $thisUnitId ) then 'thisCollege' else '' }">
													<xsl:value-of select=" format-number(@cost,'$#,###') "/> -
													<a href="{ replace($urlTemplate, '~collegeSlug~', @slug) }"><xsl:value-of select=" @nameDistinct "/></a>
												</li>
											</xsl:for-each>
										</ul>
									</td>
								</tr>
								<tr>
									<td style="text-align: center; vertical-align: middle; font-size: 0.9em; font-weight: bold;" >Average</td>
									<td class="absCent">Fair</td>
									<td style="padding-left: 0px;">
										<ul>
											<xsl:for-each select=" compareTo/college[ @valueStandingPct &gt; 0.40 and @valueStandingPct &lt;= 0.60 ] ">
												<xsl:sort select=" @valueStanding " data-type="number" order="ascending" />
												<li class="{ if( @unitId = $thisUnitId ) then 'thisCollege' else '' }">
													<xsl:value-of select=" format-number(@cost,'$#,###') "/> -
													<a href="{ replace($urlTemplate, '~collegeSlug~', @slug) }"><xsl:value-of select=" @nameDistinct "/></a>
												</li>
											</xsl:for-each>
										</ul>
									</td>
								</tr>
								<tr>
									<td></td>
									<td class="absCent">Low</td>
									<td style="padding-left: 0px;">
										<ul>
											<xsl:for-each select=" compareTo/college[ @valueStandingPct &gt; 0.60 and @valueStandingPct &lt;= 0.80 ] ">
												<xsl:sort select=" @valueStanding " data-type="number" order="ascending" />
												<li class="{ if( @unitId = $thisUnitId ) then 'thisCollege' else '' }">
													<xsl:value-of select=" format-number(@cost,'$#,###') "/> -
													<a href="{ replace($urlTemplate, '~collegeSlug~', @slug) }"><xsl:value-of select=" @nameDistinct "/></a>
												</li>
											</xsl:for-each>
										</ul>
									</td>
								</tr>
								<tr>
									<td style="text-align: center; vertical-align: bottom; color:red; font-size: 0.9em; font-weight: bold;" >Overpriced</td>
									<td class="absCent">Poor</td>
									<td style="padding-left: 0px;">
										<ul>
											<xsl:for-each select=" compareTo/college[ @valueStandingPct &gt; 0.80 ] ">
												<xsl:sort select=" @valueStanding " data-type="number" order="ascending" />
												<li class="{ if( @unitId = $thisUnitId ) then 'thisCollege' else '' }">
													<xsl:value-of select=" format-number(@cost,'$#,###') "/> -
													<a href="{ replace($urlTemplate, '~collegeSlug~', @slug) }"><xsl:value-of select=" @nameDistinct "/></a>
												</li>
											</xsl:for-each>
										</ul>
									</td>
								</tr>
							</table>


						</xsl:when>

						<xsl:otherwise>
							<h2>Value for the Money Unknown</h2>
							<p>
								We were hoping to do a statewide or nationwide comparison of <xsl:value-of select="@name" />'s net price and quality but there was not enough information.
							</p>
						</xsl:otherwise>
					</xsl:choose>

				</article>

				<aside class="span4">
					<xsl:call-template name="editorComment" >
						<xsl:with-param name="unitId" select=" @unitId " />
						<xsl:with-param name="bhPageId" select=" $bhPageId " />
					</xsl:call-template>

					<xsl:if test=" $showInState ">
						<div class="rightgreybox" data-bhTrackRegion="rhrBubble">
							<div class="rightgreyboxheadline">What are Residency Discounts?</div>
							You can take a look at our <a href="{ $baseUri }/colleges/{ @slug }/paying-for-college/tuition-and-fees/{ $indexFile }">tuition and fees page</a> to find out more.
						</div>
						<div class="bubblebottom"></div>
					</xsl:if>

				</aside>

			</div>

            <!-- Ad Block -->
            <xsl:call-template name="ad_inline" />

			<xsl:if test=" costNonResidentOverallDegree/@value castable as xs:decimal ">
				<div class="row">
					<article class="span8">
						<!--
							Estimated Value of Degree:
							All value calculations are based on this, so must explain this one first before we note the value for each particular scenario.
							Must help make reader understand what this is better.
						-->
		<h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>And the Grand Total Comes To: <xsl:value-of select=" if ( costNonResidentOverallDegree/@value castable as xs:decimal ) then format-number( costNonResidentOverallDegree/@value, '$#,##0' ) else 'N/A' " /></item>
        <item>Bottom Line: You'll Spend <xsl:value-of select=" if ( costNonResidentOverallDegree/@value castable as xs:decimal ) then format-number( costNonResidentOverallDegree/@value, '$#,##0' ) else 'N/A' " /> for That Piece of Paper</item>
        <item>Drum Roll Please: The Cost for that Cap and Gown Will Be <xsl:value-of select=" if ( costNonResidentOverallDegree/@value castable as xs:decimal ) then format-number( costNonResidentOverallDegree/@value, '$#,##0' ) else 'N/A' " /></item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>


						<p>
							On average, a bachelor's degree at <xsl:value-of select="@name" /> will cost you about
							<xsl:value-of select=" if ( costNonResidentOverallDegree/@value castable as xs:decimal ) then format-number( costNonResidentOverallDegree/@value, '$#,##0' ) else 'N/A' " />.

							This is based on an average price (with and without aid) of
							<xsl:value-of select=" if ( costNonResidentOverall/@value castable as xs:decimal ) then format-number( costNonResidentOverall/@value, '$#,##0' ) else 'N/A' " />
							per year and an average of <xsl:value-of select=" if ( gradAvgTime/@value castable as xs:decimal ) then format-number( gradAvgTime/@value, '#0.0' ) else 'N/A' " />
							years to graduate.
						</p>

						<table class="table table-striped">
							<thead>
								<tr>
									<th>&nbsp;</th>
									<th style="text-align:right;">Amount</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Average Yearly Cost</td>
									<td style="text-align:right;">
										<xsl:value-of select=" if ( costNonResidentOverall/@value castable as xs:decimal ) then format-number( costNonResidentOverall/@value, '$#,##0' ) else 'N/A' " />
									</td>
								</tr>
								<tr>
									<td>Average Years to Graduate</td>
									<td style="text-align:right;">
										<xsl:value-of select=" if ( gradAvgTime/@value castable as xs:decimal ) then format-number( gradAvgTime/@value, '#0.0' ) else 'N/A' " />
									</td>
								</tr>
								<tr>
									<td>Estimated Average Total Cost of Degree</td>
									<td style="text-align:right;">
										<xsl:value-of select=" if ( costNonResidentOverallDegree/@value castable as xs:decimal ) then format-number( costNonResidentOverallDegree/@value, '$#,##0' ) else 'N/A' " />
									</td>
								</tr>
							</tbody>
						</table>

					</article>

					<!-- <aside class="span4">
						<div class="rightgreybox" data-bhTrackRegion="rhrBubble">
							<div class="rightgreyboxheadline">Estimated Value of Degree?</div>
							Interested in learning more, please <a href="{ $baseUri }/colleges/{ @slug }/paying-for-college/net-price/{ $indexFile }">click here</a>
							for more information about how we calculate the estimated value of each schools degree.
						</div>
						<div class="bubblebottom"></div>
					</aside> -->

				</div>
			</xsl:if>

			<div class="row">
				<article class="span8">
					<a name="ValueDependsOnNetPrice"></a>
					     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Is it Worth it For You? How Would We Know, We Don't Know What You Have to Spend.</item>
        <item>Does this School Make Financial Sense to You? Some Questions You're Just Going to Have to Answer for Yourself.</item>
        <item>Could be Worth It, Could be a Terrible Idea. Really Just Depends on What's Going on With You.</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
					<p>
						The overall price of a college may vary greatly depending on your individual circumstances, thus affecting its value.
						Most students will not pay the full sticker price and few students fit perfectly into 'averages'. However, to get a sense of how value for your educational
						dollar might vary based on individual circumstances, look at the table below to determine your likely cost of a bachelor's degree at <xsl:value-of select="@name" />.
						Now compare this value metric for <a href="{ $baseUri }/colleges/" target="_blank" title="Search colleges">each college</a> you are interested in.
					</p>

					<table class="table table-striped">
						<thead>
							<tr>
								<th>Nationwide Value by Aid Group</th>
								<th style="text-align:right;">Avg Total Degree Cost</th>
								<th style="text-align:right;">Affordability Rank</th>
								<th style="text-align:center;">Value Grade</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td><strong>Students Receiving no Aid</strong></td>
								<td style="text-align:right;">
									<xsl:value-of select=" if ( costNonResidentNoAidDegree/@value castable as xs:decimal ) then format-number( costNonResidentNoAidDegree/@value, '$#,##0' ) else 'N/A' " />
								</td>
								<td style="text-align:right;">
									<xsl:value-of select=" if ( costNonResidentNoAidDegree/@standing castable as xs:decimal ) then format-number( costNonResidentNoAidDegree/@standing, '#,##0' ) else 'N/A' " />
								</td>
								<td style="text-align:center;">
									<xsl:variable name="getGrade" select=" if ( valueScoreNonResidentNoAidDegree_QRFCFF/@standingPct castable as xs:decimal ) then ceiling( 15.0 * valueScoreNonResidentNoAidDegree_QRFCFF/@standingPct ) else 16 " />
									<xsl:value-of select=" ('A+','A ','A-','B+','B ','B-','C+','C ','C-','D+','D ','D-','F+','F ','F-','N/A')[ $getGrade ] " />
								</td>
							</tr>
							<tr>
								<td><strong>All Students (With and Without Aid)</strong></td>
								<td style="text-align:right;">
									<xsl:value-of select=" if ( costNonResidentOverallDegree/@value castable as xs:decimal ) then format-number( costNonResidentOverallDegree/@value, '$#,##0' ) else 'N/A' " />
								</td>
								<td style="text-align:right;">
									<xsl:value-of select=" if ( costNonResidentOverallDegree/@standing castable as xs:decimal ) then format-number( costNonResidentOverallDegree/@standing, '#,##0' ) else 'N/A' " />
								</td>
								<td style="text-align:center;">
									<xsl:variable name="getGrade" select=" if ( valueScoreNonResidentOverallDegree_QRFCFF/@standingPct castable as xs:decimal ) then ceiling( 15.0 * valueScoreNonResidentOverallDegree_QRFCFF/@standingPct ) else 16 " />
									<xsl:value-of select=" ('A+','A ','A-','B+','B ','B-','C+','C ','C-','D+','D ','D-','F+','F ','F-','N/A')[ $getGrade ] " />
								</td>
							</tr>
							<tr>
								<td><strong>Only Students Receiving Aid</strong></td>
								<td style="text-align:right;">
									<xsl:value-of select=" if ( costNonResidentWithAidDegree/@value castable as xs:decimal ) then format-number( costNonResidentWithAidDegree/@value, '$#,##0' ) else 'N/A' " />
								</td>
								<td style="text-align:right;">
									<xsl:value-of select=" if ( costNonResidentWithAidDegree/@standing castable as xs:decimal ) then format-number( costNonResidentWithAidDegree/@standing, '#,##0' ) else 'N/A' " />
								</td>
								<td style="text-align:center;">
									<xsl:variable name="getGrade" select=" if ( valueScoreNonResidentWithAidDegree_QRFCFF/@standingPct castable as xs:decimal ) then ceiling( 15.0 * valueScoreNonResidentWithAidDegree_QRFCFF/@standingPct ) else 16 " />
									<xsl:value-of select=" ('A+','A ','A-','B+','B ','B-','C+','C ','C-','D+','D ','D-','F+','F ','F-','N/A')[ $getGrade ] " />
								</td>
							</tr>

						</tbody>
					</table>

					<table class="table table-striped">
						<thead>
							<tr>
								<th>In-State Value by Aid Group</th>
								<th style="text-align:right;">Avg Total Degree Cost</th>
								<th style="text-align:right;">Affordability Rank</th>
								<th style="text-align:center;">Value Grade</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td><strong>Students Receiving no Aid</strong></td>
								<td style="text-align:right;">
									<xsl:value-of select=" if ( costInStateNoAidDegree/@value castable as xs:decimal ) then format-number( costInStateNoAidDegree/@value, '$#,##0' ) else 'N/A' " />
								</td>
								<td style="text-align:right;">
									<xsl:value-of select=" if ( costInStateNoAidDegree/@standingIS castable as xs:decimal ) then format-number( costInStateNoAidDegree/@standingIS, '#,##0' ) else 'N/A' " />
								</td>
								<td style="text-align:center;">
									<xsl:variable name="getGrade" select=" if ( valueScoreInStateNoAidDegree_QRFCFF/@standingISPct castable as xs:decimal ) then ceiling( 15.0 * valueScoreInStateNoAidDegree_QRFCFF/@standingISPct ) else 16 " />
									<xsl:value-of select=" ('A+','A ','A-','B+','B ','B-','C+','C ','C-','D+','D ','D-','F+','F ','F-','N/A')[ $getGrade ] " />
								</td>
							</tr>
							<tr>
								<td><strong>All Students (With and Without Aid)</strong></td>
								<td style="text-align:right;">
									<xsl:value-of select=" if ( costInStateOverallDegree/@value castable as xs:decimal ) then format-number( costInStateOverallDegree/@value, '$#,##0' ) else 'N/A' " />
								</td>
								<td style="text-align:right;">
									<xsl:value-of select=" if ( costInStateOverallDegree/@standingIS castable as xs:decimal ) then format-number( costInStateOverallDegree/@standingIS, '#,##0' ) else 'N/A' " />
								</td>
								<td style="text-align:center;">
									<xsl:variable name="getGrade" select=" if ( valueScoreInStateOverallDegree_QRFCFF/@standingISPct castable as xs:decimal ) then ceiling( 15.0 * valueScoreInStateOverallDegree_QRFCFF/@standingISPct ) else 16 " />
									<xsl:value-of select=" ('A+','A ','A-','B+','B ','B-','C+','C ','C-','D+','D ','D-','F+','F ','F-','N/A')[ $getGrade ] " />
								</td>
							</tr>
							<tr>
								<td><strong>Only Students Receiving Aid</strong></td>
								<td style="text-align:right;">
									<xsl:value-of select=" if ( costInStateWithAidDegree/@value castable as xs:decimal ) then format-number( costInStateWithAidDegree/@value, '$#,##0' ) else 'N/A' " />
								</td>
								<td style="text-align:right;">
									<xsl:value-of select=" if ( costInStateWithAidDegree/@standingIS castable as xs:decimal ) then format-number( costInStateWithAidDegree/@standingIS, '#,##0' ) else 'N/A' " />
								</td>
								<td style="text-align:center;">
									<xsl:variable name="getGrade" select=" if ( valueScoreInStateWithAidDegree_QRFCFF/@standingISPct castable as xs:decimal ) then ceiling( 15.0 * valueScoreInStateWithAidDegree_QRFCFF/@standingISPct ) else 16 " />
									<xsl:value-of select=" ('A+','A ','A-','B+','B ','B-','C+','C ','C-','D+','D ','D-','F+','F ','F-','N/A')[ $getGrade ] " />
								</td>
							</tr>

						</tbody>
					</table>

					<p>
						Note: the Value Grade for in-state students is calculated by looking only at
						<a href="{ $baseUri }/rankings/best-colleges-for-money/state/{ state/@slug }">
							other schools in the state of <xsl:value-of select=" state/@name " />
						</a>.
					</p>

					<h2>Additional Questions to Ask</h2>
					<ul>
						<li>Have you considered your salary prospects after graduation? If you plan on majoring in a more profitable field, it is not as big of a risk to go to a pricier school. However, if your salary prospects may not be as good, consider choosing a more affordable option.</li>
						<li>How does the location of this school affect cost? You can save money by going to a school in-state, living at home or living off-campus with a roommate.</li>
						<li>Just because a school is a good value doesn't mean it's valuable to you. Does this school offer programs you are interested in? Do you have any special interests, needs or requirements that you are looking for in a college?</li>
					</ul>

				</article>

				<aside class="span4">
					<div class="rightgreybox" data-bhTrackRegion="rhrBubble">
						<div class="rightgreyboxheadline">Many Factors Affect Net Price</div>
						Please see the <a href="{ $baseUri }/colleges/{ @slug }/paying-for-college/net-price/{ $indexFile }">net price page</a>
						for additional factors, such as your family's income, that can influence the price you will pay for college.
					</div>
					<div class="bubblebottom"></div>

                    <!-- Ad Block -->
                    <xsl:call-template name="ad_300x250_BTF" />
				</aside>

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
		<script type="text/javascript">
			$("h1" ).on("click", bhOnLinkClick());
		</script>
	</xsl:template>

</xsl:stylesheet>
