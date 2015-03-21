require './spec/spec_helper'
require './lib/xsl_filter'

describe "xsl_filter" do
  let(:template_path) { "./spec/fixtures/homepage.xsl" }
  let(:xsl_template)  { XslTemplate.new(template_path) }

  describe "template" do
    it "should change when filter applied" do
      xsl_template.filter
      xsl_template.changed?
    end

    it "should not change when unfilter applied" do
      xsl_template.filter
      xsl_template.unfilter
      xsl_template.changed?
    end

    describe "filter" do
      it "should change when injecting placeholders" do
        xsl_template.inject_placeholders
        expect(xsl_template.changed?).to be true
      end

      it "should not change when replacing variables" do
        xsl_template.inject_placeholders
        xsl_template.replace_variables
        expect(xsl_template.changed?).to be false
      end

      it "should change when moving titles" do
        template = XslTemplate.new("./spec/fixtures/paying-for-college-value-for-your-money.xsl")
        template.move_titles
        expect(template.changed?).to be true
      end

      it "should not change after moving titles back" do
        template = XslTemplate.new("./spec/fixtures/paying-for-college-value-for-your-money.xsl")
        template.move_titles
        template.move_titles_back
        expect(template.changed?).to be false
      end

      it "should save filtered template" do
        xsl_template.filter(true)
        expect(File.exist?(template_path+".filter.html")).to be true
        File.delete(template_path+".filter.html")
        expect(File.exist?(template_path+".filter.html")).to be false
      end
    end

    describe "variables" do
      it "should handle ids" do
        variable = '<xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * 100 ) " id="factor_percent" />'
        node = Nokogiri::XML::DocumentFragment.parse(variable).children.first
        placeholder = xsl_template.inject_placeholder(node)
        expect(placeholder.to_s).to eq("1_factor_percent")
      end

      it "should handle simple variables" do
        variable = '<xsl:value-of select=" @name " />'
        node = Nokogiri::XML::DocumentFragment.parse(variable).children.first
        placeholder = xsl_template.inject_placeholder(node)
        expect(placeholder.to_s).to eq("1_name")
      end

      it "should handle nested variables" do
        variable = '<xsl:value-of select=" state/@name " />'
        node = Nokogiri::XML::DocumentFragment.parse(variable).children.first
        placeholder = xsl_template.inject_placeholder(node)
        expect(placeholder.to_s).to eq("1_state_name")
      end

      it "should handle nested variables inside format-number" do
        variable = '<xsl:value-of select=" format-number(valueScoreInStateOverallDegree_QRFCFF/@standingIS, \'#,###\') " />'
        node = Nokogiri::XML::DocumentFragment.parse(variable).children.first
        placeholder = xsl_template.inject_placeholder(node)
        expect(placeholder.to_s).to eq("1_valueScoreInStateOverallDegree_QRFCFF_standingIS")
      end

      it "should handle transformed single variables" do
        variable = '<xsl:value-of select=" cf:DisplayPercentageOrNA( 0.01 * $factorPct ) " />'
        node = Nokogiri::XML::DocumentFragment.parse(variable).children.first
        placeholder = xsl_template.inject_placeholder(node)
        expect(placeholder.to_s).to eq("1_factorPct")
      end

      it "should handle non self closing variables with ids" do
        variable = '<xsl:value-of id="foo">this is the select</xsl:value-of>'
        node = Nokogiri::XML::DocumentFragment.parse(variable).children.first
        placeholder = xsl_template.inject_placeholder(node)
        expect(placeholder.to_s).to eq("1_foo")
      end
    end

    describe "hashes" do
      it "should create hash of one @ or $" do
        hash = '1_3438adcd3d1ee8430dc87814336abc70'
        variable = '<xsl:value-of select=" if ( $incomeBracket/@countReceiving castable as xs:decimal ) then format-number($incomeBracket/@countReceiving div freshmen/@count, \'##0.0%\') else \'N/A\' " />'
        node = Nokogiri::XML::DocumentFragment.parse(variable).children.first
        expect(xsl_template.inject_placeholder(node).to_s).to eq(hash)
      end

      it "should create hash of string if no @ or $ variables" do
        hash = '1_3369f0a73761ce3d9cd9719e870a7e42'
        variable = '<xsl:value-of select=" concat(\'hi\', \'there\') " />'
        node = Nokogiri::XML::DocumentFragment.parse(variable).children.first
        expect(xsl_template.inject_placeholder(node).to_s).to eq(hash)
      end
    end

    describe "bypass" do
      it "should bypass plain text strings" do
        variable = '<xsl:value-of select="\'All Colleges\'"/>'
        node = Nokogiri::XML::DocumentFragment.parse(variable).children.first
        placeholder = xsl_template.inject_placeholder(node)
        expect(placeholder.to_s).to eq(variable)
      end

      it "should bypass $baseUri" do
        variable = '<xsl:value-of select=" $baseUri "/>'
        node = Nokogiri::XML::DocumentFragment.parse(variable).children.first
        placeholder = xsl_template.inject_placeholder(node)
        expect(placeholder.to_s).to eq(variable)
      end

      it "should bypass @uri" do
        variable = '<xsl:value-of select=" $bhUriLookup/page[@id = \'college-academic-life-graduation-and-retention\']/@uri "/>'
        node = Nokogiri::XML::DocumentFragment.parse(variable).children.first
        placeholder = xsl_template.inject_placeholder(node)
        expect(placeholder.to_s).to eq(variable)
      end

      it "should bypass @navName" do
        variable = '<xsl:value-of select="$bhUriLookup/page[ @id = \'college-paying-for-college-home\' ]/@navName"/>'
        node = Nokogiri::XML::DocumentFragment.parse(variable).children.first
        placeholder = xsl_template.inject_placeholder(node)
        expect(placeholder.to_s).to eq(variable)
      end
    end

    describe "exceptions" do
      #TODO: plain text strings should be changed later to raise error.
      #TODO: non self closing variables with ids should raise error as causes same issue as plain text above
    end
  end
end
