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