module Filter
  def self.unfilter(original_template_path, translated_template_path, save)
    original = XslTemplate.new(original_template_path)
    original.test
    original.filter
    translated = XslTemplate.new(translated_template_path)
    translated.variables = original.variables
    translated.placeholders = original.variables
    translated.unfilter(save)
  end
end