require_relative './../spec_helper.rb'

describe HelpService do
  describe '#call' do
    it "Response have the main commands" do
      response = HelpService.call()
      expect(response).to match('help')
      expect(response).to match('remova ID')
      expect(response).to match('Mostra a lista de mensagens')
      expect(response).to match('Traduza a mensagem x de inglês para português')
      expect(response).to match('Como se fala x em inglês')
    end
  end
end