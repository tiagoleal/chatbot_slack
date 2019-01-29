require_relative './../../spec_helper.rb'

describe MessageModule::ListService do
  describe '#call' do
    context "list command" do
      context "Zero message in database" do 
        it "Return don't find message" do 
          @listService = MessageModule::ListService.new({}, 'list')
          response  = @listService.call()
          expect(response).to match("Not Found!")
        end
      end

      context "Two messages in database" do 
        it "Find messages in response" do 
          @listService = MessageModule::ListService.new({}, 'list')
          message1 = create(:message)
          message2 = create(:message)
          response  = @listService.call()

          expect(response).to match(message1.description)
          expect(response).to match(message2.description)
        end
      end
    end

    context "search command" do
      context "Empty query" do
        it "return don't find message" do
          @listService = MessageModule::ListService.new({'query' => ''}, 'search')

          response = @listService.call()
          expect(response).to match("Not Found!")
        end
      end

      context "Valid query" do
        it "find message in response" do
          message = create(:message)
          @listService = MessageModule::ListService.new({'query' => message.description}, 'search')
          response = @listService.call()
          expect(response).to match(message.description)
        end
      end
    end


    



  end
end

