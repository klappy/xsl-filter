require '../lib/xsl_filter.rb'

paying = XslTemplate.new('./templates/paying-for-college-value-for-your-money.xsl')
paying.test
learning = XslTemplate.new('./templates/academic-life-distance-learning.xsl')
learning.test
