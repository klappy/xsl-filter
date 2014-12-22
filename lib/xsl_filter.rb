require 'rest_client'
require 'pry'

%w[template filter translate].each{|file| require File.dirname(__FILE__)+'/xsl_filter/'+file}