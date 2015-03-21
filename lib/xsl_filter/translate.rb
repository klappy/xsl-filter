module Translate
  def self.api_call(params, type=params.delete(:type), payload=params.delete(:payload), _timeout=params.delete(:timeout)||60)
    params[:customer] ||= ENV["API_CUSTOMER"]
    params[:token] ||= ENV["API_TOKEN"]
    params[:project] ||= ENV["API_PROJECT"]
    params[:asset] ||= ENV["API_ASSET"]
    params[:from] ||= ENV["API_FROM"]
    params[:to] ||= ENV["API_TO"]

    # puts params
    # raise

    %w(customer token project asset from to).each {|key| raise "Pass CLI param or set environment variable for #{key}" if params[key.to_sym].nil? or params[key.to_sym].empty?}
    url = "https://translate.sovee.com/#{type}?#{params.map{|k,v|"#{k}=#{v.gsub(' ','+')}"}.join('&')}"
    hydra = Typhoeus::Hydra.new
    hydra.queue( request = Typhoeus::Request.new(url, method: :get, body: payload, timeout: _timeout) )
    hydra.run
    request.response.body
  end

  def self.text(params, _text=params.delete(:text))
    payload = "text=#{URI.escape(_text)}"
    api_call(params.merge(type: 'text', payload: payload, timeout: 30))
  end

  def self.template(params, html=params.delete(:html))
    payload = "html=#{CGI.escape(html.to_s)}"
    api_call(params.merge(type: 'html', payload: payload, timeout: 90))
  end
end
