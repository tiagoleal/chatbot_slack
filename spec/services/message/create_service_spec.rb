require_relative './../../spec_helper.rb'

describe MessageModule::CreateService do
  before do
    @description = "teste" 
    @language = "en"
  end

  describe "#call" do 
    context "Without description params" do 
      it "Will receive a error" do
        @createService = MessageModule::CreateService.new({"language" => @language})
        response = @createService.call()
        expect(response).to match("Description required!")
      end
    end

    context "Without Valid params" do 
      before do
        @createService = MessageModule::CreateService.new({"description" => @description, "language" => @language})
        @response = @createService.call()
      end

      it "Receive success message" do
        expect(@response).to match("created successfully!")
      end

      it "Question and anwser is present in database" do
        expect(Message.last.description).to match(@description)
        expect(Message.last.language).to match(@language)
      end
    end
  end
end
