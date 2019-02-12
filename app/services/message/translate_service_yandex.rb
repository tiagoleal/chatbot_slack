require 'rest-client'
require 'json'

class TranslateServiceYandex
  def initialize(lang_src,lang_dst,text)
    @language = "#{lang_src}-#{lang_dst}"
    @text = text    
    @key = "trnsl.1.1.20190119T104230Z.77f633d2d53a0031.ec4be61e8296f3ce425c154283e00ddaae58a1f8" 
  end

  def translate
    begin
      translate_api_url = "https://translate.yandex.net/api/v1.5/tr.json/translate?"
      url_yandex = "#{translate_api_url}key=#{@key}&lang=#{@language}"
      res = RestClient.post(url_yandex, {text: @text})
      value = JSON.parse(res.body)["text"][0]
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end