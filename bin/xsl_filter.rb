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
      opts.banner <<  "Additional API:  -C 'Customer Name' -T API_TOKEN -P 'Project Name' -A 'Asset Name' -F 'en-us' -L 'es-419'\n"
      opts.banner <<  "Optional API:    Asset will assume filename without path.\n"
      opts.banner <<  " \nUsage creates subpaths that will store the generated files and output from usage will instruct next steps.\n \n"

      opts.on("-i filepath", "--input=filepath", "input filepath") do |n|
        options.input = n
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
    params = {}
    params[:customer] = options.customer if options.customer
    params[:token] = options.token if options.token
    params[:project] = options.project if options.project
    params[:asset] = options.asset if options.asset
    params[:from] = options.from if options.from
    params[:to] = options.to if options.to

    files = []
    directory = nil

    options.input = options.input.gsub(/\/$/,'') # remove extra / from path if not needed

    (files = [options.input]) and (directory = File.dirname(options.input)) if File.file?(options.input)
    (files = Dir.glob("#{options.input}/*.xsl")) and (directory = options.input) if File.directory?(options.input)

    files.reject{|f| %w(. ..).include? f }.each do |filepath, file=File.basename(filepath), html_file=file.gsub('.xsl','.html')|
      puts "\n------------------------ starting: #{filepath} ------------------------"
      # create output sub directory for filtered templates
      filtered_directory = directory + '/filtered_for_sovee'
      translated_directory = directory + '/translated_from_sovee'
      unfiltered_directory = directory + '/unfiltered_final'

      Dir.mkdir(filtered_directory) unless Dir.exist?(filtered_directory)
      Dir.mkdir(translated_directory) unless Dir.exist?(translated_directory)
      Dir.mkdir(unfiltered_directory) unless Dir.exist?(unfiltered_directory)

      template = XslTemplate.new(filepath)

      filtered_message = "Upload to Smart Engine in project '#{params[:project]}' if not done already: #{filtered_directory + '/' + html_file}"
      template.filter and template.save(filtered_directory + '/' + html_file) and puts filtered_message if options.filter

      params[:asset] ||= html_file
      translated_message = "Translated html file from Sovee Smart Engine: #{translated_directory + '/' + html_file}"
      template.translate(params) and template.save(translated_directory + '/' + html_file) and puts translated_message if options.translate
      
      unfiltered_message = "Unfiltered final file: #{unfiltered_directory + '/' + file}"
      template.unfilter and template.save(unfiltered_directory + '/' + file) and puts unfiltered_message if options.unfilter

      puts "------------------------ completed: #{filepath} ------------------------\n"
    end
  end
end
