

#O que é uma suíte de teste?
#Uma suíte de testes é uma coleção de casos de teste ou specs destinados a testar um programa para verificar um determinado comportamento.

require_relative "../../app/bank"

describe ContaCorrente do

  describe "Saque" do
        context "quando o valor é positivo" do
          before(:all) do
            @cc = ContaCorrente.new(1000.00)
            @cc.saca(200.00)
          end
          it "então atualiza saldo" do
            expect(@cc.saldo).to eql 800.00
          end
        end

        context "Quando o saldo é zero" do
          before(:all) do
            @cc = ContaCorrente.new(0.00)
            @cc.saca(100.00)
          end
          it " então exibe mensagem" do
            expect(@cc.mensagem).to eql "Saldo insuficiente para saque :("
          end
          it " e o saldo final com zero" do
            expect(@cc.saldo).to eql 0.00
          end
        end

        context"Tenho saldo mas não o suficiente" do
          before(:all) do
            @cc = ContaCorrente.new(500.00)
            @cc.saca(501.00)
          end
           it " então exibe mensagem" do
            expect(@cc.mensagem).to eql "Saldo insuficiente para saque :("
          end
          it " e o saldo permanece" do
            expect(@cc.saldo).to eql 500.00
          end
        end

        context"Quando supera o limite por saque" do
          before(:all) do
            @cc = ContaCorrente.new(1000.00)
             @cc.saca(701.00)
          end
           it " então exibe mensagem" do
            expect(@cc.mensagem).to eql "Limite máximo por saque é de R$ 700"
          end
          it "e o saldo permance" do
            expect(@cc.saldo).to eql 1000.00
          end
        end
  end
end
