
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
    expect(hq.list).to eql ["Spiderman"]
  end
end
