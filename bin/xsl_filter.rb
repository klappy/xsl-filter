#!/usr/bin/env ruby
require 'optparse' # http://ruby-doc.org/stdlib-2.2.0/libdoc/optparse/rdoc/OptionParser.html
require 'ostruct'

class Parser
  def self.parse(_options)
    options = OpenStruct.new

    opt_parser = OptionParser.new do |opts|
      opts.banner =   "Usage:           ./bin/xsl_filter.rb [options]\n"
      opts.banner <<  "Filter:          ./bin/xsl_filter.rb -f -i [input filepath]\n"
      opts.banner <<  "Translate:       ./bin/xsl_filter.rb -t -i [input filepath]\n"
      opts.banner <<  "Full Stack:      ./bin/xsl_filter.rb -f -t -u -i [input filepath]\n"
      opts.banner <<  "Save Full Stack: ./bin/xsl_filter.rb -f -t -u -i [input filepath] -o [output filepath]\n"

      opts.on("-i filepath", "--input=filepath", "input filepath") do |n|
        options.input = n
      end

      opts.on("-o filepath", "--output=filepath", "output filepath") do |o|
        options.output = o
      end

      opts.on("-f", "--filter", "filter the file") do |f|
        options.filter = f ? true : false
      end

      opts.on("-t", "--translate", "translate the file") do |t|
        options.translate = t ? true : false
      end

      opts.on("-u", "--unfilter", "unfilter the file") do |u|
        options.unfilter = u ? true : false
      end

      opts.on("-h", "--help", "Prints this help") do
        puts opts
        exit
      end
    end

    opt_parser.parse!(_options)
    options
  end
end

if __FILE__==$0
  require File.join(File.dirname(__FILE__), '..', '/lib/xsl_filter.rb')
  options = Parser.parse ARGV
  if options.to_h.empty?
    Parser.parse %w(-h)
  else
    template = XslTemplate.new(options.input) if options.input
    template.filter if options.filter
    template.translate if options.translate
    template.unfilter if options.unfilter
    template.save(options.output) if options.output

    #puts template.template
  end

end
