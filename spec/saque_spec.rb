

#O que é uma suíte de teste?
#Uma suíte de testes é uma coleção de casos de teste ou specs destinados a testar um programa para verificar um determinado comportamento.

class ContaCorrente
  attr_accessor :saldo

  def initialize(saldo)
    self.saldo = saldo
  end

  def saca(valor)
    self.saldo -= valor
  end
end

describe ContaCorrente do
  describe "Saque" do
    context "quando o valor é positivo" do
      before(:all) do
        @conta = ContaCorrente.new(1000.00)
        @conta.saca(200.00)
      end
      it "então atualiza saldo" do
        expect(@conta.saldo).to eql 800.00
      end
    end
  end
end
