<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [<!ENTITY nbsp "&#160;">]>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 	xmlns:xs="http://www.w3.org/2001/XMLSchema" >

	<xsl:import href="../../../../_shared/bhArticleMaster.xsl" />

	<xsl:output method="html" indent="no" encoding="utf-8" />

	<xsl:template match="/college">
		<xsl:call-template name="bhArticleMaster">
			<xsl:with-param name="bhPageId" select="'#bhPageId_college-academic-life-graduation-and-retention'" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="headHeaderContent">
		<xsl:param name="bhPageId" />

		<xsl:call-template name="articleHead">
			<xsl:with-param name="bhPageId" select="$bhPageId" />
			<xsl:with-param name="htmlTitle" select ="concat(@nameDistinct, ' Freshman Retention &amp; On-Time Graduation Rates')" />
			<xsl:with-param name="metaDesc" select ="concat('The graduation and retention rates at ', @nameDistinct, ' can help you understand the average students chances of remaining at this college past freshman year, and of graduating within four, five or six years. This is especially important when looking at how much attending ', @alias, ' will cost as transferring colleges, and extending the number of years it takes to graduate, can both increase the total amount you will pay for your degree.')" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="bodyContent">
		<xsl:param name="bhPageId" />

		<div class="container-outcomes">

			<!-- The Breadcrub ==================================================-->
			<xsl:call-template name="breadcrumb">
				<xsl:with-param name="content">
					<map>
						<entry><navName><xsl:value-of select="'All Colleges'"/></navName><navUrl><xsl:value-of select="$bhUriLookup/page[ @id = 'colleges-home' ]/@uri"/></navUrl></entry>
						<entry><navName><xsl:value-of select="@name" /></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-home' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
						<entry><navName><xsl:value-of select="$bhUriLookup/page[ @id = 'college-academic-life-home' ]/@navName"/></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-academic-life-home' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
						<entry><navName><xsl:value-of select="$bhUriLookup/page[ @id = 'college-academic-life-graduation-and-retention' ]/@navName"/></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-academic-life-graduation-and-retention' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
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
                    <h2>
                        <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
                            <xsl:with-param name="items">
                                <item>Graduation and Retention Rates: Find Out if Anyone Sticks Around</item>
                                <item>If Graduating is Important to You, You May Want to Take a Peek at This</item>
                                <item>How Many Students Make it Through this Crazy Machine of Learning?</item>
                            </xsl:with-param>
                        </xsl:call-template>
                    </h2>

					<xsl:choose>
						<xsl:when test=" grad150Count/@value div grad150Pct castable as xs:decimal ">
							<p>
								At <xsl:value-of select=" @name " />, <xsl:value-of select="format-number( round( grad150Count/@value div grad150Pct ) , '##,###' ) "/>
								undergraduates were scheduled to complete their degree in <xsl:value-of select=" @y0 " />.
								Did they? Let's find out...
							</p>
						</xsl:when>
						<xsl:otherwise>
							<p>
								Of the undergraduates at <xsl:value-of select=" @name " />, that were scheduled to complete their degree in <xsl:value-of select=" @y0 " />.
								Let's find out how many are on-time...
							</p>
						</xsl:otherwise>
					</xsl:choose>

					<!--Retention Rate-->
					<a name="FreshmenRetention" />
					<xsl:variable name="retentionGrade" select=" retentionPct/@nationwideGrade " />
					<xsl:choose>
						<xsl:when test=" $retentionGrade = ('A', 'B', 'C', 'D', 'F' ) ">
							<xsl:choose>
								<xsl:when test=" $retentionGrade = 'F' ">

	 <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Not Many Students Here Return After Freshman Year</item>
        <item>This College Has a Low Freshman Retention Rate</item>
        <item>There's a Good Chance You Won't See Many of Your New Friends Next Year: Low Freshman Retention Rate</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>

									<p>
										You have to make it past freshman year, in order to make it to graduation. With only
										<xsl:value-of select=" format-number( retentionPct, '##0.0%' ) " /> of students staying
										on to become sophomores, <xsl:value-of select=" @name " /> has among the worst freshman retention
										rates in the country.
									</p>
								</xsl:when>
								<xsl:when test=" $retentionGrade = 'D' ">
	<h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Below Average Freshman Retention Rate</item>
        <item>Want to Stand Out as a Freshman? Become a Sophomore.</item>
        <item>You Might be Able to Graduate, But First You Have to Come Back After Freshman Year</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
									<p>
										To make it to graduation, you have to first make it past freshman year. With only
										<xsl:value-of select=" format-number( retentionPct, '##0.0%' ) " /> of students staying
										on to become sophomores, <xsl:value-of select=" @name " /> has freshman retention rates below the
										national average of <xsl:value-of select=" format-number( retentionPct/@nationwideAvg, '##0.0%' ) " />.
									</p>
								</xsl:when>
								<xsl:when test=" $retentionGrade = 'C' ">
	 <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Freshman Retention Rates Here Are About Average</item>
        <item>Despite their Best Efforts, a Fair Amount of Freshman Actually Make it Through the First Year</item>
        <item>An Average Amount of Freshmen Make it To Their Sophomore Year</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
									<p>
										With <xsl:value-of select=" format-number( retentionPct, '##0.0%' ) " /> of students making
										it past their freshman year, <xsl:value-of select="@name"/> has freshman retention rates similar to
										the national average of <xsl:value-of select=" format-number( retentionPct/@nationwideAvg, '##0.0%' ) " />.
									</p>
								</xsl:when>
								<xsl:when test=" $retentionGrade = 'B' ">
	 <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>An Above Average Amount of Freshmen Make It To the Next Year</item>
        <item>Can't be too Bad of a School – a Lot of Freshmen Actually Stick Around the Next Year</item>
        <item>Be Nice to Your Fellow Freshmen – You Will Probably See Them Next Year</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
									<p>
										With <xsl:value-of select=" format-number( retentionPct, '##0.0%' ) " /> of students making it past
										their freshman year, <xsl:value-of select="@name"/> has freshman retention rates above the national average of
										<xsl:value-of select="format-number( retentionPct/@nationwideAvg, '##0.0%' ) "/>.
									</p>
								</xsl:when>
								<xsl:when test=" $retentionGrade = 'A' ">
	<h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>This School Has a Crazy High Freshman Retention Rate</item>
        <item>Freshmen Must Like It Here. Most of Them Stick Around.</item>
        <item>Freshmen Must Like What They're Learning, Because Most of Them Come Back For More</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
									<p>
										With <xsl:value-of select="format-number( retentionPct, '##0.0%' ) "/> of students staying on for a
										second year, <xsl:value-of select="@name"/> has among the best freshman retention rates in the country.
									</p>
								</xsl:when>
							</xsl:choose>

							<iframe src="chart-retention-rate.html" scrolling="no" class="chart"></iframe>
						</xsl:when>
						<xsl:otherwise>
	 <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Freshman Retention Rates At This School Unknown</item>
        <item>How Many Freshmen Return? It's a Mystery.</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
							<p>
								You have to make it past freshman year, in order to make it to graduation.
								We were not able to determine the freshman retention rate at <xsl:value-of select=" @name " />.
								The national average is <xsl:value-of select=" format-number( retentionPct/@nationwideAvg, '##0.0%' ) " />.
							</p>
						</xsl:otherwise>
					</xsl:choose>

                    <!-- Ad Block -->
                    <xsl:call-template name="ad_inline" />

                    <!--Graduation Rate-->
                    <a name="GraduationRate" />

     				<div class="well well-small">
     					<p>
	     					The following information is based off of data for students who were "Full Time Undergraduate Degree Seekers".

	     					<xsl:if test=" @ugCount castable as xs:decimal and @ugCountFT castable as xs:decimal " >
		     					Out of the <xsl:value-of select="format-number( @ugCount, '##,###' ) "/> undergraduate students at <xsl:value-of select=" @name " />,
		     					this group of <xsl:value-of select="format-number( @ugCountFT, '##,###' ) "/> represents about
		     					<xsl:value-of select="format-number( @ugCountFT div @ugCount, '##0%' ) "/>.
		     				</xsl:if>
	     				</p>

     					<p>
	     					If this demographic does not represent you, then you might want to ask <xsl:value-of select=" @name " /> about graduation rates for other
	     					more appropriate groups of students.
     					</p>

     					<xsl:if test=" @ugCountFT div @ugCount &lt;= 0.6 ">
	     					<p>
		     					Given that this percentage is not higher, the mission of <xsl:value-of select=" @name " /> may reflect other priorites such as
		     					providing education for "returning" or "part-time" students and the following data should be discounted accordingly.
		     				</p>
		     			</xsl:if>
     				</div>

					<xsl:variable name="grad150Grade" select=" grad150Pct/@nationwideGrade " />
					<xsl:variable name="grad100Grade" select=" grad100Pct/@nationwideGrade " />
					<xsl:choose>
						<xsl:when test=" $grad150Grade = ('A', 'B', 'C', 'D', 'F' ) and $grad100Grade = ('A', 'B', 'C', 'D', 'F' ) ">
							<xsl:choose>
								<xsl:when test=" $grad150Grade = 'F' ">
									<xsl:choose>
										<xsl:when test=" $grad100Grade = ( 'F', 'D' ) ">
     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Graduation Rates Here are Far Below Average</item>
        <item>This School Ranks Among the Lowest for Graduation Rates</item>
        <item>Among the Worst Graduation Rates</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
											<p>
												Only <xsl:value-of select=" format-number( grad100Pct, '##0.0%' ) " /> of students graduate
												from <xsl:value-of select="@name"/> on-time (two or four years depending on the degree) and only <xsl:value-of select=" format-number( grad150Pct, '##0.0%' ) "/>
												graduate at all, ranking this school among the worst in the country in both categories.
											</p>
										</xsl:when>
										<xsl:when test=" $grad100Grade = 'C' ">
     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Unfortunate News For This College: Graduation Rates Here Are Poor</item>
        <item>Think You Got What it Takes? Think Hard on This One. Grad Rates Are Poor At This College.</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
											<p>
												While <xsl:value-of select="@name"/> performs on average when it comes to the
												<xsl:value-of select=" format-number( grad100Pct, '##0.0%' ) "/> percent of students they
												graduate on-time (two or four years depending on the degree), their overall graduation rate of
												<xsl:value-of select=" format-number( grad150Pct, '##0.0%' ) "/> ranks it among the worst
												in the country.
											</p>
										</xsl:when>
										<xsl:when test=" $grad100Grade = ( 'B', 'A' ) ">
		<h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Graduation Rates: Not So Good</item>
        <item>Below Average Graduation Rates At This School</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
											<p>
												While <xsl:value-of select="@name"/> performs above average when it comes to the
												<xsl:value-of select=" format-number( grad100Pct, '##0.0%' ) "/> percent of students they graduate
												on-time (two or four years depending on the degree), their overall graduation rate of <xsl:value-of select=" format-number( grad150Pct, '##0.0%' ) "/>
												ranks it among the worst in the country.
											</p>
										</xsl:when>
									</xsl:choose>
								</xsl:when>
								<xsl:when test=" $grad150Grade = 'D' ">
									<xsl:choose>
										<xsl:when test=" $grad100Grade = ( 'F', 'D' ) ">
		<h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Graduation Rates Are Mixed</item>
        <item>Want to Graduate From This College? You May (Or You May Not)</item>
        <item>Grad Rates are Mixed. Some Do Well, Some Do Not</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
											<p>
												Only <xsl:value-of select=" format-number( grad100Pct, '##0.0%' ) "/> of students graduate from
												<xsl:value-of select="@name"/> on-time (two or four years depending on the degree) and only <xsl:value-of select=" format-number( grad150Pct, '##0.0%' ) "/>
												graduate at all, ranking this school below average in both categories when compared nationally.
											</p>
										</xsl:when>
										<xsl:when test=" $grad100Grade = 'C' ">
		<h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Graduation Rates Aren't Too Bad (Aren't Great, But Not Too Bad)</item>
        <item>Graduation Rates Are About Average</item>
        <item>This College Does About Average When it Comes to Graduating Students</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
											<p>
												While <xsl:value-of select="@name"/> performs on average when it comes to the
												<xsl:value-of select=" format-number( grad100Pct, '##0.0%' ) "/> percent of students they graduate on-time (two or four years depending on the degree),
												their overall graduation rate of <xsl:value-of select=" format-number( grad150Pct, '##0.0%' )" /> is below the
												national average.
											</p>
										</xsl:when>
										<xsl:when test=" $grad100Grade = ('B', 'A' ) ">
	<h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>You Win Some, You Lose Some (Students Trying to Graduate)</item>
        <item>This College Is No Miracle Worker: About An Average Number of Students Graduate</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
											<p>
												While <xsl:value-of select="@name"/> performs above average when it comes to the
												<xsl:value-of select=" format-number( grad100Pct, '##0.0%' ) "/> percent of students they graduate on-time (two or four years depending on the degree),
												their overall graduation rate of <xsl:value-of select=" format-number( grad150Pct, '##0.0%' ) "/> is below the
												national average.
											</p>
										</xsl:when>
									</xsl:choose>
								</xsl:when>
								<xsl:when test=" $grad150Grade = 'C' ">
									<xsl:choose>
										<xsl:when test=" $grad100Grade = ( 'F', 'D' ) ">
	<h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>You Might Be Able To Graduate From Here, But Not in 4 Years</item>
        <item>Want To Take More Than 4 Years to Graduate? This Might Be the School For You</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
											<p>
												Only <xsl:value-of select=" format-number( grad100Pct, '##0.0%' ) "/> of students graduate from
												<xsl:value-of select="@name"/> on-time (two or four years depending on the degree), but <xsl:value-of select=" format-number( grad150Pct, '##0.0%' ) "/>
												do eventually graduate. This ranks the school among the worst in the country at graduating students on-time,
												but on average when it comes to the overall graduation rate.
											</p>
										</xsl:when>
										<xsl:when test=" $grad100Grade = 'C' ">
		<h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Graduation Rates: Could be Worse</item>
        <item>A Decent Amount of Seniors End Up Graduating From This College</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
											<p>
												<xsl:value-of select="@name"/> performs on average when it comes to the
												<xsl:value-of select=" format-number( grad100Pct, '##0.0%' ) "/> percent of students they graduate on-time (two or four years depending on the degree) and
												performs at a similarly average rate when it comes to their overall graduation rate of
												<xsl:value-of select="format-number( grad150Pct, '##0.0%' ) "/>.
											</p>
										</xsl:when>
										<xsl:when test=" $grad100Grade = ( 'B', 'A' ) ">
		<h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Graduation Rates: Not Bad</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
											<p>
												While <xsl:value-of select="@name"/> performs above average when it comes to the
												<xsl:value-of select=" format-number( grad100Pct, '##0.0%' ) "/> percent of students they graduate on-time (two or four years depending on the degree), their
												overall graduation rate of <xsl:value-of select=" format-number( grad150Pct, '##0.0%' ) "/> ranks it similar to the
												average college.
											</p>
										</xsl:when>
									</xsl:choose>
								</xsl:when>
								<xsl:when test=" $grad150Grade = 'B' ">
									<xsl:choose>
										<xsl:when test=" $grad100Grade = ( 'F', 'D' ) ">
										     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>You Might Graduate From Here, But Not in 4 Years...</item>
        <item>A Good Amount of Students Graduate From This College in 5 or 6 Years</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
											<p>
												You stand a good chance of graduating from this college, but not on-time (two or four years depending on the degree). <xsl:value-of select="@name"/> has an
												overall graduation rate of <xsl:value-of select=" format-number( grad150Pct, '##0.0%' ) "/>, which is above average
												when compared nationally, but only <xsl:value-of select=" format-number( grad100Pct, '##0.0%' ) "/> of students do so
												on-time, which is among the worst.
											</p>
										</xsl:when>
										<xsl:when test=" $grad100Grade = 'C' ">
										     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>There's a Good Chance You'll Actually Graduate From This College</item>
        <item>Graduation Rates: Not too Shabby</item>
        <item>Plan on Getting to the Graduation Stage Early – it Could Get Crowded</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
											<p>
												With rates of <xsl:value-of select="format-number( grad100Pct, '##0.0%' ) "/> and
												<xsl:value-of select=" format-number( grad150Pct, '##0.0%' ) "/> for on-time (two or four years depending on the degree) graduations and overall graduation rates,
												respectively, <xsl:value-of select="@name"/> does an average job of graduating its students on-time and an
												above average job at graduating students overall.
											</p>
										</xsl:when>
										<xsl:when test=" $grad100Grade = ( 'B', 'A' ) ">
										     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Hey, Looky Here. People Seem to be Actually Graduating From This Place.</item>
        <item>College Most Likely to Look Like One of Those Graduation Movie Scenes</item>
        <item>Can't Brag Too Much to Your Classmates About Graduating; Everyone Does it Here.</item>
       </xsl:with-param>
      </xsl:call-template>
		</h2>
											<p>
												<xsl:value-of select="@name"/> performs above average at graduating its students on all fronts, posting an on-time (two or four years depending on the degree) and
												overall graduation rate of <xsl:value-of select=" format-number( grad100Pct, '##0.0%' ) "/> and
												<xsl:value-of select=" format-number( grad150Pct, '##0.0%' ) "/> respectively.
											</p>
										</xsl:when>
									</xsl:choose>
								</xsl:when>
								<xsl:when test=" $grad150Grade = 'A' ">
									<xsl:choose>
										<xsl:when test=" $grad100Grade = ( 'F', 'D' ) ">
										     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>You Will Probably Graduate From This College... It May Just Take You a Little Longer Than Planned</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
											<p>
												You'll likely graduate from this school, but not in four years. <xsl:value-of select="@name"/> has an overall graduation
												rate of <xsl:value-of select=" format-number( grad150Pct, '##0.0%' ) "/>, ranking it among the best in the country.
												However, only <xsl:value-of select=" format-number( grad100Pct, '##0.0%' ) "/> of students graduate on-time (two or four years depending on the degree),
												which is among the worst.
											</p>
										</xsl:when>
										<xsl:when test=" $grad100Grade = 'C' ">
										     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Just a Straight-Up Graduation Factory Right Here</item>
        <item>Good News For This College: A Lot of Their Students End Up Graduating</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
											<p>
												While <xsl:value-of select="@name"/> performs on average when it comes to the <xsl:value-of select=" format-number( grad100Pct, '##0.0%' ) "/>
												percent of students they graduate on-time (two or four years depending on the degree), their overall graduation rate of
												<xsl:value-of select=" format-number( grad150Pct, '##0.0%' ) "/> is among the best in the country.
											</p>
										</xsl:when>
										<xsl:when test=" $grad100Grade = ( 'B', 'A' ) ">
	<h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Graduating Seems To Be a Popular Activity Here</item>
        <item>Graduating Important To You? This is a Good Place to Start</item>
        <item>All Around Excellent Graduation Rates Here</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
											<p>
												Both the on-time (two or four years depending on the degree) graduation rate of <xsl:value-of select="format-number( grad100Pct, '##0.0%' ) "/> and the overall rate of
												<xsl:value-of select=" format-number( grad150Pct, '##0.0%' ) "/> rank <xsl:value-of select="@name"/> among the best in the country.
											</p>
										</xsl:when>
									</xsl:choose>
								</xsl:when>
							</xsl:choose>

							<!-- add expected rate sentance -->
							<xsl:if test=" grad150PctDiff castable as xs:decimal ">
								<xsl:choose>
									<xsl:when test=" ( grad150PctDiff ) &gt; 0.125 ">
										<p>
											Based on the caliber of students that attend <xsl:value-of select="@name"/> we would expect an overall graduation rate
											of <xsl:value-of select=" format-number( grad150PctExp, '##0.0%' ) "/>, however, students are graduating at a rate
											that is <xsl:value-of select=" format-number( grad150PctDiff, '##0.0%' ) "/> higher.
											Therefore, <xsl:value-of select="@name"/> is among the highest performing schools nationwide in
											graduating students when their anticipated academic achievement is factored in.
										</p>
									</xsl:when>
									<xsl:when test=" ( grad150PctDiff ) &gt; 0.047 ">
										<p>
											Based on the caliber of students that attend <xsl:value-of select="@name"/> we would expect an overall graduation rate
											of <xsl:value-of select=" format-number( grad150PctExp, '##0.0%' ) "/>, however, students are graduating at a rate
											that is <xsl:value-of select=" format-number( grad150PctDiff, '##0.0%' ) "/> higher.
											Therefore, <xsl:value-of select="@name"/> is performing above average at graduating students, based upon those
											students' anticipated academic achievement in college.
										</p>
									</xsl:when>
									<xsl:when test=" ( grad150PctDiff ) &lt; -0.13 ">
										<p>
											Based on the caliber of students that attend <xsl:value-of select="@name"/> we would expect an overall graduation rate
											of <xsl:value-of select=" format-number( grad150PctExp, '##0.0%' ) "/>. With an actual rate that is
											<xsl:value-of select=" format-number( -1.0 * ( grad150PctDiff ), '##0.0%' ) "/> lower than expected,
											<xsl:value-of select="@name"/> is among the worst performing schools nationally when it comes to graduating
											students, based upon those students' anticipated academic achievement in college.
										</p>
									</xsl:when>
									<xsl:when test=" ( grad150PctDiff ) &lt; -0.05 ">
										<p>
											Based on the caliber of students that attend <xsl:value-of select="@name"/> we would expect an overall graduation rate
											of <xsl:value-of select=" format-number( grad150PctExp, '##0.0%' ) "/>, however, students are graduating at a
											rate that is <xsl:value-of select=" format-number( -1.0 * ( grad150PctDiff ), '##0.0%' ) "/> lower than that.
											Therefore, <xsl:value-of select="@name"/> is performing below average at graduating students, based upon those
											students' anticipated academic achievement in college.
										</p>
									</xsl:when>
									<xsl:otherwise>
										<p>
											Based on the caliber of students that attend <xsl:value-of select="@name"/> we would have expected an overall graduation
											rate of <xsl:value-of select=" format-number( grad150PctExp, '##0.0%' ) "/>. This is on par with the actual rate
											at which the college graduates students and suggests that <xsl:value-of select="@name"/> is performing on
											average when the previous academic achievement of students is factored in.
										</p>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>

							<iframe src="chart-graduation-rate.html" scrolling="no" class="chart"></iframe>

						</xsl:when>
						<xsl:otherwise>
							<h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Graduation Rates Unknown</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
							<p>
								We were hoping to show you the on-time (two or four years depending on the degree) and the eventual graduation rates
								at <xsl:value-of select=" @name " />, but we are missing one, or both of those pieces of data.

								The national averages are <xsl:value-of select=" format-number( grad100Pct/@nationwideAvg, '##0.0%' ) " />
								and <xsl:value-of select=" format-number( grad150Pct/@nationwideAvg, '##0.0%' ) " /> respectively.
							</p>
						</xsl:otherwise>
					</xsl:choose>

					<!--Non Graduates-->
					<a name="Non-Graduates" />
					<xsl:choose>
						<xsl:when test=" grad150Pct = 1.0 ">
							<h2>All Undergraduates Who Were Expected To Graduate In <xsl:value-of select=" @y0 " /> Have Done So</h2>
							<p>
								This is the area we would normally report the primary reason students did not graduate but in this case
								100% of the <xsl:value-of select="format-number( round( grad150Count/@value div grad150Pct ) , '##,###' ) "/>
								undergraduates who were expected to complete their degree have done so.
							</p>
						</xsl:when>
						<xsl:when test=" grad150Pct castable as xs:decimal ">
							<xsl:choose>
								<xsl:when test=" ( transferOutPct div ( 1 - grad150Pct ) ) &gt; 0.50 ">
	 <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Most of Non-Grads End Up Transferring</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
									<p>
										<xsl:value-of select=" format-number( 1 - grad150Pct, '##0.0%' ) "/> of students at <xsl:value-of select="@name"/>
										failed to graduate within 150% of the expected time.
										The majority did so because they transferred to another school.
									</p>
								</xsl:when>
								<xsl:when test=" ( nonCompletersNotEnrolledPct div ( 1 - grad150Pct ) ) &gt; 0.50 ">
	  <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>A Lot of Students Pulled the ol' Mark Zuckerberg </item>
        <item>Graduating From College Isn't for Everyone. The Majority of Non-Grads at this School Dropped Out.</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
									<p>
										<xsl:value-of select=" format-number( 1 - grad150Pct, '##0.0%' ) "/> of students at <xsl:value-of select="@name"/>
										failed to graduate within 150% of the expected time.
										The majority did so because they dropped out.
									</p>
								</xsl:when>
								<xsl:when test=" ( nonCompletersStillEnrolledPct div ( 1 - grad150Pct ) ) &gt; 0.50 ">
	 <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Most of the Non-Grads Are Still Enrolled At The School</item>
        <item>The Majority of Non Grads Are Just Taking a Longer Time to Graduate</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
									<p>
										<xsl:value-of select=" format-number( 1 - grad150Pct, '##0.0%' ) "/> of students at <xsl:value-of select="@name"/>
										failed to graduate within 150% of the expected time.
										The majority are still enrolled at the college.
									</p>
								</xsl:when>
								<xsl:otherwise>
	  <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Not Graduating: Hey, It's Complicated. Let's Get a Pizza and Never Talk About This Again.</item>
        <item>Mixed Reasons for Students Not Graduating</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
									<p>
										<xsl:value-of select=" format-number( 1 - grad150Pct, '##0.0%' ) "/> of students at <xsl:value-of select="@name"/>
										failed to graduate within 150% of the expected time.
									</p>
								</xsl:otherwise>
							</xsl:choose>

							<xsl:variable name="someTransferred" select=" if ( transferOutPct &gt; 0 ) then 1 else 0 " />
							<xsl:variable name="someDroppedOut" select=" if ( nonCompletersNotEnrolledPct &gt; 0 ) then 1 else 0 " />
							<xsl:variable name="someStillWorking" select=" if ( nonCompletersStillEnrolledPct &gt; 0 ) then 1 else 0 " />

							<xsl:choose>
								<xsl:when test=" ( $someTransferred + $someDroppedOut + $someStillWorking ) &gt; 1 ">
									<iframe src="chart-non-completers.html" class="chart"></iframe>

								</xsl:when>
								<xsl:otherwise>
									<p>
										The following table lists the reasons why students at <xsl:value-of select="@name"/> did not graduate within three or six years depending on the degree type.
									</p>

									<table class="table table-striped">
										<thead>
											<tr>
												<th>Reason</th>
												<th style="text-align:right;">% of Overall Class</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Still Enrolled</td>
												<td style="text-align:right;">
													<xsl:value-of select="if ( nonCompletersStillEnrolledPct castable as xs:decimal) then format-number( nonCompletersStillEnrolledPct, '##0.0%' ) else 'N/A' " />
												</td>
											</tr>
											<tr>
												<td>Transferred</td>
												<td style="text-align:right;">
													<xsl:value-of select="if ( transferOutPct castable as xs:decimal ) then format-number( transferOutPct, '##0.0%' ) else 'N/A' " />
												</td>
											</tr>
											<tr>
												<td>Dropped Out</td>
												<td style="text-align:right;">
													<xsl:value-of select="if ( nonCompletersNotEnrolledPct castable as xs:decimal ) then format-number( nonCompletersNotEnrolledPct, '##0.0%' ) else 'N/A' " />
												</td>
											</tr>
											<tr>
												<td>Total</td>
												<td style="text-align:right;"><xsl:value-of select=" format-number( 1 - grad150Pct, '##0.0%' ) "/></td>
											</tr>
										</tbody>
									</table>

								</xsl:otherwise>
							</xsl:choose>

						</xsl:when>
						<xsl:otherwise>
	  <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Reasons For Not Graduating Are Unknown</item>
        <item>Why Didn't These Kids Graduate? Some Questions are Not Meant to be Answered.</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
							<p>
								We are unable to display the reasons why undergraduates at <xsl:value-of select="@name"/> fail to
								complete their degrees within three or six years (depending on the degree type), because the information is not available to us.
								Typical reasons given for students not graduating include dropping out, transferring to another college or their degree is still in progress.
							</p>
						</xsl:otherwise>
					</xsl:choose>

					<!--
					<iframe src="chart-02.html" class="chart"></iframe>
					-->

					<!--
					<h2>What to Ask <xsl:value-of select="@name"/></h2>
					<ul>
					-->
						<!--Retention Rate-->
					<!--
						<xsl:choose>
							<xsl:when test="retentionFulltime/@NationalAvgGrade = 'F'">
								<li>Why is your freshman retention rate of only <xsl:value-of select="format-number(retentionPct, '##0.0%')"/> so low when compared with the national average of <xsl:value-of select="format-number(national/average/retentionFulltimePct, '##0.0%')"/>. What do you do to make sure freshman are successful both academically and in adjusting to student life at your school?</li>
							</xsl:when>
							<xsl:when test="retentionFulltime/@NationalAvgGrade = 'D'">
								<li>Why is your freshman retention rate of <xsl:value-of select="format-number(retentionPct, '##0.0%')"/> below the national average of <xsl:value-of select="format-number(national/average/retentionFulltimePct, '##0.0%')"/>. What do you do to make sure freshman are successful both academically and in adjusting to student life at your school?</li>
							</xsl:when>
							<xsl:when test="retentionFulltime/@NationalAvgGrade = 'C'">
								<li>What do you do to make sure freshman are successful both academically and in adjusting to student life at your school?</li>
							</xsl:when>
							<xsl:when test="retentionFulltime/@NationalAvgGrade = 'B'">
								<li>Your freshman retention rate of <xsl:value-of select="format-number(retentionPct, '##0.0%')"/> is above the national average of <xsl:value-of select="format-number(national/average/retentionFulltimePct, '##0.0%')"/>.  Why is that and what do you do to make sure freshman are successful both academically and in adjusting to student life at your school?</li>
							</xsl:when>
							<xsl:when test="retentionFulltime/@NationalAvgGrade = 'A'">
								<li>Your excellent freshman retention rate of <xsl:value-of select="format-number(retentionPct, '##0.0%')"/> is well above the natoinal average of <xsl:value-of select="format-number(national/average/retentionFulltimePct, '##0.0%')"/>.  Why is that and what do you do to make sure freshman are successful both academically and in adjusting to student life at your school?</li>
							</xsl:when>
						</xsl:choose>
					-->
						<!--Transfer Out Rates-->
					<!--
						<xsl:choose>
							<xsl:when test="transferOutPct/@NationalGrade = 'F'">
								<li>What explains why <xsl:value-of select="format-number(transferOutPct, '##0.0%')"/> of your students transfer to another school prior to graduation when the national average is only <xsl:value-of select="format-number(national/average/transferOutPct, '##0.0%')"/>.  What schools do these students transfer to and for what reasons?</li>
							</xsl:when>
							<xsl:when test="transferOutPct/@NationalGrade = 'D'">
								<li>What explains why <xsl:value-of select="format-number(transferOutPct, '##0.0%')"/> of your students transfer to another school prior to graduation when the national average is only <xsl:value-of select="format-number(national/average/transferOutPct, '##0.0%')"/>.  What schools do these students transfer to and for what reasons?</li>
							</xsl:when>
						</xsl:choose>
					</ul>
					-->
					<h2>Questions You Need to Ask</h2>
					<ul>
						<li>The majority of students take more than the "expected time" to graduate. Have you factored this into your college budget?</li>
						<li>You may not think you will transfer, but a lot of students do. How easy is it to transfer credits from this college? Will you end up having to retake classes?</li>
					</ul>

				</article>

				<aside class="span4">
					<xsl:call-template name="editorComment" >
						<xsl:with-param name="unitId" select=" @unitId " />
						<xsl:with-param name="bhPageId" select=" $bhPageId " />
					</xsl:call-template>

					<!--four year Grad Rates-->
					<div class="rightgreybox" data-bhTrackRegion="rhrBubble">
						<div class="rightgreyboxheadline">On-Time Graduation Rate</div>
						The "overall" graduation rate means students
						attending <xsl:value-of select="@name"/> graduated in half again the expected time. This makes the on-time
						graduation rate a very important statistic to pay attention to. If it takes you more than the standard two or four years
						to graduate (depending on the degree), then your degree could cost you much more than you originally planned for.
					</div>
					<div class="bubblebottom"></div>

					<!--Transfer Out Rates-->
					<xsl:choose>
						<xsl:when test=" transferOutPct/@NationalGrade = 'F' ">
							<div class="rightgreybox" data-bhTrackRegion="rhrBubble">
								<div class="rightgreyboxheadline">High Transfer Out Rate</div>
								At <xsl:value-of select="@name"/>, significantly more students transfer to another school prior to graduation than
								the national average. It is worth taking the time to understand if the majority of students planned to transfer out
								when they entered (e.g. they traded up to a better school), or if this was unplanned, and occurred because the
								school did not meet their expectations.
							</div>
							<div class="bubblebottom"></div>
						</xsl:when>
						<xsl:when test=" transferOutPct/@NationalGrade = 'D' ">
							<div class="rightgreybox" data-bhTrackRegion="rhrBubble">
								<div class="rightgreyboxheadline">Above Average Transfer Out Rate</div>
								At <xsl:value-of select="@name"/>, more students transfer to another school prior to graduation than the national
								average. It is worth taking the time to understand if the majority of students planned to transfer out when they
								entered (e.g. they traded up to a better school), or if this was unplanned, and occurred because the school did
								not meet their expectations.
							</div>
							<div class="bubblebottom"></div>
						</xsl:when>
					</xsl:choose>

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
