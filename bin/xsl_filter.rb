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
      opts.banner <<  "Additional API:  -C 'Customer Name' -T API_TOKEN -P 'Project Name' -A 'Asset Name' -F 'en-us' -L 'es-419'"

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

      opts.on("-C api_customer", "--customer=api_customer", "customer api_customer") do |c|
        options.customer = c
      end

      opts.on("-T token", "--token=api_token", "token api_token") do |t|
        options.token = t
      end

      opts.on("-P api_customer", "--project=api_project", "project api_project") do |p|
        options.project = p
      end

      opts.on("-A asset", "--asset=api_asset", "asset api_asset") do |a|
        options.asset = a
      end

      opts.on("-F from_language", "--from=api_from_language", "from api_from_language") do |f|
        options.from = f
      end

      opts.on("-L to_language", "--to=api_to_language", "to api_to_language") do |t|
        options.to = t
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

options
    params = {}
    params[:customer] = options.customer if options.customer
    params[:token] = options.token if options.token
    params[:project] = options.project if options.project
    params[:asset] = options.asset if options.asset
    params[:from] = options.from if options.from
    params[:to] = options.to if options.to

    template = XslTemplate.new(options.input) if options.input
    template.filter if options.filter
    template.translate(params) if options.translate
    template.unfilter if options.unfilter
    template.save(options.output) if options.output
    puts template.template # this remains to allow piping data in command line to other commands
  end

end
