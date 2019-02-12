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

      # res = RestClient.post url_yandex, text: @text.to_json, :accept => :json 
      res = RestClient.post(url_yandex, {text: @text})
      value = JSON.parse(res.body)["text"].to_s
      value

      # r = RestClient.post('https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20190119T104230Z.77f633d2d53a0031.ec4be61e8296f3ce425c154283e00ddaae58a1f8&lang=pt-en', {text: 'ola'})
      # r = RestClient.post('https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20190119T104230Z.77f633d2d53a0031.ec4be61e8296f3ce425c154283e00ddaae58a1f8&lang=pt-en', {text: 'ola'})
      

    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end