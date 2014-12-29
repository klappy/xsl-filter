module Translate
  def self.api_call(type, payload, _timeout=1)
    params = {
      customer: ENV["API_CUSTOMER"],
      token: ENV["API_TOKEN"],
      project: ENV["API_PROJECT"],
      asset: ENV["API_ASSET"],
      from: ENV["API_FROM"],
      to: ENV["API_TO"]
    }
    %w(customer token project asset from to).each {|key| raise "set environment variable for #{key}: export API_#{key.upcase}='value'" if params[key.to_sym].empty?}
    url = "https://translate.sovee.com/#{type}?#{params.map{|k,v|"#{k}=#{CGI.escape(v)}"}.join('&')}"
    body = `curl -X GET '#{url}' -d '#{payload}'`
  end

  def self.text(_text)
    payload = "text=#{URI.escape(_text)}"
    api_call('text', payload)
  end

  def self.template(html)
    payload = "html=#{CGI.escape(html.to_s)}"
    api_call('html', payload, 2)
  end
end
