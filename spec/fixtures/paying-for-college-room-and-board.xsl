<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [<!ENTITY nbsp "&#160;">]>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" >

    <xsl:import href="../../../../_shared/bhArticleMaster.xsl" />

    <xsl:output method="html" indent="no" encoding="utf-8" />

    <xsl:template match="/college">
        <xsl:call-template name="bhArticleMaster">
            <xsl:with-param name="bhPageId" select="'#bhPageId_college-paying-for-college-room-and-board'" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="headHeaderContent">
        <xsl:param name="bhPageId" />

        <xsl:call-template name="articleHead">
            <xsl:with-param name="bhPageId" select="$bhPageId" />
            <xsl:with-param name="htmlTitle" select ="concat(@nameDistinct, ' Room &amp; Board Costs: Dorms, Meals &amp; Other Expenses')" />
            <xsl:with-param name="metaDesc" select ="concat('Calculating costs to attend ', @nameDistinct, '? Review these stats for room and board, books, supplies and transporation, including average costs for both on-campus and off-campus housing, as well as what typical students pay for books, supplies and other living expenses, as well as travel expenses to and from college.')" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="bodyContent">
        <xsl:param name="bhPageId" />

        <div class="container-paying">
            <!-- The Breadcrub ==================================================-->
            <xsl:call-template name="breadcrumb">
                <xsl:with-param name="content">
                    <map>
                        <entry><navName><xsl:value-of select="'All Colleges'"/></navName><navUrl><xsl:value-of select="$bhUriLookup/page[ @id = 'colleges-home' ]/@uri"/></navUrl></entry>
                        <entry><navName><xsl:value-of select="@name" /></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-home' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
                        <entry><navName><xsl:value-of select="$bhUriLookup/page[ @id = 'college-paying-for-college-home' ]/@navName"/></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-paying-for-college-home' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
                        <entry><navName><xsl:value-of select="$bhUriLookup/page[ @id = 'college-paying-for-college-room-and-board' ]/@navName"/></navName><navUrl><xsl:value-of select="replace( $bhUriLookup/page[ @id = 'college-paying-for-college-room-and-board' ]/@uri, '~collegeSlug~', @slug )"/></navUrl></entry>
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

            <xsl:variable name="showOnCampusData" select=" if( onCampusLiving &gt; 0 ) then 1 else 0 " />
            <xsl:variable name="showOffCampusData" select=" if( offCampusLiving &gt; 0 ) then 1 else 0 " />

            <div class="row">
                <article class="span8">
        <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Rooms, Meals and College Necessities: Here's What It's Going to Cost</item>
        <item>Here's What Sleeping and Eating is Going to Cost You</item>
        <item>A Room, Some Food, and Other Stuff That's Not Free for Some Reason</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>

                    <xsl:if test=" @isMostlyOnline = 'true' ">
                        <p>
                            The majority of undergraduates at <xsl:value-of select="@name" /> take all of their classes on-line.
                            Since you probably will continue your current living arrangements, you probably have a better handle
                            on what your room and board will cost than anything we could estimate.
                        </p>
                    </xsl:if>

                    <p>
                        <xsl:choose>
                            <xsl:when test=" onCampusRoomBoard/@offered = 'true' ">
                                <xsl:value-of select="@name" /> offers students combined housing and dining options. The on-campus cost for a typical
                                student was <xsl:value-of select=" format-number(onCampusRoomBoard/@cost,'$##,##0') " /> in <xsl:value-of select="$currentYear" />.
                            </xsl:when>
                            <xsl:when test=" onCampusRoom/@offered = 'true' and onCampusBoard/@offered = 'true' and onCampusRoom/@cost castable as xs:decimal and onCampusBoard/@cost castable as xs:decimal ">
                                <xsl:value-of select="@name" /> offers students both housing and dining options. The on-campus housing cost for a typical
                                student was <xsl:value-of select=" format-number(onCampusRoom/@cost,'$##,##0') " /> in <xsl:value-of select="$currentYear" />
                                and the cost for a typical meal plan was <xsl:value-of select=" format-number(onCampusBoard/@cost,'$##,##0') " />.
                            </xsl:when>
                            <xsl:when test=" onCampusRoom/@offered = 'true' and onCampusBoard/@offered = 'true' ">
                                <xsl:value-of select="@name" /> offers students both housing and dining options. However, <xsl:value-of select="@name" /> did not provide enough information regarding the typical cost for on-campus housing and dining options.
                            </xsl:when>
                            <xsl:when test=" onCampusRoom/@offered = 'true' ">
                                <xsl:value-of select="@name" /> offers students housing options. The on-campus housing cost for a typical
                                student was <xsl:value-of select=" format-number(onCampusRoom/@cost,'$##,##0') " /> in <xsl:value-of select="$currentYear" />.
                                This school either does not offer a mean plan or did not provide information regarding meal plans.
                            </xsl:when>
                            <xsl:when test=" onCampusBoard/@offered = 'true' ">
                                <xsl:value-of select="@name" /> offers students dining options. The cost for a typical meal plan was
                                <xsl:value-of select=" format-number(onCampusBoard/@cost,'$##,##0') " /> in <xsl:value-of select="$currentYear" />.
                                This school either does not offer on campus housing or did not provide information regarding their housing options.
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@name" /> did not provide us with any information regarding on-campus housing options or meal plans they might offer.
                            </xsl:otherwise>
                        </xsl:choose>
                    </p>

                    <xsl:if test=" $showOnCampusData = 1 or $showOffCampusData = 1" >
                        <xsl:choose>
                            <xsl:when test=" $showOnCampusData = 1 and $showOffCampusData = 1 ">
                                <p>
                                    The following table outlines average expected costs at <xsl:value-of select="@name" /> for both on-campus and off-campus housing, meals and other expenses.
                                </p>
                            </xsl:when>
                            <xsl:when test=" $showOnCampusData = 0 and $showOffCampusData = 1 ">
                                <p>
                                    The following table outlines average expected costs at <xsl:value-of select="@name" /> for off-campus housing, meals and other expenses.
                                </p>
                            </xsl:when>
                            <xsl:otherwise>
                                <p>
                                    The following table outlines average expected costs at <xsl:value-of select="@name" /> for on-campus housing, meals and other expenses.
                                </p>
                            </xsl:otherwise>
                        </xsl:choose>

                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Expense</th>
                                    <xsl:if test=" $showOnCampusData = 1 "><th style="text-align:right;">On Campus</th></xsl:if>
                                    <xsl:if test=" $showOffCampusData = 1 "><th style="text-align:right;">Off Campus</th></xsl:if>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Room and Board</td>
                                    <xsl:if test = " $showOnCampusData = 1 ">
                                        <td style="text-align:right;"><xsl:value-of select=" if ( onCampusLiving castable as xs:decimal ) then format-number( onCampusLiving, '$##,##0' ) else 'N/A' " /></td>
                                    </xsl:if>
                                    <xsl:if test="$showOffCampusData = 1">
                                        <td style="text-align:right;"><xsl:value-of select=" if ( offCampusLiving castable as xs:decimal ) then format-number( offCampusLiving, '$##,##0' ) else 'N/A' " /></td>
                                    </xsl:if>
                                </tr>

                                <xsl:if test=" $showOnCampusData = 1 and onCampusRoom/@cost castable as xs:decimal ">
                                    <tr style="font-size: 0.9em;">
                                        <td>-- Housing</td>
                                        <td style="text-align:right;"><xsl:value-of select=" format-number( onCampusRoom/@cost, '$##,##0' ) " /></td>
                                        <xsl:if test="$showOffCampusData = 1"><td style="text-align:right;"> </td></xsl:if>
                                    </tr>
                                </xsl:if>

                                <xsl:if test=" $showOnCampusData = 1 and onCampusBoard/@cost castable as xs:decimal ">
                                    <tr style="font-size: 0.9em;">
                                        <td>-- Meals</td>
                                        <td style="text-align:right;"><xsl:value-of select=" format-number( onCampusBoard/@cost, '$##,##0' ) " /></td>
                                        <xsl:if test="$showOffCampusData = 1"><td style="text-align:right;"> </td></xsl:if>
                                    </tr>
                                </xsl:if>

                                <tr>
                                    <td>Other Living Expenses</td>
                                    <xsl:if test=" $showOnCampusData = 1 ">
                                        <td style="text-align:right;"><xsl:value-of select=" if ( onCampusOther castable as xs:decimal ) then format-number( onCampusOther, '$##,##0' ) else 'N/A' " /></td>
                                    </xsl:if>
                                    <xsl:if test="$showOffCampusData = 1">
                                        <td style="text-align:right;"><xsl:value-of select=" if ( offCampusOther castable as xs:decimal ) then format-number( offCampusOther, '$##,##0' ) else 'N/A' " /></td>
                                    </xsl:if>
                                </tr>

                                <tr>
                                    <td>Books and Supplies</td>
                                    <xsl:if test=" $showOnCampusData = 1 ">
                                        <td style="text-align:right;"><xsl:value-of select=" if ( books castable as xs:decimal ) then format-number( books, '$##,##0' ) else 'N/A' " /></td>
                                    </xsl:if>
                                    <xsl:if test="$showOffCampusData = 1">
                                        <td style="text-align:right;"><xsl:value-of select=" if ( books castable as xs:decimal ) then format-number( books, '$##,##0' ) else 'N/A' " /></td>
                                    </xsl:if>
                                </tr>

                            </tbody>
                            <tfoot>
                                <tr>
                                    <td>Total</td>
                                    <xsl:if test=" $showOnCampusData = 1 ">
                                        <td style="text-align:right;"><xsl:value-of select=" if ( onCampusTotal castable as xs:decimal ) then format-number( onCampusTotal, '$##,##0' ) else 'N/A' " /></td>
                                    </xsl:if>
                                    <xsl:if test="$showOffCampusData = 1">
                                        <td style="text-align:right;"><xsl:value-of select=" if ( offCampusTotal castable as xs:decimal ) then format-number( offCampusTotal, '$##,##0' ) else 'N/A' " /></td>
                                    </xsl:if>
                                </tr>
                            </tfoot>
                        </table>

                    </xsl:if>
                </article>

                <aside class="span4">
                    <xsl:call-template name="editorComment" >
                        <xsl:with-param name="unitId" select=" @unitId " />
                        <xsl:with-param name="bhPageId" select=" $bhPageId " />
                    </xsl:call-template>
                    <xsl:variable name="offCampusSavings" select=" onCampusLiving - offCampusLiving " />
                    <xsl:if test = " $offCampusSavings &gt; 0 ">
                        <div class="rightgreybox" data-bhTrackRegion="rhrBubble">
                            <div class="rightgreyboxheadline">Should You Live Off Campus?</div>

                            During <xsl:value-of select="$currentYear" />, some students saved an estimated <xsl:value-of select=" format-number( $offCampusSavings, '$##,##0' ) " />
                            (<xsl:value-of select=" format-number( $offCampusSavings div onCampusLiving, '#,##0.0%' ) " />)
                            by living off campus. Students living at home can save even more.
                        </div>
                        <div class="bubblebottom"></div>
                    </xsl:if>

                    <!--Travel Costs-->
                    <div class="rightgreybox" data-bhTrackRegion="rhrBubble">
                        <div class="rightgreyboxheadline">How Far Away Do You Live?</div>
                        Don't forget to budget for travel! The cost to go to and from college can impact budgets quickly, especially if you travel during holidays and spring break.
                    </div>
                    <div class="bubblebottom"></div>
                </aside>

            </div>

            <!-- Ad Block -->
            <xsl:call-template name="ad_inline" />

            <a name="ExpensesTrend"></a>
            <xsl:variable name="totalLivingCosts" select=" onCampusTotal/@y0p2 + onCampusTotal/@y0p3 + onCampusTotal/@y0p4 + onCampusTotal/@y0p5" />
            <xsl:variable name="totalLivingCosts2yr" select=" onCampusTotal/@y0p2 + onCampusTotal/@y0p3 " />
            <xsl:choose>
                <xsl:when test=" $totalLivingCosts castable as xs:decimal ">
                <div class="row">
                    <article class="span8">
    <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Planning on Spending Four Years in the Dorms? Projected Cost is <xsl:value-of select=" format-number( $totalLivingCosts, '$##,##0' ) " /></item>
        <item>Over Four Years You're Looking to Drop About <xsl:value-of select=" format-number( $totalLivingCosts, '$##,##0' ) " /> on Housing, Food and Other Stuff.</item>
        <item>What's Room &amp; Board Going to Cost Over 4 Years? The Total Comes to <xsl:value-of select=" format-number( $totalLivingCosts, '$##,##0' ) " />.</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
                        <p>
                            On-campus housing and dining at <xsl:value-of select="@name" /> has changed an average of
                            <xsl:value-of select=" format-number( onCampusLiving/@compounder, '##,##0.0%' ) " />
                            for each of the past five years.

                            If current growth trends in room, board and other expenses continue, we expect this year's incoming freshmen to pay
                            <xsl:value-of select=" format-number( onCampusTotal/@y0p2,'$##,##0' ) " /> their first year of college.

                            By their final year they will pay approximately <xsl:value-of select=" format-number( onCampusTotal/@y0p3,'$##,##0') " /> for an associate degree seeker, and
                            <xsl:value-of select=" format-number( onCampusTotal/@y0p5,'$##,##0') " /> for a bachelor degree seeker to cover these expenses

                            Over the entire degree (assuming you graduate on-time) the total will come to <xsl:value-of select=" format-number( $totalLivingCosts, '$##,##0' ) " />
                            for a four year stay or <xsl:value-of select=" format-number( $totalLivingCosts2yr, '$##,##0' ) " /> for a two year stay.
                        </p>
                        <iframe src="chart-room-board-other-expense-trend.html" scrolling="no" class="chart"></iframe>
                    </article>
                    <aside class="span4">
                        <div class="rightgreybox" data-bhTrackRegion="rhrBubble">
                            <div class="rightgreyboxheadline">Costs Usually Go Up, Not Down</div>
                            When calculating total costs for four years of college, if you assume that housing, meals and other expenses will remain steady at
                            <xsl:value-of select=" format-number( onCampusTotal/@y0p2, '$##,##0' ) " /> per year, your budget could fall short by about
                            <xsl:value-of select=" format-number( $totalLivingCosts - onCampusTotal/@y0p2 * 3, '$##,##0' ) " /> by the end of your senior year.
                        </div>
                        <div class="bubblebottom"></div>
                    </aside>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="row">
                    <article class="span8">
                <h2>Projected Four Year Cost Unknown</h2>
                    <p>
                        We would like to show you the projected four year cost of attending <xsl:value-of select="@alias" /> but we do not have enough information to provide that detail.
                    </p>
                </article>
            </div>
        </xsl:otherwise>
    </xsl:choose>


            <div class="row">
                <article class="span8">
    <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>The Lowdown on Your Campus Home and Food Plan</item>
        <item>The Fun Stuff: Where's Your New Home and How Much Can You Eat?</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
                    <table class="table table-striped">
                        <tbody>
                            <tr>
                                <td>Must Freshmen Live On Campus?</td>
                                <td><xsl:value-of select=" if ( onCampusRoom/@requiredFirstYear = 'true' ) then 'Yes' else 'No' " /></td>
                            </tr>
                            <tr>
                                <td>On-Campus Housing Capacity</td>
                                <td><xsl:value-of select=" if ( onCampusRoom/@capacity castable as xs:decimal ) then format-number( onCampusRoom/@capacity, '##,##0' ) else 'N/A' " /></td>
                            </tr>
                            <tr>
                                <td>Max Number of Meal-Plan Meals Per Week</td>
                                <td><xsl:value-of select=" if ( onCampusBoard/@meals > 0 ) then onCampusBoard/@meals else 'N/A' " /></td>
                            </tr>
                        </tbody>
                    </table>

                    <a name="ExpensesComparison"></a>
                    <xsl:if test = " $showOnCampusData = 1 or $showOffCampusData = 1">
                        <xsl:choose>

                            <xsl:when test=" onCampusTotal/@nationwideGrade = 'F' ">
     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Campus Expense is Way Above Average</item>
        <item>We Hope This Campus Has Lots of Amenities, Because Students are Paying Through the Nose For It</item>
        <item>By the Looks of This Campus' Average Expense, You'd Think Everything was Dipped in Gold.</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
                                <p>
                                    With room, board, books, supplies and other expenses for on-campus students totaling
                                    <xsl:value-of select=" format-number(onCampusTotal, '$##,###' ) "/>,
                                    <xsl:value-of select="@name"/> is well above the national average of
                                    <xsl:value-of select=" format-number( onCampusTotal/@nationwideAvg, '$##,###' ) "/>.
                                </p>
                            </xsl:when>

                            <xsl:when test=" onCampusTotal/@nationwideGrade = 'D' ">
     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>And You Thought the Tuition Was High...</item>
        <item>You Know What Else Here is Costly? Everything.</item>
        <item>Good Luck Trying to Save Money Once You Get Here, Campus Expenses are Above Average</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
                                <p>
                                    With total room, board, books, supplies and other expenses costing on-campus students
                                    <xsl:value-of select=" format-number( onCampusTotal, '$##,###' ) "/>,
                                    <xsl:value-of select="@name"/> is above the national average of
                                    <xsl:value-of select=" format-number( onCampusTotal/@nationwideAvg, '$##,###' ) "/>.
                                </p>
                            </xsl:when>

                            <xsl:when test=" onCampusTotal/@nationwideGrade = 'C' ">
     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Campus Expenses Here are Not Pretty, but at Least They're Fairly Similar to Other Schools</item>
        <item>Things Here Cost About What They Should. What More Can You Ask?</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
                                <p>
                                    Room, board, books, supplies and other expenses for on-campus students at <xsl:value-of select="@name"/> totals to
                                    <xsl:value-of select=" format-number( onCampusTotal, '$##,###' ) "/>,
                                    similar to the average of
                                    <xsl:value-of select=" format-number( onCampusTotal/@nationwideAvg, '$##,###' ) "/>.
                                </p>
                            </xsl:when>

                            <xsl:when test=" onCampusTotal/@nationwideGrade = 'B' ">
     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>Nice Job, Monopoly Man. You've Found One of the Few Schools That's Actually a Deal</item>
        <item>You'll Actually Gonna Save Some Green on Campus Expenses at This College</item>
        <item>One Stat to Get Psyched About: Campus Expenses Below Average</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
                                <p>
                                    The cost of room, board, books, supplies and other expenses for on-campus students attending
                                    <xsl:value-of select="@name"/> is
                                    <xsl:value-of select=" format-number( onCampusTotal, '$##,###' ) "/>,
                                    which is below the national average of
                                    <xsl:value-of select=" format-number( onCampusTotal/@nationwideAvg, '$##,###' ) "/>.
                                </p>
                            </xsl:when>

                            <xsl:when test=" onCampusTotal/@nationwideGrade = 'A' ">
     <h2>
      <xsl:call-template name="pickOne"><xsl:with-param name="key" select=" @unitId " />
       <xsl:with-param name="items">
        <item>It Sounds too Good to be True, but we Swear we did the Research: This Campus has Insanely Low Expenses.</item>
        <item>Here's the Most Beautiful Part of This Campus: Low On-Campus Expenses.</item>
        <item>The One Stat That Should be on the Cover of Every Campus Brochure: Lowest On-Campus Expenses.</item>
       </xsl:with-param>
      </xsl:call-template>
     </h2>
                                <p>
                                    On-campus students attending <xsl:value-of select="@name"/> spend
                                    <xsl:value-of select=" format-number( onCampusTotal/@y0, '$##,###' ) "/>
                                    on room, board, books, supplies and other expenses, a figure that is well below the national average of
                                    <xsl:value-of select=" format-number( onCampusTotal/@nationwideAvg, '$##,###' ) "/>.
                                </p>
                            </xsl:when>

                            <xsl:otherwise>
                                <h2>Other Campus Expenses</h2>
                            </xsl:otherwise>

                        </xsl:choose>

                        <iframe src="chart-room-board-other-expense-compare.html" scrolling="no" class="chart"></iframe>
                    </xsl:if>
                    <xsl:if test = " $showOnCampusData = 0 and $showOffCampusData = 0">
                        <h2>Other Campus Expenses Unknown</h2>
                        <p>
                            We would like to show you other on-campus and off-campus expenses here but we do not have enough information for <xsl:value-of select="@alias" /> to show that detail.
                        </p>
                    </xsl:if>

                    <h2>You Know What's More Fun Than Thinking About Your New Future Room? How Much Food You'll Be Eating</h2>
                    <ul>
                        <li>How easy is it to customize the meal plan to meet your needs? Is there a required meal plan freshman students are automatically enrolled in?</li>
                        <li>How easy is it to get around or off campus? Does the college offer shuttle services, or discounts for public transportation?</li>
                        <li>Is parking readily available on-campus? Will you have to pay a fee to register your car?</li>
                    </ul>

                </article>
                <aside class="span4">
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
