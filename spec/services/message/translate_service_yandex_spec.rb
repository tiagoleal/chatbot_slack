require 'spec_helper'
require './app/services/message/translate_service_yandex'

describe "translate message" do
  before do 
    @description_pt = "Olá mundo!" 
    @description_en = "hello World!" 
  end

  it "translate pt-br to eng" do
    response = TranslateServiceYandex.new("pt","en",@description_pt).translate
    puts "Retorno pt-en => "+response
    expect(response.is_a? String).to eql(true)
  end

  it "translate eng to pt" do
    response = TranslateServiceYandex.new("en","pt",@description_en).translate
    puts "Retorno en-pt => "+response
    expect(response.is_a? String).to eql(true)
  end

end
