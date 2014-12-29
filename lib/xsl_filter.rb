require 'rest_client'
require 'nokogiri'
require 'pry'
require 'patron'

%w[xsl_template filter translate].each{|file| require File.dirname(__FILE__)+'/xsl_filter/'+file}
