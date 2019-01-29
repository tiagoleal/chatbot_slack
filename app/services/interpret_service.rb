class InterpretService 

  def self.call action, params
    case action
    when "list", "search"
      MessageModule::ListService.new(params, action).call()
    when "create"
      MessageModule::CreateService.new(params).call()
    when "remove"
      MessageModule::RemoveService.new(params).call()
    when "help"
      HelpService.call()
    else
      "Invalid Option!"    
    end
  end
end