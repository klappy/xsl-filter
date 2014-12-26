require './spec/spec_helper'
require './lib/xsl_filter'

describe "xsl_filter" do
  let(:template_path) { "./spec/fixtures/paying-for-college-value-for-your-money.xsl" }
  let(:xsl_template)  { XslTemplate.new(template_path) }

  describe "template" do
    it "should change when injecting placeholders" do
      xsl_template.inject_placeholders
      xsl_template.changed?
    end

    it "should not change when replacing variables" do
      xsl_template.inject_placeholders
      xsl_template.replace_variables
      !xsl_template.changed?
    end

    it "should change when moving titles" do
      xsl_template.move_titles
      xsl_template.changed?
    end

    it "should not change after moving titles back" do
      xsl_template.move_titles
      xsl_template.move_titles_back
      !xsl_template.changed?
    end

    it "should change when filter applied" do
      xsl_template.filter
      xsl_template.changed?
    end

    it "should not change when unfilter applied" do
      xsl_template.filter
      xsl_template.unfilter
      xsl_template.changed?
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

    # this should be changed later to raise error.
    it "should bypass plain text strings" do
      variable = '<xsl:value-of select="\'All Colleges\'"/>'
      node = Nokogiri::XML::DocumentFragment.parse(variable).children.first
      placeholder = xsl_template.inject_placeholder(node)
      expect(placeholder.to_s).to eq(variable)
    end

    it "should bypass baseUri" do
      variable = '<xsl:value-of select="\'All Colleges\'"/>'
      node = Nokogiri::XML::DocumentFragment.parse(variable).children.first
      placeholder = xsl_template.inject_placeholder(node)
      expect(placeholder.to_s).to eq(variable)
    end
  end
end
