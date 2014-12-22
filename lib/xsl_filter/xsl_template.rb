class XslTemplate
  attr_accessor :template, :file_template, :variables, :placeholders, :path
  def initialize(path)
    @path = path
    @file_template = open
    @template = @file_template.dup
    @variables = []
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
    raise "unfilter requires variables and placeholders" unless variables.count > 0
    replace_variables
    move_titles_back
    save(path+".unfilter.html") if _save
    true
  end

  def inject_placeholders
    xml = Nokogiri::XML(@template)
    xml.xpath('//xsl:value-of').each do |node, _attributes=node.attributes, _select=_attributes["select"]|
      return unless _select
      variable = node.to_xml
      if (id = _attributes["id"])
        placeholder = [@start, id, @end]
      elsif _select.value[/(format-number\()?(\s+)?([\w]+)?(\/)?(@)(\w+)(,\s*'[$#,0]+'\))?/]
        placeholder = [@start, $3, $6, @end].compact
      elsif _select.value[/["']?\s*(\w+)\s*["']?/]
        placeholder = [@start, $1, @end].compact
      else
        binding.pry
        raise "need to update variables to handle: #{node.to_xml}"
      end
      @variables.push({variable: variable, placeholder: placeholder})
      node.replace(placeholder.join(@separator))
    end
    @template = xml.to_xml
    # template.gsub!(/<xsl:value-of\s+select=["']\s*.*["']\s*\/>/) do |match, tag=$&|
    #   if match[/\sid=["']\s*(\w+)\s*["']/]
    #     variable = tag #capture entire value-of tag and storing in variable
    #     placeholder = [@start,$2,@end].compact #replace with value of id
    #     binding.pry
    #   elsif match[/<xsl:value-of\s+select=["']+\s*(\w)\s*["']+\s*\/>/]
    #     variable = tag
    #     placeholder = [@start,$2,@end]
    #   elsif match[/(<xsl:value-of\s+select=["']\s*)(format-number\()?(\s+)?([\w]+)?(\/)?(@)(\w+)(,\s*'[$#,0]+'\))?(\s*["']\s*\/>)/]
    #     variable = tag
    #     placeholder = [@start,$4,$7,@end].compact
    #   else
    # end
  end

  def replace_variables
    variables.map do |_variable|
      variable, placeholder = _variable[:variable], _variable[:placeholder]
      raise "placeholder #{placeholder} not found" unless template[/#{placeholder}/]
      template.sub!(placeholder.join(@separator)) do |match|
        variable
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

=begin
jon stromer-galley: <xsl:value-of select=" concat('hi', 'ther'e) " />
jon stromer-galley: <xsl:value-of select="" id="foo" />
jon stromer-galley: <xsl:value-of id="foo">this is the select</xsl:value-of>
jon stromer-galley: $bhUriLookup/page[@id = 'college-academic-life-graduation-and-retention']/@uri
jon stromer-galley: if ( $incomeBracket/@countReceiving castable as xs:decimal ) then format-number($incomeBracket/@countReceiving div freshmen/@count, '##0.0%') else 'N/A'
=end
