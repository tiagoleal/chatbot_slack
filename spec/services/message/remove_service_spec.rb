require_relative './../../spec_helper.rb'
  
describe MessageModule::RemoveService do
 
  describe '#call' do
    context "Valid ID" do
      before do
        message = create(:message)
        @removeService = MessageModule::RemoveService.new({"id" => message.id})
      end
 
      it "Return success message" do
        response = @removeService.call()
        expect(response).to match("deleted successfully!")
      end
 
      it "Remove Message from database" do
        expect(Message.all.count).to eq(1)
        response = @removeService.call()
        expect(Message.all.count).to eq(0)
      end
    end
 
    context "Invalid ID" do
      it "return error message" do
        @removeService = MessageModule::RemoveService.new({"id" => rand(1..9999)})
        response = @removeService.call()
        expect(response).to match("Invalid Question, verify ID!")
      end
    end
  end
end