module MessageModule
  class CreateService
    def initialize(params)
      @description = params["description"]
      @language_src = params["language"]
      @language_dst = "pt"
      if @language_src == "pt"
        @language_dst = "eng"
      end
    end

    def call
      return 'Description required!' if @description == nil
      Message.transaction do
        traducao = TranslateServiceYandex.new(@language_src,@language_dst,@description).translate
        response = "*Mensagem informada: #{@language_src}* \n\n"  
        response += "`#{@description}`\n\n"
        response += "*Mensagem traduzida: #{@language_dst}* \n\n"  
        response += "`#{traducao}`\n"
        language = "#{@language_src} - #{@language_dst}"
        Message.create(description: response, language: language)
        return response 
      end
      "created successfully!" 
    end
  end
end