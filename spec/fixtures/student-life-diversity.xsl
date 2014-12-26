<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [<!ENTITY nbsp "&#160;">]>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 	xmlns:xs="http://www.w3.org/2001/XMLSchema" >

	<xsl:import href="../../../../_shared/bhArticleMaster.xsl" />

	<xsl:output method="html" indent="no" encoding="utf-8" />

	<xsl:template match="/college">
		<xsl:call-template name="bhArticleMaster">
			<xsl:with-param name="bhPageId" select="'#bhPageId_college-student-life-diversity'" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="headHeaderContent">
		<xsl:param name="bhPageId" />

		<xsl:call-template name="articleHead">
			<xsl:with-param name="bhPageId" select="$bhPageId" />
			<xsl:with-param name="htmlTitle" select ="concat('How Diverse is ', @nameDistinct, '? Explore Ethnic, Age, Male to Female and Geographic Diversity')" />
			<xsl:with-param name="metaDesc" select ="concat('How diverse is the undergraduate student body at ', @nameDistinct, '? Find info and statistics on ethnic diversity, male to female ratio, geographic diversity and more at CollegeFactual.com.')" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="bodyContent">
		<xsl:param name="bhPageId" />

		<div class="container-studentlife" style="margin-bottom: 24px;">

			<!-- The Breadcrumb ==================================================-->
            <xsl:call-template name="breadcrumb">
                <xsl:with-param name="content">
                    <map>
                        <entry><navName><xsl:value-of select="'All Colleges'"/></navName><navUrl><xsl:value-of select="$bhUriLookup/page[ @id = 'colleges-home' ]/@uri"/></navUrl></entry>
                        <entry><navName><xsl:value-of select="@name" /></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-home' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
                        <entry><navName><xsl:value-of select="$bhUriLookup/page[ @id = 'college-student-life-home' ]/@navName"/></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-student-life-home' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
                        <entry><navName><xsl:value-of select="$bhUriLookup/page[ @id = 'college-student-life-diversity' ]/@navName"/></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-student-life-diversity' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
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

			<div class="row">
				<article class="span8">
					 <!-- ETHNIC DIVERSITY -->
					<a name="EthnicDiversity" />
					<xsl:if test=" enrollment/ethnicity/eth[1]/@count &gt;= 0 ">
						<!--<h2>Ethnic Diversity</h2>-->
						<xsl:choose>
							<xsl:when test=" @stu_eth_div_grade = ( 'A+', 'A', 'A-' ) ">
	<h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Excellent Ethnic Diversity Means You'll Get to Try Out Some Far-Out Recipes (And Meet Some Cool People)</item>
        <item>This College Will Be a Great Place to Learn About Other Cultures: High Ethnic Diversity.</item>
        <item>Easy to Study Abroad Here – Even if you Never Leave Campus</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
	 </xsl:when>

							<xsl:when test=" @stu_eth_div_grade = ( 'B+', 'B', 'B-' ) ">
							     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>All Ethnicities are Encouraged to Apply. This School is Considered Above Average in Diversity.</item>
        <item>If You Enjoy Diverse Ethnicities and New Cultures, This is the College For You.</item>
        <item>If You Need a Foreign-Language Tutor, You're in Luck: Campus is Above Average in Ethnic Diversity.</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
	 </xsl:when>

							<xsl:when test=" @stu_eth_div_grade = ( 'C+', 'C', 'C-' ) ">
							     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Diversity is Not This School's Strong Point, But Hey – It Could Be Much Worse.</item>
        <item>Pot Luck Dinners Around Campus Will be Pretty Predictable.</item>
        <item>It's Not Like This College Is Located In An Airport: Diversity Is About Average</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
	 </xsl:when>

							<xsl:when test=" @stu_eth_div_grade = ( 'D+', 'D', 'D-' ) ">
							     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Below Average When It Comes to Ethnic Diversity</item>
        <item>One Ethnicity Will Fit Right in at This School. The Rest of Us? Probably Not.</item>
        <item>If This School Got a Grade on Ethnic Diversity, They Would be One Letter-Grade Away from Failing.</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
	 </xsl:when>

							<xsl:when test=" @stu_eth_div_grade = ( 'F+', 'F', 'F-' ) ">
							     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Find out the Number One Ethnicity at This School, Because There Isn't a Number Two.</item>
        <item>No, You're Not Imagining Things — Everyone Here Looks Related.</item>
        <item>If Ethnic Diversity Is Important To You, You May Need to Look Elsewhere</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
	 </xsl:when>
							<xsl:otherwise>
							<h2>Ethnic Diversity</h2></xsl:otherwise>
						</xsl:choose>

						Ethnically-diverse college campuses offer students the opportunity to study and collaborate with undergraduates from racial
						and ethnic groups that are different from their own.

						<xsl:if test=" @stu_eth_rank castable as xs:decimal ">
							<xsl:value-of select="@name" /> is ranked <a href="{ $baseUri }/rankings/diversity/ethnic/{ $indexFile }#{ @stu_eth_rank }" >#<xsl:value-of select="@stu_eth_rank"/></a>
							in ethnic diversity nationwide, with a student body composition
							<xsl:choose>
								<xsl:when test=" @stu_eth_div_grade = ( 'A+', 'A', 'A-' ) "> that is far above the national average.</xsl:when>
								<xsl:when test=" @stu_eth_div_grade = ( 'B+', 'B', 'B-' ) "> that is above the national average.</xsl:when>
								<xsl:when test=" @stu_eth_div_grade = ( 'C+', 'C', 'C-' ) "> that is similar to the national average. </xsl:when>
								<xsl:when test=" @stu_eth_div_grade = ( 'D+', 'D', 'D-' ) "> that is below the national average.</xsl:when>
								<xsl:when test=" @stu_eth_div_grade = ( 'F+', 'F', 'F-' ) "> that is far below the national average.</xsl:when>
								<xsl:otherwise> that we were unable to properly determine.</xsl:otherwise>
							</xsl:choose>
						</xsl:if>

						<xsl:if test=" @is_historically_black = 1 ">
							However, this college is a HBCU (Historically Black College or University), with a principal mission of serving and educating the black community.
						</xsl:if>
						<xsl:if test=" @is_tribal = 1 ">
						   However, this college is designated as a TCU (Tribal College or University), chartered by a Tribal government, with a principal mission of educating Native Americans and preserving Tribal culture.
						</xsl:if>

						When available, the chart below also explores ethnic diversity among the faculty at <xsl:value-of select="@alias" />.

						<iframe src="chart-ethnic-diversity.html" class="chart"></iframe>
					</xsl:if>

					<xsl:if test="not( enrollment/ethnicity/eth[1]/@count &gt;= 0 )">
						<h2>Ethnic Diversity Unknown</h2>
						Ethnically-diverse college campuses offer students the opportunity to study and collaborate with undergraduates from racial and ethnic groups that are different from their own. We've calculated the ethnic diversity for most of the colleges in our database. Unfortunately, <xsl:value-of select="@name" /> did not provide sufficient data and we are unable to present this information.
					</xsl:if>
				</article>

				<aside class="span4">
					<xsl:call-template name="editorComment" >
						<xsl:with-param name="unitId" select=" @unitId " />
						<xsl:with-param name="bhPageId" select=" $bhPageId " />
					</xsl:call-template>
					<div class="rightgreybox" data-bhTrackRegion="rhrBubble">
						<div class="rightgreyboxheadline">Diversity Decisions</div>
						How important is diversity to you? Let these numbers help guide you to a college where you will feel comfortable learning and growing.
					</div>
					<div class="bubblebottom"></div>
				</aside>
			</div>

            <!-- Ad Block -->
            <xsl:call-template name="ad_inline" />

			<div class="row">
				<article class="span8">
					<!-- GENDER -->
					<a name="GenderDiversity" />
					<xsl:if test=" enrollment/undergrad/@men castable as xs:decimal or enrollment/undergrad/@women castable as xs:decimal ">
						<!--<h2>Gender</h2>-->
						<xsl:choose>
							<xsl:when test=" @stu_gen_div_grade = ( 'A+', 'A', 'A-' ) ">
								<h2>
									<xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
										<xsl:with-param name="items">
											<item>Here's one School That Takes Gender Equality Pretty Darn Seriously</item>
											<item>Good Balance for Those who Enjoy the Presence of the Opposite Sex</item>
											<item>Plenty of Opportunity to Both Kick it with the Boys or Hang with your Ladies</item>
										</xsl:with-param>
									</xsl:call-template>
								</h2>
							</xsl:when>
							<xsl:when test=" @stu_gen_div_grade = ( 'B+', 'B', 'B-' ) ">
								<h2>
									<xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
										<xsl:with-param name="items">
											<item>Male to Female Ratio is Better Than Average</item>
											<item>Not Bad if you Like the Ladies. Or Boys. Or Both.</item>
											<item>Plenty of Both Guys and Gals On Campus</item>
										</xsl:with-param>
									</xsl:call-template>
								</h2>
							</xsl:when>
							<xsl:when test=" @stu_gen_div_grade = ( 'C+', 'C', 'C-' ) ">
								<h2>
									<xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
										<xsl:with-param name="items">
											<item>If the Boy-to-Girl Ratio is Important to You, You May be a Bit Disappointed Here.</item>
											<item>If They Don't Fix the Men / Women Ratio Here Soon, One Side is Going to be Very Unhappy.</item>
											<item>Dreaming of a College Relationship? You're in Luck. Maybe. It Could Depend on Which Gender You're After.</item>
										</xsl:with-param>
									</xsl:call-template>
								</h2>
							</xsl:when>
							<xsl:when test=" @stu_gen_div_grade = ( 'D+', 'D', 'D-' ) ">
								<h2>
									<xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
										<xsl:with-param name="items">
											<item>If You Have a Preference for a Certain Gender, Make Sure That's the One that Dominates This Campus.</item>
											<item>This is Either Good News or Bad News, Depending on Your Preference: Male-to-Female Ratio Below Average.</item>
											<item>Let's Just Say Valentine's Day Around Here Isn't Exactly Filled with a Bunch of Love Birds.</item>
										</xsl:with-param>
									</xsl:call-template>
								</h2>
							</xsl:when>
							<xsl:when test=" @stu_gen_div_grade = ( 'F+', 'F', 'F-' ) ">
								<h2>
									<xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
										<xsl:with-param name="items">
											<item>Gender Diversity? Ha, This May as Well be a Boarding School.</item>
											<item>Depending On Your Gender Preference, You May be Extremely Delighted or Horribly Disappointed</item>
											<item>How's the Campus Dating Scene? Let's Just Say It's Not Exactly the Love Boat Around Here.</item>
										</xsl:with-param>
									</xsl:call-template>
								</h2>
							</xsl:when>
							<xsl:otherwise>
								<h2>Male to Female Diversity</h2>
							</xsl:otherwise>
						</xsl:choose>

						Will you feel more comfortable on a campus with a balanced mix of males to females?

						<xsl:choose>
							<xsl:when test=" @stu_gen_div_grade = ( 'A+', 'A', 'A-' ) "> At <xsl:value-of select=" @name" />, the male to female student ratio is far above the national average of about 40:60, with a student body that is </xsl:when>
							<xsl:when test=" @stu_gen_div_grade = ( 'B+', 'B', 'B-' ) "> At <xsl:value-of select=" @name" />, the male to female student ratio is above the national average of about 40:60, with a student body that is</xsl:when>
							<xsl:when test=" @stu_gen_div_grade = ( 'C+', 'C', 'C-' ) "> At <xsl:value-of select=" @name" />, the male to female student ratio is comparable to the national average of about 40:60, with a student body that is</xsl:when>
							<xsl:when test=" @stu_gen_div_grade = ( 'D+', 'D', 'D-' ) "> At <xsl:value-of select=" @name" />, the male to female student ratio is below the national average of about 40:60, with a student body that is</xsl:when>
							<xsl:when test=" @stu_gen_div_grade = ( 'F+', 'F', 'F-' ) "> At <xsl:value-of select=" @name" />, the male to female student ratio is far below the national average of about 40:60, with a student body that is</xsl:when>
							<xsl:otherwise> The national average male to female student ratio is about 40:60. At <xsl:value-of select=" @name" />, the student body is </xsl:otherwise>
						</xsl:choose>

						<xsl:choose>
							<xsl:when test=" enrollment/undergrad/@men div (enrollment/undergrad/@men + enrollment/undergrad/@women) &gt;= 0.6 ">
								predominantly male.
							</xsl:when>
							<xsl:when test=" enrollment/undergrad/@women div (enrollment/undergrad/@men + enrollment/undergrad/@women) &gt;= 0.6 ">
								predominantly female.
							</xsl:when>
							<xsl:otherwise>
								equally balanced.
							</xsl:otherwise>
						</xsl:choose>

						<xsl:if test=" @stu_gen_rank castable as xs:decimal ">
							It is ranked at <a href="{ $baseUri }/rankings/diversity/gender/{ $indexFile }#{ @stu_gen_rank }" >#<xsl:value-of select="@stu_gen_rank"/></a>
							in male to female diversity nationwide.
						</xsl:if>

						The undergraduate population is comprised of <xsl:value-of select="format-number(enrollment/undergrad/@men, '#,###')"/> males and
						<xsl:value-of select="format-number(enrollment/undergrad/@women, '#,###')"/> females.
						Where available, the chart below also shows the male to female distribution among <xsl:value-of select="@alias" />'s faculty.

						<iframe src="chart-gender-diversity.html" class="chart"></iframe>
					</xsl:if>

					<xsl:if test="not( enrollment/undergrad/@men castable as xs:decimal or enrollment/undergrad/@women castable as xs:decimal )">
						<h2>Male to Female Diversity Unknown</h2>
						Did you know that the average male to female ratio on college campuses is skewed towards females?
						There are currently about six females for every four males attending college.
						We've calculated this percentage for most of the colleges in our database, but unfortunately, we do not have enough data on
						<xsl:value-of select=" @name" />'s male to female diversity to provide you with this information.
					</xsl:if>
				</article>

				<aside class="span4">
                    <!-- Ad Block -->
                    <xsl:call-template name="ad_300x250_BTF" />
				</aside>
			</div>

			<div class="row">
				<article class="span8">
					<!-- GEOGRAPHIC DIVERSITY -->
					<a name="GeographicDiversity" />
					<!--<h2>Geographic Diversity</h2>-->
					<xsl:if test="not( @stu_geo_div_grade = '' )">
						<xsl:choose>
							<xsl:when test=" @stu_geo_div_grade = ( 'A+', 'A', 'A-' ) ">
								<h2>
									<xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
										<xsl:with-param name="items">
											<item>Meet Students From All 50 States: Excellent Geographic Diversity</item>
											<item>Perfect Place to See What They Call 'Coke' in Other States</item>
											<item>From Surfer Dudes to Southern Belles, the Campus is Filled with all Types</item>
										</xsl:with-param>
									</xsl:call-template>
								</h2>
							</xsl:when>
							<xsl:when test=" @stu_geo_div_grade = ( 'B+', 'B', 'B-' ) ">
								<h2>
									<xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
										<xsl:with-param name="items">
											<item>Higher Than Average Chance your Roommate Will be From a State You've Never Been To.</item>
											<item>Dorm Rooms Covered in Exotic Flags from States All Over the Country</item>
											<item>Perfect Campus for Finding Someone to Argue About your Pro Sports Team With</item>
										</xsl:with-param>
									</xsl:call-template>
								</h2>
							</xsl:when>
							<xsl:when test=" @stu_geo_div_grade = ( 'C+', 'C', 'C-' ) ">
								<h2>
									<xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
										<xsl:with-param name="items">
											<item>There's a Few Out-of-State Kids Here to Shake Things Up</item>
											<item>The Rest of the Country Hasn't Quite Caught Onto this School Yet, but They're Getting There.</item>
											<item>Decent Chance your Roomie will Have a Different State Flag Up Than Yours.</item>
										</xsl:with-param>
									</xsl:call-template>
								</h2>
							</xsl:when>
							<xsl:when test=" @stu_geo_div_grade = ( 'D+', 'D', 'D-' ) ">
								<h2>
									<xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
										<xsl:with-param name="items">
											<item>Pay Close Attention to the State This School is In. Because It's Filled with Students From There.</item>
											<item>Perfect College For Students Who Love Their State (And Everyone From There)</item>
											<item>If You Listen Closely, Everyone Here has a Similar Accent (and Home Address).</item>
										</xsl:with-param>
									</xsl:call-template>
								</h2>
							</xsl:when>
							<xsl:when test=" @stu_geo_div_grade = ( 'F+', 'F', 'F-' ) ">
								<h2>
									<xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
										<xsl:with-param name="items">
											<item>Campus Represents the State Well. Maybe Too Well.</item>
											<item>Perfect Place to Meet People From all Walks of Life (But Who Only Walk in the Same State).</item>
											<item>It Seems Like No One Outside of This State Has Even Heard of This College</item>
										</xsl:with-param>
									</xsl:call-template>
								</h2>
							</xsl:when>
							<xsl:otherwise>
								<h2>Geographic Diversity</h2>
							</xsl:otherwise>
						</xsl:choose>

						Would you prefer a college that attracts students from all across the United States, or would you prefer a regional college
						that primarily pulls students from within your home state?

						We've derived the geographic diversity of each school by looking at where matriculated undergraduates lived before they attended college.

						<xsl:choose>
							<xsl:when test="@num_of_states_represented = 1"></xsl:when>
							<xsl:when test="(100 - round(@percent_out_of_state)) &gt; 90">Over 90% of the students attending <xsl:value-of select="@name" /> come from within the state, </xsl:when>
							<xsl:when test="(100 - round(@percent_out_of_state)) &lt; 10">Less than 10% of the students attending <xsl:value-of select="@name" /> come from within the state, </xsl:when>
							<xsl:otherwise><xsl:value-of select="100 - round(@percent_out_of_state)"/>% of the students attending <xsl:value-of select="@name" /> come from within the state, </xsl:otherwise>
						</xsl:choose>

						<xsl:choose>
							<xsl:when test="@num_of_states_represented = 1">All students attending <xsl:value-of select="@name" /> come from within the state.</xsl:when>
							<xsl:when test="@num_of_states_represented = 51">Students attending <xsl:value-of select="@name" /> hail from all 50 states and Washington D.C.,</xsl:when>
							<xsl:otherwise>with the entire undergraduate body split among <xsl:value-of select="@num_of_states_represented" /> states (may include Washington D.C.), as shown in the chart below.</xsl:otherwise>
						</xsl:choose>

						<xsl:choose>
							<xsl:when test=" @stu_geo_div_grade = ( 'A+', 'A', 'A-' ) "> This puts <xsl:value-of select="@alias"/>'s level of geographic diversity far above the national average, and gives it a nationwide geographic diversity ranking of <a href="{ $baseUri }/rankings/diversity/location/{ $indexFile }#{ @stu_geo_rank }" >#<xsl:value-of select="@stu_geo_rank"/></a>.</xsl:when>
							<xsl:when test=" @stu_geo_div_grade = ( 'B+', 'B', 'B-' ) "> This places <xsl:value-of select="@alias"/>'s level of geographic diversity above the national average, and gives it a nationwide geographic diversity ranking of <a href="{ $baseUri }/rankings/diversity/location/{ $indexFile }#{ @stu_geo_rank }" >#<xsl:value-of select="@stu_geo_rank"/></a>.</xsl:when>
							<xsl:when test=" @stu_geo_div_grade = ( 'C+', 'C', 'C-' ) "> This puts <xsl:value-of select="@alias"/>'s level of geographic diversity on par with the national average, and gives it a nationwide geographic diversity ranking of <a href="{ $baseUri }/rankings/diversity/location/{ $indexFile }#{ @stu_geo_rank }" >#<xsl:value-of select="@stu_geo_rank"/></a>.</xsl:when>
							<xsl:when test=" @stu_geo_div_grade = ( 'D+', 'D', 'D-' ) "> This places <xsl:value-of select="@alias"/>'s level of geographic diversity below the national average, and gives it a nationwide geographic diversity ranking of <a href="{ $baseUri }/rankings/diversity/location/{ $indexFile }#{ @stu_geo_rank }" >#<xsl:value-of select="@stu_geo_rank"/></a>.</xsl:when>
							<xsl:when test=" @stu_geo_div_grade = ( 'F+', 'F', 'F-' ) "> This places <xsl:value-of select="@alias"/>'s level of geographic diversity far below the national average, and gives it a nationwide geographic diversity ranking of <a href="{ $baseUri }/rankings/diversity/location/{ $indexFile }#{ @stu_geo_rank }" >#<xsl:value-of select="@stu_geo_rank"/></a>.</xsl:when>
						</xsl:choose>

						<iframe src="chart-geographic-diversity.html" class="chart"></iframe>
					</xsl:if>

					<xsl:if test="@stu_geo_div_grade = ''">
						<h2>Geographic Diversity Unknown</h2>
						Would you prefer to attend a college with students from all across the United States? Or, would you prefer a regional college
						that primarily pulls students from within your home state?

						For <a href="{ $baseUri }/rankings/diversity/location/{ $indexFile }">most of the colleges</a> within our database, we were
						able to derive the geographic diversity by looking at the states matriculated undergraduate students lived in prior to
						attending college.

						But unfortunately, we do not have available data to calculate <xsl:value-of select=" @name" />'s geographic diversity score.
					</xsl:if>

				</article>

				<aside class="span4">
				</aside>
			</div>

			<div class="row">
				<article class="span8">
					<!-- AGE DIVERSITY -->
					<a name="AgeDiversity" />
					<xsl:if test="not( @stu_age_div_grade = '' )">
                        <h2>
                        <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
                            <xsl:with-param name="items">
                                <item>Is Everyone Here the Same Age as You?</item>
                                <item>How Important is it For You to Associate With Young Bucks or Wise Grand-Pops?</item>
                            </xsl:with-param>
                        </xsl:call-template>
                        </h2>

						Are you looking for a college where the student body represents a blend of different ages and generations, or would you prefer
						a college where most students are about your own age?

						Traditionally, undergraduate students range in age from 18 to 22.
						At <xsl:value-of select="@name"/>, <xsl:value-of select="round(@stu_percent_normal_age)"/>% of students are in this age bracket,
						compared to the national average of 60%.

						<xsl:if test=" round(@stu_percent_normal_age) &lt; 41">
							In addition, this school appears to attract a majority of older students.
						</xsl:if>

						The bar chart below shows the age distribution of the undergraduate student body at <xsl:value-of select="@alias"/>.

						<iframe src="chart-age-diversity.html" class="chart"></iframe>
					</xsl:if>

					<xsl:if test="@stu_age_div_grade = '' ">
						<h2>Age Diversity Unknown</h2>
						Are you looking for a college where the student body represents a blend of different ages and generations, or would you prefer
						a college where most students are about your own age?

						Traditionally, undergraduate students range in age from 18 to 22.

						For most of the colleges within our database, we were able to determine the age distribution of the undergraduate student body.

						Unfortunately, we were not able to do so for <xsl:value-of select="@name"/>, as the information is not available.
					</xsl:if>
				</article>

				<aside class="span4">
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
		<script  type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
		<script type="text/javascript">
			$("h1" ).on("click", bhOnLinkClick());
		</script>
	</xsl:template>

</xsl:stylesheet>
