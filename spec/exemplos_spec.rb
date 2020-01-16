
#Estrutura de teste chamado de suite
describe "suite rspec" do

  #metodo it é um cenário de teste

  it "soma de valores" do
    soma = 10 + 5

    #Fazer verificação no cenario
    expect(soma).to eql 15
  end
end
