<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [<!ENTITY nbsp "&#160;">]>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" >

    <xsl:import href="../_shared/bhArticleMaster.xsl" />

    <xsl:output method="html" indent="no" encoding="utf-8" />

    <xsl:template match="/*">
        <xsl:call-template name="bhArticleMaster">
            <xsl:with-param name="bhPageId" select="'#bhPageId_home'" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="headHeaderContent">
        <xsl:param name="bhPageId" />

        <xsl:call-template name="articleHead">
            <xsl:with-param name="bhPageId" select=" $bhPageId " />
            <xsl:with-param name="htmlTitle" select=" 'Find Your College at CollegeFactual.com: Compare Colleges, Costs and Value via Rankings and Profiles' " />
            <xsl:with-param name="metaDesc" select=" 'Struggling to choose a college? CollegeFactual.com''s data-driven insights are designed to help simplify this all-important choice. Find the best colleges for your money via our unique college rankings, compare colleges via the scorecard, and dive deep into college costs and profiles via user-friendly charts and tables that will help you discover just the right fit based on all the variables that are uniquely you.' " />
            <xsl:with-param name="metaTitleOveride" select=" '' " />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="headFooterContent">
        <style type="text/css">
            #disqus_wrapper { width: auto !important; }
            #disqus_wrapper .btn { border-radius: 0px; font-weight: 700; font-size: 15px; width: 160px; }
            #disqus_wrapper h1 { margin-top: 24px; margin-bottom: 24px; font-size: 40px; font-weight: 700; line-height: 48px; }

            #hero {  }
            #hero { margin-top: -20px; background: rgba(236,83,68,1); color: #fff; }
            #hero .rowPadding { margin: 35px; }
            #hero .heroP { font-weight: 600; margin-bottom: 24px; }
            #hero .btn{ background-color: rgb(243, 140, 116); }

            #tryIt {  color: #ed5354; }
            #tryIt .rowPadding { margin: 35px; }
            #tryIt .tryItHeading { font-size: 38px; line-height: 38px; font-weight: 900;  }
            #tryIt .tryItP { font-size: 15px; font-weight: 700; }
            #tryIt .btn { background-color: rgba(236,83,68,1); margin: 8px; }

            .popover { color: #000; font-size: 14px; }
            .popover-title { background-color: #F35757; font-weight: bold; }

            #toolsShowcase {  background: rgba(30,155,155,1); color: #fff; }
            #toolsShowcase h2 {  }
            #toolsShowcase .rowPadding { margin: 35px; text-align: center; }

            #atGlance {  background: rgba(245,148,45,1); color: #fff; }
            #atGlance h2 {  font-size: 40px; font-weight: 900; line-height: 40px; }
            #atGlance .rowPadding { margin: 35px; text-align: center; }
            #atGlance .btn { background-color: rgba(249,176,103,1); width: 220px; }

            #featuredIn { color: #ed5354; }
            #featuredIn h2 { font-size: 40px; line-height: 40px;  }
            #featuredIn .rowPadding { margin: 20px; text-align:center; }
            #featuredIn .span3 { height: 110px; position: relative; }

            .clickable { cursor: pointer; }
            .AbsoluteCenter { margin: auto; position: absolute; top: 0; left: 0; bottom: 0; right: 0; }

            @media (min-width: 979px) and (max-width: 1199px) {
                #hero .heroP div { font-size: 15px; }
            }

            @media (max-width: 480px) {
                h1 { font-size: 32px; }
            }

            #imaContainer { dispaly: none; }
            #imaContainer .row-fluid { margin-bottom: 10px; }

            #spinner { display: none; text-align: center; }
            #theRankingsNoData { display: none; }
            #theRankings { display: none; }

            .progress { position: relative; height: 5px; line-height: 5px; border: solid 1px #aaa; background-image: none; border-radius: 0px; margin-bottom: 0px; margin-right: 16px; margin-left: 18px; margin-top: 4px; }
            .progress .bar { background-color: rgb(221,215,206); background-image: none; box-shadow: none; }
            .progress .goodbar { background-color: rgb(121,235,146); }
            .progress .badbar { background-color: rgb(235,121,146); }
            .progress span { position: absolute; z-index: 2; left: 0; width: 100%; text-align: center; color: #666; font-size: 0.75em; display: none; }
        </style>

        <script type="text/javascript">
            var bhLoadDisqus = false;

            <xsl:text disable-output-escaping='yes'><![CDATA[
            if(typeof analytics !== "undefined" && analytics !== null) { analytics.track('Visited Home Page', {}); }
            ]]></xsl:text>
        </script>
    </xsl:template>

    <xsl:template name="bodyContent">
        <xsl:param name="bhPageId" />

        <!-- Red Hero Block -->
        <div id="hero" class="row-fluid clickable" data-bhtrackregion="hero" data-cfTarget="{ $myFactualBase }/users/college_factual/registrations/new?cfRefId=home&amp;mfdetails=default&amp;brand=cf&amp;return_url=http%3A%2F%2Fmy.mediafactual.com%2Fcollege_factual%3fafter_profiling_url=http%3A%2F%2Fpages.collegefactual.com%2Fgsr%2F%23quick-start-guide" >
            <div class="clearfix rowPadding">
                <div class="span6">
                    <h1>COLLEGE SELECTION. CUSTOMIZED.</h1>
                    <div class="heroP">
                        <div>Don't Waste Time &amp; Money on a One-Size-Fits-All Approach.</div>
                        <div>Find a college &amp; major that is just right for you.</div>
                        <div>Graduate on your terms - with an affordable degree you can use.</div>
                    </div>
                </div>

                <div class="span6 hidden-phone" style="margin-top: 30px;"><img src="{ $staticUri }/img/homepage/1klhdl4-home-01.png" alt="" /></div>
            </div>
        </div>

        <div id="imaContainer" style="margin-top: 24px; display:none;">
            <div class="well well-small">
                <div class="row-fluid" style="border-bottom: solid 1px rgb(156, 194, 228);">
                    <div class="span4">
                        <select id="imA" name="ima" alt="I'm a" style="width: 100%; font-size: 20px; height: 44px;">
                            <option value="student" selected="selected">I'm a high school student&nbsp;</option>
                            <option value="athelete">I'm a high school athelete&nbsp;</option>
                            <option value="adult">I'm an adult learner&nbsp;</option>
                            <option value="vet">I'm a veteran or active duty servicemember&nbsp;</option>
                        </select>
                    </div>

                    <div class="span4">
                        <select id="myState" name="myState" alt="Living In" style="width: 100%; font-size: 20px; height: 44px;">
                            <option value="*">living outside The USA&nbsp;</option>
                            <option value="*" selected="selected">living in The USA&nbsp;</option>
                            <option value="AL">living in Alabama&nbsp;</option><option value="AK">living in Alaska&nbsp;</option><option value="AZ">living in Arizona&nbsp;</option><option value="AR">living in Arkansas&nbsp;</option><option value="CA">living in California&nbsp;</option><option value="CO">living in Colorado&nbsp;</option><option value="CT">living in Connecticut&nbsp;</option><option value="DE">living in Delaware&nbsp;</option><option value="DC">living in District of Columbia&nbsp;</option><option value="FL">living in Florida&nbsp;</option><option value="GA">living in Georgia&nbsp;</option><option value="HI">living in Hawaii&nbsp;</option><option value="ID">living in Idaho&nbsp;</option><option value="IL">living in Illinois&nbsp;</option><option value="IN">living in Indiana&nbsp;</option><option value="IA">living in Iowa&nbsp;</option><option value="KS">living in Kansas&nbsp;</option><option value="KY">living in Kentucky&nbsp;</option><option value="LA">living in Louisiana&nbsp;</option><option value="ME">living in Maine&nbsp;</option><option value="MD">living in Maryland&nbsp;</option><option value="MA">living in Massachusetts&nbsp;</option><option value="MI">living in Michigan&nbsp;</option><option value="MN">living in Minnesota&nbsp;</option><option value="MS">living in Mississippi&nbsp;</option><option value="MO">living in Missouri&nbsp;</option><option value="MT">living in Montana&nbsp;</option><option value="NE">living in Nebraska&nbsp;</option><option value="NV">living in Nevada&nbsp;</option><option value="NH">living in New Hampshire&nbsp;</option><option value="NJ">living in New Jersey&nbsp;</option><option value="NM">living in New Mexico&nbsp;</option><option value="NY">living in New York&nbsp;</option><option value="NC">living in North Carolina&nbsp;</option><option value="ND">living in North Dakota&nbsp;</option><option value="OH">living in Ohio&nbsp;</option><option value="OK">living in Oklahoma&nbsp;</option><option value="OR">living in Oregon&nbsp;</option><option value="PA">living in Pennsylvania&nbsp;</option><option value="RI">living in Rhode Island&nbsp;</option><option value="SC">living in South Carolina&nbsp;</option><option value="SD">living in South Dakota&nbsp;</option><option value="TN">living in Tennessee&nbsp;</option><option value="TX">living in Texas&nbsp;</option><option value="UT">living in Utah&nbsp;</option><option value="VT">living in Vermont&nbsp;</option><option value="VA">living in Virginia&nbsp;</option><option value="WA">living in Washington&nbsp;</option><option value="WV">living in West Virginia&nbsp;</option><option value="WI">living in Wisconsin&nbsp;</option><option value="WY">living in Wyoming&nbsp;</option><option value="AS">living in American Samoa&nbsp;</option><option value="FM">living in Federated States of Micronesia&nbsp;</option><option value="GU">living in Guam&nbsp;</option><option value="MH">living in Marshall Islands&nbsp;</option><option value="MP">living in Northern Marianas&nbsp;</option><option value="PW">living in Palau&nbsp;</option><option value="PR">living in Puerto Rico&nbsp;</option><option value="VI">living in Virgin Islands&nbsp;</option>
                        </select>
                    </div>

                    <div class="span4">
                        <select id="myGrades" name="myGrades" alt="Living In" style="width: 100%; font-size: 20px; height: 44px;">
                            <option value="1">who has great grades.&nbsp;</option>
                            <option value="2" selected="selected">who has good grades.&nbsp;</option>
                            <option value="3">who has average grades.&nbsp;</option>
                            <option value="4">who has below average grades.&nbsp;</option>
                            <option value="5">who doesn't want to talk about grades.&nbsp;</option>
                        </select>
                        <select id="mySport" name="mySport" alt="I'm a" style="width: 100%; font-size: 20px; height: 44px; display:none;">
                            <option value="baseball-men" selected="selected">who wants to play Men's Baseball&nbsp;</option>
                            <option value="basketball-men">who wants to play Men's Basketball&nbsp;</option>
                            <option value="fencing-men">who wants to play Men's Fencing&nbsp;</option>
                            <option value="football-men">who wants to play Men's Football&nbsp;</option>
                            <option value="golf-men">who wants to play Men's Golf&nbsp;</option>
                            <option value="gymnastics-men">who wants to play Men's Gymnastics&nbsp;</option>
                            <option value="icehockey-men">who wants to play Men's Ice Hockey&nbsp;</option>
                            <option value="indoortrack-men">who wants to play Men's Indoor Track&nbsp;</option>
                            <option value="lacrosse-men">who wants to play Men's Lacrosse&nbsp;</option>
                            <option value="outdoortrack-men">who wants to play Men's Outdoor Track&nbsp;</option>
                            <option value="rifle-men">who wants to play Men's Rifle&nbsp;</option>
                            <option value="soccer-men">who wants to play Men's Soccer&nbsp;</option>
                            <option value="swimming-men">who wants to play Men's Swimming&nbsp;</option>
                            <option value="tennis-men">who wants to play Men's Tennis&nbsp;</option>
                            <option value="volleyball-men">who wants to play Men's Volleyball&nbsp;</option>
                            <option value="waterpolo-men">who wants to play Men's Water Polo&nbsp;</option>
                            <option value="wrestling-men">who wants to play Men's Wrestling&nbsp;</option>

                            <option value="basketball-women">who wants to play Women's Basketball&nbsp;</option>
                            <option value="bowling-women">who wants to play Women's Bowling&nbsp;</option>
                            <option value="fencing-women">who wants to play Women's Fencing&nbsp;</option>
                            <option value="fieldhockey-women">who wants to play Women's Field Hockey&nbsp;</option>
                            <option value="golf-women">who wants to play Women's Golf&nbsp;</option>
                            <option value="gymnastics-women">who wants to play Women's Gymnastics&nbsp;</option>
                            <option value="icehockey-women">who wants to play Women's Ice Hockey&nbsp;</option>
                            <option value="indoortrack-women">who wants to play Women's Indoor Track&nbsp;</option>
                            <option value="lacrosse-women">who wants to play Women's Lacrosse&nbsp;</option>
                            <option value="outdoortrack-women">who wants to play Women's Outdoor Track&nbsp;</option>
                            <option value="rowing-women">who wants to play Women's Rowing&nbsp;</option>
                            <option value="soccer-women">who wants to play Women's Soccer&nbsp;</option>
                            <option value="softball-women">who wants to play Women's Softball&nbsp;</option>
                            <option value="swimming-women">who wants to play Women's Swimming&nbsp;</option>
                            <option value="volleyball-women">who wants to play Women's Volleyball&nbsp;</option>
                            <option value="waterpolo-women">who wants to play Women's Water Polo&nbsp;</option>
                        </select>
                    </div>

                </div>
                <div class="row-fluid">
                    <div class="span4">
                        <select id="myFulltimeStatus" name="myFulltimeStatus" alt="Living In" style="width: 100%; font-size: 20px; height: 44px;">
                            <option value="1" selected="selected">I'll attend college full-time&nbsp;</option>
                            <option value="0">I'll attend college part-time&nbsp;</option>
                        </select>
                    </div>

                    <div class="span4">
                        <select id="myOnlineStatus" name="myOnlineStatus" alt="Living In" style="width: 100%; font-size: 20px; height: 44px;">
                            <option value="0" selected="selected">in-person&nbsp;</option>
                            <option value="1">online&nbsp;</option>
                            <option value="0.5">some online and some in-person&nbsp;</option>
                        </select>
                    </div>

                    <div class="span4">
                        <select id="myField" name="myField" alt="Living In" style="width: 100%; font-size: 20px; height: 44px;">
                            <option value="*" selected="selected">and I am undeclared.&nbsp;</option>
                            <option value="f01">and study Agriculture and Agriculture Operations.&nbsp;</option>
                            <option value="f03">and study Natural Resources and Conservation.&nbsp;</option>
                            <option value="f04">and study Architecture and Related Services.&nbsp;</option>
                            <option value="f10">and study Communications Technologies and Support.&nbsp;</option>
                            <option value="f11">and study Computer and Information Sciences.&nbsp;</option>
                            <option value="f12">and study Personal and Culinary Services.&nbsp;</option>
                            <option value="f13">and study Education.&nbsp;</option>
                            <option value="f14">and study Engineering.&nbsp;</option>
                            <option value="f15">and study Engineering Technologies.&nbsp;</option>
                            <option value="f16">and study Foreign Languages and Linguistics.&nbsp;</option>
                            <option value="f19">and study Family, Consumer and Human Sciences.&nbsp;</option>
                            <!--<option value="f21">and study Technology Education/Industrial Arts.&nbsp;</option>-->
                            <option value="f22">and study Legal Professions.&nbsp;</option>
                            <option value="f23">and study English Language and Literature.&nbsp;</option>
                            <option value="f24">and study Liberal Arts/Sciences and Humanities.&nbsp;</option>
                            <option value="f25">and study Library Science.&nbsp;</option>
                            <option value="f26">and study Biological and Biomedical Sciences.&nbsp;</option>
                            <option value="f27">and study Mathematics and Statistics.&nbsp;</option>
                            <option value="f28">and study Military Science and Leadership.&nbsp;</option>
                            <option value="f29">and study Military Technologies and Applied Sciences.&nbsp;</option>
                            <option value="f30">and study Multi/Interdisciplinary Studies.&nbsp;</option>
                            <option value="f31">and study Parks, Recreation, Leisure, and Fitness Studies.&nbsp;</option>
                            <!--<option value="f32">and study Developmental/Remedial Education.&nbsp;</option>-->
                            <!--<option value="f33">and study Citizenship Activities.&nbsp;</option>-->
                            <!--<option value="f34">and study Health-Related Knowledge and Skills.&nbsp;</option>-->
                            <!--<option value="f35">and study Interpersonal and Social Skills.&nbsp;</option>-->
                            <!--<option value="f36">and study Leisure and Recreational Activities.&nbsp;</option>-->
                            <!--<option value="f37">and study Personal Awareness and Self-Improvement.&nbsp;</option>-->
                            <option value="f38">and study Philosophy and Religious Studies.&nbsp;</option>
                            <option value="f39">and study Theology and Religious Vocations.&nbsp;</option>
                            <option value="f40">and study Physical Sciences.&nbsp;</option>
                            <option value="f41">and study Science Technologies/Technicians.&nbsp;</option>
                            <option value="f42">and study Psychology.&nbsp;</option>
                            <option value="f43">and study Homeland Security, Law Enforcement and Firefighting.&nbsp;</option>
                            <option value="f44">and study Public Administration and Social Service.&nbsp;</option>
                            <option value="f45">and study Social Sciences.&nbsp;</option>
                            <option value="f46">and study Construction Trades.&nbsp;</option>
                            <option value="f47">and study Mechanic and Repair Technologies.&nbsp;</option>
                            <option value="f48">and study Precision Production.&nbsp;</option>
                            <option value="f49">and study Transportation and Materials Moving.&nbsp;</option>
                            <option value="f50">and study Visual and Performing Arts.&nbsp;</option>
                            <option value="f51">and study Health Professions.&nbsp;</option>
                            <option value="f52">and study Business, Management and Marketing.&nbsp;</option>
                            <!--<option value="f53">and study High School/Secondary Diplomas and Certificates.&nbsp;</option>-->
                            <option value="f54">and study History.&nbsp;</option>
                            <!--<option value="f60">and study Residency Programs.&nbsp;</option>-->
                        </select>
                    </div>
                </div>

                <div style="text-align: center;">
                    <div id="showMe" class="btn btn-large btn-primary">Find Matches</div>
                </div>
            </div>

            <div>
                <div id="spinner"><img src="{ $baseUri }/_dir-static/img/loaderRed.gif" /></div>
                <div id="theRankingsNoData">
                    <div class="alert alert-block">
                        <button type="button" class="close" data-dismiss="alert">x</button>
                        <h4>No Colleges Found.</h4>
                        <p>
                            You can can try relaxing your criteria and searching again, or you can check out
                            the <a href="/colleges">full list of colleges</a> we cover.
                        </p>
                    </div>
                </div>

                <div id="theRankings" style="margin-bottom: 16px; margin-top: 16px;"></div>
            </div>
        </div>


        <div id="tryIt" class="row-fluid" data-bhtrackregion="tryIt">
            <div class="clearfix rowPadding" >
                <div class="span4 tryItHeading">
                    Get Started Now!
                </div>
                <div class="span3 tryItP">
                    Get matched to majors, choose colleges and find a career path -- All in just a few minutes.
                </div>
                <div class="span5" style="text-align: center;">
                    <a class="btn btn-large" href="http://pages.collegefactual.com/parents/">PARENTS</a>
                    <a class="btn btn-large" style="background-color: rgba(245,148,45,1);" href="http://pages.collegefactual.com/students/">STUDENTS</a>
                </div>
            </div>
        </div>

        <div id="toolsShowcase" class="row-fluid" data-bhtrackregion="toolsShowcase">
            <div class="clearfix rowPadding">
                <div class="span4 clickable" data-cfTarget="http://pages.collegefactual.com/find-my-major" >
                    <img src="{ $staticUri }/img/homepage/3v9s5o-benefit-01.jpg" alt="" />
                    <h2>MAJORS MATCH</h2>
                    <p>Work smarter, not harder, in college. Discover which majors are a natural fit, based on your interests and strengths.</p>
                </div>
                <div class="span4 clickable" data-cfTarget="http://pages.collegefactual.com/find-my-major" >
                    <img src="{ $staticUri }/img/homepage/acuquv-benefit-02.jpg" alt="" />
                    <h2>COLLEGE FINDER</h2>
                    <p>Beat the odds and graduate on time, in four years (not five or six) with the right major at the right college.</p>
                </div>
                <div class="span4 clickable" data-cfTarget="{ $baseUri }/tools/custom-rankings2/#cfValue" >
                    <img src="{ $staticUri }/img/homepage/jlzemj-benefit-03.jpg" alt="" />
                    <h2>CUSTOMIZED RANKINGS</h2>
                    <p>Develop a customized ranking of colleges based on what matters most to you, and narrow in on your top choices.</p>
                </div>
            </div>
        </div>

        <div id="atGlance" class="row-fluid" data-bhtrackregion="atGlance">
            <div class="clearfix rowPadding">

                <div class="span6 hidden-phone">
                    <a href="{ $baseUri }/colleges/amherst-college" >
                        <img src="{ $staticUri }/img/homepage/1nxehvi-laptop_0fa0850fa085000000.png" alt="" />
                    </a>
                </div>

                <div class="span6">
                    <h2>AT-A-GLANCE STATISTICS</h2>
                    <p>A snapshot view of each college highlights the stats that matter most.</p>
                    <p>Drill deep into the data, check out each college's scorecard, and compare the numbers to state and nationwide averages.</p>

                    <a
                        id="seeForYourself"
                        class="btn btn-large"
                        title="Attempting to locate the #1 college in your state."
                        data-toggle="popover"
                        data-placement="right"
                        data-content="This can take a few seconds. If it takes too long or you forbid it, we will show you the #1 nationwide."
                        data-original-title="Attempting to locate the #1 college in your state."
                        href="javascript:void(0);">SEE FOR YOURSELF</a>
                </div>

            </div>
        </div>

        <div class="mmAddLetushelp" style="text-align: center; background: rgba(236,83,68,1);">
            <a href="http://pages.collegefactual.com/veterans/"><img src="{ $staticUri }/img/veterans/vets-long.png" /></a>
        </div>

        <div id="featuredIn" class="row-fluid" data-bhtrackregion="featuredIn">
            <div class="clearfix rowPadding">
                <h3>AS FEATURED IN</h3>

                <div class="row-fluid">
                    <div class="span3">
                        <a class="AbsoluteCenter" style="height: 77px;" href="http://pages.collegefactual.com/press/#usatoday" ><img src="{ $staticUri }/img/homepage/usatodaycollege.png" alt="" /></a>
                    </div>
                     <div class="span3">
                        <a class="AbsoluteCenter" style="height: 65px;" href="http://pages.collegefactual.com/press/#bizjournals" ><img src="{ $staticUri }/img/homepage/qh8y56-bizjournals_06i01t06i01t000000.png" alt="" /></a>
                    </div>
                    <div class="span3">
                        <a class="AbsoluteCenter" style="height: 110px;" href="http://pages.collegefactual.com/press/#chronicle" ><img src="{ $staticUri }/img/homepage/10qxifi-chronicle_054032054032000000.jpg" alt="" /></a>
                    </div> 
                    <div class="span3">
                        <a class="AbsoluteCenter" style="height: 80px;" href="http://benefits.va.gov/gibill/docs/factsheets/Choosing_a_School.pdf" target="_blank" ><img src="{ $staticUri }/img/homepage/va.png" alt="" /></a>
                    </div>
                </div>

            </div>
        </div>
    </xsl:template>

    <xsl:template name="bodyFooterContent" >
        <script id="college-template" type="text/x-handlebars-template">
            {{#each this}}
            <div class="row-fluid">

                {{#each this}}
                <div class="span6 collegeData clearfix clickable" style="height: 150px; margin-bottom: 3px; background-color: aliceblue; border: solid 1px;">
                    <xsl:attribute name="data-cfTarget"><xsl:value-of select=" $baseUri " />/colleges/{{ slug }}/</xsl:attribute>

                    <div>
                        <xsl:attribute name="style">height: 100%; width: 150px; float:left; background-image: url(http://www.collegefactual.com/college_images/{{slug}}.jpg); background-size: cover; background-position-x: 50%;</xsl:attribute>
                    </div>

                    <div style="margin-left: 150px; padding: 5px;">
                        <div class="collegeName" style=" margin-bottom: 3px;">
                            <a style="font-weight: bold; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><xsl:attribute name="href"><xsl:value-of select=" $baseUri " />/colleges/{{ slug }}/</xsl:attribute>{{ name }}</a>
                            <div style="font-size: 0.8em; color: #666; margin-top:2px;">{{ city }}, {{ state }}</div>
                        </div>

                        <table class="table table-condensed" style="font-size: 14px;">
                            <tr>
                                <td style="width: 50px; font-weight: bold;">Quality: </td>
                                <td>
                                    <div class="progress goodprogress">
                                        <xsl:attribute name="title">Nationwide rank of overall quality: #{{ qualityScore.value }}</xsl:attribute>
                                        <div class="bar goodbar"><xsl:attribute name="style">width: {{ qualityPct }}%;</xsl:attribute></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50px; font-weight: bold;">Value: </td>
                                <td>
                                    <div class="progress goodprogress">
                                        <xsl:attribute name="title">Nationwide rank of overall value: #{{ valueScoreNonResidentOverallDegree_QRFCFF.value }}</xsl:attribute>
                                        <div class="bar goodbar"><xsl:attribute name="style">width: {{ valuePct }}%;</xsl:attribute></div>
                                    </div>
                                </td>
                            </tr>
                        </table>

                        <div style="text-align: center; margin-top: -18px">
                            <div class="btn btn-small btn-primary">
                                <xsl:attribute name="id">interested-{{ slug }}/</xsl:attribute>
                                Learn More
                            </div>
                        </div>
                    </div>

                </div>
                {{/each}}

            </div>
            {{/each}}
        </script>

        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.1.2/handlebars.min.js" ></script>
        <script type="text/javascript">
            $("body").on( "click", "[data-cfTarget]", function(event) { cfTracker.trackClick(event, $(this).attr("data-cfTarget")); } );

            $("#seeForYourself").on("click", function(event) {
                cfTracker.trackClick(event);

                $("#seeForYourself").popover('show');

                var stateCollege = {};
                <xsl:for-each select=" /root/colleges/state-rep/state ">stateCollege["<xsl:value-of select=" @id " />"] = "<xsl:value-of select=" @collegeSlug " />";</xsl:for-each>

                var stateData = null;
                var stateSlug = stateCollege["MA"];
                var newUriTemplate = bhBaseUri + "/colleges/~collegeSlug~/" + bhIndexFile;

                var geoSuccess = function (position) {
                    console.log("geocoder success");
                    clearTimeout(_FFHACK_location_timeout);

                    var lat = position.coords.latitude;
                    var lng = position.coords.longitude;
                    var geoUri = "http://maps.googleapis.com/maps/api/geocode/json?latlng="+ lat +"," + lng + "&amp;sensor=false";

                    $.ajax({
                        dataType: "json",
                        url: geoUri,
                        data: null,
                        success: function(data) {
                            console.log("json success");
                            for (var i=0; i &lt; data.results[0].address_components.length; i++) {
                                for (var b=0; b &lt; data.results[0].address_components[i].types.length; b++) {
                                    if ( data.results[0].address_components[i].types[b] == "administrative_area_level_1") {
                                        stateData = data.results[0].address_components[i];
                                        stateSlug = stateCollege[stateData.short_name] || stateSlug;
                                        break;
                                    }
                                }
                            }
                            location.href = newUriTemplate.replace("~collegeSlug~", stateSlug);
                        },
                        error: function(){
                            console.log("json failure");
                            location.href = newUriTemplate.replace("~collegeSlug~", stateSlug);
                        }

                    });

                };

                var geoFail = function () {
                    console.log("geocoder failure");
                    clearTimeout(_FFHACK_location_timeout);
                    location.href = newUriTemplate.replace("~collegeSlug~", stateSlug);
                }

                // if nothing happens in 5 seconds assume failure
                var _FFHACK_location_timeout = setTimeout( function() { geoFail(); }, 5 * 1000);

                if ( navigator.geolocation ) {
                    navigator.geolocation.getCurrentPosition( geoSuccess, geoFail, { "maximumAge" : 150 * 1000, "timeout" : 5 * 1000 } );
                } else {
                    geoFail();
                }

            });

            // ====================================
            // Fisher-Yates
            // ====================================
            function shuffleArray(array) {
                for (var i = array.length - 1; i &gt; 0; i--) {
                    var j = Math.floor(Math.random() * (i + 1));
                    var temp = array[i];
                    array[i] = array[j];
                    array[j] = temp;
                }
                return array;
            }
            // ====================================

            // ====================================
            // prep the templates
            // ====================================
            Handlebars.registerHelper('json', JSON.stringify);
            var collegeTemplate = Handlebars.compile( $("#college-template").html() );
            // ====================================

            $("#imA").change(function(){
                $("#myGrades").hide();
                $("#mySport").hide();

                if ($(this).val() === "athelete" ){ $("#mySport").show(); } else { $("#myGrades").show(); }
            });

            $("#showMe").click(function(event){
                cfTracker.trackClick(event);

                $("#theRankings").hide();
                $("#theRankingsNoData").hide();
                $("#spinner").show();

                var dataFilePath = "";
                switch($("#imA").val()){
                    case "athelete":
                        dataFilePath = "/tools/_data/homepage/colleges-" + $("#mySport").val() + ".json";
                        break;
                    case "vet":
                        dataFilePath = "/tools/_data/homepage/colleges-veterans.json";
                        break;
                    default:
                        dataFilePath = "/tools/_data/homepage/colleges.json";
                        break;
                }

                $.getJSON( dataFilePath ).done(function(collegeData) {
                    var selectedStateId = $("#myState").val();
                    if ( selectedStateId !== "*" ){
                        collegeData = collegeData.filter(function(item){ return item.st === selectedStateId; });
                    }

                    if ( $("#myField").val() !== "*" ){
                        collegeData = collegeData.filter(function(item){ return typeof item[ $("#myField").val() ] !== "undefined"; });
                    }

                    var selectedGrades = $("#myGrades").val();
                    switch( selectedGrades ){
                        case "1":
                            //collegeData = collegeData.filter(function(item){ return typeof item.sat === "number" &amp;&amp; item.sat &lt;= 1.00; });
                            break;
                        case "2":
                            collegeData = collegeData.filter(function(item){ return typeof item.sat === "number" &amp;&amp; item.sat &lt;= 0.80; });
                            break;
                        case "3":
                            collegeData = collegeData.filter(function(item){ return typeof item.sat === "number" &amp;&amp; item.sat &lt;= 0.60; });
                            break;
                        case "4":
                            collegeData = collegeData.filter(function(item){ return typeof item.sat === "number" &amp;&amp; item.sat &lt;= 0.40; });
                            break;
                        case "5":
                            collegeData = collegeData.filter(function(item){ return !!item.oa; });
                            break;
                    }

                    var selectedFulltimeStatus = $("#myFulltimeStatus").val();
                    if ( selectedFulltimeStatus === "1" ){
                        collegeData = collegeData.filter(function(item){ return typeof item.ft === "number" &amp;&amp; item.ft &gt;= 0.5; });
                    } else {
                        collegeData = collegeData.filter(function(item){ return typeof item.ft === "number" &amp;&amp; item.ft &lt;= 0.5; });
                    }

                    var selectedOnlineStatus = $("#myOnlineStatus").val();
                    switch(selectedOnlineStatus){
                        case "0":
                            collegeData = collegeData.filter(function(item){ return typeof item.ol === "number" &amp;&amp; item.ol &lt;= 0.25; });
                            break;
                        case "1":
                            collegeData = collegeData.filter(function(item){ return typeof item.ol === "number" &amp;&amp; item.ol &gt;= 0.75; });
                            break;
                        default:
                            collegeData = collegeData.filter(function(item){ return typeof item.ol === "number" &amp;&amp; item.ol &lt;= 0.80 &amp;&amp; item.ol &gt;= 0.20; });
                            break;
                    }

                    if ( $("#myField").val() !== "*" ){
                        collegeData.sort(function(a,b){ return b[$("#myField").val()] - a[$("#myField").val()]; });
                    }

                    var someDetails = []
                    var secondaryAjaxRequests = [];

                    var rndCollegeData = shuffleArray( collegeData.slice(0,11) ).slice(0,4);
                    for(var i = 0; i &lt; rndCollegeData.length; i++ ){
                        secondaryAjaxRequests.push( $.getJSON( "/tools/_data/college-detail/" + rndCollegeData[i].id + ".json", function(data) { someDetails.push(data); }) );
                    }

                    $.when.apply( $, secondaryAjaxRequests ).done(function () {
                        for(var i = 0; i &lt; someDetails.length; i++ ){
                            someDetails[i].qualityPct = someDetails[i].qualityScore.standingPct !== 0 ? Math.round(10000 * (1.0 - someDetails[i].qualityScore.standingPct)) / 100 : 0;
                            someDetails[i].costPct = someDetails[i].cost_InOutBlended_AidBlended_FullDegree.standingPct !== 0 ? 100 * parseFloat( someDetails[i].cost_InOutBlended_AidBlended_FullDegree.value.replace(/\$/g,"").replace(/,/g,"") ) / 256440 : null;
                            someDetails[i].valuePct = someDetails[i].valueScoreNonResidentOverallDegree_QRFCFF.standingPct !== 0 ? Math.round(10000 * (1.0 - someDetails[i].valueScoreNonResidentOverallDegree_QRFCFF.standingPct)) / 100 : 0;
                        }

                        function reshaper ( arr ) {
                            var result = [], temp = [];

                            arr.forEach( function ( elem, i ) {
                                if ( i > 0 &amp;&amp; i % 2 === 0 ) {
                                    result.push( temp );
                                    temp = [];
                                }
                                temp.push( elem );
                            });

                            if ( temp.length > 0 ) { result.push( temp ); }
                            return result;
                        }

                        $("#theRankings").html( collegeTemplate( reshaper(someDetails) ) );

                        $("#spinner").hide();

                        if ( someDetails.length !== 0 ) {
                            $("#theRankings").show();
                        } else {
                            $("#theRankingsNoData").show();
                        }

                    });

                });

            });

            $("#imaContainer").show();

        </script>
    </xsl:template>

</xsl:stylesheet>
