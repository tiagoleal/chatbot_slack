module MessageModule
  class CreateService
    def initialize(params)
      @description = params["description"]
      @language_dst = params["language"]
      @language_src = "pt"
      if @language_dst == "pt"
        @language_src = "eng"
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
        response 
      end
      "created successfully!" 
    end
  end
end