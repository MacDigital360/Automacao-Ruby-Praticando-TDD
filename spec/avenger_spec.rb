
class AvengerHead
  attr_accessor :list

  def initialize
    self.list = []
  end

  def put(avenger)
    self.list.push(avenger)
  end
end

#TDD (Desenvolvimento guiado por teste) Conforme o teste você vai fazendo sua classe.
describe AvengerHead do
  it "deve adicionar um vingador" do
    hq = AvengerHead.new
    hq.put("Spiderman")
    expect(hq.list).to include "Spiderman"
  end

  #Criando cenário
  it "deve adicionar uma lista de vingadores" do
    hq = AvengerHead.new
    hq.put("Hulk")
    hq.put("Viuva Negra")
    hq.put("Suri")

    res = hq.list.size > 0
    expect(hq.list).to include "Suri"

    expect(hq.list.size).to be > 0
    expect(res).to be true
  end

  it "Hulk deve ser o primeiro da lista" do
    hq = AvengerHead.new
    hq.put("Hulk")
    hq.put("Viuva Negra")
    hq.put("Suri")

    expect(hq.list).to start_with("Hulk")
  end

  it "IronMan deve ser o ultimo da lista" do
    hq = AvengerHead.new
    hq.put("Hulk")
    hq.put("Viuva Negra")
    hq.put("Suri")
    hq.put("IronMan")

    expect(hq.list).to end_with("IronMan")
  end

  it "Deve conter o sobrenome" do
    avenger = " peter parker"
    expect(avenger).to match(/parker/)
    expect(avenger).not_to match(/maga/)
  end
end
