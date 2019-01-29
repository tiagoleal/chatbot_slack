module MessageModule
  class ListService
    def initialize(params, action)
      @action = action
      @query = params["query"]
    end

    def call
      if @action == "search"
        messages = Message.search(@query)
      else
        messages = Message.all
      end 

      response = "*Mensagems* \n\n"
      messages.each do |f|
        response +="*#{f.id}* - "
        response +="#{f.description}\n"
        response +="`#{f.language}`\n"
        response +="\n\n"
      end
      (messages.count > 0)? response : "Not Found!"      
    end
  end
end