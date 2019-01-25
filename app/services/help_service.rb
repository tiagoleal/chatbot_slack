class HelpService
  def self.call
    response  = "*Meus comandos* \n\n"
    response += "help\n"
    response += "`Lista de comandos que eu conheço`\n\n"
    response += "Traduza x de inglês para português\n"
    response += "`Como se fala x em inglês`\n\n"
    response
  end
end