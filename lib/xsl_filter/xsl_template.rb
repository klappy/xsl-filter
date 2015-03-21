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
    variable = node.to_xml
    if (id = _attributes["id"])
      placeholder = [@start, id, @end].compact
    elsif _select.value[/^\s*'.+'\s*$/] #plain text as string shouldn't be a placeholder and should be a translatable string
      return node
    elsif %w($baseUri @uri @navName).map{ |var| _select.value[/#{Regexp.escape(var)}/] }.compact.any? # does not handle and simply moves on
      return node
    elsif _select.value.scan(/[@\$]/).count > 1 # handles more than one variable
      placeholder = [@start,  hash(_select.value), @end].compact
    elsif _select.value[/\s*(\w+)?\/?@(\w+)\s*/] # handles nested words and variables
      placeholder = [@start, $1, $2, @end].compact
    elsif _select.value[/\$(\w+)/] # starting with $
      placeholder = [@start, $1, @end].compact
    else # no variables
      placeholder = [@start,  hash(_select.value), @end].compact
    end
    @variables.push({variable: variable, placeholder: placeholder})
    node.replace(placeholder.join(@separator))
  end

  def hash(data)
    _data = (data.class == String ? data : JSON.generate(data))
    _hash = Digest::MD5.hexdigest(_data)
    return _hash
  end

  def replace_variables
    @variables.map do |_variable|
      replace_variable(_variable)
    end
    !changed?
  end

  def replace_variable(_variable, variable=_variable[:variable], placeholder=_variable[:placeholder])
    puts "placeholder #{placeholder} not found" unless template[/#{placeholder}/]
    template.sub!(placeholder.join(@separator), variable)
  end

  # replaced 'div' with 't' - divs were messing up our divs
  def move_titles #find and move text with Nokogiri and/or other methods
    template.gsub!(/(<\w+\s+.*title=")([^"]+)("\s*>)/) do |match|
      $1 + $3 + "<t>#{$2}</t>"
    end
  end

  def move_titles_back #find moved text and move it back
    template.gsub!(/(<\w+\s+.*title=")("\s*>)<t>(.*)<\/t>/) do |match|
      $1 + $3 + $2
    end
  end

  def changed?
    template != file_template
  end

  def inspect
    template
  end
  alias_method :to_s, :inspect

  def translate
    @template = Translate.template(html: template)
  end
end
