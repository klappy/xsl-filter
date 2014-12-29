require './spec/spec_helper'
require './lib/xsl_filter'

describe "xsl_filter" do
  let(:template_path) { "./spec/fixtures/homepage.xsl" }
  let(:translatable_template)  { XslTemplate.new(template_path) }

  describe "translate" do
    it "should translate text" do
      translation = Translate.text("Hello world!")
      expect(translation).to include("Hola")
    end

    it "should translate html" do
      html = '<html><body><div>Hello world!</div></body></html>'
      translation = Translate.template(html)
      expect(translation).to include("Hola")
    end

    it "should translate template" do
      translatable_template.filter
      html = translatable_template.template
      translation = Translate.template(html)
      expect(translation).to include("estudiar")
    end

  end
end
