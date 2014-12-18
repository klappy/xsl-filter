require 'rest_client'
require 'pry'
require 'open-uri'
require 'nokogiri'

class XslTemplate
  attr_accessor :template, :file_template, :variables, :placeholders, :path
  def initialize(path)
    @path = path
    @file_template = open
    @template = @file_template.dup
    @variables = []
    @placeholders = []
    @start = '1'
    @end = nil
    @separator = '_'
  end

  def open
    File.read(path)
  end

  def save(_path)
    File.write(_path, template)
  end

  def filter(_save=false)
    inject_placeholders
    move_titles
    raise "nothing changed" unless changed?
    save(path+".filter.html") if _save
    true
  end

  def unfilter(_save=false)
    raise "unfilter requires variables and placeholders" unless variables.count > 0 && placeholders.count > 0
    replace_variables
    move_titles_back
    save(path+".unfilter.html") if _save
    true
  end

  def inject_placeholders
    #Find ID if it doesn't exist
    template.gsub!(/(<xsl:value-of\s+select=["']\s*)(format-number\()?(\s+)?([\w]+)?(\/)?(@)(\w+)(,\s*'[$#,0]+'\))?(\s*["']\s*\/>)/) do |match|
      variable = [$1,$2,$3,$4,$5,$6,$7,$8,$9]
      ##TODO: 
      raise "need to update to handle #{match}" unless variable.join == match
      @variables.push variable
      placeholder = [@start,$4,$7,@end].compact
      @placeholders.push placeholder
      placeholder.join(@separator)  
    end
  end

  def replace_variables
    placeholders.map.with_index do |placeholder, index|
      raise "placeholder #{placeholder} not found" unless template[/#{placeholder}/]
      template.sub!(placeholder.join(@separator)) do |match|
        variable = variables[index]
        variable.compact.join
      end
    end
    !changed?
  end

  def move_titles #find and move text with Nokogiri and/or other methods
    template.gsub!(/(<\w+\s+.*title=")([^"]+)("\s*>)/) do |match|
      $1 + $3 + "<div>#{$2}</div>"
    end
  end

  def move_titles_back #find moved text and move it back
    template.gsub!(/(<\w+\s+.*title=")("\s*>)<div>(.*)<\/div>/) do |match|
      $1 + $3 + $2
    end
  end

  def changed?
    template != file_template
  end

  def test
    filter
    raise "filter didn't apply" unless changed?
    unfilter
    raise "unfilter didn't put things back" unless !changed?
    "all is well"
  end

  def inspect
    template
  end
end

module XslTranslatedTemplate
  def self.unfilter(original_template_path, translated_template_path, save)
    original = XslTemplate.new(original_template_path)
    original.test
    original.filter
    translated = XslTemplate.new(translated_template_path)
    translated.variables = original.variables
    translated.placeholders = original.variables
    translated.unfilter(save)
  end

  def self.translate(html)
    params = {
      customer: "College Factual",
      token: "",
      project: "Templates",
      asset: "",
      from: "en-us",
      to: "zh-chs"
    }
    payload = "html=#{URI.escape(html)}"
    url = "https://translate.sovee.com/html?#{params.map{|k,v|"#{k}=#{CGI.escape(v)}"}.join('&')}"
    RestClient::Request.execute(method: :get, url: url, payload: payload)
  end
end

#find and replace all template variables with mt variables

# Only run the following code when this file is the main file being run
# instead of having been required or loaded by another file
if __FILE__==$0

  case ARGV.length
  when 0
    puts "Usage:"
    puts "Test -      ruby xsl_filter.rb [infile]"
    puts "Transform - ruby xsl_filter.rb [infile] [outfile]"
    exit 1
  when 1
    puts "Testing file: #{ARGV[0]}"
    t = XslTemplate.new(ARGV[0])
    t.test
  when 2
    t = XslTemplate.new(ARGV[0])
    t.open
    t.filter
    t.save ARGV[1]
  end

end

=begin
jon stromer-galley: <xsl:value-of select=" concat('hi', 'ther'e) " />
jon stromer-galley: <xsl:value-of select="" id="foo" />
jon stromer-galley: <xsl:value-of id="foo">this is the select</xsl:value-of>
jon stromer-galley: $bhUriLookup/page[@id = 'college-academic-life-graduation-and-retention']/@uri
jon stromer-galley: if ( $incomeBracket/@countReceiving castable as xs:decimal ) then format-number($incomeBracket/@countReceiving div freshmen/@count, '##0.0%') else 'N/A'
=end
