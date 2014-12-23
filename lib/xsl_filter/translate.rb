module Translate
  def self.unfilter(original_template_path, translated_template_path, save)
    original = XslTemplate.new(original_template_path)
    original.test
    original.filter
    translated = XslTemplate.new(translated_template_path)
    translated.variables = original.variables
    translated.placeholders = original.variables
    translated.unfilter(save)
  end

  def self.translate(html)
    params = {
      customer: "College Factual",
      token: "",
      project: "Templates",
      asset: "",
      from: "en-us",
      to: "zh-chs"
    }
    payload = "html=#{URI.escape(html)}"
    url = "https://translate.sovee.com/html?#{params.map{|k,v|"#{k}=#{CGI.escape(v)}"}.join('&')}"
    RestClient::Request.execute(method: :get, url: url, payload: payload)
  end
end