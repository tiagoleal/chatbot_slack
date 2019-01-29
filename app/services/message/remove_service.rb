module MessageModule
  class RemoveService
    def initialize(params)
      @id = params["id"]
    end

    def call
      message = Message.where(id: @id).last
      return 'Invalid Question, verify ID!' if message == nil
      Message.transaction do
        message.delete
      end
      "deleted successfully!" 
    end
  end
end