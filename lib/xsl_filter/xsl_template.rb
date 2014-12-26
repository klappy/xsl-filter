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
    file = File.read(path)
    Nokogiri::XML(file).to_xml
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
    xml.xpath('//xsl:value-of').each do |node|
      inject_placeholder(node)
    end
    @template = xml.to_xml
  end

  def inject_placeholder(node, _attributes=node.attributes, _select=_attributes["select"])
    return node unless _select
    variable = node.to_xml
    if (id = _attributes["id"])
      placeholder = [@start, id, @end].compact
    elsif _select.value[/\$baseUri/] # does not handle and simply moves on
      return node
    elsif _select.value[/\s*(\w+)?\/?@(\w+)\s*/]
      placeholder = [@start, $1, $2, @end].compact
    elsif _select.value[/\$(\w+)/]
      placeholder = [@start, $1, @end].compact
    elsif _select.value[/'.+'/] #plain text as string shouldn't be a placeholder and should be a translatle string
      return node
    # raise "Plain text should not be a placeholder and should be a translatable string."
    else
      raise "need to update variables to handle: #{node.to_xml}"
    end
    @variables.push({variable: variable, placeholder: placeholder})
    node.replace(placeholder.join(@separator))
  end

  def replace_variables
    @variables.map do |_variable|
      replace_variable(_variable)
    end
    !changed?
  end

  def replace_variable(_variable, variable=_variable[:variable], placeholder=_variable[:placeholder])
      raise "placeholder #{placeholder} not found" unless template[/#{placeholder}/]
      template.sub!(placeholder.join(@separator), variable)
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
