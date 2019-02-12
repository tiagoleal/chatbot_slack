class HelpService
  def self.call
    response  = "*Meus comandos* \n\n"
    response += "help\n"
    response += "`Lista de comandos que eu conheço`\n\n"
    response += "tradução\n"
    response += "`Traduza a mensagem de x de inglês para português`\n"
    response += "`Como se fala x em inglês`\n\n"
    response += "remova ID\n"
    response += "`Remove uma mensagem baseada no ID dela`\n\n"
    response += "listagem\n"
    response += "`Mostra a lista de mensagens`\n\n"
    response
  end
end