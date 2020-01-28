

#O que é uma suíte de teste?
#Uma suíte de testes é uma coleção de casos de teste ou specs destinados a testar um programa para verificar um determinado comportamento.

class ContaCorrente
  attr_accessor :saldo, :mensagem

  def initialize(saldo)
    self.saldo = saldo
  end

  def saca(valor)
    if (valor > self.saldo)
      self.mensagem = "Saldo insuficiente para saque :("
    elsif (valor > 700)
      self.mensagem = "Limite máximo por saque é de R$ 700"
    else
    self.saldo -= valor
    end
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

        context "Quando o saldo é zero" do
          before(:all) do
            @conta = ContaCorrente.new(0.00)
            @conta.saca(100.00)
          end
          it " então exibe mensagem" do
            expect(@conta.mensagem).to eql "Saldo insuficiente para saque :("
          end
          it " e o saldo final com zero" do
            expect(@conta.saldo).to eql 0.00
          end
        end

        context"Tenho saldo mas não o suficiente" do
          before(:all) do
            @conta = ContaCorrente.new(500.00)
            @conta.saca(501.00)
          end
           it " então exibe mensagem" do
            expect(@conta.mensagem).to eql "Saldo insuficiente para saque :("
          end
          it " e o saldo permanece" do
            expect(@conta.saldo).to eql 500.00
          end
        end

        context"Quando supera o limite por saque" do
          before(:all) do
            @conta = ContaCorrente.new(1000.00)
             @conta.saca(701.00)
          end
           it " então exibe mensagem" do
            expect(@conta.mensagem).to eql "Limite máximo por saque é de R$ 700"
          end
          it "e o saldo permance" do
            expect(@conta.saldo).to eql 1000.00
          end
        end
  end
end

